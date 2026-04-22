local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.Data.PetEggData)
local v_u_4 = require(v2.Data.PetRegistry)
local v_u_5 = require(v2.Modules.UpdateService)
local v_u_6 = require(v2.Modules.ItemImageFinder)
local v_u_7 = script.Parent
local v_u_8 = v_u_7:WaitForChild("Content")
local v_u_9 = v_u_8:WaitForChild("TEMPLATE")
local v_u_10 = v1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PetEquipSlots_UI")
v_u_10:WaitForChild("Main")
local v_u_11 = require(v2.Modules.PetEggOddsController)
local v_u_12 = {}
for v13, v14 in v3 do
	if (v14.ItemType or "Egg") == "Egg" then
		table.insert(v_u_12, {
			["Key"] = v13,
			["Value"] = v14
		})
	end
end
table.sort(v_u_12, function(p15, p16)
	local v17 = p15.Value.StockChance
	local v18 = p16.Value.StockChance
	if v17 == v18 then
		return p15.Value.EggName < p16.Value.EggName
	else
		return v18 < v17
	end
end)
local function v_u_37()
	-- upvalues: (copy) v_u_8, (copy) v_u_12, (copy) v_u_5, (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (copy) v_u_6, (copy) v_u_4
	for _, v19 in v_u_8:GetChildren() do
		if v19:IsA("Frame") and v19.Name ~= "TEMPLATE" then
			v19:Destroy()
		end
	end
	local v20 = {}
	for _, v21 in v_u_12 do
		local v22 = v21.Value.EggName
		if not (v_u_5:IsHiddenFromUpdate(v22) or v_u_5:IsHiddenAfterUpdate(v22)) then
			local v23 = {
				["name"] = v22,
				["chance"] = 1 / v21.Value.StockChance
			}
			table.insert(v20, v23)
		end
	end
	local function v28(p24, p25)
		local v26 = 1
		for _, v27 in ipairs(p24) do
			if v27.name == p25 then
				v26 = v26 * (1 - v26 * v27.chance)
				break
			end
			v26 = v26 * (1 - v27.chance)
		end
		return 1 - v26 ^ 3
	end
	for _, v29 in v_u_12 do
		if v29.Value.DisplayInShop ~= false then
			local v_u_30 = v29.Value.EggName
			if not (v_u_5:IsHiddenFromUpdate(v_u_30) or v_u_5:IsHiddenAfterUpdate(v_u_30)) then
				local v31 = v_u_9:Clone()
				v31.Name = v_u_30
				v31.Parent = v_u_9.Parent
				v31.Visible = true
				local v32 = v31:WaitForChild("Display")
				local v33 = v32:WaitForChild("DisplayBox"):WaitForChild("EGG_IMAGE")
				local v34 = v32:WaitForChild("RARITY_NAME")
				local v35 = v32:WaitForChild("RARITY_PERCENTAGE")
				v32:WaitForChild("OddsButton").Activated:Connect(function()
					-- upvalues: (ref) v_u_11, (copy) v_u_30, (ref) v_u_10
					v_u_11:Open(v_u_30, v_u_10)
				end)
				v33.Image = v_u_6(v_u_30, "Egg")
				v34.Text = v_u_30
				v34.TextColor3 = v_u_4.PetEggs[v_u_30].Color
				local v36 = v28(v20, v_u_30) * 100
				v35.Text = ("%*%% of shops"):format((("%.0f"):format(v36)))
				v35.TextColor3 = Color3.fromRGB(255, 255, 255)
				v31.LayoutOrder = 1000 / v36
			end
		end
	end
	task.wait(1)
	v_u_9.Visible = false
end
v_u_37()
v_u_7:GetPropertyChangedSignal("Visible"):Connect(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_37
	if v_u_7.Visible then
		v_u_37()
	end
end)
v_u_7.Parent.Parent.Parent.Parent:GetPropertyChangedSignal("Enabled"):Connect(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_37
	if v_u_7.Parent.Parent.Parent.Parent.Enabled then
		v_u_37()
	end
end)