# Security

Repofolio handles OAuth credentials and access tokens, so it is built defensively. This document summarizes the controls in place and how to report an issue.

## Reporting a vulnerability

Please email **security@matthummel.com** with details and reproduction steps. Do not open a public issue for security reports. You'll get an acknowledgement within 72 hours.

## Data the plugin stores

| Data | Where | Protection |
|------|-------|-----------|
| OAuth Client ID | `repofolio_options` option | Not secret (public identifier) |
| OAuth Client Secret | `repofolio_options` option | **Encrypted at rest**, never re-rendered in the admin UI |
| Access token | `repofolio_access_token` option (non-autoloaded) | **Encrypted at rest** (libsodium authenticated encryption) |
| Manual token (optional) | `repofolio_options` option | **Encrypted at rest**, never re-rendered |
| Viewer profile (login/avatar) | `repofolio_viewer` option | Sanitized on save |

### Encryption

Tokens and secrets are encrypted with `sodium_crypto_secretbox` (XSalsa20‑Poly1305) using a 32‑byte key derived via SHA‑256 from your site's `AUTH_KEY` — or from a dedicated `REPOFOLIO_TOKEN_KEY` constant if you define one in `wp-config.php`:

```php
define( 'REPOFOLIO_TOKEN_KEY', 'a-long-random-string-unique-to-this-site' );
```

On hosts without libsodium, the plugin falls back to keyed XOR obfuscation (clearly marked with an `x1:` prefix). For strongest protection, run PHP with the sodium extension (default on PHP 7.2+).

## Application‑level controls

- **CSRF:** every state‑changing action (connect, disconnect, cache flush, settings save) is protected by a WordPress nonce (`check_admin_referer` / `settings_fields`). The OAuth flow additionally uses a single‑use, per‑user `state` value compared with `hash_equals()`.
- **Authorization:** all admin handlers require the `manage_options` capability. Meta write access requires `edit_posts`.
- **Least privilege scopes:** only `read:user` + `public_repo` are requested by default. Private‑repo access (`repo` scope) is opt‑in.
- **Output escaping:** all dynamic output is escaped (`esc_html`, `esc_attr`, `esc_url`); GitHub‑rendered README HTML is passed through `wp_kses` where used.
- **Input sanitization:** all `$_GET`/`$_POST` input is unslashed and sanitized before use; the settings array is validated field‑by‑field against an allow‑list.
- **No secret leakage:** the Client Secret and manual token are never written back into form fields; a blank submit preserves the stored value instead of clearing it.
- **Safe transport:** all GitHub calls go through the WordPress HTTP API over HTTPS with timeouts and a proper `User-Agent`.
- **Non‑autoloaded secrets:** the access token option is stored with `autoload = false` so it is not loaded on every page request.
- **Direct‑access guards:** every PHP file begins with `defined( 'ABSPATH' ) || exit;` and each directory contains a silent `index.php`.
- **Clean uninstall:** `uninstall.php` deletes all options, the token, and cached transients.

## Hardening recommendations for site owners

1. Define `REPOFOLIO_TOKEN_KEY` in `wp-config.php` (see above).
2. Use a **dedicated OAuth App per site** rather than sharing one.
3. Serve the admin over HTTPS (required for OAuth callbacks anyway).
4. Grant private‑repo scope only if you actually display private repositories.
