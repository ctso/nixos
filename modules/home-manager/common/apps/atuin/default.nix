{ util, config, pkgs, lib, ... }:

{
  programs.atuin = {
    enable = true;
  };

  catppuccin.atuin = {
    enable = true;
    flavor = "mocha";
  };
}