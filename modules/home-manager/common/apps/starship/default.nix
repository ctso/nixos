{ util, config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      directory = {
        style = "bold lavender";
      };
    };
  };

  catppuccin.starship = {
    enable = true;
    flavor = "mocha";
  };
}