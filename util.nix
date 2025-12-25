{
  hostname,
  lib,
}:

let
  absoluteHomeManagerPath = "/etc/nixos/modules/home-manager";

  linkHostApp =
    config: app:
    let
      hostPath = "${absoluteHomeManagerPath}/hosts/${hostname}";
    in
    {
      ".config/${app}".source = config.lib.file.mkOutOfStoreSymlink "${hostPath}/apps/${app}/config";
    };

  linkSharedApp =
    config: app:
    let
      sharedPath = "${absoluteHomeManagerPath}/shared";
    in
    {
      ".config/${app}".source = config.lib.file.mkOutOfStoreSymlink "${sharedPath}/apps/${app}/config";
    };

  util = {
    inherit linkHostApp linkSharedApp;
  };
in
util