{ util, config, pkgs, lib, ... }:

{
  programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        ui = {
          logoless = true;
        };
      };
    };
  };

  catppuccin.k9s = {
    enable = true;
    flavor = "mocha";
  };
}
