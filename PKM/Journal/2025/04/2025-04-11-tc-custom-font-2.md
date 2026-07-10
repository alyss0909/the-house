---
date: 2025-04-11
tags:
  - idea
---
# TC custom Font 2
Livy Lin-Bay I'm a web designer, so I just added a code block at the top of the first lesson with the font installation code in it, and duplicated that lesson before editing it for all of the module's lessons. The code is:
<style>
@font-face {
  font-family: 'REGULARFONTNAME';
  src:        url('PASTEREGULARFONTSOURCEURL1') format('opentype'),  url('PASTEREGULARFONTSOURCEURL2') format('woff'), url('PASTEREGULARFONTSOURCEURL3') format('woff2');
}
h1, .tc-v2-widget-heading .builder-v2-block-heading {
font-family: REGULARFONTNAME;
font-weight: 100;
letter-spacing: 0 rem; 
}
</style>
You have to store the font files somewhere, so I put the file in my website's asset library & used the source link for the file in there instead of 'PASTEREGULARFONTSOURCEURL' in the code, with 1 link per font format for .otf, .woff, and .woff2. Then you can name it whatever you want in place of REGULARFONTNAME in the @font-face section, and then use that same name in the bottom font-family section.
**Related notes**
- [[2023-10-23-tc-font|Tc Font]]
- [[2024-10-03-hex|Hex]]
- [[2025-05-14-what-font-is-this|What Font Is This]]
- [[2025-11-27-fonts-and-colours|Fonts And Colours]]
- [[2025-12-03-cool-fonts|Cool Fonts]]
- [[2026-02-24-tc-custom-font|Tc Custom Font]]
- [[2026-03-18-showit-font-editor|Showit Font Editor]]

**Connections:** [[rebrand]]
