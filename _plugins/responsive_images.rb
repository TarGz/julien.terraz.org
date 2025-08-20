require 'mini_magick'
require 'fileutils'

module Jekyll
  class ResponsiveImages
    MOBILE_WIDTH = 400
    TABLET_WIDTH = 600
    QUALITY = 85
    
    def initialize(site)
      @site = site
      @source_dir = File.join(@site.source, 'images')
      @processed_count = 0
      @skipped_count = 0
    end
    
    def generate
      return unless File.directory?(@source_dir)
      
      Jekyll.logger.info "ResponsiveImages:", "Generating responsive images..."
      
      # Create output directories
      create_directories
      
      # Process all WebP images
      process_images
      
      Jekyll.logger.info "ResponsiveImages:", "✅ Processed #{@processed_count} images, skipped #{@skipped_count}"
    end
    
    private
    
    def create_directories
      # No separate directories needed - files will be in same location with suffixes
    end
    
    def process_images
      # Find all WebP images in images/work directory
      work_images = Dir.glob(File.join(@source_dir, 'work', '**', '*.webp'))
      
      work_images.each do |source_file|
        process_single_image(source_file)
      end
      
      # Also process any remaining JPG images that weren't converted
      jpg_images = Dir.glob(File.join(@source_dir, 'work', '**', '*.jpg'))
      jpg_images.each do |source_file|
        process_single_image(source_file)
      end
    end
    
    def process_single_image(source_file)
      return if source_file.include?('-mobile.') || source_file.include?('-tablet.')
      
      # Generate mobile version (same directory, different filename)
      mobile_output = source_file.sub('.webp', '-mobile.webp')
      generate_version(source_file, mobile_output, MOBILE_WIDTH, 'mobile')
      
      # Generate tablet version (same directory, different filename)
      tablet_output = source_file.sub('.webp', '-tablet.webp')  
      generate_version(source_file, tablet_output, TABLET_WIDTH, 'tablet')
    end
    
    def generate_version(source_file, output_file, width, size_name)
      # Skip if output exists and is newer than source
      if File.exist?(output_file) && File.mtime(output_file) > File.mtime(source_file)
        @skipped_count += 1
        return
      end
      
      begin
        # Ensure output directory exists
        FileUtils.mkdir_p(File.dirname(output_file))
        
        # Use MiniMagick to resize image
        image = MiniMagick::Image.open(source_file)
        
        # Only resize if image is larger than target width
        if image.width > width
          image.resize("#{width}x>")
          image.quality(QUALITY)
          image.write(output_file)
          
          original_size = File.size(source_file)
          new_size = File.size(output_file)
          reduction = ((original_size - new_size).to_f / original_size * 100).round
          
          Jekyll.logger.debug "ResponsiveImages:", "#{File.basename(source_file)} → #{size_name}/ (-#{reduction}%)"
        else
          # Copy original if it's already smaller
          FileUtils.cp(source_file, output_file)
          Jekyll.logger.debug "ResponsiveImages:", "#{File.basename(source_file)} → #{size_name}/ (copied, already small)"
        end
        
        @processed_count += 1
        
      rescue StandardError => e
        Jekyll.logger.warn "ResponsiveImages:", "Failed to process #{source_file}: #{e.message}"
      end
    end
  end
  
  # Hook into Jekyll's site generation
  Jekyll::Hooks.register :site, :after_init do |site|
    responsive_images = ResponsiveImages.new(site)
    responsive_images.generate
  end
end