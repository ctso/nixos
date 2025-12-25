{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    fzf
    git
    jq
    just
    kubectl
    ripgrep
    wget
  ];
}


