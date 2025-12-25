{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    gdu
    tree-sitter
    bottom
    gettext
  ];

  home.file.".config/nvim" = {
    source = ./astro;
    recursive = true;
  };

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    extraPlugins = with pkgs.vimPlugins; [
      astrocore
      astrotheme
      astroui
      astrolsp
      mason-nvim-dap-nvim
      mason-null-ls-nvim
    ];
  };
}