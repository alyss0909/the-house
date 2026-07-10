# Templates - Index

Copy-and-edit starter files for every entity type in your myPKA. Each template carries a complete frontmatter block (per [[GL-002-frontmatter-conventions]]) plus a body skeleton with prompt-style headings.

## How to use a template

Pick the template for the entity you are creating. Copy it to the right entity folder (see the table below). Rename it to a kebab-case slug per [[GL-001-file-naming-conventions]]. Fill in the fields you have. Leave the rest blank or delete the lines you will never use.

Example, from your myPKA root:

```bash
cp "Team Knowledge/Templates/person.md" "Notebook/Life/CRM/People/jane-doe.md"
```

Then open the new file and edit. The Properties tab in mypka-interface will populate as soon as you save the file with frontmatter that has values.

## Templates

| Template | Entity | Goes under |
|---|---|---|
| [[Templates/person]] | Person | `Notebook/Life/CRM/People/<slug>.md` |
| [[Templates/organization]] | Organization | `Notebook/Life/CRM/Organizations/<slug>.md` |
| [[Templates/project]] | Project | `Notebook/Life/Projects/<slug>.md` |
| [[Templates/goal]] | Goal | `Notebook/Life/Goals/<slug>.md` |
| [[Templates/habit]] | Habit | `Notebook/Life/Habits/<slug>.md` |
| [[Templates/topic]] | Topic | `Notebook/Life/Topics/<slug>.md` |
| [[Templates/key-element]] | Key Element | `Notebook/Life/Key Elements/<slug>.md` |
| [[Templates/document]] | Document | `PKM/Documents/<slug>.md` |

## Rules these templates follow

- Frontmatter field names match the SQLite column names in [[SOP-002-convert-mypka-to-sqlite]]. Do not rename them.
- Required fields are marked in [[GL-002-frontmatter-conventions]]. Everything else is optional - delete the lines you do not need.
- Body H2 headings are suggestions, not contracts. Add or remove sections as your note evolves. The Properties tab does not care what is in the body.
- Foreign-key fields (e.g. `company`, `key_element`, `linked_*`) store the **slug** of the target file, not the title. Per [[GL-002-frontmatter-conventions]] rule 4.

## When in doubt

Read [[GL-002-frontmatter-conventions]]. If a field you need is not there, edit the Guideline first, then come back and use it.
