# Connecting Repofolio to GitHub (OAuth)

Repofolio uses GitHub's **OAuth App** web flow so you can connect with a real "Login with GitHub" button. This takes about a minute.

## 1. Find your callback URL

In WordPress, go to **Settings → Repofolio**. Under *"1. Connect with GitHub"* you'll see an **Authorization callback URL** that looks like:

```
https://your-site.com/wp-admin/admin-post.php?action=repofolio_oauth_callback
```

Copy it — you'll paste it into GitHub in the next step.

## 2. Create a GitHub OAuth App

1. Go to **https://github.com/settings/developers** → **OAuth Apps** → **New OAuth App**.
   (For an organization, use **Organization settings → Developer settings → OAuth Apps**.)
2. Fill in:
   - **Application name:** e.g. `My Site — Repofolio`
   - **Homepage URL:** your site URL (`https://your-site.com`)
   - **Authorization callback URL:** paste the value from step 1 exactly
3. Click **Register application**.
4. Copy the **Client ID**.
5. Click **Generate a new client secret** and copy the **Client Secret** (you only see it once).

## 3. Enter the credentials in WordPress

1. Back in **Settings → Repofolio**, paste the **Client ID** and **Client Secret**.
2. (Optional) Tick **Request access to private repositories** only if you want to display private repos.
3. Click **Save settings**.

> The secret is encrypted before it's stored and is never shown again. If you save the form later and leave the secret blank, the stored value is kept.

## 4. Connect

1. Click **Connect with GitHub**.
2. GitHub asks you to authorize the app → **Authorize**.
3. You're returned to the settings page showing **Connected as @yourname**.

## 5. (Optional) Use a manual token instead

For quick local testing without registering an OAuth App, paste a **Personal Access Token** into the *Manual token* field and save. Create one at **https://github.com/settings/tokens** with the `public_repo` (or `repo` for private) scope. OAuth takes precedence if both are set.

## Troubleshooting

| Message | Cause / fix |
|---------|-------------|
| *"Add and save your Client ID and Secret first."* | Save the credentials before clicking Connect. |
| *"GitHub did not return an access token…"* | The callback URL in the GitHub app doesn't match, or the secret is wrong. Re-copy both. |
| *"Security check failed…"* | The one-time `state` expired (15 min) — just click Connect again. |
| Grid shows *"No repositories to show yet."* | Not connected yet, or your data source/user login is empty. Check **Settings → Repofolio**. |
| Hitting rate limits | Connect via OAuth (or add a token) — authenticated requests get 5,000/hour vs. 60 anonymous. |

## Security notes

See **[../SECURITY.md](../SECURITY.md)** for how credentials are encrypted and how to set a dedicated `REPOFOLIO_TOKEN_KEY`.
