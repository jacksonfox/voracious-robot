#!/usr/bin/env python3
"""
Convert OPML file to JSON format for Hugo static site generator.
Usage: python3 convert-opml.py input.opml output.json
"""

import xml.etree.ElementTree as ET
import json
import sys
from pathlib import Path

def parse_opml(opml_file):
    """Parse OPML file and convert to a flat alphabetical list of feeds"""
    tree = ET.parse(opml_file)
    root = tree.getroot()

    feeds = []

    # Find body element
    body = root.find('body')
    if body is None:
        print("Error: No body element found in OPML")
        return None

    # Process each outline, collecting all feeds regardless of category
    for outline in body.findall('outline'):
        children = outline.findall('outline')

        if children:
            # This is a category - collect its child feeds
            for child in children:
                feed = {
                    'title': child.get('title', child.get('text', '')),
                    'htmlUrl': child.get('htmlUrl', ''),
                    'xmlUrl': child.get('xmlUrl', ''),
                    'description': child.get('description', '')
                }
                feeds.append(feed)
        else:
            # This is a standalone feed
            text = outline.get('text', '')
            title = outline.get('title', text)
            feed = {
                'title': title,
                'htmlUrl': outline.get('htmlUrl', ''),
                'xmlUrl': outline.get('xmlUrl', ''),
                'description': outline.get('description', '')
            }
            feeds.append(feed)

    # Sort feeds alphabetically by title (case-insensitive)
    feeds.sort(key=lambda f: f['title'].lower())

    return {'feeds': feeds}

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 convert-opml.py input.opml output.json")
        sys.exit(1)
    
    input_file = Path(sys.argv[1])
    output_file = Path(sys.argv[2])
    
    if not input_file.exists():
        print(f"Error: Input file {input_file} does not exist")
        sys.exit(1)
    
    try:
        data = parse_opml(input_file)
        if data is None:
            sys.exit(1)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
        
        print(f"Successfully converted {input_file} to {output_file}")
        print(f"Found {len(data['feeds'])} feeds")
        
    except ET.ParseError as e:
        print(f"Error parsing OPML file: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == '__main__':
    main()