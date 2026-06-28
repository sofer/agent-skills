---
name: publish-slides
description: Use when publishing or updating a Founders and Coders slide deck on the public web (GitHub Pages). Syncs a deck and only its referenced assets from a private source repo into a public publish repo, builds it under /slides/<slug>/ and deploys via GitHub Actions. Use after a deck is authored or revised with fac-workshop-slides.
---

# Publish slides

Use this skill to put a deck authored in a private slides directory onto the
public web. Authoring happens upstream with [[fac-workshop-slides]]; this skill
is the delivery step.

## Architecture

Two repos, deliberately separate:

- The **source repo** (private) is the source of truth. Decks live in
  `slides/<name>.html` with shared `assets/` and `style.css`. It stays private
  to protect any personal or draft content it contains.
- The **publish repo** (public) is the publish target. Only decks chosen for
  publication are mirrored here. GitHub Actions builds it and deploys to GitHub
  Pages.

Live site: the root of the publish repo's Pages site (landing page) with each
deck at `/<slug>/`.

The two repos do not auto-sync. Editing a deck in the source repo does not
change the live site until it is re-synced and pushed.

## How it works

Each deck is a self-contained Reveal.js HTML file. The build step (`build.mjs`)
copies each deck listed in `decks.json` into `dist/<slug>/index.html`, copies
`style.css`, and copies all `./assets/...` files referenced by the HTML and CSS.
No npm packages, no Vite build, no SPA routing patch — just file copies.

Reveal.js uses hash routing (`hash: true`), so slide URLs look like
`/<slug>/#/3`. GitHub Pages serves `index.html` for the slug root, and the hash
is handled client-side. No 404 fallback or SPA redirect is needed.

## Steps

1. **Sync** the deck from the source repo. From the publish repo root:

   ```sh
   node sync-deck.mjs <path-to-deck.html> <slug>
   ```

   This copies the deck file, `style.css`, and only the `./assets/...` files the
   deck and its CSS reference, then registers the deck in `decks.json`. Edit the
   `decks.json` `description` field by hand if you want a description on the
   landing page.

2. **Build and verify** locally:

   ```sh
   node build.mjs
   ```

   Confirm `dist/<slug>/index.html`, `dist/<slug>/style.css`, and the asset
   files exist. To preview:

   ```sh
   python3 -m http.server 4173 --directory dist
   # open http://localhost:4173/<slug>/
   ```

   Check navigation: advance a slide and confirm the URL changes to
   `/<slug>/#/2`. Refresh on a hash URL — it must reload the same slide
   correctly (no 404).

3. **Deploy**: commit and push. The push triggers the Pages workflow.

   ```sh
   git add -A && git commit -m "publish: <slug>" && git push
   ```

4. **Verify live** after the workflow finishes:

   ```sh
   gh run watch $(gh run list --limit 1 --json databaseId -q '.[0].databaseId') --exit-status
   curl -s -o /dev/null -w "%{http_code}\n" <live-url>/<slug>/
   ```

   Navigate to the live URL, advance a slide, and confirm hash routing works.

## Gotchas

- **First publish needs GitHub Pages enabled** with the Actions source:
  `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`.
- **Asset 404s?** Check that the asset paths in the HTML and CSS use the
  `./assets/...` pattern — the build regex only picks up that prefix.
- **Style not updating?** The build reads `style.css` from the repo root (not
  from the source repo). Run `node sync-deck.mjs` first to copy the latest
  `style.css`, then `node build.mjs`.

## Adding a brand-new deck

Author with [[fac-workshop-slides]], then `sync-deck.mjs <path>.html <slug>`.
`decks.json` and the landing page update automatically.
