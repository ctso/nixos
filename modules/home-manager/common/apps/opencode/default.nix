{ pkgs, lib, ... }:

let
  opencode-config = {
    "$schema" = "https://opencode.ai/config.json";
    mcp = {
      # GitHub Grep for code search
      gh_grep = {
        type = "remote";
        url = "https://mcp.grep.app";
      };

      # Serena - Semantic code retrieval and editing toolkit
      serena = {
        type = "local";
        command = [ "uvx" "--from" "git+https://github.com/oraios/serena" "serena" "start-mcp-server" "--context" "ide" ];
        enabled = true;
        environment = {
          # Add any required environment variables for language servers here
          # Example: DOTNET_ROOT = "/opt/homebrew/Cellar/dotnet/9.0.8/libexec";
        };
      };
    };
  };
in
{
  home.packages = with pkgs; [
    opencode
    uv # Required for uvx to run Serena
  ];

  # Create opencode config directory and file
  home.file.".config/opencode/opencode.jsonc" = {
    text = builtins.toJSON opencode-config;
  };

  # Add environment variables for MCP servers (if needed)
  home.sessionVariables = {
    # Optional: Set your Context7 API key for higher rate limits
    # CONTEXT7_API_KEY = lib.mkDefault "";
    # Add other API keys as environment variables here
  };

  # Add opencode to PATH if installed locally
  home.sessionPath = [
    # Add local opencode installation path if needed
    # "${config.home.homeDirectory}/.npm-global/bin"
  ];
}
