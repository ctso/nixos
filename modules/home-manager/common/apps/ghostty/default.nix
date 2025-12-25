{ util, config, pkgs, lib, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      shell-integration = "zsh";
      shell-integration-features = "cursor,title,sudo";
      font-family = "VictorMono Nerd Font Mono";
      font-size = 14;
      background-opacity = 0.90;
    };
  } // lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
    package = null;
  };

  catppuccin.ghostty = {
    enable = true;
    flavor = "mocha";
  };
}