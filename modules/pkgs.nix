{ pkgs, ... }:

let
  php = pkgs.php82.buildEnv {
    extensions = { enabled, all }: enabled ++ (with all; [ imagick ]);
  };
  composer = pkgs.php82Packages.composer.override {
    php = php;
  };
in
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    corepack
    awscli2
    composer
    fzf
    gh
    git
    go
    jq
    just
    kubectl
    kubectx
    mosh
    nodejs_22
    php
    python314
    ripgrep
    rustup
    wget
  ];
}


