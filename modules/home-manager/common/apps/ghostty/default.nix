{ util, config, pkgs, lib, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      shell-integration = "zsh";
      shell-integration-features = "cursor,title,sudo";
      font-family = "JetBrainsMono Nerd Font Mono";
      background-opacity = 0.95;
    };
  } // lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
    package = null;
  };

  catppuccin.ghostty = {
    enable = true;
    flavor = "mocha";
  };
}