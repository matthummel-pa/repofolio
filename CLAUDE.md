# Repofolio — Project Context (for Cowork / Claude)

This file gives an AI assistant everything it needs to continue developing **Repofolio** in a fresh session. Open this folder as its own Cowork project and this file loads as working context.

## What Repofolio is

A standalone, drop‑in **WordPress plugin** that turns GitHub repositories **and** regular website projects into a living portfolio. Tagline: *Repos in. Portfolio out.* Status: **experimental v1.0.0**, open to contributors.

- Repo: https://github.com/matthummel-pa/repofolio
- Support site (GitHub Pages, `/docs`): https://matthummel-pa.github.io/repofolio/
- License: GPL‑2.0‑or‑later · Requires WordPress 6.2+, PHP 8.0+

## Core features (built)

1. **OAuth "Login with GitHub"** — web app flow (authorize → callback → token exchange), single‑use CSRF `state`, token exchanged server‑side.
2. **Settings page** (Settings → Repofolio) — OAuth Client ID/Secret, private‑repo scope opt‑in, data source (connected account / user / org), sort, count, columns, fork/archived filters, and a per‑feature display toggle for every GitHub field.
3. **Repofolio Repo Grid block** — server‑rendered (`render_callback`) with a live `ServerSideRender` editor preview; inherits global settings or overrides source + toggles per block.
4. **GitHub API client** — repos (user/org/authenticated), single‑repo details, languages, topics, releases (+ latest/tag fallback), README HTML, contributors, rate limit; 6‑hour transient cache.
5. **Website Projects** — `repofolio_project` CPT + `repofolio_project_type` taxonomy, plus a "Repofolio" pattern category with case‑study patterns (hero, overview, gallery, results, testimonial, CTA, full case study, projects grid).
6. **Security** — secrets/tokens encrypted at rest (libsodium, XOR fallback), never re‑rendered; nonce + capability checks on every action; sanitized input, escaped output; non‑autoloaded token option; per‑dir `index.php` guards; clean `uninstall.php`.

## Architecture / conventions

- **No build step.** Plain PHP + vanilla‑JS block registration. Do not add Composer/npm requirements to install.
- Namespace `Repofolio`; constants `REPOFOLIO_*`; functions/options/hooks prefixed `repofolio_*`; text domain `repofolio`; block name `repofolio/repo-grid`.
- **Always** escape on output (`esc_html/attr/url`), sanitize on input, and verify a nonce **and** capability on state‑changing actions. Never echo secrets/tokens.

| File | Responsibility |
|------|----------------|
| `repofolio.php` | Bootstrap, constants, activation defaults |
| `includes/class-github-client.php` | GitHub REST calls + caching |
| `includes/class-oauth.php` | Login flow + encrypted token storage |
| `includes/class-settings.php` | Settings screen + option schema |
| `includes/class-block.php` | Repo Grid block + server render |
| `includes/class-projects.php` | Website Projects CPT + patterns |
| `includes/helpers.php` | Feature list, formatting, language colors |
| `assets/js/block.js` | Editor UI (ServerSideRender + toggles) |
| `assets/css/repofolio.css` | Front‑end grid/card styles |
| `assets/branding/` | Logo mark, lockup, banner (SVG) |
| `docs/` | OAuth setup, SOP, error log, brand, Pages site |

## Brand

Colorful "language‑bar" identity. Palette: iris `#6C4CF1`, pink `#FF4D9D`, coral `#FF7A3D`, amber `#FFC53D`, lime `#37E29A`, cyan `#22CFEE`, ink `#17151F`, paper `#FFF9F5`. Primary gradient purple→pink→orange. Full spec in `docs/BRAND.md`.

## Current status & next steps

- Code complete and installed/verified on local WordPress; PHP + JS lint clean.
- Git repo initialized here with remote `origin` = `https://github.com/matthummel-pa/repofolio.git` (branch `main`). **Pending:** `git push -u origin main --force` (remote has a placeholder README), then enable GitHub Pages (`main` /docs) and set the social‑preview banner.
- Roadmap (see README): single featured‑repo block, contributor avatars, pinned‑repos source, WP‑CLI cache warm, more project patterns + starter theme, activity widgets, i18n.

## How this project was built

See `docs/PROMPTS.md` for the full chronological prompt history that produced Repofolio — useful for understanding intent and for continuing the same working style.

## Cursor Cloud specific instructions

Standards come from the Cursor playbook plugin (matthummel-pa/ai-dev-standards-playbook). Do not copy those rules into this repo. When a playbook rule and a project rule disagree, follow this file.

The Build runs the playbook `cloud-install.sh` (PHP, Composer, WP-CLI). This plugin has no Composer or npm install. Do not install WordPress unless the task asks. The facts above stay in force.
