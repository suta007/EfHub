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

## 6. ARCHITECTURE & MODULE-TAB PAIRING (CRITICAL)
- **The Pairing Rule:** Files in `src/UI/Tabs/` (e.g., `AutoTab.luau`) and `src/Modules/` (e.g., `Auto.luau`) ALWAYS work in pairs.
- **Role of `UI/Tabs/` (UI Logic ONLY):** - Define Fluent UI elements (Toggles, Sliders, Buttons).
  - Contain UI-specific logic (e.g., `OnChanged` events, showing/hiding elements).
  - You MAY use loops (`task.spawn(function() while...`) in Tabs ONLY for updating UI visuals (like Dashboards or Status texts).
  - STRICT RULE: DO NOT put heavy Game Logic (like moving the character, firing server remotes, or pathfinding) in Tabs.
- **Role of `Modules/` (Game Logic):** - Contains the actual game mechanics, automation loops, bypassing, and remote firing.
- **State Synchronization:** The UI Tab and its corresponding Module communicate via the shared `Registry` table. Variable names and configuration states MUST match perfectly between the paired files.
- **Execution Flow:** When a UI element changes in a Tab, it should update a value in `Registry.fVar` or call a function in its paired Module to handle the heavy lifting.