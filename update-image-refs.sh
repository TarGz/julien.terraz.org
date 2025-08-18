#!/bin/bash

# Update image references from jpg/png to webp in all posts

echo "📝 Updating image references to WebP..."
echo ""

# Update all markdown files in _posts directory
find _posts -name "*.markdown" -o -name "*.md" | while read file; do
    # Create backup
    cp "$file" "$file.bak"
    
    # Replace .jpg, .jpeg, and .png references with .webp for work images
    sed -i '' 's/images\/work\/\(.*\)\.jpg/images\/work\/\1.webp/g' "$file"
    sed -i '' 's/images\/work\/\(.*\)\.jpeg/images\/work\/\1.webp/g' "$file"
    sed -i '' 's/images\/work\/\(.*\)\.png/images\/work\/\1.webp/g' "$file"
    
    # Check if file was modified
    if ! diff -q "$file" "$file.bak" > /dev/null; then
        echo "✅ Updated: $(basename "$file")"
        rm "$file.bak"
    else
        rm "$file.bak"
    fi
done

echo ""
echo "✅ All image references updated!"