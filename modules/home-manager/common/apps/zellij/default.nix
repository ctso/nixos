{ util, config, pkgs, lib, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      default_mode = "locked";
    };
  };

  catppuccin.zellij = {
    enable = true;
    flavor = "mocha";
  };
}
