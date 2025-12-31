{ pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];
  };

  catppuccin.tmux = {
    enable = true;
    flavor = "mocha";
  };
}
