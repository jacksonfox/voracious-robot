# TODO

Work on this repo only. Anything that should also happen on Upstanding Robot lives in the blogs workspace TODO at `~/Code/websites/blogs/docs/TODO.md`.

## Content

- [x] `content/posts/2025-08-13-lisa-congdon.md` has no title, so its URL slug and `<title>` fall back to Hugo defaults. Give it one.

## Via attribution

Decided 2026-09-23 in the workspace: two flat fields, `via` (source name) and `via_url` (its address). The sequence and the shared markup are in the workspace TODO. The Blog Manager config goes first.

- [x] `archetypes/default.md`: add `via: ""` and `via_url: ""` after `link`. Mirror the order in `blogging-tool/lib/config.ts`. Reconciling the rest of the archetype is a separate workspace item and can ride along.
- [x] Render the line after the body and before the tags in `_default/single.html`, `_default/index.html`, and `_default/list.html`. The card is pasted into the last two; the workspace TODO already asks for a `partials/post-card.html`, so do that first and add the line once. Reads `via Kottke`, name linked when `via_url` is set, host shown when only `via_url` is set.
- [x] `.post-via` style in `baseof.html`, same rule as Upstanding Robot.
- [x] Run the Blog Manager's migration script. Nine posts end in a standalone `via [Name](url)` line and move cleanly: `print-making-with-lego`, `lego-crocs`, `handle-with-rage`, `modern-illustration`, `colors-in-unexpected-places`, `felt-nudibranchs`, `stone-tools-are-new-reviews-of-old-software`, `there-are-still-sit-down-pizza-huts`, `the-iss-transits-the-moon`. Fix the `Collosal` typo on felt-nudibranchs while there.
- [x] Hand-edit the three the script cannot: `2026-01-20-retro-pis.md` (the via line continues with more prose), `2025-08-13-lisa-congdon.md` (mid-sentence, after a comma), `2025-08-02-undertale-and-deltarune.md` (`via our dev intern`, no URL: set `via` alone, or leave it in the body).
- [x] `2026-09-14-the-quiet.md` has `via: Kottke` and no URL. Find the Kottke post and set `via_url`.
- [x] `CLAUDE.md` frontmatter example and `.claude/commands/new-post.md`: `via` is the name, `via_url` the address. Stop saying "Source name or URL".

## Repo

- [ ] `static/og-robot.png` is 303x549, not usable as a social card image. Replacing it is on the workspace TODO, under parity with Upstanding Robot's default image.
- [ ] `.claude/commands/new-post.md` is local and untracked. Decide whether to commit it.
- [ ] The Claude GitHub Actions in `.github/workflows/` exist here but not on Upstanding Robot. Whether both blogs should have them is on the workspace TODO.

## Done

- [x] 2026-09-22: Rewrote `README.md` and `CLAUDE.md`, added `docs/`, matched `.gitignore` to Upstanding Robot's, removed the empty `.gitmodules` and the tracked `.hugo_build.lock`.
- [x] 2026-09-22: Fixed the `/new-post` slash command. It searched for TOML tags in post folders that don't exist, so it never found any tags.
- [x] 2026-09-23: Dropped the unrendered `link` field from the archetype, `new-post.sh`, and the six posts that set it. The Blog Manager's field list changed the same day.
- [x] 2026-09-23: Archetype now matches what the Blog Manager writes: title, unquoted date, lastmod, empty tags list, via, via_url, no placeholder body.
