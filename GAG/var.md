# Project Variable & Function Map

Detailed mapping of all variables and functions within the EfHub project, grouped by file.
This documentation exhaustively separates variables/functions that are **created** within the file (either locally or assigned to the module table) vs **used** (imported from the Registry (`reg`) or Roblox globals).

---

## 1. Boot & Initialization (Root)

### [`loader.luau`](file:///d:/LuaCode/EfHub/GAG/src/loader.luau)
**Creates:**
- `EfHub` (Local variable)
**Uses:**
- `getgenv().DEV_MODE`, `getgenv().EF_REMOTE`
- `game:HttpGet()`, `loadstring()`, `task.wait()`
- `game:GetService("Players").LocalPlayer`
- `game:GetService("VirtualUser")`

### [`EfHub.luau`](file:///d:/LuaCode/EfHub/GAG/src/EfHub.luau)
**Creates:**
- `EfHub.Initialize` (Module function)
- `LoadModules` (Local function)
**Uses:**
- `getgenv().DEV_MODE`, `getgenv().EF_REMOTE`
- `Registry` initialization for all Modules and UI Tabs.

---

## 2. Core Modules (Data & State)

### [`Core/Loader.luau`](file:///d:/LuaCode/EfHub/GAG/src/Core/Loader.luau)
**Creates:**
- `Loader.Require` (Module function)
**Uses:**
- `getgenv().DEV_MODE`
- `game:HttpGet()`, `loadstring()`

### [`Core/fVar.luau`](file:///d:/LuaCode/EfHub/GAG/src/Core/fVar.luau)
**Creates (State Variables):**
- `fVar.IsPlanting`, `fVar.IsAgeBreaking`, `fVar.IsHarvesting`, `fVar.IsSelling`
- `fVar.IsFruitHidden`, `fVar.IsPlantHidden`, `fVar.IsRemovingPlants`, `fVar.IsRemovingCrops`
- `fVar.IsTroweling`, `fVar.IsReclaiming`, `fVar.IsSprinkling`, `fVar.IsCatLeading`
- `fVar.IsFarmingLevel`, `fVar.IsMutating`
- `fVar.UIShopLoaded`
- `fVar.CheckLevelConnection`, `fVar.CheckLevelConnection2`
- `fVar.Pos` (Table: `Trowel`, `Sprinkler`)
- `fVar.ShopKey` (Table of data keys)
- `fVar.BuyList` (Table of shop configurations)
**Uses:** None (Pure state storage table).

### [`Core/sData.luau`](file:///d:/LuaCode/EfHub/GAG/src/Core/sData.luau)
**Creates (Roblox References & Extracted Data Tables):**
- `sData.Players`, `sData.LocalPlayer`, `sData.MyName`, `sData.Character`, `sData.Humanoid`, `sData.PlayerGui`
- `sData.ReplicatedStorage`, `sData.GameEvents`, `sData.Data`, `sData.PetRegistry`, `sData.Modules`
- `sData.DataService`, `sData.InventoryService`, `sData.ActivePetsService`, `sData.PetUtils`
- `sData.CollectEvent`, `sData.RemoveItemEvent`, `sData.TrowelEvent`, `sData.ReclaimerEvent`, `sData.SprinklerEvent`
- `sData.RefreshActivePetsUI`, `sData.PetsServiceEvent`
- `sData.Backpack`, `sData.Lighting`, `sData.Terrain`, `sData.CoreGui`, `sData.VirtualUser`
- Tables array cache: `sData.SeedShopTable`, `sData.DailySeedShopTable`, `sData.SeedDataTable`, `sData.SeedDataBlackTable`
- Tables array cache: `sData.MutationDataTable`, `sData.MutationDataBlackTable`, `sData.PetsDataTable`, `sData.HungerDataTable`
- Tables array cache: `sData.PetMutationDataTable`, `sData.EnumToNameCache`, `sData.PetMutationDataBlackTable`
- Tables array cache: `sData.GearShopTable`, `sData.EggShopTable`, `sData.TravelingMerchantTable`, `sData.SantaShopTable`
- Tables array cache: `sData.NewYearShopTable`, `sData.SprinklerDataTable`
- Note: Removed `sData.Initialize`
**Uses:**
- Standard Roblox standard Services (Workspace, Lighting, ReplicatedStorage)

---

## 3. Functional Modules (Helpers & Logic)

