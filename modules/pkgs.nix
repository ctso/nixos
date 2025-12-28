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
    nodejs_22
    (corepack.override { nodejs = nodejs_22; })
    python314
    ripgrep
    rustup
    wget
  ];
}


