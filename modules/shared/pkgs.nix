{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [ "/share/zsh" ];

  environment.systemPackages = with pkgs; [
    fzf
    ripgrep
    git
    wget
  ];
}
