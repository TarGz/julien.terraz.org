# Jekyll Performance Optimization Guide

## Summary
This guide documents proven performance optimization strategies for Jekyll sites, based on real testing that improved LCP from 5.42s to 4.31s while maintaining perfect CLS (0.000).

## ✅ PROVEN OPTIMIZATIONS (Safe to implement)

### 1. Image Loading Strategy
**Problem**: All images loading lazily causes slow LCP
**Solution**: First 2 images eager, rest lazy
```html
<img src="{{ post.image | relative_url }}" 
     alt="{{ post.title }}"
     {% if forloop.index <= 2 %}loading="eager"{% else %}loading="lazy"{% endif %}
     {% if forloop.index <= 2 %}fetchpriority="high"{% endif %}
     width="704" height="990">
```
**Result**: ✅ LCP improved by 1.11s (5.42s → 4.31s)

### 2. Image Dimensions
**Problem**: Unsized images cause layout shift
**Solution**: Always specify width/height attributes
```html
<img src="..." width="40" height="40" alt="...">
```
**Result**: ✅ Prevents CLS issues

### 3. Responsive Images (if needed)
**Problem**: Large images on mobile
**Solution**: Use responsive images with proper structure
```
assets/images/
├── mobile/          # 400px versions
├── tablet/          # 600px versions  
└── original.webp    # Desktop version
```

### 4. Menu Background Optimization
**Problem**: Header image loads immediately, blocking render
**Solution**: Lazy load menu background only when menu opens
```css
.slide-nav-overlay {
  background-color: #000; /* Default */
}
.slide-nav-overlay.image-loaded {
  background-image: url('../images/header.webp');
}
```
```javascript
function openMenu() {
  if (!imageLoaded) {
    const img = new Image();
    img.onload = () => overlay.classList.add('image-loaded');
    img.src = '/assets/images/header.webp';
  }
}
```

## ❌ AVOID THESE APPROACHES (Cause more problems)

### 1. Critical CSS Inlining
**Why it fails**: 
- Complex to maintain
- Can break existing layouts
- Often causes more layout shift
- Minimal performance gain vs complexity

### 2. Aggressive CSS Purging
**Why it fails**:
- Can break dynamic content
- Jekyll plugins may add classes
- Maintenance overhead high

### 3. Deferring All CSS
**Why it fails**:
- Causes flash of unstyled content (FOUC)
- Increases CLS significantly
- Poor user experience

## 🧪 LOCAL TESTING SETUP

### Test Performance Locally
```bash
# Start Jekyll
bundle exec jekyll serve --port 4001

# Run Lighthouse
npx lighthouse http://127.0.0.1:4001/ --only-categories=performance --view

# Quick CLS check
npx lighthouse http://127.0.0.1:4001/ --only-audits=cumulative-layout-shift --view
```

### Performance Targets
- **Performance Score**: 80%+ (Good), 90%+ (Excellent)
- **CLS**: 0.000-0.1 (Good), 0.000 (Perfect)
- **LCP**: <2.5s (Good), <4s (Acceptable)
- **FCP**: <1.8s (Good)

## 📊 PERFORMANCE IMPACT SUMMARY

| Optimization | LCP Impact | CLS Impact | Implementation |
|--------------|------------|------------|----------------|
| Eager load first 2 images | -1.11s ✅ | No change ✅ | Easy |
| Image dimensions | No change | Prevents issues ✅ | Easy |
| Lazy menu background | -200ms ✅ | No change ✅ | Medium |
| Critical CSS inlining | Variable ❌ | Often breaks ❌ | Hard |

## 🔧 IMPLEMENTATION CHECKLIST

### Before Starting
- [ ] Set up local testing environment
- [ ] Get baseline performance metrics
- [ ] Note current logo/navigation positioning

### Safe Optimizations (Do First)
- [ ] Add width/height to all images
- [ ] Implement eager loading for first 2 images
- [ ] Add `fetchpriority="high"` to above-fold images
- [ ] Lazy load menu backgrounds
- [ ] Test locally after each change

### Advanced Optimizations (Only if needed)
- [ ] Responsive images (if mobile traffic high)
- [ ] Font loading optimization
- [ ] Service worker caching

### Testing & Deployment
- [ ] Test locally shows improvement
- [ ] CLS remains 0.000 or <0.1
- [ ] Visual regression testing
- [ ] Deploy and verify live performance

## 🚨 WARNING SIGNS

Stop and revert if you see:
- CLS > 0.1 (layout shifting)
- Logo/navigation positioning breaks
- Performance score drops significantly
- Flash of unstyled content (FOUC)

## 📈 SUCCESS METRICS

A successful optimization should:
- Improve LCP by >500ms
- Maintain CLS <0.1 (ideally 0.000)
- Not break existing functionality
- Be maintainable long-term

---

**Key Takeaway**: Focus on image loading strategy first - it's the safest optimization with the biggest impact. Avoid complex CSS manipulations that can break layout.