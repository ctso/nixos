{ hmModules, lib, ... }:

{
  imports = [
    hmModules.common
  ];

  programs.git.settings = {
    commit.gpgsign = lib.mkForce false;
    tag.gpgsign = lib.mkForce false;
  };
}
