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

### Development with Drafts

Run with drafts enabled:
```bash
./startlocaldev-draft.sh
```

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

## Creating New Articles

### Using the Template

1. **Copy the template:**
```bash
cp _drafts/1972-01-28-template.markdown _drafts/YYYY-MM-DD-your-project-name.markdown
```

2. **Update the front matter:**
```yaml
---
layout: post
title: "Your Project Title"
date: "Mon DD, YYYY HH:MM:SSam"
categories: work
comments: true
preview: "images/work/your-project/hero-image.webp"
excerpt: "Brief description of your project"
industry: "Industry Name"
tech_tags: ["TAG1", "TAG2", "TAG3"]
---
```

### Image Requirements

**Required Images:**
- **Hero image**: Main project image for preview (800x533px recommended)
- **Content images**: Supporting images throughout the article

**Image Formats:**
- **Source format**: Any format (JPG, PNG, WebP)
- **Naming convention**: `01.webp`, `02.webp`, etc. or descriptive names
- **Location**: `/images/work/project-name/`

**Image Sizes Generated Automatically:**
- Desktop: Original size
- Tablet: `-tablet.webp` (responsive)  
- Mobile: `-mobile.webp` (responsive)

### Image Setup Process

1. **Create project folder:**
```bash
mkdir images/work/your-project-name
```

2. **Add your images:**
```bash
# Copy your source images
cp ~/your-images/* images/work/your-project-name/
```

3. **Use responsive image syntax:**
```liquid
{% include responsive-image.html src="images/work/your-project-name/01.webp" alt="Description" width="800" height="533" %}
```

**Image Grid Examples:**
```liquid
<!-- Single image -->
{% include responsive-image.html src="images/work/project/01.webp" alt="Description" width="800" height="533" %}

<!-- Two images side by side -->
<div class="content-grid">
    {% include responsive-image.html src="images/work/project/01.webp" alt="Description 1" width="800" height="533" %}
    {% include responsive-image.html src="images/work/project/02.webp" alt="Description 2" width="800" height="533" %}
</div>

<!-- Three images in sequence -->
{% include responsive-image.html src="images/work/project/01.webp" alt="Description 1" width="800" height="533" %}
{% include responsive-image.html src="images/work/project/02.webp" alt="Description 2" width="800" height="533" %}
{% include responsive-image.html src="images/work/project/03.webp" alt="Description 3" width="800" height="533" %}
```

### Publishing Workflow

1. **Work in drafts:** Edit `_drafts/your-article.markdown`
2. **Test with drafts:** Use `./startlocaldev-draft.sh`  
3. **Move to posts:** When ready, move to `_posts/` folder
4. **Commit:** `git add . && git commit -m "Add new project article"`

### Content Sections Template

The template includes these standard sections:
- **Hero image and video** (optional)
- **Text blocks** with descriptions
- **Image + text combinations**
- **Image galleries** (1, 2, or 3 images)
- **Roles section** with responsibilities
- **Credits section** with team members

## Dependencies

- `jekyll` ~3.9
- `jekyll-sitemap` - XML sitemap generation
- `jekyll-feed` - RSS feed
- `kramdown-parser-gfm` - GitHub Flavored Markdown

## License

See LICENSE file for details.