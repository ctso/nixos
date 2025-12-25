{ util, config, pkgs, lib, ... }:

{
  programs.lazygit = {
    enable = true;
  };

  catppuccin.lazygit = {
    enable = true;
    flavor = "mocha";
  };
}