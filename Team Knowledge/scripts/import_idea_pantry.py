"""
Phase 5 — Idea Pantry CSV → PKM/Documents/ import
Writes Document entity files from the Notion CSV export.
"""
import csv
import os
import re
import sys
import io

# Force UTF-8 stdout
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# ── Config ──────────────────────────────────────────────────────────────────
CSV_PATH = r'C:\Users\accol\AppData\Local\Temp\idea Pantry DB 2f4c8b43e5658142a060f4e3c920e7f4_all.csv'
DEST_DIR = r'C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\PKM\Documents'

# ── Lookup tables ─────────────────────────────────────────────────────────
LABEL_MAP = {
    '🔮 Good Ideas':   'good-ideas',
    '🤎 Family':       'family',
    '🌹 Content':      'content',
    '✨ Inspo':        'inspo',
    '🕊️ Muisings':    'muisings',
    '📁 Copy Cupboard':'copy-cupboard',
    '🍒 Recipes':      'recipes',
}

AREA_MAP = {
    'content':    'emails',
    'Life':       'life',
    'socials':    'socials',
    'promos':     'promos',
    'products':   'offers',
    'clients':    'clients',
    'operations': 'operations',
    'Team':       'operations',
    'design':     None,   # no KE yet — omit
}

# Month name → zero-padded number
MONTH_MAP = {
    'January':'01','February':'02','March':'03','April':'04',
    'May':'05','June':'06','July':'07','August':'08',
    'September':'09','October':'10','November':'11','December':'12',
}

# ── Helpers ───────────────────────────────────────────────────────────────

def parse_date(raw):
    """'March 19, 2026' → '2026-03-19'. Returns '' on failure."""
    raw = raw.strip()
    if not raw:
        return ''
    m = re.match(r'^(\w+)\s+(\d{1,2}),\s+(\d{4})$', raw)
    if not m:
        return ''
    month_name, day, year = m.group(1), m.group(2), m.group(3)
    month_num = MONTH_MAP.get(month_name, '')
    if not month_num:
        return ''
    return f'{year}-{month_num}-{int(day):02d}'


def extract_area_name(raw):
    """'content (https://...)' → 'content'. Returns '' if empty."""
    raw = raw.strip()
    if not raw:
        return ''
    m = re.match(r'^(.+?) \(https', raw)
    return m.group(1).strip() if m else raw


def make_slug(title, max_len=60):
    """Title → kebab-case slug, max 60 chars, trimmed at last hyphen if needed."""
    s = title.lower()
    s = re.sub(r'[^a-z0-9]+', '-', s)
    s = s.strip('-')
    if len(s) <= max_len:
        return s
    # Truncate at max_len, then trim to last hyphen
    s = s[:max_len]
    last_hyphen = s.rfind('-')
    if last_hyphen > 0:
        s = s[:last_hyphen]
    return s.strip('-')


def parse_linked_entries(raw):
    """
    'Project Notion (https://...), Other (https://...)' →
    ['Project Notion', 'Other']
    """
    if not raw.strip():
        return []
    entries = [e.strip() for e in raw.split(', ')]
    results = []
    for e in entries:
        m = re.match(r'^(.+?) \(https', e)
        name = m.group(1).strip() if m else e.strip()
        if name:
            results.append(name)
    return results


def build_frontmatter(row):
    """Return the YAML frontmatter string (without closing ---)."""
    title = row['Name'].strip()
    lines = ['---', f'title: "{title}"']

    # tags
    label_raw = row.get('Label', '').strip()
    tag_slug = LABEL_MAP.get(label_raw)
    if tag_slug:
        lines.append('tags:')
        lines.append(f'  - {tag_slug}')

    # issued_on
    date_str = parse_date(row.get('Idea Created', ''))
    if date_str:
        lines.append(f'issued_on: {date_str}')

    # key_element
    area_name = extract_area_name(row.get('Area', ''))
    if area_name:
        ke = AREA_MAP.get(area_name)
        if ke:   # None means omit (design)
            lines.append(f'key_element: {ke}')

    lines.append('---')
    return '\n'.join(lines)


def build_body(row):
    """Return the body string (may be empty string)."""
    sections = []

    # 1. Inspo link (takes priority over URL)
    inspo = row.get('Inspo', '').strip()
    url   = row.get('URL',   '').strip()
    if inspo:
        sections.append(f'[Inspo]({inspo})')
    elif url:
        sections.append(f'[Link]({url})')

    # 2. Notes
    notes = row.get('Notes', '').strip()
    if notes:
        sections.append(notes)

    # 3. Projects wikilinks
    proj_entries = parse_linked_entries(row.get('Projects', ''))
    if proj_entries:
        sections.append('\n'.join(f'[[{p}]]' for p in proj_entries))

    # 4. Tags wikilinks
    tag_entries = parse_linked_entries(row.get('Tags', ''))
    if tag_entries:
        sections.append('\n'.join(f'[[{t}]]' for t in tag_entries))

    return '\n\n'.join(sections)


def build_file_content(row):
    fm = build_frontmatter(row)
    body = build_body(row)
    if body:
        return fm + '\n' + body + '\n'
    else:
        return fm + '\n'


# ── Main ──────────────────────────────────────────────────────────────────

def main():
    # Load existing slugs in destination (safety check)
    existing_slugs = set()
    for fname in os.listdir(DEST_DIR):
        if fname.endswith('.md') and fname.lower() != 'index.md':
            existing_slugs.add(fname[:-3])  # strip .md

    # Read CSV
    with open(CSV_PATH, encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        all_rows = list(reader)

    # Filter archived
    active_rows = [r for r in all_rows if r.get('Weekly Review Status', '').strip() != 'Archived']

    total_written = 0
    total_skipped = 0
    skipped_details = []
    used_slugs = dict(existing_slugs)  # slug → True (already used)
    # Re-use as a set
    used_slugs_set = set(existing_slugs)

    batch_size = 100
    batch_num = 0

    for batch_start in range(0, len(active_rows), batch_size):
        batch = active_rows[batch_start:batch_start + batch_size]
        batch_num += 1
        batch_written = 0

        for row in batch:
            name = row.get('Name', '').strip()
            if not name:
                total_skipped += 1
                skipped_details.append(f'Row with empty Name skipped')
                continue

            slug = make_slug(name)
            if not slug:
                total_skipped += 1
                skipped_details.append(f'Could not generate slug for: {name!r}')
                continue

            # Collision resolution
            candidate = slug
            counter = 2
            while candidate in used_slugs_set:
                candidate = f'{slug}-{counter}'
                counter += 1
            slug = candidate
            used_slugs_set.add(slug)

            dest_path = os.path.join(DEST_DIR, slug + '.md')
            content = build_file_content(row)

            with open(dest_path, 'w', encoding='utf-8', newline='') as out:
                out.write(content)

            batch_written += 1
            total_written += 1

        end_row = min(batch_start + batch_size, len(active_rows))
        print(f'Batch {batch_num} (rows {batch_start + 1}-{end_row}): {batch_written} written')

    print(f'Total: {total_written} written')
    if total_skipped:
        print(f'Skipped: {total_skipped}')
        for detail in skipped_details:
            print(f'  - {detail}')
    else:
        print('Skipped: 0')


if __name__ == '__main__':
    main()
