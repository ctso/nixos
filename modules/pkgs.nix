{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    fzf
    git
    go
    jq
    just
    kubectl
    nodejs_24
    php83
    python314
    ripgrep
    rustup
    wget
  ];
}


