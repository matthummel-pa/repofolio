#!/usr/bin/env bash
#
# Publish Repofolio to GitHub: create the repo, push, and enable GitHub Pages.
# Requires the GitHub CLI (https://cli.github.com) authenticated as you:
#   gh auth login
#
# Usage:
#   ./scripts/publish.sh [owner] [repo] [public|private]
#
set -euo pipefail

OWNER="${1:-matthummel-pa}"
REPO="${2:-repofolio}"
VISIBILITY="${3:-public}"

command -v gh >/dev/null || { echo "GitHub CLI (gh) not found. Install: https://cli.github.com"; exit 1; }
command -v git >/dev/null || { echo "git not found."; exit 1; }

# Ensure we're at the repo root (the folder containing repofolio.php).
cd "$(dirname "$0")/.."

# Initialise git if needed.
if [ ! -d .git ]; then
  git init -q
  git add -A
  git commit -q -m "Initial commit: Repofolio"
fi
git branch -M main

# Create the remote repo and push (idempotent-ish: skips creation if it exists).
if gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
  echo "Repo $OWNER/$REPO already exists — pushing."
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$OWNER/$REPO.git"
  git push -u origin main
else
  gh repo create "$OWNER/$REPO" \
    --"$VISIBILITY" \
    --source=. \
    --remote=origin \
    --description="Turn your GitHub repos and website projects into a living portfolio for WordPress." \
    --push
fi

# Enable GitHub Pages from the main branch /docs folder.
echo "Enabling GitHub Pages (main branch, /docs)…"
gh api -X POST "repos/$OWNER/$REPO/pages" \
  -f "source[branch]=main" -f "source[path]=/docs" >/dev/null 2>&1 \
  || gh api -X PUT "repos/$OWNER/$REPO/pages" \
       -f "source[branch]=main" -f "source[path]=/docs" >/dev/null 2>&1 \
  || echo "  (Enable Pages manually: Settings → Pages → Deploy from branch → main → /docs)"

echo
echo "Done."
echo "  Repo:  https://github.com/$OWNER/$REPO"
echo "  Pages: https://$OWNER.github.io/$REPO/  (may take a minute to build)"
echo
echo "Next: set the repo's social preview image to assets/branding/repofolio-banner.svg"
echo "      (Settings → General → Social preview) and add topics: wordpress, github, portfolio, gutenberg."
