#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILLS_DIR="${REPO_ROOT}/skills"

usage() {
  echo "Usage: $0 <relative-dir> [--clean]"
  echo ""
  echo "Initializes a target directory (relative to the current working directory)"
  echo "with repo-scoped skills for Codex and GitHub Copilot."
  echo ""
  echo "Creates:"
  echo "  <target>/.codex/skills"
  echo "  <target>/.github/skills"
  echo ""
  echo "Options:"
  echo "  --clean   Remove existing skill entries before installing"
}

TARGET_INPUT=""
CLEAN=false

for arg in "$@"; do
  case "$arg" in
    --clean)
      CLEAN=true
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      echo "Unknown option: $arg" >&2
      usage >&2
      exit 1
      ;;
    *)
      if [ -z "$TARGET_INPUT" ]; then
        TARGET_INPUT="$arg"
      else
        echo "Unexpected argument: $arg" >&2
        usage >&2
        exit 1
      fi
      ;;
  esac
done

if [ -z "$TARGET_INPUT" ]; then
  usage >&2
  exit 1
fi

if [ ! -d "${SKILLS_DIR}" ]; then
  echo "Skills directory not found at ${SKILLS_DIR}" >&2
  exit 1
fi

if [ ! -d "${TARGET_INPUT}" ]; then
  mkdir -p "${TARGET_INPUT}"
fi

TARGET_ROOT="$(cd "${TARGET_INPUT}" && pwd)"
CODEX_TARGET="${TARGET_ROOT}/.codex/skills"
COPILOT_TARGET="${TARGET_ROOT}/.github/skills"

install_skills() {
  local label=$1
  local dest=$2
  local count=0
  local skipped=0

  mkdir -p "${dest}"

  for skill_dir in "${SKILLS_DIR}"/*/; do
    if [ -d "${skill_dir}" ] && [ -f "${skill_dir}/SKILL.md" ]; then
      local skill_name
      skill_name="$(basename "${skill_dir}")"
      local target="${dest}/${skill_name}"

      if [ -e "${target}" ] || [ -L "${target}" ]; then
        if [ "${CLEAN}" = true ]; then
          rm -rf "${target}"
        else
          echo "  Skipping existing: ${skill_name}"
          skipped=$((skipped + 1))
          continue
        fi
      fi

      cp -R "${skill_dir}" "${target}"
      echo "  Copied: ${skill_name}"
      count=$((count + 1))
    fi
  done

  echo "Installed ${count} skills for ${label} into ${dest}"
  if [ "${CLEAN}" = false ] && [ "${skipped}" -gt 0 ]; then
    echo "Skipped ${skipped} existing skills for ${label}"
  fi
  echo ""
}

echo "Initializing skills in ${TARGET_ROOT}"
echo ""
install_skills "Codex" "${CODEX_TARGET}"
install_skills "GitHub Copilot" "${COPILOT_TARGET}"
echo "Done."
