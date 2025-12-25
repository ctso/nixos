{ pkgs, lib, ... }:
{
  programs.eza = {
    enable = true;
  };

  catppuccin.eza = {
    enable = true;
    flavor = "mocha";
  };
}
