# Error Log & Troubleshooting

How Repofolio surfaces errors, how to capture them, and a running log of known issues with their resolutions.

## How Repofolio handles errors

- **Never fatals on GitHub failures.** Every API call degrades to an empty result; the grid shows a friendly "No repositories to show yet." message instead of a white screen.
- **Failed responses are cached briefly** (5 minutes) so a transient outage or rate‑limit doesn't hammer the API, while successes cache for 6 hours.
- **Admin notices** report OAuth problems in plain language (bad state, no token, missing credentials) on the settings page.

## Enabling WordPress debug logging

Add to `wp-config.php` (above `/* That's all, stop editing! */`):

```php
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );      // writes to wp-content/debug.log
define( 'WP_DEBUG_DISPLAY', false ); // don't show errors on the front end
```

Reproduce the issue, then check `wp-content/debug.log`. Include the relevant lines in a bug report.

## Diagnostics checklist

1. **Settings → Repofolio** — is it "Connected as @you"? What's the rate limit line?
2. Click **Clear cached GitHub data** and retry (rules out stale cache).
3. Confirm the OAuth App's **Authorization callback URL** matches the value on the settings page exactly.
4. Temporarily switch to a default theme to rule out theme CSS/markup conflicts.
5. With `WP_DEBUG` on, watch `debug.log` while reloading the page.

## Known issues & resolutions

Log format: `date — symptom — cause — resolution`.

| Date | Symptom | Cause | Resolution |
|------|---------|-------|------------|
| 2026‑07‑01 | Grid shows "No repositories to show yet." while connected | Data source set to a user/org with an empty login field | Set a valid login in Settings → Repofolio, or use "My connected account". |
| 2026‑07‑01 | "GitHub did not return an access token" after authorizing | Callback URL mismatch or wrong Client Secret | Re‑copy the callback URL into the OAuth App and re‑enter the secret. |
| 2026‑07‑01 | Editor preview blank for the Repo Grid block | Not connected / no token, so no repos to preview | Connect via OAuth or add a manual token, then reload the editor. |
| 2026‑07‑01 | Hitting 60 requests/hour limit | Anonymous (unauthenticated) requests | Connect via OAuth or add a token to get 5,000/hour. |

> Maintainers: append new production incidents here as they're resolved (see [SOP §6](SOP.md)).

## Reporting a new error

Open a **Bug report** issue with: WordPress/PHP/Repofolio versions, steps to reproduce, expected vs. actual, and the relevant `debug.log` lines. Security‑sensitive issues go to **security@matthummel.com** — see [SECURITY.md](../SECURITY.md).
