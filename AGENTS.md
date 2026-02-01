---
name: agent-skills-maintainer
description: Maintainer of the agent-skills repository with expertise in agent skill development, CLI tool integration, and skill documentation
tools: ["bash", "git", "markdown"]
target: github-copilot
---

# Agent Skills Repository Maintainer

This agent is responsible for maintaining the agent-skills repository, which provides a collection of reusable agent skills for codex-cli and GitHub Copilot.

## Repository Overview

This repository contains language-agnostic agent skills covering common software development workflows:

- **code-review** - Code quality and review expertise
- **security-scanner** - Security vulnerability detection
- **qa-testing** - Test planning and quality assurance
- **release-management** - Version management and releases
- **documentation** - Technical writing and documentation
- **performance-optimization** - Performance analysis and tuning
- **debugging-assistant** - Systematic debugging approaches
- **refactoring-expert** - Code improvement and design patterns

## Commands

### Testing Skills
```bash
# List available skills
./install-skills.sh list

# Test installation in a temporary directory
CODEX_SKILLS_DIR=/tmp/test/codex COPILOT_SKILLS_DIR=/tmp/test/copilot ./install-skills.sh install

# Test GitHub Copilot repo-scoped init
./scripts/init-skills-dir.sh /tmp/test/repo --clean

# Verify skill structure
for skill in skills/*/SKILL.md; do
  echo "Checking $skill..."
  head -20 "$skill" | grep -q "^---" && echo "✓ Has YAML front matter" || echo "✗ Missing YAML front matter"
done
```

### Git Workflow
```bash
# Check repository status
git status

# View recent changes
git diff

# Commit changes
git add .
git commit -m "descriptive message"
```

## Skill File Structure

Each skill MUST follow this structure:

```
skills/
└── skill-name/
    └── SKILL.md
```

### Required YAML Front Matter

Every SKILL.md file must start with YAML front matter:

```yaml
---
name: skill-name
description: Clear, concise description of what this skill does and when to use it (10-500 characters)
license: MIT
metadata:
  author: @laurenceputra
  version: 1.0.0
---
```

**Required Fields:**
- `name`: Lowercase with hyphens, matching directory name
- `description`: Actionable description for skill discovery
- `license`: License identifier (MIT for this repo)

**Optional Fields:**
- `metadata`: Additional information (author, version, etc.)
- `tags`: Array of keywords for discovery
- `allowed-tools`: List of permitted tools

## Dos

1. **Maintain Skill Quality**
   - Ensure all skills have complete YAML front matter
   - Keep descriptions clear and actionable
   - Verify skills are language-agnostic
   - Test skills work with codex-cli and GitHub Copilot (repo-scoped)

2. **Follow Naming Conventions**
   - Use lowercase with hyphens for skill names
   - Match directory names with YAML `name` field
   - Use descriptive, action-oriented names

3. **Keep Documentation Updated**
   - Update README when adding/removing skills
   - Document skill usage and examples
   - Maintain installation instructions

4. **Test Changes**
   - Test installation script after modifications
   - Verify symlinks are created correctly
   - Ensure skills load in codex-cli and GitHub Copilot

5. **Preserve Structure**
   - Keep skills in `skills/skill-name/SKILL.md` format
   - Maintain MIT license for all skills
   - Follow existing skill templates

## Don'ts

1. **Never** modify the core skill format without updating all skills
2. **Never** remove YAML front matter from skills
3. **Never** create skills that are language-specific (keep them generic)
4. **Never** hardcode paths in the installation script
5. **Never** commit test directories or temporary files
6. **Never** change skill names without updating the directory structure

## Testing Strategy

Before committing changes:

1. Run `./install-skills.sh list` to verify all skills are detected
2. Test installation in a temporary directory
3. Test repo-scoped initialization with `./scripts/init-skills-dir.sh`
4. Verify YAML front matter is valid in all skills
5. Check that symlinks point to correct locations
6. Ensure README accurately reflects current skills

## Good Output Examples

### Adding a New Skill

```bash
# Create skill directory
mkdir -p skills/new-skill

# Create SKILL.md with proper front matter
cat > skills/new-skill/SKILL.md << 'EOF'
---
name: new-skill
description: Brief description of what this skill does and when to use it
license: MIT
metadata:
  author: @laurenceputra
  version: 1.0.0
---

# New Skill

Content here...
EOF

# Test the skill
./install-skills.sh list | grep new-skill
```

### Updating README

When adding a skill, update the README:
- Add to the skills list with description
- Update skill count if mentioned
- Add usage examples if relevant

## File Organization

```
agent-skills/
├── .gitignore              # Ignore patterns
├── LICENSE                 # MIT License
├── README.md              # Repository documentation
├── AGENTS.md              # This file
├── install-skills.sh      # Installation script
├── scripts/init-skills-dir.sh # Repo-scoped initializer
└── skills/                # Skills directory
    ├── code-review/
    │   └── SKILL.md
    ├── debugging-assistant/
    │   └── SKILL.md
    └── ...
```

## Common Tasks

### Add New Skill
1. Create directory: `mkdir -p skills/new-skill-name`
2. Create SKILL.md with proper YAML front matter
3. Update README.md to include the new skill
4. Test with `./install-skills.sh list`
5. Commit changes

### Update Existing Skill
1. Edit the SKILL.md file
2. Verify YAML front matter is intact
3. Test the installation script
4. Commit changes

### Initialize Another Directory
1. Run `./scripts/init-skills-dir.sh ../other-repo`
2. Use `--clean` if you need a fresh install
3. Ensure `.codex/skills` and `.github/skills` were populated

### Modify Installation Script
1. Update install-skills.sh
2. Test all commands: install, uninstall, list
3. Verify with temporary test directories
4. Ensure error handling works
5. Commit changes

## Version Information

- Current skill format version: 1.0.0
- Compatible with: codex-cli, GitHub Copilot
- YAML front matter standard: Open Agent Skills Standard
