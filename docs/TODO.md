# TODO

Work on this repo only. Anything that should also happen on Upstanding Robot lives in the blogs workspace TODO at `~/Code/websites/blogs/docs/TODO.md`.

## Content

- [ ] `content/posts/2025-08-13-lisa-congdon.md` has no title, so its URL slug and `<title>` fall back to Hugo defaults. Give it one.

## Repo

- [ ] `static/og-robot.png` is 303x549, not usable as a social card image. Replacing it is on the workspace TODO, under parity with Upstanding Robot's default image.
- [ ] `.claude/commands/new-post.md` is local and untracked. Decide whether to commit it.
- [ ] The Claude GitHub Actions in `.github/workflows/` exist here but not on Upstanding Robot. Whether both blogs should have them is on the workspace TODO.

## Done

- [x] 2026-09-22: Rewrote `README.md` and `CLAUDE.md`, added `docs/`, matched `.gitignore` to Upstanding Robot's, removed the empty `.gitmodules` and the tracked `.hugo_build.lock`.
- [x] 2026-09-22: Fixed the `/new-post` slash command. It searched for TOML tags in post folders that don't exist, so it never found any tags.
