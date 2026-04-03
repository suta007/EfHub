# Grow a Garden EfHub Architecture

## Overview
EfHub is a modular framework for building automated scripts in Luau, specifically tailored for the "Grow a Garden" game. It utilizes a **Registry Pattern** to manage dependencies and a **Task-based** execution model for automation.

## Core Components

### 1. Registry System (`Registry`)
The heart of the framework. It is a shared table passed to every module's `Initialize` function.
- **`reg.sData`**: Static and dynamic game data (Services, Player data, Constants).
- **`reg.fVar`**: Functional variables and state flags (e.g., `IsPlanting`, `IsHarvesting`).
- **`reg.Utils`**: Shared utility functions and helper methods.
- **`reg.EfTasks`**: Centralized task management for automation loops.

### 2. Initialization Flow (`EfHub.luau`)
1. **Module Loading**: Modules are loaded either locally (`require`) or remotely (`EF_REMOTE`) depending on `DEV_MODE`.
2. **Registry Injection**: All modules are populated into a single `Registry` table.
3. **Initialization**: Modules are initialized in a specific order (Core -> Functional -> UI).
4. **Finalization**: UI is rendered and settings are loaded.

### 3. Module Categories

#### Core (`src/Core/`)
- **`sData.luau`**: Data service and constant definitions.
- **`fVar.luau`**: Global state and configuration flags.

#### Functional Modules (`src/Modules/`)
- **`Utils.luau`**: General purpose helpers (Finding items, raycasting, math).
- **`EfTasks.luau`**: Wraps loops in safe execution environments with error logging.
- **`Main.luau` / `Auto.luau` / `Pets.luau` / `Shop.luau`**: Game-specific automation logic.
- **`Misc.luau`**: Various quality-of-life features (ESP, Anti-Lag, performance optimizations).

#### UI Layer (`src/UI/`)
- **`Window.luau`**: Main window creation and Fluent UI setup.
- **`Tabs/`**: Individual tab modules responsible for rendering UI elements and binding them to functional logic.

## Task Management
Automation tasks are managed via `EfTasks.ToggleTask(name, state, function)`. This ensures:
- Tasks can be safely cancelled.
- Errors within loops don't crash the entire script.
- Consistent logging of runtime issues.

## Data Persistence
Configuration is handled via the `Fluent SaveManager`, allowing user preferences (Toggles, Dropdowns, Sliders) to persist across game sessions.
