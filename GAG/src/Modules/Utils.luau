local getconnections = (getfenv() :: any).getconnections

local Utils = {}
local reg: any
local sData: any
local RNG = Random.new()

function Utils.Initialize(registry)
	reg = registry
	sData = reg.sData
	Utils.SellButton = sData.TeleportFrame:WaitForChild("Sell")
	Utils.GearButton = sData.TeleportFrame:WaitForChild("Gear")
	Utils.PetsButton = sData.TeleportFrame:WaitForChild("Pets")
	Utils.SeedsButton = sData.TeleportFrame:WaitForChild("Seeds")
	Utils.GardenButton = sData.TeleportFrame:WaitForChild("Garden")
end

function Utils.ViewButton()
	Utils.PetsButton.Visible = true
	Utils.GearButton.Visible = true
end

function Utils.ClickButton(Button)
	if getconnections then
		for _, connection in pairs(getconnections(Button.Activated)) do
			connection:Fire()
		end
	end
end

function Utils.GetMyFarm()
	local farmFolder = workspace:FindFirstChild("Farm")
	if not farmFolder then
		return nil
	end
	for _, oFarm in pairs(farmFolder:GetChildren()) do
		local success, owner = pcall(function()
			return oFarm.Important.Data.Owner.Value
		end)

		if success and owner == sData.MyName then
			return oFarm
		end
	end
	return nil
end

function Utils.GetPlantsFolder()
	local Farm_Important = Utils.GetMyFarm():FindFirstChild("Important")
	return Farm_Important and Farm_Important:FindFirstChild("Plants_Physical")
end

function Utils.GetPlot()
	local myPlot = {}
	local plantLocations = Utils.GetMyFarm().Important.Plant_Locations:GetChildren()
	for _, plate in pairs(plantLocations) do
		if plate.Name == "Can_Plant" or plate:IsA("Part") then
			table.insert(myPlot, plate)
		end
	end
	return myPlot
end

function Utils.GetBoundary(Plot)
	if not Plot then
		return nil
	end

	local bCf = Plot.CFrame
	local size = Plot.Size

	local bMinX, bMaxX = -size.X / 2 + 1, size.X / 2 - 1
	local bMinZ, bMaxZ = -size.Z / 2 + 1, size.Z / 2 - 1
	return {
		cf = bCf,
		minX = bMinX,
		maxX = bMaxX,
		minZ = bMinZ,
		maxZ = bMaxZ,
	}
end

function Utils.GetRandomPlotPos()
	local MyPlantableParts = Utils.GetPlot()
	if #MyPlantableParts == 0 then
		return nil
	end
	local targetPart = MyPlantableParts[math.random(1, #MyPlantableParts)]
	local size = targetPart.Size
	local cframe = targetPart.CFrame

	local randomX = RNG:NextNumber(-size.X / 2, size.X / 2)
	--local randomY = RNG:NextNumber(-size.Y / 2, size.Y / 2)
	local randomZ = RNG:NextNumber(-size.Z / 2, size.Z / 2)

	local floatDistance = 1

	local localOffset = CFrame.new(randomX, floatDistance, randomZ)
	local worldCFrame = cframe * localOffset

	local finalX = worldCFrame.Position.X
	local finalY = cframe.Position.Y
	local finalZ = worldCFrame.Position.Z

	return CFrame.new(finalX, finalY, finalZ)
end

function Utils.GetPosition()
	local Character = reg.sData.Character
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	if HumanoidRootPart then
		local pivot = Character:GetPivot()
		return pivot.Position
	end
	return nil
end

function Utils.GetPlayerCFrame()
	return sData.Character:GetPivot()
end

function Utils.GetSelectedItems(DropdownValue)
	local Items = {}
	if type(DropdownValue) == "table" then
		for Value, State in pairs(DropdownValue) do
			if State then
				table.insert(Items, Value)
			end
		end
	end
	return Items
end

function Utils.HandleRuntimeError(modeName, err)
	reg.Log(string.format("❌ %s error: %s", modeName, tostring(err)))
end

function Utils.RunWithFlag(flagName, modeName, fn)
	local fVar = reg and reg.fVar
	if not fVar then
		return false
	end
	fVar[flagName] = true
	local ok, err = xpcall(fn, debug.traceback)
	fVar[flagName] = false
	if not ok then
		Utils.HandleRuntimeError(modeName, err)
	end
	return ok
end

function Utils.FindToolByName(backpack, toolName)
	if not backpack then
		return nil
	end
	return backpack:FindFirstChild(toolName)
end

function Utils.FindToolByPattern(backpack, namePattern)
	if not backpack then
		return nil
	end
	for _, item in ipairs(backpack:GetChildren()) do
		if item:IsA("Tool") and item.Name:match(namePattern) then
			return item
		end
	end
	return nil
end

function Utils.MatchesWeight(weight, condition, value)
	if value <= 0 then
		return true
	end
	if condition == "Below" then
		return weight < value
	end
	if condition == "Above" then
		return weight > value
	end
	return false
end

function Utils.IsTableEmpty(t)
	return type(t) ~= "table" or next(t) == nil
end

function Utils.UnequipTool()
	pcall(function()
		sData.Humanoid:UnequipTools()
		task.wait()
	end)
end

function Utils.EquipTool(item)
	local success, _err = pcall(function()
		sData.Humanoid:EquipTool(item)
		task.wait()
	end)
	return success
end

return Utils
