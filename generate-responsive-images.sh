#!/bin/bash

# Generate responsive WebP images for Jekyll site
# Creates mobile (400px) and tablet (800px) versions of work images

set -e

WORK_DIR="images/work"
MOBILE_SIZE=400
TABLET_SIZE=800
QUALITY=85
PROCESSED=0
SKIPPED=0

echo "📱 Responsive Image Generation Script"
echo "====================================="
echo "Mobile size: ${MOBILE_SIZE}px"
echo "Tablet size: ${TABLET_SIZE}px"
echo "Quality: ${QUALITY}%"
echo ""

# Create directory structure
create_directories() {
    echo "📁 Creating directory structure..."
    
    # Find all subdirectories in work folder
    find "$WORK_DIR" -type d | while read dir; do
        # Skip the root work directory
        if [[ "$dir" != "$WORK_DIR" ]]; then
            local relative_path="${dir#$WORK_DIR/}"
            mkdir -p "$WORK_DIR/mobile/$relative_path"
            mkdir -p "$WORK_DIR/tablet/$relative_path"
        fi
    done
    
    echo "✅ Directories created"
    echo ""
}

# Function to generate responsive version
generate_responsive() {
    local source_file="$1"
    local size="$2"
    local size_name="$3"
    
    # Get relative path from work directory
    local relative_path="${source_file#$WORK_DIR/}"
    local output_file="$WORK_DIR/$size_name/$relative_path"
    
    # Skip if output already exists and is newer than source
    if [[ -f "$output_file" && "$output_file" -nt "$source_file" ]]; then
        return 1
    fi
    
    # Create output directory if needed
    mkdir -p "$(dirname "$output_file")"
    
    # Get original dimensions
    local original_width=$(identify -ping -format '%w' "$source_file" 2>/dev/null || echo "0")
    
    # Skip if original is smaller than target size
    if [[ $original_width -le $size ]]; then
        # Just copy the original file
        cp "$source_file" "$output_file"
        echo "  📄 $(basename "$source_file") → ${size_name}/ (copied original, already smaller)"
        return 0
    fi
    
    # Resize and convert
    if convert "$source_file" -resize "${size}x>" -quality $QUALITY "$output_file" 2>/dev/null; then
        local original_size=$(stat -f%z "$source_file" 2>/dev/null || stat -c%s "$source_file" 2>/dev/null)
        local new_size=$(stat -f%z "$output_file" 2>/dev/null || stat -c%s "$output_file" 2>/dev/null)
        local percent_reduction=$((100 * (original_size - new_size) / original_size))
        
        echo "  ✅ $(basename "$source_file") → ${size_name}/ (-${percent_reduction}%)"
        return 0
    else
        echo "  ❌ Failed: $(basename "$source_file")"
        return 1
    fi
}

# Function to process a single image
process_image() {
    local file="$1"
    local basename_file=$(basename "$file")
    local processed_any=false
    
    echo "🖼️  Processing: $basename_file"
    
    # Generate mobile version
    if generate_responsive "$file" $MOBILE_SIZE "mobile"; then
        processed_any=true
    else
        SKIPPED=$((SKIPPED + 1))
    fi
    
    # Generate tablet version
    if generate_responsive "$file" $TABLET_SIZE "tablet"; then
        processed_any=true
    else
        SKIPPED=$((SKIPPED + 1))
    fi
    
    if $processed_any; then
        PROCESSED=$((PROCESSED + 1))
    fi
    
    echo ""
}

# Main execution
echo "🔍 Scanning for WebP images..."
create_directories

# Process all WebP images in work directory
find "$WORK_DIR" -name "*.webp" -not -path "*/mobile/*" -not -path "*/tablet/*" | sort | while read file; do
    process_image "$file"
done

# Process remaining JPG images that weren't converted to WebP
find "$WORK_DIR" -name "*.jpg" -not -path "*/mobile/*" -not -path "*/tablet/*" | sort | while read file; do
    process_image "$file"
done

echo "📊 Generation Summary"
echo "===================="
echo "Images processed: $PROCESSED"
echo "Files skipped: $SKIPPED"
echo ""
echo "📁 Directory structure created:"
echo "   images/work/mobile/    - 400px versions"
echo "   images/work/tablet/    - 800px versions"
echo "   images/work/           - Desktop versions"
echo ""
echo "✅ Responsive images generated!"
echo ""
echo "💡 Next steps:"
echo "   1. Test with: ls -la images/work/mobile/"
echo "   2. Update Jekyll templates to use responsive images"
echo "   3. Add proper srcset and sizes attributes"