### [`Modules/Utils.luau`](file:///d:/LuaCode/EfHub/GAG/src/Modules/Utils.luau)
**Creates:**
- `Utils.Initialize`, `Utils.ViewButton`, `Utils.ClickButton`
- `Utils.GetMyFarm`, `Utils.GetPlantsFolder`, `Utils.GetPlot`, `Utils.GetBoundary`
- `Utils.GetRandomPlotPos`, `Utils.GetPosition`, `Utils.GetPlayerCFrame`
- `Utils.GetSelectedItems`, `Utils.HandleRuntimeError`, `Utils.RunWithFlag`
- `Utils.FindToolByName`, `Utils.FindToolByPattern`, `Utils.MatchesWeight`, `Utils.IsTableEmpty`
- `Utils.UnequipTool`, `Utils.EquipTool`
- `Utils.SellButton`, `Utils.GearButton`, `Utils.PetsButton`, `Utils.SeedsButton`, `Utils.GardenButton` (Cached UI References)
**Uses:**
- `reg.sData`, `reg.Log`, `reg.fVar`
- `getconnections()` (Executor dependent)

### [`Modules/Main.luau`](file:///d:/LuaCode/EfHub/GAG/src/Modules/Main.luau)
**Creates:**
- `Main.Initialize`, `Main.GetHarvestVar`, `Main.AutoPlant`, `Main.ClearReadyCrops`
- `Main.GetAllReadyCrops`, `Main.GetAllReadyCrops2`, `Main.CheckCrops`, `Main.HarvestCrops`
- `Main.GetSellVar`, `Main.CheckItem`, `Main.SellCrops`, `Main.SellIfFull`
- Local Variables: `readyCrops` *(Pending standard rename to ReadyCrops)*
- Local Functions: `shouldMatchMutants`, `isBlockedByBlackMutants` *(Pending standard renames)*
**Uses:**
- `reg.sData`, `reg.Utils`, `reg.fVar`, `reg.Options`
- `CollectionService`

### [`Modules/Auto.luau`](file:///d:/LuaCode/EfHub/GAG/src/Modules/Auto.luau)
**Creates:**
- `Auto.Initialize`, `Auto.RemovePlants`, `Auto.GetRemovePlantsVar`, `Auto.RemoveCrops`
- `Auto.Trowel`, `Auto.Reclaim`, `Auto.Sprinkler`, `Auto.CatLead`, `Auto.OpenPack`
- Local Functions: `matchesPlantFilter`
**Uses:**
- `reg.fVar`, `reg.sData`, `reg.Utils`, `reg.Options`, `reg.Main.CheckCrops`

### [`Modules/Misc.luau`](file:///d:/LuaCode/EfHub/GAG/src/Modules/Misc.luau)
**Creates:**
- `Misc.Initialize`, `Misc.AntiLag`, `Misc.HidePlant`, `Misc.HideFruit`, `Misc.UpdatePlantTracker`
- `Misc.CreatESP`, `Misc.EspCrops`, `Misc.EspPlants`, `Misc.HideTracker`
- Module Fields: `setEspCrop`, `setEspPlant` *(Pending standard rename to SetEspCrop / SetEspPlant)*
- Local Variables: `SharedPlantConnection`, `PlantsESPFolderName`, `FruitESPFolderName`, `bGuiSession`, `GetSelectedItems`
- Local Functions: `FormatComma`, `FormatCompactPrice`, `ApplyMarketTax`, `GetFormattedFruitPrice`
- Local Functions: `GetFormattedMutations`, `IsFruit`, `SetVisibility`
- Local Functions: `gethui` *(Pending standard rename to GetHUI)*
**Uses:**
- `reg.sData`, `reg.Utils`, `reg.fVar`, `reg.Options`
- `ReplicatedStorage.Item_Module`, `MutationHandler`, `InventoryEnums`, `VariantColors`

### [`Modules/Pets.luau`](file:///d:/LuaCode/EfHub/GAG/src/Modules/Pets.luau)
**Creates:**
- `Pets.Initialize`
- `Pets.RawData`, `Pets.GetPetType`, `Pets.Level`, `Pets.Favorited`, `Pets.Weight`, `Pets.HeldPet`
- `Pets.AgeBreak`, `Pets.EquipPet`, `Pets.UnequipPet`, `Pets.SwapPetLoadout`, `Pets.FarmLevel`
- `Pets.findFarmPet`, `Pets.TargetPetLevelCheck`, `Pets.MutatePet`, `Pets.ClaimMutationPet`
- `Pets.CheckMutantReady`, `Pets.PetShard`
- Local Variables: `AgeBreakUUID`, `MutantUUID`, `TaskMutantReady`
- Local Functions: `GetPetInventory`, `findDupePet`, `findMainPet`
**Uses:**
- `reg.fVar`, `reg.sData`, `reg.Utils`, `reg.Options`, `reg.Log`

