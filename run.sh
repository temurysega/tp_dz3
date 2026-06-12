#!/usr/bin/env bash
set -e
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMAND="${1:-}"
case "$COMMAND" in build_generator) docker build -t tp-generator "$PROJECT_DIR/generator";;

  run_generator)
    mkdir -p "$PROJECT_DIR/data"
    docker run --rm -v "$PROJECT_DIR/data:/data" tp-generator;;

  create_local_data)
    mkdir -p "$PROJECT_DIR/local_data"
    python3 "$PROJECT_DIR/generator/generate.py" "$PROJECT_DIR/local_data";;

  *)
    exit 1
    ;;
esac