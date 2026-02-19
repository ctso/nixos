{
  hostname,
  lib,
  # Hardcoded path to the repo checkout for out-of-store symlinks
  # This allows editing configs without rebuilding nix
  repoPath ? "/Users/ctso/src/nixos",
}:

let
  absoluteHomeManagerPath = "${repoPath}/home-manager";
  absoluteModulesPath = "${repoPath}/modules";

  linkSharedApp =
    config: app:
    let
      sharedPath = "${absoluteModulesPath}/home-manager/common";
    in
    {
      ".config/${app}".source = config.lib.file.mkOutOfStoreSymlink "${sharedPath}/apps/${app}/config";
    };

  util = {
    inherit linkSharedApp repoPath;
  };
in
util