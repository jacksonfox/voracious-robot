# Hugo Links Blog - Custom Minimal Design

This is a personal links blog built with Hugo, featuring a custom minimal design inspired by jacksonfox.org.

## Key Technical Details

### Hugo Setup
- Hugo built from source, binary located at `./hugo` 
- No theme used - completely custom layouts in `layouts/_default/`
- Run with: `./hugo server` or `./hugo` to build

### Design Philosophy  
- Minimal, text-focused aesthetic matching jacksonfox.org
- Clean typography with intentional font choices
- Accessibility-first (WCAG AA compliant links)
- No external dependencies except Google Fonts

### Typography
- **Body text**: Menlo monospace for technical/code aesthetic
- **Headers & site title**: Poppins (Google Fonts) for clean contrast
- **Links**: #0066cc blue for accessibility compliance

### Content Structure
- Posts are individual `.md` files in `content/posts/` (not directories)
- Images stored in `static/` and referenced as `/filename.jpg`
- Posts have optional titles - if no title, just show date/content/tags
- Date-based permalinks: `/:year/:month/:day/:slug/`
- Tags appear below post content with # prefix
- Posts migrated from micro.blog format (originals in `to-migrate/`)

### Styling Choices
- Blockquotes: Left blue border + light blue background, italic, smaller font
- Centered layout (650px max width) with left-aligned text
- Minimal navigation: "home", "about", "following", and "tags"
- Clean, functional design - no visual clutter

## Common Tasks
- New post: `./new-post.sh <URL> [title]` or `./hugo new content posts/filename.md`
- Update following list: `./update-following.sh` (after placing OPML export as `following.opml`)
- Build: `./hugo --quiet` 
- Serve locally: `./hugo server` (uses localhost:1313)
- Build for production: `./hugo --environment production`
- Posts only need: date, tags, content (titles optional)

## Configuration
- Default baseURL: `http://localhost:1313/` for easy local testing
- Production config in `config/production/hugo.toml` sets correct production URL
- Use `--environment production` flag when building for deployment

## Design Preferences
- Keep minimal aesthetic - avoid adding complexity
- Maintain accessibility standards
- Preserve clean typography hierarchy
- Any changes should feel intentional and purposeful
- Always update CLAUDE.md with relevant details when committing code to Github