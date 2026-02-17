{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.workmux.packages.${pkgs.system}.default
  ];

  xdg.configFile."workmux/config.yaml".text = ''
    nerdfont: true

    post_create:
      - mise trust

    dashboard:
      merge: "/pr"
  '';
}
