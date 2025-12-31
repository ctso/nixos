{ util, config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        co = "checkout";
        br = "branch";
      };
      gpg.format = "ssh";
      "gpg.ssh".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMxEhsFd5OjD8wJNb4N0HKrPyJkEeuZETFs9MOihrADX";
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };
}
