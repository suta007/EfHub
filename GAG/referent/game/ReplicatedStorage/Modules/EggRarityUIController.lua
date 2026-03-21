local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
require(v2.Modules.GetFarm)
local v_u_3 = v1.LocalPlayer.PlayerGui:WaitForChild("EggRarityDisplay_UI")
require(v2.Modules.WaitForDescendant)
local v4 = require(v2.Data.PetEggData)
local v_u_5 = require(v2.Data.PetRegistry)
local v_u_6 = require(game.ReplicatedStorage.Frame_Popup_Module)
local v7 = v_u_3:WaitForChild("RarityDisplay"):WaitForChild("Main"):WaitForChild("Holder")
local v_u_8 = v7:WaitForChild("Header"):WaitForChild("Exit"):WaitForChild("SENSOR")
local v_u_9 = v7:WaitForChild("ScrollingFrame"):WaitForChild("Content")
local v_u_10 = v_u_9:WaitForChild("SEGMENT")
local v_u_11 = {}
local v_u_12 = {}
local v_u_13 = {
	["Common Egg"] = "rbxassetid://110495383642358",
	["Uncommon Egg"] = "rbxassetid://116378505754760",
	["Rare Egg"] = "rbxassetid://111372276806205",
	["Mythical Egg"] = "rbxassetid://83210224500991",
	["Legendary Egg"] = "rbxassetid://97799911854888",
	["Jungle Egg"] = "rbxassetid://82473700313689",
	["Bug Egg"] = "rbxassetid://83970205286930"
}
for v14, v15 in v4 do
	table.insert(v_u_11, {
		["Key"] = v14,
		["Value"] = v15
	})
end
table.sort(v_u_11, function(p16, p17)
	local v18 = p16.Value.StockChance
	local v19 = p17.Value.StockChance
	if v18 == v19 then
		return p16.Value.EggName < p17.Value.EggName
	else
		return v19 < v18
	end
end)
local v_u_20 = false
function v_u_12.Show(_, p21)
	-- upvalues: (ref) v_u_20, (copy) v_u_8, (copy) v_u_12, (copy) v_u_6, (copy) v_u_3
	if p21 and v_u_20 == false then
		v_u_8.Activated:Connect(function()
			-- upvalues: (ref) v_u_12
			v_u_12:Show(false)
		end)
		v_u_12:Populate()
		v_u_20 = true
	end
	if p21 == true then
		v_u_6.Show(v_u_3.RarityDisplay)
	else
		v_u_6.Hide(v_u_3.RarityDisplay)
	end
	print("ya")
	v_u_3.Enabled = p21
end
function v_u_12.Populate(_)
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (copy) v_u_13, (copy) v_u_5
	for _, v22 in v_u_9:GetChildren() do
		if v22.Name == "SEGMENT_UNUSED" then
			v22:Destroy()
		end
	end
	local v_u_23 = {}
	for _, v24 in v_u_11 do
		local v25 = {
			["name"] = v24.Value.EggName,
			["chance"] = 1 / v24.Value.StockChance
		}
		table.insert(v_u_23, v25)
	end
	for _, v26 in v_u_11 do
		local v27 = v_u_10:Clone()
		local v28 = v27:WaitForChild("Display")
		local v29 = v28:WaitForChild("DisplayBox"):WaitForChild("EGG_IMAGE")
		local v30 = v28:WaitForChild("RARITY_NAME")
		local v31 = v28:WaitForChild("RARITY_PERCENTAGE")
		v27.Parent = v_u_10.Parent
		v29.Image = v_u_13[v26.Value.EggName]
		v30.Text = v26.Value.EggName
		v30.TextColor3 = v_u_5.PetEggs[v26.Value.EggName].Color
		local v_u_32 = v26.Value.EggName
		local v35 = (1 - (function()
			-- upvalues: (copy) v_u_23, (copy) v_u_32
			local v33 = 1
			for _, v34 in ipairs(v_u_23) do
				if v34.name == v_u_32 then
					return v33 * (1 - v33 * v34.chance)
				end
				v33 = v33 * (1 - v34.chance)
			end
			return v33
		end)() ^ 3) * 100
		v31.Text = ("%*%% of shops"):format((("%.0f"):format(v35)))
		v31.TextColor3 = Color3.fromRGB(255, 255, 255)
		v27.LayoutOrder = 1000 / v35
	end
	wait(1)
	v_u_10:Destroy()
end
return v_u_12