# Justfile for nix-darwin configuration

hostname := `hostname -s`

# Rebuild and switch to the darwin configuration
default:
    sudo darwin-rebuild switch --flake .#{{hostname}}

# Rebuild and switch (alias for default)
rebuild:
    sudo darwin-rebuild switch --flake .#{{hostname}}

# Show the current configuration
show:
    sudo darwin-rebuild show --flake .#{{hostname}}

# Check the configuration for errors
check:
    sudo darwin-rebuild check --flake .#{{hostname}}

# Update flake inputs
update:
    nix flake update

# Garbage collect unused nix store entries
gc:
    nix-collect-garbage -d

