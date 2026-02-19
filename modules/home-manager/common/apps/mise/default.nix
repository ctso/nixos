{ util, config, pkgs, lib, ... }:

let
  # Tools needed for compilation
  buildTools = with pkgs; [
    gcc
    gnumake
    pkg-config
  ];

  # Libraries needed for Python compilation
  buildLibs = with pkgs; [
    openssl
    zlib
    libffi
    readline
    bzip2
    ncurses
    sqlite
    xz
  ];
in
{
  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    settings.python_compile = true;
    settings.aqua.github_attestations = false;
  };

  home.packages = buildTools ++ buildLibs;

  home.sessionVariables = {
    C_INCLUDE_PATH = lib.makeSearchPathOutput "dev" "include" buildLibs;
    LIBRARY_PATH = lib.makeLibraryPath buildLibs;
    PKG_CONFIG_PATH = lib.makeSearchPathOutput "dev" "lib/pkgconfig" buildLibs;
  };
}
