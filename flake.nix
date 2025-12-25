{
  description = "nixos/darwin configs";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-25.11";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nix-darwin,
      nix-homebrew,
      home-manager,
      agenix,
      impermanence,
      catppuccin,
      nixvim,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      # Use legacyPackages directly from nixpkgs flake (system-keyed)
      legacyPackages = nixpkgs.legacyPackages;

      # System-specific formatter
      formatter = nixpkgs.lib.genAttrs [ "aarch64-darwin" "x86_64-darwin" "aarch64-linux" "x86_64-linux" ] (system: nixpkgs.legacyPackages.${system}.nixpkgs-rfc-style);

      mkUtil =
        hostname:
        import ./util.nix {
          hostname = hostname;
          lib = nixpkgs.lib;
          flakeRoot = self.outPath;
        };

      createNixOS =
        hostname:
        (
          let
            commonVars = (
              import ./modules/vars.nix {
                inherit
                  hostname
                  ;
              }
            );
            vars = commonVars // (if builtins.pathExists ./hosts/${commonVars.hostname}/vars.nix then import ./hosts/${commonVars.hostname}/vars.nix else {});

            specialArgs = {
              inherit
                inputs
                outputs
                vars
                ;
              util = mkUtil vars.hostname;
              nixosModules = outputs.nixosModules;
              hmModules = outputs.hmModules;
            };

            modules = [
              (import ./hosts/${vars.hostname})
              outputs.nixosModules.common
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = specialArgs;
                home-manager.users."${vars.defaultUser}" = import ./home-manager/${vars.hostname};
              }
              home-manager.nixosModules.home-manager
              agenix.nixosModules.default
              impermanence.nixosModules.impermanence
            ];
          in
          {
            name = hostname;
            value = nixpkgs.lib.nixosSystem {
              inherit modules specialArgs;
            };
          }
        );

      createDarwin =
        hostname:
        (
          let
            vars = (
              import ./modules/vars.nix {
                inherit
                  hostname
                  ;
              }
            );
            specialArgs = {
              inherit
                inputs
                outputs
                vars
                ;
              util = mkUtil vars.hostname;
              darwinModules = outputs.darwinModules;
              hmModules = outputs.hmModules;
            };
            modules = [
              (import ./hosts/${vars.hostname})
              outputs.darwinModules.common
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = specialArgs;
                home-manager.users."${vars.defaultUser}" = import ./home-manager/${vars.hostname};
              }
              home-manager.darwinModules.home-manager
              nix-homebrew.darwinModules.nix-homebrew
              {
                nix-homebrew = {
                  enable = true;
                  user = vars.defaultUser;
                  enableRosetta = true;
                  autoMigrate = true;
                  # mutableTaps = false;
                };
              }
            ];
          in
          {
            name = hostname;
            value = nix-darwin.lib.darwinSystem {
              inherit specialArgs modules;
            };
          }
        );
    in
    {
      inherit legacyPackages formatter;

      nixosModules = {
        common = import ./modules/nixos/common;
      };

      darwinModules = {
        common = import ./modules/darwin/common;
      };

      hmModules = {
        common = import ./modules/home-manager/common;
      };

      nixosConfigurations = builtins.listToAttrs [
      #  (createNixOS "meatwad")
      ];

      darwinConfigurations = builtins.listToAttrs [
        (createDarwin "ctso-macbook")
      ];

      darwinPackages = self.darwinConfigurations.ctso-macbook.pkgs;
    };
}
