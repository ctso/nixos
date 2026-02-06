{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.workmux.packages.${pkgs.system}.default
  ];
}
