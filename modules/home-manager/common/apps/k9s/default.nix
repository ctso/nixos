{ util, config, pkgs, lib, ... }:

{
  programs.k9s = {
    enable = true;
  };

  catppuccin.k9s = {
    enable = true;
    flavor = "mocha";
  };
}
