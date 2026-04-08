# EfHub Project: AI Assistant System Rules

You are an expert Roblox Luau developer assisting with "EfHub", a multi-game script hub designed to run on Delta Executor.

## 1. PROJECT STRUCTURE (CRITICAL)
This repository is a "Monorepo" containing independent scripts for DIFFERENT Roblox games.
The games are separated into their own root folders:
- `GAG/` (Grow a Garden)
- `GHZs/` (Garden Horizons)

**REFERENCE FOLDERS (DO NOT MODIFY):**
- Files and folders within `GAG/referent/` and `GHZs/referent/` are **NOT** project code.
- They contain decompiled game code (dedexed) intended STRICTLY as reference material, data sources, and for study purposes.
- NEVER modify these files, and NEVER treat them as part of the EfHub active codebase.

## 2. STRICT ISOLATION RULE (NEVER MIX GAMES)
- NEVER mix, import, or reference code between different game folders.
- If the user is working inside `GAG/`, you must PRETEND that `GHZs/` DOES NOT EXIST.
- Every game folder has its own isolated `src/` directory.

## 3. DEVELOPMENT & RELEASE WORKFLOW
We use a dual-mode system (`getgenv().DEV_MODE`) in `loader.luau` and `EfHub.luau`:
- **Dev Mode (true):** Fetches code remotely using `EF_REMOTE` or `loadstring`.
- **Release Mode (false):** Uses strict `require("./path/to/file.luau")` so Darklua can bundle it via GitHub Actions.
- When generating module imports, ALWAYS provide the `if isDev` toggle pattern, and ENSURE that `require()` uses EXACT relative paths (e.g., `./Modules/Auto.luau`).
- DO NOT use Roblox instance paths like `require(script.Modules.Auto)`.

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
- **Role of `UI/Tabs/` (UI Logic ONLY):**
  - Define Fluent UI elements (Toggles, Sliders, Buttons).
  - Contain UI-specific logic (e.g., `OnChanged` events, showing/hiding elements).
  - You MAY use loops (`task.spawn(function() while...`) in Tabs ONLY for updating UI visuals (like Dashboards or Status texts).
  - STRICT RULE: DO NOT put heavy Game Logic (like moving the character, firing server remotes, or pathfinding) in Tabs.
- **Role of `Modules/` (Game Logic):**
  - Contains the actual game mechanics, automation loops, bypassing, and remote firing.
- **State Synchronization:** The UI Tab and its corresponding Module communicate via the shared `Registry` table. Variable names and configuration states MUST match perfectly between the paired files.
- **Execution Flow:** When a UI element changes in a Tab, it should update a value in `Registry.fVar` or call a function in its paired Module to handle the heavy lifting.

**EXCEPTION FOR EVENTS (`src/UI/Tabs/Events/`):**
- Files located inside `src/UI/Tabs/Events/` (e.g., Seasonal Events) are the ONLY exception to the Pairing Rule.
- These files contain BOTH UI definitions and Game Logic within the same file to keep temporary/event code isolated.
- When generating Event code, structure the file cleanly: Services top, UI creation middle, Functions next, and UI Connections (`OnChanged` with `task.spawn`) at the bottom.

## 7. USING THE `referent/` FOLDERS
- When asked to write game logic, automate a task, or find a RemoteEvent for GAG or GHZs, you MUST FIRST search the respective `referent/` folder.
- Do NOT guess or hallucinate RemoteEvent names, paths, or game specific variables. Always base them on the actual game code found in the referent files.

## 8. NAMING CONVENTIONS
- **Variables & Functions:** Use `camelCase` (e.g., `local playerHealth`, `function getStats()`).
- **Services & Modules:** Use `PascalCase` (e.g., `local ReplicatedStorage`, `local AutoFarm = require(...)`).
- **Constants:** Use `UPPER_SNAKE_CASE` (e.g., `local MAX_RETRIES = 5`).
- **UI Elements:** Prefix UI variables clearly (e.g., `btnStart`, `lblStatus`, `tglAutoFarm`).

## 9. ERROR HANDLING & PERFORMANCE
- **Remote Firing:** ALWAYS wrap network calls (`FireServer`, `InvokeServer`) in a `pcall()` to prevent the script from breaking if the remote is altered or fails.
- **Connections:** Whenever creating an event connection (e.g., `RunService.RenderStepped:Connect()`), assign it to a variable and ensure there is logic to `:Disconnect()` it when the feature is toggled off.
- **Memory Leaks:** Avoid creating infinite loops without a break condition or toggle check. Always verify `if not Registry.fVar.ToggleName then break end` inside loops.

## 10. ROBLOX SERVICES & GLOBALS
- Declare all `game:GetService("ServiceName")` calls at the VERY TOP of the file.
- **WORKSPACE RULE:** ALWAYS use `local Workspace = game:GetService("Workspace")` instead of calling the global `workspace` or `game.Workspace` directly.
- Cache commonly used instances (like `Players.LocalPlayer`) right below the services.