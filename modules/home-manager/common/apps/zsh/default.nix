{
  config,
  util,
  pkgs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    envExtra = ''
      ZDOTDIR=$HOME/.config/zsh
    '';
    shellAliases = {
      ff = "fastfetch";
    };
  };

  home.file = util.linkSharedApp config "zsh";
}

