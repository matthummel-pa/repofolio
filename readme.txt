=== Repofolio ===
Contributors: matthummel
Tags: github, portfolio, repositories, developer, block
Requires at least: 6.2
Tested up to: 6.8
Requires PHP: 8.0
Stable tag: 1.0.0
License: GPLv2 or later
License URI: https://www.gnu.org/licenses/gpl-2.0.html

Turn your GitHub repositories into a living portfolio. Connect with GitHub, choose what to show, and drop a live repo grid on any page.

== Description ==

Repofolio pulls your GitHub repositories into WordPress in real time and displays them as a polished, self-updating grid.

* **Login with GitHub (OAuth).** Connect securely from the settings page — no tokens to hand-copy (a manual token option is available for local testing).
* **Choose exactly what to show.** Toggle description, topics, language breakdown, stars, forks, watchers, open issues, license, latest release/version, homepage/demo link, dates, default branch, size and owner — globally or per block.
* **Live repo grid block.** Add the "Repofolio Repo Grid" block anywhere, pick a source (your account, another user, or an organization), sort, and column count.
* **Fast & polite.** Responses are cached for six hours and authenticated requests get GitHub's full 5,000/hour rate limit.

== Installation ==

1. Upload the plugin to `/wp-content/plugins/repofolio` or install the zip via Plugins → Add New → Upload.
2. Activate it.
3. On GitHub, go to Settings → Developer settings → OAuth Apps → New OAuth App.
4. Set the **Authorization callback URL** to the value shown on the plugin's settings page.
5. Copy the Client ID and Client Secret into Settings → Repofolio, save, then click **Connect with GitHub**.
6. Choose your display options and add the **Repofolio Repo Grid** block to a page.

== Frequently Asked Questions ==

= Do I need an OAuth App? =
For the "Login with GitHub" flow, yes — it takes a minute to create. Alternatively, paste a Personal Access Token in the Manual Token field for quick local testing.

= Does it show private repositories? =
Only if you enable "Request access to private repositories," which adds the `repo` scope when you connect.

= How fresh is the data? =
Cached for six hours; use "Clear cached GitHub data" on the settings page to refresh immediately.

== Changelog ==

= 1.0.0 =
* Initial release: OAuth login, settings with per-feature toggles, and the Repofolio Repo Grid block.
