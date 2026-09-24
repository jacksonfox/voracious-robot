#!/bin/bash

# new-post.sh - Easy posting script for Hugo blog
# Usage: ./new-post.sh [title]

set -e  # Exit on any error

if [ $# -gt 1 ]; then
    echo "Usage: $0 [title]"
    echo "Example: $0"
    echo "Example: $0 'Cool Article About Design'"
    exit 1
fi

TITLE="${1:-}"

# Change to script directory for Automator compatibility
cd "$(dirname "$0")" || {
    echo "Error: Could not change to script directory"
    exit 1
}

# Generate filename with YYYY-MM-DD-slug format
DATE_PREFIX=$(date +"%Y-%m-%d")
if [ -n "$TITLE" ]; then
    # Create slug from title
    SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
    FILENAME="${DATE_PREFIX}-${SLUG}"
else
    # Use date + "post" as filename
    FILENAME="${DATE_PREFIX}-post"
fi

# Create the post file path
POST_PATH="content/posts/${FILENAME}.md"

# Check if file already exists
if [ -f "$POST_PATH" ]; then
    SUFFIX=$(date +"%H%M%S")
    echo "Warning: $POST_PATH already exists. Using timestamp suffix."
    POST_PATH="content/posts/${FILENAME}-${SUFFIX}.md"
fi

# Create post content with YAML frontmatter
cat > "$POST_PATH" << EOF
---
date: $(date -Iseconds)
draft: false
tags: [""]
EOF

# Add title if provided
if [ -n "$TITLE" ]; then
    echo "title: \"$TITLE\"" >> "$POST_PATH"
fi

cat >> "$POST_PATH" << 'EOF'
---

Commentary, with the link inline.

EOF

echo "✅ Created new post: $POST_PATH"
echo ""
echo "Next steps:"
echo "1. Edit $POST_PATH"
echo "2. Add your commentary and tags"
echo "3. Add images to static/ and reference with /filename.jpg"
echo "4. Run hugo server to preview"
echo ""
# Only try to open editor if running interactively (not from Automator)
if [ -t 0 ] && [ -t 1 ]; then
    echo "Opening post in default editor..."
    
    # Try to open in editor (works with most setups)
    if command -v code >/dev/null 2>&1; then
        code "$POST_PATH"
    elif command -v subl >/dev/null 2>&1; then
        subl "$POST_PATH"
    elif command -v nano >/dev/null 2>&1; then
        nano "$POST_PATH"
    elif command -v vim >/dev/null 2>&1; then
        vim "$POST_PATH"
    else
        echo "No editor found. Please edit $POST_PATH manually."
    fi
else
    echo "Post created successfully. Edit $POST_PATH to add your content."
fi