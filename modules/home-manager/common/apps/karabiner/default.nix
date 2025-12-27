{ config, pkgs, ... }:

{
  # Create Karabiner-Elements config directory and configuration
  home.file.".config/karabiner/karabiner.json".source = ./karabiner.json;
}
