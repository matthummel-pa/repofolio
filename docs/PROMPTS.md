# Prompt History — how Repofolio was built

A chronological log of the prompts and key decisions that produced Repofolio, migrated so a new Cowork project can continue with full context. Paraphrased lightly for clarity; intent preserved.

## Decisions captured along the way
- **Auth method:** OAuth App — "Login with GitHub" (chosen over Personal Access Token and GitHub App).
- **Primary display:** a Repo list / grid block (server‑rendered).
- **Name:** "Repofolio" (repos + portfolio) — verified unused on the WordPress plugin directory.
- **Repo owner:** `matthummel-pa` on GitHub.

## Prompts (in order)

1. **Build the plugin.** "Dynamically pull in GitHub data for GitHub projects. Create a plugin and a separate repo. Connect to the GitHub API using a login authentication method. Create a settings page in the plugin that lets me choose which features to display. Use all available GitHub API options for the GitHub project."

2. **Add website projects.** "Also include regular website‑design project options in this plugin; provide patterns / blocks for the website project pages."

3. **Security.** "Make sure to include security features in the code for securing data."

4. **Name + repo.** "Create a marketable plugin name that's not already used, and create and store the files and documentation in a repo."

5. **Install.** "Install the plugin for me." → Installed & activated on local WordPress via the admin uploader; settings page verified.

6. **Full repo scaffolding + branding.** "Create the repo for me, with all standard software‑development details: README, changelog, error logs, SOP, about description; set up a GitHub Pages page with support details; provide a branding logo and colors for the theme — make the colors colorful."

7. **Experimental framing.** "Update the README to show this is an experimental repo that I want to build on with contributors."

8. **GitHub auth in browser.** "I'm logged into GitHub using Claude for Chrome." → Repo `matthummel-pa/repofolio` created via the browser; description, website, and topics set.

9. **Push the plugin.** "Push the earlier plugin items too." → Push must be run by the user (credentials stay with them); commands provided.

10. **Move into project.** "Move / copy the plugin files into the project folder." → Copied to `matthummel-theme/repofolio/`, git‑initialized, remote set.

11. **New Cowork project + migrate prompts.** "Create a new Cowork project for Repofolio development and migrate the prompts too." → This folder set up as a self‑contained project (`CLAUDE.md` + this `PROMPTS.md`).

## Suggested starter prompt for the new project

> You are continuing development of **Repofolio**, an experimental WordPress plugin (see `CLAUDE.md` for full context). It's a no‑build‑step plugin: plain PHP + vanilla‑JS blocks, namespace `Repofolio`, prefix `repofolio_`. Always escape output, sanitize input, and verify nonce + capability on state‑changing actions; never echo secrets. The immediate open task is to `git push` to `origin` (`matthummel-pa/repofolio`) and enable GitHub Pages from `main` /docs. After that, pick from the roadmap in `README.md`.
