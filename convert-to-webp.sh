#!/bin/bash

# Convert images to WebP format for better performance
# WebP typically achieves 25-35% smaller file sizes than JPEG and PNG

set -e  # Exit on error

WORK_DIR="images/work"
BACKUP_DIR="images_backup_work"
QUALITY=85  # WebP quality (80-90 is good balance)
TOTAL_BEFORE=0
TOTAL_AFTER=0
CONVERTED=0
FAILED=0

echo "🚀 WebP Image Conversion Script"
echo "================================"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "📦 Creating backup of work images..."
    mkdir -p "$BACKUP_DIR"
    cp -r "$WORK_DIR" "$BACKUP_DIR/"
    echo "✅ Backup created in $BACKUP_DIR"
fi

# Function to convert image to WebP
convert_to_webp() {
    local file="$1"
    local webp_file="${file%.*}.webp"
    
    # Skip if already WebP
    if [[ "$file" == *.webp ]]; then
        return
    fi
    
    # Get original size
    local original_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
    
    # Convert to WebP using ImageMagick
    if convert "$file" -quality $QUALITY "$webp_file" 2>/dev/null; then
        local webp_size=$(stat -f%z "$webp_file" 2>/dev/null || stat -c%s "$webp_file" 2>/dev/null)
        
        # Only keep WebP if it's smaller
        if [ $webp_size -lt $original_size ]; then
            rm "$file"  # Remove original
            local saved=$((original_size - webp_size))
            TOTAL_BEFORE=$((TOTAL_BEFORE + original_size))
            TOTAL_AFTER=$((TOTAL_AFTER + webp_size))
            CONVERTED=$((CONVERTED + 1))
            
            # Calculate percentage saved
            local percent=$((100 * saved / original_size))
            echo "  ✅ $(basename "$file") → $(basename "$webp_file"): $(numfmt --to=iec $original_size) → $(numfmt --to=iec $webp_size) (-${percent}%)"
        else
            # WebP not smaller, keep original
            rm "$webp_file"
            TOTAL_BEFORE=$((TOTAL_BEFORE + original_size))
            TOTAL_AFTER=$((TOTAL_AFTER + original_size))
            echo "  ⚠️  $(basename "$file"): Original smaller, keeping as-is"
        fi
    else
        echo "  ❌ Failed to convert $(basename "$file")"
        FAILED=$((FAILED + 1))
        TOTAL_BEFORE=$((TOTAL_BEFORE + original_size))
        TOTAL_AFTER=$((TOTAL_AFTER + original_size))
    fi
}

# Process all images in work directory
echo ""
echo "🔄 Converting work images to WebP..."
echo ""

# Find all image files (jpg, jpeg, png)
find "$WORK_DIR" \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | while read file; do
    convert_to_webp "$file"
done

# Calculate totals properly
echo ""
echo "📊 Conversion Summary"
echo "===================="
echo "Files converted: $CONVERTED"
echo "Files failed: $FAILED"

# Show size savings if we have conversions
if [ $CONVERTED -gt 0 ] && [ $TOTAL_BEFORE -gt 0 ]; then
    echo "Original total: $(numfmt --to=iec $TOTAL_BEFORE)"
    echo "New total: $(numfmt --to=iec $TOTAL_AFTER)"
    echo "Total saved: $(numfmt --to=iec $((TOTAL_BEFORE - TOTAL_AFTER)))"
    
    local percentage=$((100 * (TOTAL_BEFORE - TOTAL_AFTER) / TOTAL_BEFORE))
    echo "Size reduction: ${percentage}%"
fi

echo ""
echo "✅ Conversion complete!"
echo ""
echo "⚠️  IMPORTANT: You need to update image references in your posts:"
echo "   Change: images/work/project/image.jpg"
echo "   To:     images/work/project/image.webp"
echo ""
echo "💡 Backup available in: $BACKUP_DIR"