### [`Modules/Shop.luau`](file:///d:/LuaCode/EfHub/GAG/src/Modules/Shop.luau)
**Creates:**
- `Shop.ShopKey`
- `Shop.Initialize`, `Shop.UpdateBuyList`, `Shop.BuyItem`
- Local Variables: `BuyList` *(Pending rename to FullBuyList)*, `RemoteCache`
**Uses:**
- `reg.sData`, `reg.fVar`, `reg.Options`, `reg.Utils.GetSelectedItems`

### [`Modules/EfTasks.luau`](file:///d:/LuaCode/EfHub/GAG/src/Modules/EfTasks.luau)
**Creates:**
- `EfTasks.Initialize`, `EfTasks.ToggleTask`
- Local Variables: `ActiveTasks`
**Uses:**
- `reg.Log`, `task.spawn`, `task.wait`, `task.cancel`

---

## 4. User Interface & Tabs (UI Module)

### [`UI/Window.luau`](file:///d:/LuaCode/EfHub/GAG/src/UI/Window.luau)
**Creates:**
- `Window.Initialize`, `Window.Finalize`, `Window.QuickSave`
- Sets `Registry.IsLoading`, `Registry.Interface`, `Registry.Tabs`, `Registry.Fluent`
- Sets `Registry.SaveManager`, `Registry.InterfaceManager`, `Registry.Options`
**Uses:**
- Remote Scripts (HTTPGet): `Fluent`, `SaveManager`, `InterfaceManager`, `CollapsibleAddon`

### [`UI/Tabs/LogTab.luau`](file:///d:/LuaCode/EfHub/GAG/src/UI/Tabs/LogTab.luau)
**Creates:**
- `LogTab.Initialize`, `LogTab.Log`
- Sets `Registry.Log` (Binding to `LogTab.Log`)
- Local Variables: `logHistory`, `logCount`
**Uses:**
- `reg.fDisplay`
- `setclipboard()` (Executor dependent)

### [`UI/Tabs/MainTab.luau`](file:///d:/LuaCode/EfHub/GAG/src/UI/Tabs/MainTab.luau)
**Creates:**
- `MainTab.Initialize`
**Uses:**
- `reg.Interface`, `reg.Tabs`, `reg.Options`, `reg.Window.QuickSave`
- `reg.fVar`, `reg.EfTasks`, `reg.Main`, `reg.sData`

### [`UI/Tabs/AutoTab.luau`](file:///d:/LuaCode/EfHub/GAG/src/UI/Tabs/AutoTab.luau)
**Creates:**
- `AutoTab.Initialize`
**Uses:**
- `reg.Interface`, `reg.Tabs`, `reg.Options`, `reg.Window.QuickSave`
- `reg.fVar`, `reg.EfTasks`, `reg.Auto`, `reg.sData`

### [`UI/Tabs/PetsTab.luau`](file:///d:/LuaCode/EfHub/GAG/src/UI/Tabs/PetsTab.luau)
**Creates:**
- `PetsTab.Initialize`
- Local Variables: `CheckLevelTask`
**Uses:**
- `reg.Interface`, `reg.Tabs`, `reg.Options`, `reg.Window.QuickSave`
- `reg.fVar`, `reg.EfTasks`, `reg.Pets`, `reg.sData`

### [`UI/Tabs/ShopTab.luau`](file:///d:/LuaCode/EfHub/GAG/src/UI/Tabs/ShopTab.luau)
**Creates:**
- `ShopTab.Initialize`
**Uses:**
- `reg.Interface`, `reg.Tabs`, `reg.Options`, `reg.Window.QuickSave`
- `reg.fVar`, `reg.Shop`, `reg.sData`, `reg.Utils`

### [`UI/Tabs/MiscTab.luau`](file:///d:/LuaCode/EfHub/GAG/src/UI/Tabs/MiscTab.luau)
**Creates:**
- `MiscTab.Initialize`
**Uses:**
- `reg.Interface`, `reg.Tabs`, `reg.Options`, `reg.Window.QuickSave`
- `reg.Misc`, `reg.sData`

### [`UI/Tabs/EventsTab.luau`](file:///d:/LuaCode/EfHub/GAG/src/UI/Tabs/EventsTab.luau)
**Creates:**
- `EventsTab.Initialize`
- Local Functions: `LoadEvents`
**Uses:**
- `reg.Interface`, `reg.Tabs`
- `getgenv().EF_REMOTE`
- `Events.Strange.Initialize()`
