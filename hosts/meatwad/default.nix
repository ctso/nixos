{ vars, nixosModules, ... }:

{
  imports = [
    nixosModules.common
    ./hardware-configuration.nix
  ];

  networking.hostName = vars.hostname;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  time.timeZone = vars.timeZone;

  services.tailscale.enable = true;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
  };

  users.users.${vars.defaultUser} = {
    isNormalUser = true;
    home = "/home/${vars.defaultUser}";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMxEhsFd5OjD8wJNb4N0HKrPyJkEeuZETFs9MOihrADX"
    ];
  };

  system.stateVersion = "24.11";
}
