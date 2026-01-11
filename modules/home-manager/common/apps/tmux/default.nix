{ pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    historyLimit = 50000;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];

    extraConfig = ''
      # Don't let programs rename windows, but auto-name based on current process
      set-window-option -g allow-rename off
      set-window-option -g automatic-rename on
    '';
  };

  catppuccin.tmux = {
    enable = true;
    flavor = "mocha";
    extraConfig = ''
      set -g @catppuccin_window_text " #W"
      set -g @catppuccin_window_current_text " #W"
    '';
  };
}
