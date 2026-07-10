---
date: 2026-02-24
tags:
  - idea
---
# TC custom Font
The easiest one is: use WordPress, no plugins, no Bunny, no drama.
You already have WordPress, so:
Easiest path (for a sane person):
Step 1: Upload the font to WordPress
Go to your WP dashboard → Media → Add New
Upload your webfont file, ideally a .woff2 (and .woff if you have it)
Click the file → copy the File URL, it’ll look like:
 https://yourdomain.com/wp-content/uploads/2025/12/yourfont.woff2
That URL is all we need.
Step 2: Tell ThriveCart about it with @font-face
In ThriveCart → product → checkout editor → Custom CSS, add:
@font-face {
 font-family: 'AlyssaCustom';
 src: url('https://yourdomain.com/wp-content/uploads/2025/12/yourfont.woff2') format('woff2');
 font-weight: 400;
 font-style: normal;
 font-display: swap;
}
(If you also have a .woff, add a second url(...) format('woff') line under that.)
Step 3: Use it where you want
Example for the marquee:
.boh-marquee {
 font-family: 'AlyssaCustom', "Playfair Display", serif;
}
Done. No Bunny config, no extra plugins, no messing with storage zones. Just “font file in WordPress → URL into ThriveCart.”

**Related notes**
- [[2023-10-23-tc-font|Tc Font]]
- [[2024-10-03-hex|Hex]]
- [[2025-04-11-tc-custom-font-2|Tc Custom Font 2]]
- [[2025-05-14-what-font-is-this|What Font Is This]]
- [[2025-11-27-fonts-and-colours|Fonts And Colours]]
- [[2025-12-03-cool-fonts|Cool Fonts]]
- [[2026-03-18-showit-font-editor|Showit Font Editor]]

**Connections:** [[rebrand]] [[back-of-house]]
