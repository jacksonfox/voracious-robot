# Voracious Robot

Source for [voraciousrobot.com](https://voraciousrobot.com/), a personal links blog with a reading list. Built with [Hugo](https://gohugo.io/) using hand-written layouts and no theme. Deployed on Netlify.

## Run it

Needs Hugo 0.159.1 (`brew install hugo`).

```bash
hugo server                       # http://localhost:1313/
hugo --environment production     # build to public/ with the live baseURL
```

## Write

- `./new-post.sh [title]`: a new post; the link goes in the body
- `./add-book.sh "title by author"`: add a book to the reading list
- `./update-following.sh`: refresh the following page from a `following.opml` export
- Or use the Blog Manager app, which edits this repo directly

## Layout

- `content/posts/`: entries, YAML frontmatter
- `layouts/`: all templates; styling is inline in `_default/baseof.html`
- `static/`: images, referenced as `/name.jpg`
- `data/reading.json`, `data/following.json`: the reading and following pages
- `docs/`: `TODO.md` and `CHANGELOG.md`

Sister blog: [Upstanding Robot](https://upstandingrobot.com/). The two share most of their templates.
