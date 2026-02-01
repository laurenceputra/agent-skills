# Contributing Guide

Thank you for your interest in contributing to agent-skills!

## Ways to Contribute
- Add new skills
- Improve existing skills
- Fix typos or clarify documentation
- Improve installation or validation tooling

## Skill Requirements
- Each skill must live in `skills/<skill-name>/SKILL.md`
- `skill-name` must be lowercase with hyphens
- `SKILL.md` must include the required YAML front matter
- Skill content should remain language-agnostic

## Required YAML Front Matter
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

Optional fields:
- `tags`
- `allowed-tools`

## Development Workflow
1. Create a new branch for your changes.
2. Make focused updates.
3. Run validation commands:
   ```bash
   ./install-skills.sh list
   CODEX_SKILLS_DIR=/tmp/test/codex COPILOT_SKILLS_DIR=/tmp/test/copilot ./install-skills.sh install
   ./scripts/validate-skills.sh
   ```
4. Ensure README updates reflect new/changed skills.
5. Open a pull request with a clear summary.

## Pull Request Checklist
- [ ] Skill front matter is complete and valid
- [ ] README updated if skills changed
- [ ] Validation commands pass
- [ ] No temporary files committed

## Code of Conduct
By participating, you agree to follow the project code of conduct.
