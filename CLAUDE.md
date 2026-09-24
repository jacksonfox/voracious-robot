# Voracious Robot

Personal links blog at voraciousrobot.com: short posts, usually about something found elsewhere, plus a reading list. Hugo with no theme and hand-written layouts, deployed on Netlify from `main`.

Sister blog: Upstanding Robot (`~/Code/websites/upstanding-robot`). The two share most of their templates and conventions. Before changing anything both blogs have, read `~/Code/websites/blogs/docs/blog-conventions.md`.

## Setup

- Hugo 0.159.1 from Homebrew, on PATH. There is no `./hugo` binary in this repo.
- Preview: `hugo server`, then http://localhost:1313/
- Build for deploy: `hugo --environment production`. Netlify runs `hugo --gc --minify --environment production`, pinned to 0.159.1 in `netlify.toml`.
- Config is TOML: `config/_default/hugo.toml`, with `config/development/` and `config/production/` overriding `baseURL`.
- Content frontmatter is YAML.
- Most posting happens in the Blog Manager (`~/Code/apps/blogging-tool`), which edits this repo directly and writes `lastmod` on every save. Its field list for this blog mirrors the archetype here. Change one, change the other.

## Content

One type, posts, in `content/posts/` at `/:year/:month/:day/:slug/`. The slug comes from the title, not the filename. Archetype: `archetypes/default.md`. The Blog Manager names files `YYYY-MM-DD-title-slug.md`; `new-post.sh [title]` writes `YYYY-MM-DD-slug.md`, or `YYYY-MM-DD-post.md` without a title.

A post as the Blog Manager writes it:

```yaml
---
title: The quiet grief of adult friendship
date: 2026-09-14
lastmod: 2026-09-14
draft: false
tags:
  - friendship
via: Kottke            # optional: where it was found
via_url: "https://..."  # optional: link for via
---
```

- The archetype is older than this. It has no `title` or `lastmod` and quotes the date. Reconciling it is on the workspace TODO.
- `via` and `via_url` render as a "via Name" line after the body, with the name linked when `via_url` is set. Post titles are not shown on the page either; they feed `<title>`, the SEO tags, and the URL slug.
- Images go in `static/` and are referenced root-relative, `/photo.jpg`. There is no default social image yet.
- The homepage lists posts newest first. The card markup lives in `layouts/partials/post-card.html`, shared by `index.html` and `list.html`.
- Pages: `/about/`, `/reading/` (rendered from `data/reading.json`), `/following/` (from `data/following.json`), `/tags/`.
- Tags render below the body with a `#` prefix. Empty-string tags are skipped.

## Layouts

All in `layouts/`, no theme. All CSS is inline in `_default/baseof.html`.

- `_default/baseof.html`: shell, head, nav, all styling
- `_default/index.html`: homepage
- `_default/list.html`: section and tag lists
- `_default/single.html`: single post
- `_default/terms.html`: tag index
- `reading/single.html`: reading list from `data/reading.json`
- `about/single.html`, `following/single.html`
- `partials/seo.html`: canonical, Open Graph, Twitter card, JSON-LD

## Scripts

- `./new-post.sh <URL> [title]`: new link post with hand-written frontmatter, opened in an editor when run interactively
- `./add-book.sh "title by author" [date] [bookshop_url]`: prepends a book to `data/reading.json`, prompting for a Bookshop.org URL if none is given
- `./update-following.sh`: rebuilds `data/following.json` from a `following.opml` export in the repo root, using `convert-opml.py`, then deletes the OPML
- `/new-post` Claude slash command in `.claude/commands/` (local, not tracked): guided post creation

## Design

- Body text Menlo. Headings Poppins. Links `#0066cc`.
- Site title in Knewave at 36px with a slow rainbow color cycle (`.rainbow-title`).
- Mascot `static/voracious-robot.png` at 100px in the header.
- One 650px centered column, left-aligned text.
- Blockquotes: left blue border, light blue background, italic, smaller.
- Figures and images in post bodies scale to the column.
- Keep it minimal and accessible. Changes should feel intentional. Match the sister blog unless the difference is deliberate; the conventions doc lists which differences are.

## Automation

`.github/workflows/` runs Claude code review on pull requests and answers `@claude` mentions in issues and PR comments. Upstanding Robot has no workflows.

## Working in this repo

- `docs/TODO.md` is the task list for this repo. `docs/CHANGELOG.md` records changes, newest first. Update both when work lands.
- Work that should also happen on Upstanding Robot goes in the workspace TODO at `~/Code/websites/blogs/docs/TODO.md`, not here.
- Small, frequent commits to `main`. Netlify deploys on push.
- Keep this file current when the setup or conventions change.
