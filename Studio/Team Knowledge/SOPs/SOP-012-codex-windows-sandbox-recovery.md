# SOP-011 - Codex Windows Sandbox Recovery

- **Type:** SOP - atomic troubleshooting procedure
- **Default owner:** Mack (runtime/automation), Larry (triage + session continuity)
- **Reusable by:** Any agent working in this myPKA
- **Trigger:** Codex Desktop on Windows cannot run local commands and reports `windows sandbox: setup refresh failed`, `windows sandbox failed: spawn setup refresh`, or `parse deny-read ACL state`.
- **References:** [[GL-001-file-naming-conventions]]

## Purpose

Restore Codex local command execution on Windows when the sandbox setup layer fails before PowerShell, Node, `node_repl`, Browser, or automations can launch.

This SOP was created after the June 2026 failure where `deny_read_acl_state.json` was corrupted into NUL bytes and Codex could only run previously approved command shapes.

## Symptoms

- New PowerShell commands fail before execution with:
  - `windows sandbox: setup refresh failed with status exit code: 1`
- `node_repl` fails before execution with:
  - `windows sandbox failed: spawn setup refresh`
- Previously approved narrow commands may still work.
- Commands run successfully when explicitly approved outside the sandbox.
- `C:\Users\accol\.codex\.sandbox\setup_error.json` may show:
  - `helper_unknown_error`
  - `apply deny-read ACLs`
- The sandbox log may show:
  - `parse deny-read ACL state C:\Users\accol\.codex\.sandbox\deny_read_acl_state.json`
  - `expected value at line 1 column 1`
  - `invalid type: sequence, expected a map`

## Fast diagnosis

Run these checks from the myPKA root. If sandboxed commands fail, run them with explicit user approval outside the sandbox.

```powershell
Get-Content -Raw -LiteralPath 'C:\Users\accol\.codex\.sandbox\setup_error.json'
Get-Content -LiteralPath 'C:\Users\accol\.codex\.sandbox\sandbox.2026-06-04.log' -Tail 120
Get-Item -LiteralPath 'C:\Users\accol\.codex\.sandbox\deny_read_acl_state.json' | Select-Object FullName,Length,CreationTime,LastWriteTime
Get-Content -Raw -LiteralPath 'C:\Users\accol\.codex\.sandbox\deny_read_acl_state.json'
```

If `deny_read_acl_state.json` contains NUL bytes or cannot parse as JSON, repair it.

## Repair deny-read ACL state

Back up the corrupted file, then restore the expected empty map state.

```powershell
$state = 'C:\Users\accol\.codex\.sandbox\deny_read_acl_state.json'
$bak = "$state.corrupt-bak-$(Get-Date -Format yyyyMMdd-HHmmss)"
Copy-Item -LiteralPath $state -Destination $bak

$json = "{`n  `"principals`": {}`n}"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($state, $json, $utf8NoBom)

Get-Content -Raw -LiteralPath $state
```

Expected content:

```json
{
  "principals": {}
}
```

Important: `principals` must be a JSON object/map (`{}`), not a list (`[]`). The list form produces `invalid type: sequence, expected a map`.

## Switch away from elevated sandbox mode

Open `C:\Users\accol\.codex\config.toml`.

If this is present:

```toml
[windows]
sandbox = "elevated"
```

Back up the file and change it to:

```toml
[windows]
sandbox = "unelevated"
```

PowerShell backup/update command:

```powershell
$cfg = 'C:\Users\accol\.codex\config.toml'
$bak = "$cfg.bak-$(Get-Date -Format yyyyMMdd-HHmmss)"
Copy-Item -LiteralPath $cfg -Destination $bak
$text = Get-Content -Raw -LiteralPath $cfg
$new = $text -replace '(?m)^sandbox = "elevated"$', 'sandbox = "unelevated"'
Set-Content -LiteralPath $cfg -Value $new -NoNewline
```

The `unelevated` workaround matches the Windows sandbox failure pattern reported in OpenAI Codex issues:

- https://github.com/openai/codex/issues/25280
- https://github.com/openai/codex/issues/24098
- https://github.com/openai/codex/issues/24926
- https://github.com/openai/codex/issues/25012

## Smoke tests

After repair, run:

```powershell
Get-Location | Select-Object -ExpandProperty Path
$PSVersionTable.PSVersion.ToString()
if (Test-Path -LiteralPath 'Team Knowledge/tasks/INDEX.md') { 'VAULT_READ_OK' } else { 'VAULT_READ_MISSING_TASK_INDEX' }
```

Then test `node_repl` with:

```javascript
nodeRepl.write('NODE_REPL_OK cwd=' + nodeRepl.cwd)
```

Expected result:

- PowerShell commands complete normally.
- Vault read returns `VAULT_READ_OK`.
- `node_repl` returns `NODE_REPL_OK`.

If the same error persists, restart Codex Desktop after the repair and rerun the smoke tests.

## Meetily / Closing Shift automation check

If the failure affected meeting capture or Closing Shift, verify the current split:

- Vault root is `C:\Users\accol\OneDrive\Desktop\the-house`.
- Meetily raw source is `D:\Alyssa\Music\meetily-recordings`.
- Daily Meeting Clean script is `Team Knowledge/Automations/meetily-inbox-prep.ps1`.
- Meeting pointer destination is `Notebook/Inbox/Meeting Captures/`.

Daily Meeting Clean should:

- Create missing pointer notes only.
- Delete audio/video after 7 days.
- Retire transcripts only after a pointer is marked processed and the retention window has elapsed.
- Never summarize meetings, write Journal notes, or create tasks.

Closing Shift review should:

- Be Larry-led judgment, run on request.
- Stop at an approval report.
- Never treat standing instructions or old thread context as approval.
- Never delete transcripts or raw shell folders before processed memory exists.
- Never auto-launch Obsidian or trigger `obsidian://` URIs.

## What not to do first

- Do not turn on full computer access as the first fix.
- Do not delete the entire `.codex` folder.
- Do not reinstall Codex Desktop until the corrupted sandbox state file and `[windows] sandbox` mode have been checked.
- Do not delete `deny_read_acl_state.json` without backing it up first.

## Cross-references

- [[2026-06-03-22-16_larry_codex-sandbox-repair-and-closing-shift]] - session where this SOP was created.
- [[2026-06-02-17-20_larry_telegram-capture-mvp-handoff]] - earlier session blocked by the same sandbox failure.
- [[2026-06-02_larry_meetily-meeting-capture-workflow]] - session that created Closing Shift.
