{ hmModules, ... }:

{
  imports = [
    hmModules.common
  ];

  programs.git.settings = {
    commit.gpgsign = false;
    tag.gpgsign = false;
  };
}
