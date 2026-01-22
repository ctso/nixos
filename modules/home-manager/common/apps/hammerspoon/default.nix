{ util, config, pkgs, ... }:

let
  configPath = "/Users/ctso/src/nixos/modules/home-manager/common/apps/hammerspoon/config";
in
{
  home.file.".hammerspoon/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/init.lua";

  # Install SpoonInstall if it doesn't exist
  home.activation.installSpoonInstall = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/.hammerspoon/Spoons/SpoonInstall.spoon" ]; then
      $DRY_RUN_CMD mkdir -p "$HOME/.hammerspoon/Spoons"
      $DRY_RUN_CMD ${pkgs.curl}/bin/curl -L -o /tmp/SpoonInstall.spoon.zip https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip
      $DRY_RUN_CMD ${pkgs.unzip}/bin/unzip -o /tmp/SpoonInstall.spoon.zip -d "$HOME/.hammerspoon/Spoons"
      $DRY_RUN_CMD rm /tmp/SpoonInstall.spoon.zip
    fi
  '';
}
