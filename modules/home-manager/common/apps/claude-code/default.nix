{ ... }:

{
  programs.claude-code = {
    enable = true;
    settings = {
      terminal = {
        default_mode = "acceptEdits";
      };
    };
  };
}
