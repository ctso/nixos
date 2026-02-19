# Justfile for nix configuration

hostname := `hostname -s`
os := os()

# Rebuild and switch to the configuration
default: update rebuild

# Rebuild and switch
rebuild:
    {{ if os == "macos" { "sudo darwin-rebuild switch --flake .#" + hostname } else { "sudo nixos-rebuild switch --flake .#" + hostname } }}

# Show the current configuration
show:
    {{ if os == "macos" { "sudo darwin-rebuild show --flake .#" + hostname } else { "nixos-rebuild list-generations" } }}

# Check the configuration for errors
check:
    {{ if os == "macos" { "sudo darwin-rebuild check --flake .#" + hostname } else { "nix flake check" } }}

# Update flake inputs
update:
    nix flake update

# Garbage collect unused nix store entries
gc:
    nix-collect-garbage -d
