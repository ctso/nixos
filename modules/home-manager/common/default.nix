{ vars, inputs, ... }:

{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./users/${vars.defaultUser}.nix
    ./apps
  ];

  programs.home-manager.enable = true;

  home = {
    username = vars.defaultUser;
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
  };
}
