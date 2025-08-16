# Julien Terraz Portfolio

Personal portfolio website of Julien Terraz - Creative Director at Razorfish playing with technology in pursuit of creativity.

## About

This is the repository for [julien.terraz.org](https://julien.terraz.org/), built using [Jekyll](https://jekyllrb.com/) and based on [Jekyll Now](https://github.com/barryclark/jekyll-now).

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

**Note:** If you're running multiple Jekyll instances, use different ports to avoid conflicts:
- Instance 1: `bundle exec jekyll serve --port 4001 --livereload` (uses default livereload port 35729)
- Instance 2: `./startlocaldev.sh` (uses port 4002 and livereload port 35730)

## Project Structure

- `_posts/` - Blog posts and portfolio items
- `_drafts/` - Draft posts
- `_layouts/` - Page templates
- `_includes/` - Reusable components
- `_sass/` - SCSS stylesheets
- `images/` - Image assets for work and leisure projects
- `downloads/` - Downloadable files
- `work.html` - Work portfolio page
- `photos.html` - Photo gallery page

## Dependencies

Main gems used:
- jekyll ~3.9
- jekyll-sitemap
- jekyll-feed
- kramdown-parser-gfm
- eventmachine 1.2.7

## Configuration

Site configuration is managed in `_config.yml`:
- Site title and description
- Social media links (Instagram, LinkedIn)
- Disqus comments
- Google Analytics

## License

See LICENSE file for details.