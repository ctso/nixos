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
    shellAliases = {
      ff = "fastfetch";
      lg = "lazygit";
      cat = "bat";

      ls = "eza --icons always";
      ll = "eza -bhl --icons --group-directories-first";
      la = "eza -abhl --icons --group-directories-first";
      lt = "eza --tree --level=2 --icons";
    };
    initContent = ''
      # Add local node_modules/.bin to PATH
      export PATH="./node_modules/.bin:$PATH"
    '';
  };
}

