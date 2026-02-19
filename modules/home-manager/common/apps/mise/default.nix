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

  # Exclude ncurses from packages to avoid terminfo conflict with ghostty
  home.packages = buildTools ++ (lib.remove pkgs.ncurses buildLibs);

  home.sessionVariables = let
    libraryPath = lib.makeLibraryPath buildLibs;
  in {
    C_INCLUDE_PATH = lib.makeSearchPathOutput "dev" "include" buildLibs;
    LIBRARY_PATH = libraryPath;
    PKG_CONFIG_PATH = lib.makeSearchPathOutput "dev" "lib/pkgconfig" buildLibs;
    LDFLAGS = "-Wl,-rpath,${libraryPath}";
  };
}
