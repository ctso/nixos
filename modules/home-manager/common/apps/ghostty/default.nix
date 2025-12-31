{ util, config, pkgs, lib, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      keybind = "global:shift+ctrl+alt+cmd+g=toggle_quick_terminal";

      shell-integration = "zsh";
      shell-integration-features = "cursor,title,sudo";

      font-family = "JetBrainsMono Nerd Font Mono";

      background-opacity = 0.95;
      background-blur = 20;

      quick-terminal-position = "center";
      quick-terminal-size = "75%";
      quick-terminal-animation-duration = 0;
    };
  } // lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
    package = null;
  };

  catppuccin.ghostty = {
    enable = true;
    flavor = "mocha";
  };
}
