#!/bin/bash

# Image optimization script for Jekyll site
# Optimizes JPEGs and PNGs while preserving quality

set -e  # Exit on error

BACKUP_DIR="images_backup"
QUALITY=85  # JPEG quality (85 is good balance of size/quality)
TOTAL_BEFORE=0
TOTAL_AFTER=0

echo "🖼️  Image Optimization Script"
echo "=========================="

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "📦 Creating backup directory..."
    mkdir -p "$BACKUP_DIR"
    cp -r images/ "$BACKUP_DIR/"
    echo "✅ Backup created in $BACKUP_DIR"
fi

# Function to optimize a single JPEG
optimize_jpeg() {
    local file="$1"
    local original_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
    
    # Use jpegoptim for JPEG optimization
    jpegoptim --max=$QUALITY --preserve --quiet "$file"
    
    local new_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
    local saved=$((original_size - new_size))
    
    TOTAL_BEFORE=$((TOTAL_BEFORE + original_size))
    TOTAL_AFTER=$((TOTAL_AFTER + new_size))
    
    if [ $saved -gt 0 ]; then
        echo "  📉 $(basename "$file"): $(numfmt --to=iec $original_size) → $(numfmt --to=iec $new_size) (saved $(numfmt --to=iec $saved))"
    fi
}

# Function to optimize a single PNG
optimize_png() {
    local file="$1"
    local original_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
    
    # Use pngquant for PNG optimization (creates temp file)
    local temp_file="${file%.png}_temp.png"
    
    if pngquant --quality=80-95 --ext "_temp.png" --force "$file" 2>/dev/null; then
        # If pngquant succeeded and the new file is smaller
        local temp_size=$(stat -f%z "${file%.*}_temp.png" 2>/dev/null || stat -c%s "${file%.*}_temp.png" 2>/dev/null)
        if [ $temp_size -lt $original_size ]; then
            mv "${file%.*}_temp.png" "$file"
            local new_size=$temp_size
        else
            # Keep original if not smaller
            rm -f "${file%.*}_temp.png"
            local new_size=$original_size
        fi
    else
        # pngquant failed, keep original
        local new_size=$original_size
    fi
    
    local saved=$((original_size - new_size))
    
    TOTAL_BEFORE=$((TOTAL_BEFORE + original_size))
    TOTAL_AFTER=$((TOTAL_AFTER + new_size))
    
    if [ $saved -gt 0 ]; then
        echo "  📉 $(basename "$file"): $(numfmt --to=iec $original_size) → $(numfmt --to=iec $new_size) (saved $(numfmt --to=iec $saved))"
    fi
}

# Process images in leisure directory
echo ""
echo "🎨 Optimizing leisure images..."
find images/leisure -name "*.jpg" -o -name "*.jpeg" | head -20 | while read file; do
    optimize_jpeg "$file"
done

find images/leisure -name "*.png" | head -10 | while read file; do
    optimize_png "$file"
done

# Process images in work directory  
echo ""
echo "💼 Optimizing work images..."
find images/work -name "*.jpg" -o -name "*.jpeg" | head -20 | while read file; do
    optimize_jpeg "$file"
done

find images/work -name "*.png" | head -10 | while read file; do
    optimize_png "$file"
done

# Show summary
echo ""
echo "📊 Optimization Summary"
echo "======================"
echo "Original size: $(numfmt --to=iec $TOTAL_BEFORE)"
echo "Optimized size: $(numfmt --to=iec $TOTAL_AFTER)"
echo "Total saved: $(numfmt --to=iec $((TOTAL_BEFORE - TOTAL_AFTER)))"

if [ $TOTAL_BEFORE -gt 0 ]; then
    local percentage=$((100 * (TOTAL_BEFORE - TOTAL_AFTER) / TOTAL_BEFORE))
    echo "Reduction: ${percentage}%"
fi

echo ""
echo "✅ Optimization complete!"
echo "💡 Backup available in: $BACKUP_DIR"