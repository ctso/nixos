{ util, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    gdu
    tree-sitter
    bottom
    gettext
    opencode
  ];

  # Symlink config directly to ~/.config/nvim (out-of-store)
  # This allows iterating on the vim config without rebuilding
  home.file = util.linkSharedApp config "nvim";
}
