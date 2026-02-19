{ util, config, pkgs, lib, ... }:

{
  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    settings.python_compile = false;
    settings.aqua.github_attestations = false;
  };
}
