local v1 = game:GetService("Players")
local v_u_2 = require(game.ReplicatedStorage.Modules.DataService)
require(game.ReplicatedStorage.UserGenerated.Client.ClientABTests)
local v3 = require(game.ReplicatedStorage.Data.RebirthConfigData)
local v_u_4 = require(game.ReplicatedStorage.Modules.RebirthUnlocksSharedService)
local v_u_5 = script.RebirthLockTemplate
local v6 = workspace:WaitForChild("NPCS", 30)
local v_u_7 = workspace:WaitForChild("Visuals", 30)
local v8 = v6:WaitForChild("Isaac", 30)
local v9 = v6:WaitForChild("Eloise", 30)
local v10 = v6:WaitForChild("PetMutationMachine", 30)
local v11 = v6:WaitForChild("Pet Stand", 30)
local v12 = workspace:WaitForChild("CraftingTables", 30)
local v13 = v12:WaitForChild("SeedEventCraftingWorkBench", 30)
local v14 = v12:WaitForChild("EventCraftingWorkBench", 30)
local v_u_15 = v1.LocalPlayer
local v_u_16 = {}
local v_u_17 = {
	["Pet Stand"] = {
		["Model"] = v11,
		["Padding"] = Vector3.new(1, 0, 2),
		["PositionalOffset"] = Vector3.new(0, 0, 0),
		["RotationalOffset"] = Vector3.new(0, 0, 0),
		["UnlockRequirement"] = v3.REBIRTH_UNLOCKS.PET_STAND
	},
	["Gear Stand"] = {
		["Model"] = v9,
		["Padding"] = Vector3.new(1, 2.5, 1),
		["PositionalOffset"] = Vector3.new(0, 1.5, 0),
		["RotationalOffset"] = Vector3.new(0, 3.1415927, 0),
		["UnlockRequirement"] = v3.REBIRTH_UNLOCKS.GEAR_STAND
	},
	["Cosmetic Stand"] = {
		["Model"] = v8,
		["Padding"] = Vector3.new(1, 2.5, 1),
		["PositionalOffset"] = Vector3.new(0, 1.5, 0),
		["RotationalOffset"] = Vector3.new(0, 3.1415927, 0),
		["UnlockRequirement"] = v3.REBIRTH_UNLOCKS.COSMETIC_STAND
	},
	["Pet Mutation Machine"] = {
		["Model"] = v10,
		["Padding"] = Vector3.new(1.5, 1, 1.5),
		["PositionalOffset"] = Vector3.new(0, 0, 0),
		["RotationalOffset"] = Vector3.new(0, 0, 0),
		["UnlockRequirement"] = v3.REBIRTH_UNLOCKS.PET_MUTATION_MACHINE
	},
	["Seed Crafting Bench"] = {
		["Model"] = v13,
		["Padding"] = Vector3.new(0.95, 0, 0.95),
		["PositionalOffset"] = Vector3.new(0, 0, 0),
		["RotationalOffset"] = Vector3.new(0, 3.1415927, 0),
		["UnlockRequirement"] = v3.REBIRTH_UNLOCKS.CRAFTING
	},
	["Event Crafting Bench"] = {
		["Model"] = v14,
		["Padding"] = Vector3.new(1, 1, 1),
		["PositionalOffset"] = Vector3.new(0, 0.4, 0),
		["RotationalOffset"] = Vector3.new(0, 3.1415927, 0),
		["UnlockRequirement"] = v3.REBIRTH_UNLOCKS.CRAFTING
	}
}
local function v_u_27(p18, p19, p20, p21, p22)
	-- upvalues: (copy) v_u_5, (copy) v_u_7
	if not p18 then
		return nil
	end
	local v23 = p18:GetExtentsSize()
	local v24, _ = p18:GetBoundingBox()
	local v25 = v23 + p19
	local v26 = v_u_5:Clone()
	v26.Parent = v_u_7
	v26.Size = v25
	v26:PivotTo(v24 * CFrame.new(p20) * CFrame.Angles(p21.X, p21.Y, p21.Z))
	v26:FindFirstChild("SurfaceGui"):FindFirstChild("Container"):FindFirstChild("RequirementText").Text = ("Ascensions Required: %*"):format(p22)
	return v26
end
task.delay(3, function()
	-- upvalues: (copy) v_u_4, (copy) v_u_15, (copy) v_u_2, (copy) v_u_17, (copy) v_u_27, (copy) v_u_16
	if v_u_4:HasBeenAssignedABTest(v_u_15) then
		local v_u_28 = v_u_2:GetData()
		if v_u_28 then
			for v29, v30 in v_u_17 do
				if v_u_28.RebirthData.TotalRebirths < v30.UnlockRequirement then
					v_u_16[v29] = v_u_27(v30.Model, v30.Padding, v30.PositionalOffset, v30.RotationalOffset, v30.UnlockRequirement - v_u_28.RebirthData.TotalRebirths)
				end
			end
			local v_u_31 = nil
			v_u_31 = v_u_2:GetPathSignal("RebirthData/TotalRebirths"):Connect(function()
				-- upvalues: (ref) v_u_17, (ref) v_u_16, (copy) v_u_28, (ref) v_u_31
				local v32 = true
				for v33, v34 in v_u_17 do
					local v35 = v_u_16[v33]
					if v_u_28.RebirthData.TotalRebirths < v34.UnlockRequirement then
						v32 = false
						if v35 then
							local v36 = v34.UnlockRequirement - v_u_28.RebirthData.TotalRebirths
							v35:FindFirstChild("SurfaceGui"):FindFirstChild("Container"):FindFirstChild("RequirementText").Text = ("Ascensions Required: %*"):format(v36)
						end
					elseif v35 then
						v35:Destroy()
						v_u_16[v33] = nil
					end
				end
				if v_u_31 and v32 then
					v_u_31:Disconnect()
					v_u_31 = nil
				end
			end)
		else
			warn("RebirthUnlocksClientService | Unable to retrieve PlayerData!")
		end
	else
		return
	end
end)
return {}