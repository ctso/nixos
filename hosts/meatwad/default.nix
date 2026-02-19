{ vars, nixosModules, ... }:

{
  imports = [
    nixosModules.common
    ./hardware-configuration.nix
  ];

  networking.hostName = vars.hostname;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = vars.timeZone;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
  };

  users.users.${vars.defaultUser} = {
    isNormalUser = true;
    home = "/home/${vars.defaultUser}";
    extraGroups = [ "wheel" ];
    # TODO: add your authorized SSH keys
    # openssh.authorizedKeys.keys = [ ];
  };

  system.stateVersion = "24.11";
}
