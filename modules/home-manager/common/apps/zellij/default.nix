{ util, config, pkgs, lib, ... }:

{
  programs.zellij = {
    enable = true;
  };

  catppuccin.zellij = {
    enable = true;
    flavor = "mocha";
  };
}
