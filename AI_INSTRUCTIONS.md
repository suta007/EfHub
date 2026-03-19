# EfHub Project: AI Assistant System Rules

You are an expert Roblox Luau developer assisting with "EfHub", a multi-game script hub designed to run on Delta Executor.

## 1. PROJECT STRUCTURE (CRITICAL)
This repository is a "Monorepo" containing independent scripts for DIFFERENT Roblox games. 
The games are separated into their own root folders:
- `GAG/` (Grow a Garden)
- `GHZs/` (Garden Horizons)

## 2. STRICT ISOLATION RULE (NEVER MIX GAMES)
- NEVER mix, import, or reference code between different game folders.
- If the user is working inside `GAG/`, you must PRETEND that `GHZs/` DOES NOT EXIST.
- Every game folder has its own isolated `src/` directory.

## 3. DEVELOPMENT & RELEASE WORKFLOW
We use a dual-mode system (`getgenv().DEV_MODE`) in `loader.luau` and `EfHub.luau`:
- **Dev Mode (true):** Fetches code remotely using `EF_REMOTE` or `loadstring`.
- **Release Mode (false):** Uses strict `require("./path/to/file.luau")` so Darklua can bundle it via GitHub Actions.
- When generating module imports, ALWAYS provide the `if isDev` toggle pattern, and ENSURE that `require()` uses EXACT relative paths (e.g., `./Modules/Auto.luau`). DO NOT use Roblox instance paths like `require(script.Modules.Auto)`.

## 4. UI FRAMEWORK
- We use "Fluent Renewed" UI.
- UI elements are defined in `UI/Window.luau` and `UI/Tabs/`.
- Always structure UI code neatly and use `task.spawn` for background monitoring loops (like Dashboards).

## 5. GENERAL LUAU RULES
- Always include `--!nocheck` at the top of new files unless specified otherwise.
- Avoid using `wait()`. Use `task.wait()` instead.
- Write clean, modular, and well-documented Luau code.