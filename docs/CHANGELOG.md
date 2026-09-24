# Changelog

Changes to this repo, newest first. Cross-blog changes are also noted in the blogs workspace at `~/Code/websites/blogs/docs/CHANGELOG.md`.

## 2026-09-23

- Feed link tags in `baseof.html` now come from `.AlternativeOutputFormats`, like Upstanding Robot's, instead of a hand-written RSS-only tag.
- `partials/seo.html` and `_default/terms.html` are now identical to Upstanding Robot's.
- Replaced the deprecated `.Site.Data` with `hugo.Data` in `following/single.html` and `reading/single.html`.
- Reconciled the archetype: added `title` and `lastmod`, unquoted the date, dropped the stale placeholder body.
- Titled the Lisa Congdon post; its URL moved to `/2025/08/13/lisa-congdon/`, with the old slug-less address redirecting via an alias.
- Dropped the `link` field. It rendered nowhere; five of the six posts that set it already linked the same URL in the body, and Lisa Congdon now does. Removed from the six posts, the archetype, and `new-post.sh`, which now takes only an optional title.
- Moved the post card markup out of `index.html` and `list.html` and into `layouts/partials/post-card.html`, shared by both. Output is unchanged.
- Added `via` and `via_url` to the archetype and to `CLAUDE.md`'s frontmatter example. Both render as a "via Name" line after the body, through a new `layouts/partials/via.html`: the name links when `via_url` is set, and the URL's host shows when there's no name.
- Moved every body-text attribution into `via` and `via_url`: nine posts through the Blog Manager's `migrate-via` script, three by hand (Retro PIs, Lisa Congdon, and Undertale and Deltarune, the last as `via: our dev intern` with no URL), and added the Kottke URL to The quiet grief of adult friendship. Fixed the `Collosal` typo on Felt Nudibranchs. Thirteen posts now show a via line and no body text says "via [" any more.
- The tags page prints tag names as written (`#ai`, `#raspberry pi`) instead of Hugo's capitalised term titles (`#Ai`, `#Raspberry Pi`), matching the chips under each post. Same template on both blogs.

## 2026-09-22

- Rewrote `CLAUDE.md` to match the repo as it is: Hugo from Homebrew rather than a `./hugo` binary, TOML config, the real frontmatter (`title`, `lastmod`, `link`, `via`), the reading list, `add-book.sh`, the GitHub workflows, and the Blog Manager as the main way posts get written. The old file was a copy shared with Upstanding Robot and described a `to-migrate/` folder that no longer exists.
- Replaced the one-line placeholder `README.md`.
- Added `docs/TODO.md` and `docs/CHANGELOG.md`.
- `.gitignore` now matches Upstanding Robot's: dropped the entry for a `hugo` binary that no longer exists, added `tmp/` and `.hugo_build.lock`. Removed the empty `.gitmodules` and un-tracked `.hugo_build.lock`.
- Fixed the local `/new-post` slash command (`.claude/commands/`, untracked), which looked for `content/posts/*/index.md` and TOML `tags = ` lines. Posts are flat files with YAML frontmatter.
