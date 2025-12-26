{ vars, ... }:

{
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = vars.defaultUser;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.15;
      orientation = "bottom";
      tilesize = 48;
      launchanim = false;
      minimize-to-application = true;
      show-process-indicators = true;
      show-recents = false;
      showhidden = false;
      static-only = false;
      mineffect = "scale";
      dashboard-in-overlay = false;
      expose-animation-duration = 0.2;
      expose-group-apps = true;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      mru-spaces = false;
      persistent-apps = [
        "/Applications/Helium.app"
        "/Applications/Ghostty.app"
      ];
    };
    WindowManager = {
      EnableStandardClickToShowDesktop = false;
    };
    NSGlobalDomain = {
      KeyRepeat = 1;
      InitialKeyRepeat = 10;
      ApplePressAndHoldEnabled = false;
    };
    # Disable Spotlight's cmd+space shortcut to free it for Raycast
    # Key 64 is the Spotlight search shortcut in AppleSymbolicHotKeys
    CustomUserPreferences = {
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          "64" = {
            enabled = false;
          };
        };
      };
    };
  };
}
