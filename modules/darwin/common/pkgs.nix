{ pkgs, ... }:

{
  imports = [
    ../../pkgs.nix
  ];

  environment.systemPackages = with pkgs; [
    just
  ];
}

