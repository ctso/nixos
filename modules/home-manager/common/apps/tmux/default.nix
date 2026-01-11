{ pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];
    extraConfig = ''
      # Don't let programs rename windows
      set-option -g allow-rename off
      # Don't automatically rename windows based on running process
      set-option -g automatic-rename off
    '';
  };

  catppuccin.tmux = {
    enable = true;
    flavor = "mocha";
  };
}
