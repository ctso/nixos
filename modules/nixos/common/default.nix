{ ... }:

{
  imports = [
    ./pkgs.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

