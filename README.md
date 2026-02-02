# Agent Skills

A collection of common agent skills that work across coding projects in various languages. These skills are designed to be used with codex-cli and GitHub Copilot to enhance AI coding assistants with specialized expertise.

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

## Skills Index

| Skill | Description | Path |
| --- | --- | --- |
| code-review | Expert code review with focus on quality, bugs, and best practices | [`skills/code-review/SKILL.md`](skills/code-review/SKILL.md) |
| security-scanner | Identify security vulnerabilities and OWASP Top 10 issues | [`skills/security-scanner/SKILL.md`](skills/security-scanner/SKILL.md) |
| qa-testing | Test planning, design, and quality assurance | [`skills/qa-testing/SKILL.md`](skills/qa-testing/SKILL.md) |
| release-management | Version management, releases, and deployment | [`skills/release-management/SKILL.md`](skills/release-management/SKILL.md) |
| documentation | Technical writing and documentation best practices | [`skills/documentation/SKILL.md`](skills/documentation/SKILL.md) |
| performance-optimization | Performance analysis and optimization techniques | [`skills/performance-optimization/SKILL.md`](skills/performance-optimization/SKILL.md) |
| debugging-assistant | Systematic debugging and problem-solving | [`skills/debugging-assistant/SKILL.md`](skills/debugging-assistant/SKILL.md) |
| refactoring-expert | Code improvement and design patterns | [`skills/refactoring-expert/SKILL.md`](skills/refactoring-expert/SKILL.md) |

## Installation

### Quick Install

Install skills for codex-cli and a secondary skills directory:

```bash
./install-skills.sh
```

For GitHub Copilot repo-scoped usage, use `./scripts/init-skills-dir.sh` below to populate `.github/skills`.

### Custom Installation

You can customize the installation directories using environment variables:

```bash
export CODEX_SKILLS_DIR=/path/to/your/codex/skills
export COPILOT_SKILLS_DIR=/path/to/your/copilot/skills
./install-skills.sh
```

These variables apply to `./install-skills.sh` (codex-cli and a secondary target). For GitHub Copilot repo-scoped setup, use `./scripts/init-skills-dir.sh` below.

Default directories:
- codex-cli (user scope): `~/.codex/skills`
- secondary target (default): `~/.copilot/skills`
- GitHub Copilot (repo scope): `.github/skills` (use `./scripts/init-skills-dir.sh`)

### Initialize Another Directory (Repo-Scoped)

Initialize skills in another directory relative to your current working directory (for GitHub Copilot repo-scoped usage):

```bash
./scripts/init-skills-dir.sh ../other-repo
```

This creates repo-scoped skill directories:
- Codex: `.codex/skills`
- GitHub Copilot: `.github/skills`

By default, existing skill entries are skipped. Use `--clean` to remove existing entries before installing:

```bash
./scripts/init-skills-dir.sh ../other-repo --clean
```

### Other Commands

List available skills:
```bash
./install-skills.sh list
```

Uninstall skills:
```bash
./install-skills.sh uninstall
```

### Validation

Run local validation to confirm skill metadata and install behavior:

```bash
./scripts/validate-skills.sh
CODEX_SKILLS_DIR=/tmp/test/codex COPILOT_SKILLS_DIR=/tmp/test/copilot ./install-skills.sh install
```

## Skill Format

Each skill follows the Open Agent Skills Standard with proper YAML front matter:

```yaml
---
name: skill-name
description: Clear description of what this skill does and when to use it
license: MIT
tags:
  - example
allowed-tools:
  - bash
metadata:
  author: @laurenceputra
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

This format is compatible with both codex-cli and GitHub Copilot.

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

Once installed, these skills will be available in your codex-cli or GitHub Copilot. The exact usage depends on how your tool implements skills, but typically you can:

1. Reference the skill in your prompts
2. Use skill-specific commands if available
3. The AI will adopt the expertise defined in the skill

Example:
```
# In codex-cli or GitHub Copilot
"Use the code-review skill to review my recent changes"
"Apply the security-scanner skill to check for vulnerabilities"
"Use the refactoring-expert skill to improve this code"
```

## How It Works

The installation scripts copy this repository's skill directories into your tools' skills directories. For GitHub Copilot repo-scoped usage, `./scripts/init-skills-dir.sh` populates `.github/skills`. Each skill is a directory containing a `SKILL.md` file with YAML front matter. This means:

- ✅ Easy to update (pull latest changes, then reinstall)
- ✅ Safe to customize locally without affecting the repo
- ✅ Single source of truth for all skills
- ✅ Works across multiple CLI tools

## Updating Skills

To get the latest skills:

```bash
git pull
./install-skills.sh install
```

## Contributing

Contributions are welcome! If you have ideas for new skills or improvements to existing ones:

1. Fork the repository
2. Create a new branch for your skill/improvement
3. Add or modify skill files in the `skills/` directory
4. Submit a pull request

For detailed contribution guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

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
  author: @laurenceputra
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

## Security

Please report security issues via the process described in [SECURITY.md](SECURITY.md).

## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for community expectations.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for notable updates.

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
