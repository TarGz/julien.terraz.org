# Julien Terraz Portfolio

**JULIEN TERRAZ**  
Creative Director at Razorfish playing with technology in pursuit of creativity.  
Also pen plotter artist known as [targz](https://targz.fr).

## About

This is the repository for [julien.terraz.org](https://julien.terraz.org/), a minimalist portfolio website built with Jekyll featuring a custom design inspired by OCKHAM aesthetics.

## Features

- **Minimalist Design**: Clean, typography-focused layout with Space Grotesk font
- **Responsive Images**: Automatic WebP conversion and responsive sizing
- **Mobile Optimized**: Centered mobile layout with enhanced readability
- **Custom 404**: Fun meme-based error page ("This is Fine")
- **Social Integration**: LinkedIn, Instagram, and Telegram links
- **Performance**: Streamlined codebase with only essential files

## Prerequisites

- Ruby (with rbenv)
- Bundler
- Jekyll ~3.9

## Installation

1. Clone the repository
2. Install dependencies:
```bash
bundle install
```

## Development

### Quick Start

Run the development server:
```bash
./startlocaldev.sh
```

This will start the Jekyll server on:
- Main server: http://localhost:4002
- LiveReload: port 35730

### Alternative Commands

Run with drafts:
```bash
bundle exec jekyll serve --draft
```

Run on default ports:
```bash
bundle exec jekyll serve
```

## Project Structure

```
├── _posts/                 # Portfolio work posts
├── _drafts/               # Draft posts  
├── _layouts/              # Page templates
├── _includes/             # Reusable components
├── _plugins/              # Custom plugins (responsive images)
├── css/                   # Stylesheets (minimal.css only)
├── images/                # Image assets
│   ├── work/             # Portfolio project images (WebP)
│   └── icons/            # Social media icons (white SVG)
├── downloads/            # Downloadable files
├── 404.md               # Custom error page
└── index.html           # Homepage
```

## Key Components

### Design System
- **Typography**: Space Grotesk from Google Fonts
- **Layout**: CSS Grid and Flexbox for responsive design  
- **Color**: Minimalist black/white/gray palette
- **Mobile**: Centered header with larger fonts

### Responsive Images
- Automatic WebP conversion via `_plugins/responsive_images.rb`
- Multiple sizes: mobile, tablet, desktop
- Lazy loading with `_includes/responsive-image.html`

### Navigation
- **WORK**: Homepage portfolio (default)
- **TARGZ**: Links to external site (targz.fr)
- **CONTACT**: Scrolls to footer contact section

## Configuration

Key settings in `_config.yml`:
- Site metadata and URLs
- Social media links (LinkedIn, Instagram, Telegram)
- Google Analytics tracking
- Disqus comments

## Dependencies

- `jekyll` ~3.9
- `jekyll-sitemap` - XML sitemap generation
- `jekyll-feed` - RSS feed
- `kramdown-parser-gfm` - GitHub Flavored Markdown

## License

See LICENSE file for details.