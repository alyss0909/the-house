---
date: 2026-06-12
tags:
  - inspo
---
# Obsidian Dashboard Inspo — Cards, Sidebar, Colored Tags

Ideas for making the Obsidian home dashboard more visual and functional.

## Colored folder cards in a base/dashboard

Uses a Property formula to assign folder icon images based on file name keywords:

```
if(file.name.contains('zoology'),"000 General Information/Images/greenfolder.png",
if(file.name.contains('films'),'000 General Information/Images/pinkfolder.png',
if(file.name.contains('bookshelf'),"000 General Information/Images/purplefolder.png",
if(file.name.contains('countries'),"000 General Information/Images/yellowfolder.png",
"000 General Information/Images/file.png"))))
```

Set as the cards image property. The folder/file images are PNGs saved in the vault, recolored via Photoshop to match theme.

![[Images/2026/06/2026-06-12-obsidian-dashboard-cards.png]]

## Sidebar file properties

Right-click on a tab, "Open linked view > View file properties", move the properties window wherever you want. Then use CSS to make the background/border transparent and visible only on hover.

![[Images/2026/06/2026-06-12-obsidian-dashboard-sidebar.png]]

## Colored tags

Used the **Colored Tags** plugin to customize tag colors throughout the vault.

**Connections:** [[pkm]]

*[Source](https://www.reddit.com/r/ObsidianMD/comments/1s96asw/comment/odmgskp/)*
