@echo off
REM Slack Expansion — Windows launcher
setlocal enabledelayedexpansion

set "EXPANSION_DIR=%~dp0.."
pushd "%EXPANSION_DIR%" >nul
set "EXPANSION_DIR=%CD%"
popd >nul

if not exist "%EXPANSION_DIR%\.env" (
  echo [mypka-slack:start] ERROR: %EXPANSION_DIR%\.env not found. Run scripts\install.sh first.
  exit /b 1
)

REM Load .env (very simple parser: KEY=VALUE, ignores comments and blanks)
for /f "usebackq tokens=1,* delims==" %%A in ("%EXPANSION_DIR%\.env") do (
  set "line=%%A"
  if not "!line!"=="" if not "!line:~0,1!"=="#" (
    set "%%A=%%B"
  )
)

if "%SLACK_BOT_TOKEN%"=="" (
  echo [mypka-slack:start] ERROR: SLACK_BOT_TOKEN is required in .env.
  exit /b 1
)
if "%SLACK_APP_TOKEN%"=="" (
  echo [mypka-slack:start] ERROR: SLACK_APP_TOKEN is required in .env.
  exit /b 1
)

cd /d "%EXPANSION_DIR%\runtime"
node index.js
