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
    fzf
    git
    go
    jq
    just
    kubectl
    nodejs_22
    (corepack.override { nodejs = nodejs_22; })
    php
    composer
    python314
    ripgrep
    rustup
    wget
    awscli2
  ];
}


