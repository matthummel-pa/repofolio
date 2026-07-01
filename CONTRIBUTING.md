# Contributing to Repofolio

Thanks for your interest in improving Repofolio! This is a lightweight, no‑build‑step WordPress plugin, so getting started is quick.

## Ground rules

- Be respectful — see the [Code of Conduct](CODE_OF_CONDUCT.md).
- Open an issue before large changes so we can align on approach.
- Keep PRs focused: one logical change per pull request.

## Development setup

1. Clone the repo into a WordPress install:
   ```bash
   git clone https://github.com/matthummel-pa/repofolio.git wp-content/plugins/repofolio
   ```
2. Activate **Repofolio** in WordPress admin.
3. Configure an OAuth App (see [docs/OAUTH-SETUP.md](docs/OAUTH-SETUP.md)) or paste a manual token for local testing.

There is no compile step — PHP, CSS, and vanilla JS are loaded directly.

## Coding standards

- Follow [WordPress PHP coding standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/php/).
- Prefix everything: namespace `Repofolio`, functions/options `repofolio_*`, hooks `repofolio_*`.
- **Escape on output** (`esc_html`, `esc_attr`, `esc_url`), **sanitize on input**, and **verify a nonce + capability** on every state‑changing action.
- Never echo secrets or tokens.

## Before you open a PR

Run the checks locally:

```bash
# PHP lint every file
find . -name '*.php' -not -path './vendor/*' -print0 | xargs -0 -n1 php -l

# JS syntax check
node --check assets/js/block.js
```

If you have PHPCS with the WordPress standard installed:

```bash
phpcs --standard=WordPress .
```

## Commit messages & versioning

- Use clear, imperative commit subjects ("Add contributor avatars to cards").
- Update [CHANGELOG.md](CHANGELOG.md) under **[Unreleased]**.
- We follow [Semantic Versioning](https://semver.org/). Bump the version in `repofolio.php` and `readme.txt` only in release PRs.

## Reporting bugs & requesting features

Use the issue templates under **Issues → New issue**. For security issues, do **not** open a public issue — see [SECURITY.md](SECURITY.md).
