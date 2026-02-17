{ inputs, pkgs, config, ... }:

let
  repoPath = "/Users/ctso/src/nixos";
  skillsPath = "${repoPath}/modules/home-manager/common/apps/claude-code/skills";
  skills = [
    "pr"
    "worktree"
    "rebase"
  ];
  skillFiles = builtins.listToAttrs (map (name: {
    name = ".claude/skills/${name}/SKILL.md";
    value = {
      source = config.lib.file.mkOutOfStoreSymlink "${skillsPath}/${name}/SKILL.md";
    };
  }) skills);
in
{
  home.file = skillFiles;

  programs.claude-code = {
    enable = true;

    # Use the auto-updating package instead of nixpkgs’ one
    package = inputs.claude-code.packages.${pkgs.system}.default;

    settings = {
      env = {
        CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS = "1";
      };
      terminal = {
        default_mode = "acceptEdits";
      };
      permissions = {
        allow = [ "WebSearch" ];
      };
      hooks = {
        UserPromptSubmit = [
          {
            hooks = [
              {
                type = "command";
                command = "workmux set-window-status working";
              }
            ];
          }
        ];
        Notification = [
          {
            matcher = "permission_prompt|elicitation_dialog";
            hooks = [
              {
                type = "command";
                command = "workmux set-window-status waiting";
              }
            ];
          }
        ];
        PostToolUse = [
          {
            hooks = [
              {
                type = "command";
                command = "workmux set-window-status working";
              }
            ];
          }
        ];
        Stop = [
          {
            hooks = [
              {
                type = "command";
                command = "workmux set-window-status done";
              }
            ];
          }
        ];
      };
    };
  };
}
