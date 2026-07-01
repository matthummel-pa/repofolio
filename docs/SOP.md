# Standard Operating Procedures (SOP)

Operational runbook for developing, releasing, and supporting **Repofolio**.

## 1. Branching

| Branch | Purpose |
|--------|---------|
| `main` | Always releasable. Protected. |
| `feature/*` | New work, branched from `main`. |
| `fix/*` | Bug fixes. |
| `release/x.y.z` | Optional staging branch for a release. |

Open a PR into `main`. Squash‑merge with a clear title. Delete the branch after merge.

## 2. Development workflow

1. Create a branch: `git checkout -b feature/short-name`.
2. Make the change. Keep functions prefixed and output escaped.
3. Update **[CHANGELOG.md](../CHANGELOG.md)** under `[Unreleased]`.
4. Run local checks (see §3).
5. Push and open a PR using the PR template. Link any issue.
6. Get review, address feedback, squash‑merge.

## 3. Quality gates (run before every PR)

```bash
# PHP syntax
find . -name '*.php' -not -path './vendor/*' -print0 | xargs -0 -n1 php -l

# JS syntax
node --check assets/js/block.js

# (optional) WordPress coding standards
phpcs --standard=WordPress .
```

CI runs the PHP lint on every push and PR (see `.github/workflows/lint.yml`).

Manual smoke test on a local WordPress:
- Activate cleanly (no notices with `WP_DEBUG` on).
- Connect via OAuth; confirm "Connected as @you".
- Add the **Repofolio Repo Grid** block; confirm cards render.
- Toggle features on the settings page; confirm the grid reflects them.
- Deactivate/reactivate; run uninstall on a throwaway site to confirm cleanup.

## 4. Release procedure

1. Confirm `main` is green and the smoke test passes.
2. Bump the version in **three** places: `repofolio.php` header, `REPOFOLIO_VERSION`, and `readme.txt` `Stable tag`.
3. Move `[Unreleased]` notes into a new dated version section in `CHANGELOG.md`.
4. Commit: `Release x.y.z`.
5. Tag and push:
   ```bash
   git tag -a vX.Y.Z -m "Repofolio X.Y.Z"
   git push origin main --tags
   ```
6. Build the distributable zip:
   ```bash
   ./scripts/build-zip.sh        # or: zip -r repofolio.zip repofolio -x '*.git*'
   ```
7. Create a GitHub Release for the tag, paste the changelog section, attach `repofolio.zip`.
8. Verify the GitHub Pages site still builds (Settings → Pages).

## 5. Hotfix procedure

1. Branch `fix/*` from `main`.
2. Patch, add a regression note to the CHANGELOG, bump the patch version.
3. Fast‑track review, merge, tag, release.

## 6. Support triage

1. Label incoming issues: `bug`, `enhancement`, `question`, `security`, `needs-info`.
2. Reproduce bugs against a default theme; ask for the info in [SUPPORT.md](../SUPPORT.md) if missing.
3. Security reports go to email, never public — see [SECURITY.md](../SECURITY.md).
4. Record notable production errors and their resolution in [ERROR-LOG.md](ERROR-LOG.md).

## 7. Rollback

If a release causes a regression: revert the merge commit on `main`, cut a patch release, and advise affected users to reinstall the previous zip from the GitHub Releases page.
