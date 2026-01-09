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
    (corepack.override { nodejs = nodejs_22; })
    awscli2
    composer
    fzf
    git
    go
    jq
    just
    kubectl
    kubectx
    nodejs_22
    php
    python314
    ripgrep
    rustup
    wget
  ];
}


