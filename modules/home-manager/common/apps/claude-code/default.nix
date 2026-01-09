{ inputs, pkgs, ... }:

{
  programs.claude-code = {
    enable = true;

    # Use the auto-updating package instead of nixpkgs’ one
    package = inputs.claude-code.packages.${pkgs.system}.default;

    settings = {
      terminal = {
        default_mode = "acceptEdits";
      };
    };
  };
}
