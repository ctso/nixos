{ util, config, pkgs, lib, ... }:

{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://atuin.c9s.io";
    };
  };

  catppuccin.atuin = {
    enable = true;
    flavor = "mocha";
  };
}
