# Agent Skills

A collection of common agent skills that work across coding projects in various languages. These skills are designed to be used with codex-cli and copilot-cli to enhance AI coding assistants with specialized expertise.

## Overview

This repository provides a curated set of agent skills covering essential software development tasks:

- **Code Review** - Expert code review with focus on quality, bugs, and best practices
- **Security Scanner** - Identify security vulnerabilities and OWASP Top 10 issues
- **QA Testing** - Test planning, design, and quality assurance
- **Release Management** - Version management, releases, and deployment
- **Documentation** - Technical writing and documentation best practices
- **Performance Optimization** - Performance analysis and optimization techniques
- **Debugging Assistant** - Systematic debugging and problem-solving
- **Refactoring Expert** - Code improvement and design patterns

## Installation

### Quick Install

Install skills for both codex-cli and copilot-cli:

```bash
./install-skills.sh
```

### Custom Installation

You can customize the installation directories using environment variables:

```bash
export CODEX_SKILLS_DIR=/path/to/your/codex/skills
export COPILOT_SKILLS_DIR=/path/to/your/copilot/skills
./install-skills.sh
```

Default directories:
- codex-cli: `~/.codex/skills`
- copilot-cli: `~/.copilot-cli/skills`

### Other Commands

List available skills:
```bash
./install-skills.sh list
```

Uninstall skills:
```bash
./install-skills.sh uninstall
```

## Skill Format

Each skill follows the Open Agent Skills Standard with proper YAML front matter:

```yaml
---
name: skill-name
description: Clear description of what this skill does and when to use it
license: MIT
metadata:
  author: Laurence Putra Franslay
  version: 1.0.0
---
```

### Directory Structure

```
skills/
├── code-review/
│   └── SKILL.md
├── debugging-assistant/
│   └── SKILL.md
└── ...
```

Each skill is in its own directory containing a `SKILL.md` file with:
- **YAML front matter** with required metadata
- **Markdown content** describing the skill's expertise and guidelines

This format is compatible with both codex-cli and copilot-cli.

## Skills Description

### Code Review
Expert code reviewer that analyzes code changes for:
- Logic errors and bugs
- Security vulnerabilities
- Performance issues
- Code quality and maintainability
- Testing adequacy
- Documentation completeness

### Security Scanner
Security expert that identifies:
- OWASP Top 10 vulnerabilities
- Injection flaws
- Authentication issues
- Data exposure risks
- Dependency vulnerabilities
- Cryptographic issues

### QA Testing
QA engineer that helps with:
- Test planning and strategy
- Test case design
- Unit, integration, and E2E tests
- Coverage analysis
- Quality metrics

### Release Management
Release engineer that assists with:
- Semantic versioning
- Changelog generation
- Release planning
- Deployment strategies
- Rollback procedures

### Documentation
Technical writer that creates:
- Code documentation
- API documentation
- User guides
- Developer documentation
- README files

### Performance Optimization
Performance expert that provides:
- Performance analysis
- Bottleneck identification
- Optimization strategies
- Frontend and backend tuning
- Performance metrics

### Debugging Assistant
Debugging expert that helps:
- Analyze problems
- Identify root causes
- Suggest debugging strategies
- Provide systematic approaches
- Prevent future issues

### Refactoring Expert
Refactoring specialist that:
- Detects code smells
- Suggests improvements
- Applies design patterns
- Follows SOLID principles
- Ensures safe refactoring

## Usage

Once installed, these skills will be available in your codex-cli or copilot-cli. The exact usage depends on how your CLI tool implements skills, but typically you can:

1. Reference the skill in your prompts
2. Use skill-specific commands if available
3. The AI will adopt the expertise defined in the skill

Example:
```
# In codex-cli or copilot-cli
"Use the code-review skill to review my recent changes"
"Apply the security-scanner skill to check for vulnerabilities"
"Use the refactoring-expert skill to improve this code"
```

## How It Works

The installation script creates symlinks from this repository's skill directories to your CLI tools' skills directories. Each skill is a directory containing a `SKILL.md` file with YAML front matter. This means:

- ✅ Skills stay in sync with this repository
- ✅ Easy to update (just pull latest changes)
- ✅ Single source of truth for all skills
- ✅ Works across multiple CLI tools

## Updating Skills

To get the latest skills:

```bash
git pull
# Skills are automatically updated via symlinks
```

## Contributing

Contributions are welcome! If you have ideas for new skills or improvements to existing ones:

1. Fork the repository
2. Create a new branch for your skill/improvement
3. Add or modify skill files in the `skills/` directory
4. Submit a pull request

### Skill Format Requirements

Each skill must follow this structure:

```
skills/
└── skill-name/
    └── SKILL.md
```

**SKILL.md must include:**

1. **YAML Front Matter** (required):
```yaml
---
name: skill-name
description: Clear, actionable description (10-500 characters)
license: MIT
metadata:
  author: Your Name
  version: 1.0.0
---
```

2. **Markdown Content**:
   - **Title** - Clear name for the skill
   - **Role Description** - What expertise this skill provides
   - **Guidelines** - Specific instructions and best practices
   - **Output Format** - How to structure responses

See existing skills for examples.

## License

MIT License - see [LICENSE](LICENSE) for details.

## Support

If you encounter issues or have questions:
- Open an issue on GitHub
- Check existing skills for examples
- Review the installation script for troubleshooting

## Roadmap

Future skills to consider:
- CI/CD Pipeline Expert
- Database Design Expert
- API Design Specialist
- Frontend Architecture
- Backend Architecture
- DevOps Specialist
- Accessibility Expert
- Internationalization (i18n) Expert

Contributions for any of these or other useful skills are welcome!