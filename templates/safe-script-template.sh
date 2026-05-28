#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=false
NAME=""

usage() {
  cat <<USAGE
Usage: ./safe-script-template.sh --name VALUE [--dry-run]

Options:
  --name VALUE   Name or target value to process
  --dry-run      Show what would happen without making changes
  --help         Show this help message
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --name)
      NAME="${2:-}"
      shift 2
      ;;
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$NAME" ]]; then
  echo "Error: --name is required" >&2
  usage
  exit 1
fi

if [[ "$DRY_RUN" == true ]]; then
  echo "[dry-run] Would process: $NAME"
else
  echo "Processing: $NAME"
fi
