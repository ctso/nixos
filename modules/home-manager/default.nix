{
  inputs,
  username,
  hostname,
  specialArgs,
  flakeRoot ? "/etc/nixos",
}:

let
  buildHomeManagerConfig =
    hostname:
    let
      absoluteHomeManagerPath = "${flakeRoot}/modules/home-manager";
      hostPath = "${absoluteHomeManagerPath}/hosts/${hostname}";
      sharedPath = "${absoluteHomeManagerPath}/shared";
    in
    {
      linkHostApp = config: app: config.lib.file.mkOutOfStoreSymlink "${hostPath}/apps/${app}/config";
      linkSharedApp = config: app: config.lib.file.mkOutOfStoreSymlink "${sharedPath}/apps/${app}/config";
    };
in
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = specialArgs // {
    homeManagerConfig = buildHomeManagerConfig hostname;
  };
  home-manager.users."${username}" =
    { pkgs, lib, ... }:
    let
      darwinHomeManagerPath = "${flakeRoot}/modules/shared/darwin/home-manager/default.nix";
    in
    {
      imports = [
        ./shared
        ./hosts/${hostname}
      ] ++ lib.optionals (pkgs.stdenv.isDarwin) [
        darwinHomeManagerPath
      ];
    };
}
