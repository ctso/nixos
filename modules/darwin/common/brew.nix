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
      "coder/coder"
    ];

    brews = [
      "mole"
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
          "raycast"
          "orbstack"
          "obsidian"
          "discord"
          "karabiner-elements"
          "tableplus"
          "vlc"
          "betterdisplay"
          "coder-desktop"
          "hammerspoon"
          "linear-linear"
          "lm-studio"
          "chatgpt"
          "loom"
          "granola"
          "claude"
          "superhuman"

          # Fonts
          "font-victor-mono-nerd-font"
          "font-commit-mono-nerd-font"
          "font-jetbrains-mono-nerd-font"
          "sf-symbols"
        ];
  };
}
