# Changelog

Changes to this repo, newest first. Cross-blog changes are also noted in the blogs workspace at `~/Code/websites/blogs/docs/CHANGELOG.md`.

## 2026-09-22

- Rewrote `CLAUDE.md` to match the repo as it is: Hugo from Homebrew rather than a `./hugo` binary, TOML config, the real frontmatter (`title`, `lastmod`, `link`, `via`), the reading list, `add-book.sh`, the GitHub workflows, and the Blog Manager as the main way posts get written. The old file was a copy shared with Upstanding Robot and described a `to-migrate/` folder that no longer exists.
- Replaced the one-line placeholder `README.md`.
- Added `docs/TODO.md` and `docs/CHANGELOG.md`.
- `.gitignore` now matches Upstanding Robot's: dropped the entry for a `hugo` binary that no longer exists, added `tmp/` and `.hugo_build.lock`. Removed the empty `.gitmodules` and un-tracked `.hugo_build.lock`.
- Fixed the local `/new-post` slash command (`.claude/commands/`, untracked), which looked for `content/posts/*/index.md` and TOML `tags = ` lines. Posts are flat files with YAML frontmatter.
