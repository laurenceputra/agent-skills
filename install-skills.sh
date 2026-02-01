#!/bin/bash

# Agent Skills Installer
# This script creates symlinks for agent skills in codex-cli and copilot-cli skills directories

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"

echo -e "${BLUE}Agent Skills Installer${NC}"
echo "================================"
echo ""

# Check if skills directory exists
if [ ! -d "$SKILLS_DIR" ]; then
    echo -e "${RED}Error: Skills directory not found at $SKILLS_DIR${NC}"
    exit 1
fi

# Function to create symlinks for a CLI tool
install_skills() {
    local cli_name=$1
    local cli_dir=$2
    
    echo -e "${BLUE}Installing skills for $cli_name...${NC}"
    
    # Check if the CLI directory exists
    if [ ! -d "$cli_dir" ]; then
        echo -e "${YELLOW}Warning: $cli_name directory not found at $cli_dir${NC}"
        echo -e "${YELLOW}Creating directory...${NC}"
        mkdir -p "$cli_dir"
    fi
    
    # Create symlinks for each skill
    local count=0
    for skill in "$SKILLS_DIR"/*.md; do
        if [ -f "$skill" ]; then
            local skill_name=$(basename "$skill")
            local target="$cli_dir/$skill_name"
            
            # Remove existing symlink or file
            if [ -e "$target" ] || [ -L "$target" ]; then
                echo -e "  Removing existing: $skill_name"
                rm -f "$target"
            fi
            
            # Create symlink
            ln -s "$skill" "$target"
            echo -e "  ${GREEN}✓${NC} Linked: $skill_name"
            count=$((count + 1))
        fi
    done
    
    echo -e "${GREEN}Installed $count skills for $cli_name${NC}"
    echo ""
}

# Function to uninstall skills
uninstall_skills() {
    local cli_name=$1
    local cli_dir=$2
    
    echo -e "${BLUE}Uninstalling skills from $cli_name...${NC}"
    
    if [ ! -d "$cli_dir" ]; then
        echo -e "${YELLOW}$cli_name directory not found, nothing to uninstall${NC}"
        echo ""
        return
    fi
    
    local count=0
    for skill in "$SKILLS_DIR"/*.md; do
        if [ -f "$skill" ]; then
            local skill_name=$(basename "$skill")
            local target="$cli_dir/$skill_name"
            
            if [ -L "$target" ]; then
                rm -f "$target"
                echo -e "  ${GREEN}✓${NC} Removed: $skill_name"
                count=$((count + 1))
            fi
        fi
    done
    
    echo -e "${GREEN}Uninstalled $count skills from $cli_name${NC}"
    echo ""
}

# Default skill directories
CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
COPILOT_SKILLS_DIR="${COPILOT_SKILLS_DIR:-$HOME/.copilot-cli/skills}"

# Parse command line arguments
COMMAND="${1:-install}"

case "$COMMAND" in
    install)
        echo "Installing agent skills..."
        echo ""
        install_skills "codex-cli" "$CODEX_SKILLS_DIR"
        install_skills "copilot-cli" "$COPILOT_SKILLS_DIR"
        echo -e "${GREEN}Installation complete!${NC}"
        echo ""
        echo "Skills have been symlinked to:"
        echo "  - codex-cli: $CODEX_SKILLS_DIR"
        echo "  - copilot-cli: $COPILOT_SKILLS_DIR"
        echo ""
        echo "To use custom directories, set these environment variables:"
        echo "  export CODEX_SKILLS_DIR=/your/custom/path"
        echo "  export COPILOT_SKILLS_DIR=/your/custom/path"
        ;;
    
    uninstall)
        echo "Uninstalling agent skills..."
        echo ""
        uninstall_skills "codex-cli" "$CODEX_SKILLS_DIR"
        uninstall_skills "copilot-cli" "$COPILOT_SKILLS_DIR"
        echo -e "${GREEN}Uninstallation complete!${NC}"
        ;;
    
    list)
        echo "Available skills:"
        echo ""
        for skill in "$SKILLS_DIR"/*.md; do
            if [ -f "$skill" ]; then
                skill_name=$(basename "$skill" .md)
                echo -e "  ${GREEN}•${NC} $skill_name"
            fi
        done
        echo ""
        ;;
    
    *)
        echo "Usage: $0 [install|uninstall|list]"
        echo ""
        echo "Commands:"
        echo "  install    - Install skills by creating symlinks (default)"
        echo "  uninstall  - Remove skill symlinks"
        echo "  list       - List available skills"
        echo ""
        echo "Environment Variables:"
        echo "  CODEX_SKILLS_DIR    - Custom path for codex-cli skills (default: ~/.codex/skills)"
        echo "  COPILOT_SKILLS_DIR  - Custom path for copilot-cli skills (default: ~/.copilot-cli/skills)"
        exit 1
        ;;
esac
