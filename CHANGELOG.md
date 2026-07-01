# Changelog

All notable changes to **Repofolio** are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- WP‑CLI command to pre‑warm the GitHub cache.
- Optional contributors avatars row on repo cards.
- Block variation: single featured repo profile.

## [1.0.0] — 2026-07-01

### Added
- **OAuth "Login with GitHub"** web flow: connect from the settings page with Client ID/Secret, single‑use CSRF `state`, server‑side token exchange.
- **Settings page** (Settings → Repofolio): OAuth credentials, private‑repo scope opt‑in, default data source (connected account / user / org), sort, count, columns, fork & archived filters.
- **Per‑feature display toggles** for every GitHub field: description, topics, primary language, language‑breakdown bar, stars, forks, watchers, open issues, license, latest release/version, homepage/demo link, created & updated dates, default branch, repo size, owner.
- **Repofolio Repo Grid block** — server‑rendered with a live editor preview (ServerSideRender); inherits global settings or overrides source + toggles per block.
- **GitHub API client** covering repositories (user/org/authenticated), single‑repo details, languages, topics, releases (+ latest/tag fallback), README (rendered HTML), contributors, and rate limit — with a 6‑hour transient cache.
- **Website Projects** custom post type + project‑type taxonomy for non‑GitHub client work.
- **Block patterns** (category "Repofolio"): project hero, overview meta, gallery, results stats, testimonial, CTA, a full case‑study assembly, and a query‑loop projects grid.
- **Security**: encrypted secrets/tokens at rest (libsodium with XOR fallback), secrets never re‑rendered, nonce + capability checks on every action, sanitized input, escaped output, non‑autoloaded token option, per‑directory `index.php` guards, clean `uninstall.php`.
- **Branding**: colorful logo mark, horizontal lockup, and social banner (SVG); brand palette.
- Documentation: README, OAuth setup guide, SECURITY, SOP, error log, and a GitHub Pages support site.

[Unreleased]: https://github.com/matthummel-pa/repofolio/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/matthummel-pa/repofolio/releases/tag/v1.0.0
