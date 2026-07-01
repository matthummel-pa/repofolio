#!/usr/bin/env bash
#
# Build a clean, installable Repofolio zip (top-level folder = repofolio/).
# Output: repofolio.zip in the repo root.
#
set -euo pipefail
cd "$(dirname "$0")/.."

ROOT="$(pwd)"
NAME="repofolio"
STAGE="$(mktemp -d)"
DEST="$STAGE/$NAME"
mkdir -p "$DEST"

# Copy everything except VCS, dev, and OS cruft.
tar --exclude='.git' --exclude='./repofolio.zip' \
    --exclude='.fuse_hidden*' --exclude='.DS_Store' \
    --exclude='node_modules' -cf - . | ( cd "$DEST" && tar -xf - )

rm -f "$ROOT/$NAME.zip"
( cd "$STAGE" && zip -rq "$ROOT/$NAME.zip" "$NAME" )
rm -rf "$STAGE"

echo "Built $ROOT/$NAME.zip"
