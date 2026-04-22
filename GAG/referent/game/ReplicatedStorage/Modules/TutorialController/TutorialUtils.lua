local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
require(v1.Modules.GetFarm)
local v_u_4 = require(v1.Modules.GetFarmAsync)
local v_u_5 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_6 = require(v1.Data.EnumRegistry.ItemTypeEnums)
local v_u_7 = require(v1.Modules.FastTween)
local v_u_8 = v3.LocalPlayer
local v_u_9 = v_u_8.PlayerGui.Tutorial_UI
local v_u_10 = v_u_9.Pointer
local v_u_11 = v_u_9.Focus
local function v_u_16()
	-- upvalues: (copy) v_u_8
	local v12 = {}
	for _, v13 in v_u_8.Backpack:GetChildren() do
		if v13:IsA("Tool") then
			table.insert(v12, v13)
		end
	end
	local v14 = v_u_8.Character
	local v15
	if v14 then
		v15 = v14:FindFirstChildWhichIsA("Tool")
	else
		v15 = nil
	end
	if v15 then
		table.insert(v12, v15)
	end
	return v12
end
local function v_u_18()
	-- upvalues: (copy) v_u_16
	for _, v17 in v_u_16() do
		if string.find(v17.Name, "Seed") then
			return true
		end
	end
	return false
end
local v_u_19 = nil
local function v28(p_u_20)
	-- upvalues: (ref) v_u_19, (copy) v_u_11, (copy) v_u_7, (copy) v_u_2
	while v_u_19 do
		task.wait()
	end
	v_u_19 = true
	v_u_11.Visible = true
	local v21 = {
		["Transparency"] = 0.3
	}
	v_u_7(v_u_11.UIStroke, TweenInfo.new(0.2), v21)
	local function v26()
		-- upvalues: (copy) p_u_20, (ref) v_u_11
		local v22 = p_u_20
		local v23, v24
		if type(v22) == "function" then
			local v25 = p_u_20()
			if v25 == nil then
				return
			end
			v23 = v25.Size
			v24 = v25.Position + v23 * 0.5
		else
			v23 = p_u_20.AbsoluteSize
			v24 = p_u_20.AbsolutePosition + v23 * 0.5
		end
		v_u_11.Position = UDim2.fromOffset(v24.X, v24.Y)
		v_u_11.Size = UDim2.fromOffset(v23.X, v23.Y)
	end
	local v_u_27 = v_u_2.PreRender:Connect(v26)
	return function()
		-- upvalues: (copy) v_u_27, (ref) v_u_19, (ref) v_u_7, (ref) v_u_11
		if v_u_27.Connected then
			v_u_27:Disconnect()
			v_u_19 = false
			v_u_7(v_u_11.UIStroke, TweenInfo.new(0.2), {
				["Transparency"] = 1
			}).Completed:Once(function()
				-- upvalues: (ref) v_u_11
				v_u_11.Visible = false
			end)
		end
	end
end
local v_u_29 = false
return {
	["getTools"] = v_u_16,
	["hasSeed"] = v_u_18,
	["waitForSeed"] = function()
		-- upvalues: (copy) v_u_18
		while not v_u_18() do
			task.wait(0.1)
		end
		return true
	end,
	["waitUntilSellableItem"] = function()
		-- upvalues: (copy) v_u_16
		while true do
			for _, v30 in v_u_16() do
				if v30:FindFirstChild("Item_String") then
					return true
				end
			end
			task.wait(0.1)
		end
	end,
	["waitUntilNoSellableItems"] = function()
		-- upvalues: (copy) v_u_16
		while true do
			local v31 = false
			for _, v32 in v_u_16() do
				if v32:FindFirstChild("Item_String") then
					v31 = true
				end
			end
			if not v31 then
				return true
			end
			task.wait(0.1)
		end
	end,
	["waitForFarm"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_8
		return v_u_4(v_u_8)
	end,
	["waitUntilDistance"] = function(p33, p34)
		-- upvalues: (copy) v_u_8
		while not v_u_8.Character or v_u_8:DistanceFromCharacter(p33) > p34 do
			task.wait(0.1)
		end
	end,
	["waitUntilSeedEquipped"] = function()
		-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_6
		while true do
			local v35 = v_u_8.Character
			if v35 then
				v35 = v35:FindFirstChildWhichIsA("Tool")
			end
			if v35 and v35:GetAttribute(v_u_5.ITEM_TYPE) == v_u_6.Seed then
				return
			end
			task.wait(0.1)
		end
	end,
	["pointToUI"] = function(p_u_36, p37, p38, p39)
		-- upvalues: (ref) v_u_29, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7, (copy) v_u_2
		while v_u_29 do
			task.wait()
		end
		v_u_29 = true
		local v_u_40 = false
		local function v42()
			-- upvalues: (copy) p_u_36, (ref) v_u_10
			local v41 = p_u_36(v_u_10)
			if v41 then
				v_u_10.Position = UDim2.fromOffset(v41.X, v41.Y)
			end
		end
		v_u_10.Image = p39 or "rbxassetid://7553620727"
		v_u_10.Parent = p37 or v_u_9
		v_u_10.UIScale.Scale = p38 or 1
		v_u_10.Visible = true
		v_u_7(v_u_10, TweenInfo.new(0.3), {
			["ImageTransparency"] = 0
		})
		local v_u_43 = v_u_7(v_u_10.UIScale, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
			["Scale"] = (p38 or 1) * 1.1
		})
		local v_u_44 = v_u_2.PreRender:Connect(v42)
		return function()
			-- upvalues: (ref) v_u_40, (ref) v_u_29, (copy) v_u_44, (copy) v_u_43, (ref) v_u_7, (ref) v_u_10, (ref) v_u_9
			if not v_u_40 then
				v_u_40 = true
				v_u_29 = false
				if v_u_44 then
					v_u_44:Disconnect()
				end
				if v_u_43 then
					v_u_43:Cancel()
				end
				v_u_7(v_u_10, TweenInfo.new(0.2), {
					["ImageTransparency"] = 1
				})
				v_u_10.Visible = false
				v_u_10.Parent = v_u_9
			end
		end
	end,
	["focusObject"] = v28,
	["getDistanceTo"] = function(p45)
		-- upvalues: (copy) v_u_8
		return not v_u_8.Character and (1 / 0) or v_u_8:DistanceFromCharacter(p45)
	end
}