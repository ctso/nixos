# Justfile for nix-darwin configuration

# Rebuild and switch to the darwin configuration
default:
    sudo darwin-rebuild switch --flake .#ctso-macbook

# Rebuild and switch (alias for default)
rebuild:
    sudo darwin-rebuild switch --flake .#ctso-macbook

# Show the current configuration
show:
    sudo darwin-rebuild show --flake .#ctso-macbook

# Check the configuration for errors
check:
    sudo darwin-rebuild check --flake .#ctso-macbook

# Update flake inputs
update:
    nix flake update

# Garbage collect unused nix store entries
gc:
    nix-collect-garbage -d

