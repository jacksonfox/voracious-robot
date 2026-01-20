#!/bin/bash

# add-book.sh - Add a book to the reading list
# Usage: ./add-book.sh "project hail mary by andy weir"
# Usage: ./add-book.sh "the martian" "andy weir" 
# Usage: ./add-book.sh "dune" "frank herbert" "2025-01-15"

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 \"book title by author\" [date] [bookshop_url]"
    echo "   or: $0 \"book title\" \"author\" [date] [bookshop_url]"
    echo ""
    echo "Examples:"
    echo "  $0 \"project hail mary by andy weir\""
    echo "  $0 \"the martian\" \"andy weir\""
    echo "  $0 \"dune\" \"frank herbert\" \"2025-01-15\""
    echo "  $0 \"dune\" \"frank herbert\" \"2025-01-15\" \"https://bookshop.org/books/dune-9780441013593\""
    exit 1
fi

# Parse input
if [ $# -eq 1 ] || [ $# -eq 2 ] && [[ "$1" =~ (.+)\ by\ (.+)$ ]]; then
    # Single argument: "title by author" [date] [url]
    INPUT="$1"
    if [[ "$INPUT" =~ (.+)\ by\ (.+)$ ]]; then
        TITLE="${BASH_REMATCH[1]}"
        AUTHOR="${BASH_REMATCH[2]}"
        DATE=${2:-$(date '+%Y-%m-%d')}
        BOOKSHOP_URL_ARG=${3:-""}
    else
        echo "Error: When using single argument, format should be 'title by author'"
        echo "Example: 'project hail mary by andy weir'"
        exit 1
    fi
else
    # Multiple arguments: title, author, [date], [bookshop_url]
    TITLE="$1"
    AUTHOR="$2"
    DATE=${3:-$(date '+%Y-%m-%d')}
    BOOKSHOP_URL_ARG=${4:-""}
fi

# Clean up title and author (title case)
TITLE=$(echo "$TITLE" | python3 -c "
import sys
import re
title = sys.stdin.read().strip()
# Convert to title case but preserve certain words as lowercase
def title_case(s):
    # Words that should stay lowercase (articles, prepositions, conjunctions)
    lowercase_words = {'a', 'an', 'and', 'as', 'at', 'but', 'by', 'for', 'if', 'in', 'nor', 'of', 'on', 'or', 'so', 'the', 'to', 'up', 'yet'}
    words = s.lower().split()
    result = []
    for i, word in enumerate(words):
        if i == 0 or i == len(words) - 1 or word not in lowercase_words:
            result.append(word.capitalize())
        else:
            result.append(word)
    return ' '.join(result)
print(title_case(title))
")

AUTHOR=$(echo "$AUTHOR" | python3 -c "
import sys
author = sys.stdin.read().strip()
print(' '.join(word.capitalize() for word in author.split()))
")

echo "Adding book: \"$TITLE\" by $AUTHOR (read on $DATE)"

# Handle Bookshop.org URL
if [ -n "$BOOKSHOP_URL_ARG" ]; then
    BOOKSHOP_URL="$BOOKSHOP_URL_ARG"
    echo "Using provided Bookshop.org URL: $BOOKSHOP_URL"
else
    BOOKSHOP_URL=""
    echo "Bookshop.org search: https://bookshop.org/beta-search?keywords=$(python3 -c "import urllib.parse; print(urllib.parse.quote_plus('$TITLE $AUTHOR'))")"
    echo -n "Enter Bookshop.org URL (or press Enter to skip): "
    read -r BOOKSHOP_URL
fi

# Add to reading list JSON
python3 -c "
import json
import sys

# Read existing data
try:
    with open('data/reading.json', 'r') as f:
        data = json.load(f)
except FileNotFoundError:
    data = {'books': []}

# Create new book entry
new_book = {
    'title': '$TITLE',
    'author': '$AUTHOR',
    'dateRead': '$DATE',
    'bookshopUrl': '$BOOKSHOP_URL',
    'rating': None,
    'notes': ''
}

# Add to list (newest first)
data['books'].insert(0, new_book)

# Write back to file
with open('data/reading.json', 'w') as f:
    json.dump(data, f, indent=2)

print(f'Added \"{new_book[\"title\"]}\" by {new_book[\"author\"]} to reading list')
"