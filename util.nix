{
  hostname,
  lib,
  flakeRoot ? null,
}:

let
  absoluteHomeManagerPath = if flakeRoot != null then "${flakeRoot}/home-manager" else "/etc/nixos/home-manager";
  absoluteModulesPath = if flakeRoot != null then "${flakeRoot}/modules" else "/etc/nixos/modules";

  linkHostApp =
    config: app:
    let
      hostPath = "${absoluteHomeManagerPath}/${hostname}";
    in
    {
      ".config/${app}".source = config.lib.file.mkOutOfStoreSymlink "${hostPath}/apps/${app}/config";
    };

  linkSharedApp =
    config: app:
    let
      sharedPath = "${absoluteModulesPath}/home-manager/common";
    in
    {
      ".config/${app}".source = config.lib.file.mkOutOfStoreSymlink "${sharedPath}/apps/${app}/config";
    };

  util = {
    inherit linkHostApp linkSharedApp;
  };
in
util