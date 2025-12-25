{ util, config, pkgs, lib, ... }:

{
  programs.bat = {
    enable = true;
  };

  catppuccin.bat = {
    enable = true;
    flavor = "mocha";
  };
}