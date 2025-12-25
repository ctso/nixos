{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    brews = [
      "ripgrep"
    ];

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
          "aerospace"
          "helium-browser"
          "tailscale-app"
          "ghostty"

          "font-victor-mono-nerd-font"
          "font-commit-mono-nerd-font"
          "sf-symbols"
        ];
  };
}
