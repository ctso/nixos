{
  config,
  util,
  pkgs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    envExtra = ''
      ZDOTDIR=$HOME/.config/zsh
    '';
  };

  home.file = util.linkSharedApp config "zsh";
}
