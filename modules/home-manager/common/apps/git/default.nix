{ util, config, pkgs, lib, ... }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  sshSignProgram = if isDarwin
    then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
    else "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
in
{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        co = "checkout";
        br = "branch";
      };
      gpg.format = "ssh";
      "gpg.ssh".program = sshSignProgram;
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMxEhsFd5OjD8wJNb4N0HKrPyJkEeuZETFs9MOihrADX";
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };
}
