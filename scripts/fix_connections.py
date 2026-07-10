import os
import re

JOURNAL_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "PKM", "Journal")
ONLY_LIFE = re.compile(r'^\*\*Connections:\*\* \[\[life\]\]\s*$', re.MULTILINE)
TAG_LINE = re.compile(r'^\s*-\s+(.+)$', re.MULTILINE)

fixed_business = []
fixed_becoming = []
scanned = 0

for root, dirs, files in os.walk(JOURNAL_DIR):
    for fname in files:
        if not fname.endswith(".md"):
            continue
        path = os.path.join(root, fname)
        text = open(path, encoding="utf-8").read()
        scanned += 1

        if not ONLY_LIFE.search(text):
            continue

        fm_match = re.match(r'^---\n(.*?)\n---', text, re.DOTALL)
        if not fm_match:
            print(f"  [no frontmatter] {fname}")
            continue
        fm = fm_match.group(1)

        tags_block = re.search(r'^tags:\n((?:[ \t]+-[ \t]+.+\n?)+)', fm, re.MULTILINE)
        if not tags_block:
            print(f"  [no tags block] {fname} | fm snippet: {repr(fm[:80])}")
            continue
        tags = [m.group(1).strip() for m in TAG_LINE.finditer(tags_block.group(0))]

        if "good-ideas" in tags or "inspo" in tags:
            new_text = ONLY_LIFE.sub("**Connections:** [[business]]", text)
            open(path, "w", encoding="utf-8").write(new_text)
            fixed_business.append(fname)
        elif "muisings" in tags:
            new_text = ONLY_LIFE.sub("**Connections:** [[becoming]]", text)
            open(path, "w", encoding="utf-8").write(new_text)
            fixed_becoming.append(fname)
        else:
            print(f"  [no matching tag] {fname} tags={tags}")

print(f"\nScanned: {scanned} files")
print(f"Total fixed: {len(fixed_business) + len(fixed_becoming)}")
print(f"  -> [[business]] ({len(fixed_business)} files): good-ideas or inspo tag")
for f in fixed_business:
    print(f"      {f}")
print(f"  -> [[becoming]] ({len(fixed_becoming)} files): muisings tag")
for f in fixed_becoming:
    print(f"      {f}")
