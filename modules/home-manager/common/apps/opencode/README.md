# OpenCode Configuration

This module installs and configures OpenCode with MCP (Model Context Protocol) servers.

## Installation

OpenCode is installed from nixpkgs and should be available in your PATH after rebuilding.

## MCP Servers

The following MCP servers are configured by default:

### 1. Context7 (`context7`)
- **Purpose**: Search through documentation
- **Type**: Remote
- **URL**: https://mcp.context7.com/mcp
- **Usage**: Add `use context7` to your prompts
- **API Key**: Optional, set `CONTEXT7_API_KEY` environment variable for higher rate limits

### 2. GitHub Grep (`gh_grep`)
- **Purpose**: Search code snippets on GitHub
- **Type**: Remote  
- **URL**: https://mcp.grep.app
- **Usage**: Add `use the gh_grep tool` to your prompts

### 3. Serena (`serena`)
- **Purpose**: Semantic code retrieval and editing toolkit
- **Type**: Local
- **Command**: `uvx --from git+https://github.com/oraios/serena serena start-mcp-server --context ide`
- **Features**: 
  - Symbol-level code understanding and manipulation
  - Support for 30+ programming languages via LSP
  - IDE-like code navigation and editing capabilities
  - Token-efficient operations for large codebases
- **Usage**: Serena tools are automatically available when working on code projects
- **Languages**: Python, JavaScript, TypeScript, Rust, Go, Java, C/C++, Nix, and many more

### 4. Local MCP Server (disabled)
- **Purpose**: Testing with a local MCP server
- **Type**: Local
- **Command**: `npx -y @modelcontextprotocol/server-everything`
- **Status**: Disabled by default

## Usage Examples

### Documentation Search
```
Configure a Cloudflare Worker script to cache JSON API responses for five minutes. use context7
```

### Code Search
```
What's the right way to set a custom domain in an SST Astro component? use the gh_grep tool
```

### Semantic Code Operations (Serena)
```
Find all functions that reference the main configuration file and add error handling.
```

```
Create a new module that exports all utility functions from the helpers directory.
```

## Authentication

For MCP servers that require authentication (like Sentry), you can authenticate using:

```bash
opencode mcp auth <server-name>
```

List all MCP servers and their auth status:
```bash
opencode mcp list
```

## Configuration

The configuration is stored in `~/.config/opencode/opencode.jsonc`. You can:

1. Modify this file directly
2. Add environment variables for API keys
3. Enable/disable servers in the configuration
4. Add new MCP servers as needed

## Adding New MCP Servers

To add a new MCP server, edit the configuration in this module and add it to the `mcp` section:

```nix
mcp = {
  my-new-server = {
    type = "remote";  # or "local"
    url = "https://my-mcp-server.com/mcp";
    # Add other configuration options as needed
  };
};
```

## Environment Variables

Set these in your shell configuration or this module:

- `CONTEXT7_API_KEY`: For Context7 higher rate limits (optional)
- Language server dependencies: Some language servers used by Serena may require additional environment variables (e.g., `DOTNET_ROOT` for F# on macOS)

## Rebuild

After making changes, rebuild your home-manager configuration:

```bash
home-manager switch --flake .#<hostname>
```