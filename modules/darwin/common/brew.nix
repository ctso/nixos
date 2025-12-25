{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    taps = [
      "nikitabobko/tap"
    ];

    casks =
      builtins.map
        (cask: {
          name = cask;
          greedy = true;
        })
        [
          # Apps
          "1password"
          "aerospace"
          "helium-browser"
          "tailscale-app"
          "ghostty"
          "cursor"
          "raycast"
          "spotify"
          "orbstack"

          # Fonts
          "font-victor-mono-nerd-font"
          "font-commit-mono-nerd-font"
          "font-jetbrains-mono-nerd-font"
          "sf-symbols"
        ];
  };
}

