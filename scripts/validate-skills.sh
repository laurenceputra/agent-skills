#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILLS_DIR="${REPO_ROOT}/skills"

if [ ! -d "${SKILLS_DIR}" ]; then
  echo "Skills directory not found at ${SKILLS_DIR}" >&2
  exit 1
fi

missing_front_matter=0

echo "Validating skill front matter..."
for skill in "${SKILLS_DIR}"/*/SKILL.md; do
  echo "Checking ${skill}..."
  if ! head -20 "${skill}" | grep -q "^---"; then
    echo "✗ Missing YAML front matter: ${skill}" >&2
    missing_front_matter=1
  fi
  if ! grep -q "^name: " "${skill}"; then
    echo "✗ Missing name field: ${skill}" >&2
    missing_front_matter=1
  fi
  if ! grep -q "^description: " "${skill}"; then
    echo "✗ Missing description field: ${skill}" >&2
    missing_front_matter=1
  fi
  if ! grep -q "^license: " "${skill}"; then
    echo "✗ Missing license field: ${skill}" >&2
    missing_front_matter=1
  fi
  if ! grep -q "^tags:" "${skill}"; then
    echo "✗ Missing tags field: ${skill}" >&2
    missing_front_matter=1
  fi
  if ! grep -q "^allowed-tools:" "${skill}"; then
    echo "✗ Missing allowed-tools field: ${skill}" >&2
    missing_front_matter=1
  fi
  echo "✓ ${skill}"
done

if [ "${missing_front_matter}" -ne 0 ]; then
  echo "Skill validation failed." >&2
  exit 1
fi

echo "All skills validated."
