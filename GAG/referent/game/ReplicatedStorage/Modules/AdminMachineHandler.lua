local v_u_1 = {}
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("ServerScriptService")
local v_u_6 = require(v_u_4.Modules.ConfirmationPromptController)
local v7 = require(v_u_4.Data.SharedCycleHandlerData)
local v_u_8 = require(v_u_4.Data.AdminMachineConfigData)
local v_u_9 = require(v_u_4.Modules.ItemImageFinder)
local v_u_10 = require(v_u_4.Modules.NumberUtil)
local v_u_11 = require(v_u_4.Data.WeatherData)
local v12 = v_u_4.GameEvents
local v13 = v12.AdminMachineUpdateBoost
local v14 = v12.AdminMachineUpdateUI
local v_u_15 = v7.AdminMachine
local v_u_16 = script.AdminBoard or game.CollectionService:GetTagged("AdminBoard")[1]
local v_u_17 = v_u_2.LocalPlayer
local v_u_18 = v_u_8.MIN_BOOST_AMOUNT
local v_u_19 = 0
local v20 = game.CollectionService:GetTagged("AdminBoardGui")[1]:WaitForChild("Container", 30):WaitForChild("Main", 30)
local v21 = v20:WaitForChild("Content", 30)
local v22 = v20:WaitForChild("Header", 30)
local v23 = v21:WaitForChild("EventFrame", 30)
local v_u_24 = v23:WaitForChild("Icon", 30):WaitForChild("Icon", 30)
local v_u_25 = v23:WaitForChild("Name", 30):WaitForChild("Name", 30)
local v_u_26 = v23:WaitForChild("Icon", 30):WaitForChild("Shadow", 30)
local v_u_27 = v23:WaitForChild("Name", 30):WaitForChild("Shadow", 30)
local v28 = v21:WaitForChild("ItemFrame", 30)
local v_u_29 = v28:WaitForChild("Icon", 30):WaitForChild("Icon", 30)
local v_u_30 = v28:WaitForChild("Name", 30):WaitForChild("Name", 30)
local v_u_31 = v28:WaitForChild("Icon", 30):WaitForChild("Shadow", 30)
local v_u_32 = v28:WaitForChild("Name", 30):WaitForChild("Shadow", 30)
local v33 = v22:WaitForChild("LuckBoost", 30)
local v_u_34 = v33:WaitForChild("Shadow", 30)
local v_u_35 = v33:WaitForChild("Label", 30)
local function v_u_39(p36)
	local v37 = game.StarterGui.Bottom_UI.BottomFrame.Holder.List:FindFirstChild(p36)
	if v37 then
		local v38 = v37:FindFirstChild("Icon")
		if v38 then
			return v38.Image, v38.ImageColor3
		else
			return "rbxassetid://6937742258", Color3.fromRGB(255, 255, 255)
		end
	else
		return "rbxassetid://6937742258", Color3.fromRGB(255, 255, 255)
	end
end
function v_u_1.HasBeenAssignedABTest(_, p40)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v41 = nil
	if v_u_3:IsServer() then
		v41 = require(v_u_5.UserGenerated.Server.ServerABTests)
	elseif v_u_3:IsClient() then
		v41 = require(v_u_4.UserGenerated.Client.ClientABTests)
	end
	if v41.GetAssignmentsAsync(p40, true) then
		return v41.GetAttributeAsync(p40, "AB_AdminMachine", false) and true or false
	else
		return false
	end
end
function v_u_1.UpdateUI(_, p42, p43, p44)
	-- upvalues: (copy) v_u_11, (copy) v_u_39, (copy) v_u_24, (copy) v_u_26, (copy) v_u_25, (copy) v_u_27, (copy) v_u_29, (copy) v_u_9, (copy) v_u_31, (copy) v_u_30, (copy) v_u_32
	local v45 = v_u_11[p42]
	if not v45 then
		v45 = v_u_11.Placeholder or {
			["Icon"] = "rbxassetid://6937742258",
			["IconColor"] = Color3.fromRGB(255, 255, 255)
		}
		local v46, v47 = v_u_39(p42)
		if v45 then
			v45.Icon = v46
			v45.IconColor = v47
		end
	end
	v_u_24.Image = v45.Icon
	v_u_24.ImageColor3 = v45.IconColor or Color3.fromRGB(255, 255, 255)
	v_u_26.Image = v45.Icon
	v_u_26.ImageColor3 = v45.IconColor or Color3.fromRGB(255, 255, 255)
	v_u_25.Text = p42
	v_u_27.Text = p42
	v_u_29.Image = v_u_9(p43, p44) or ""
	v_u_31.Image = v_u_9(p43, p44) or ""
	local v48 = v_u_30
	local v49
	if p44 == "Holdable" or not p43 then
		v49 = ("%* Seed"):format(p43)
	else
		v49 = p43
	end
	v48.Text = v49
	local v50 = v_u_32
	if p44 == "Holdable" or not p43 then
		p43 = ("%* Seed"):format(p43)
	end
	v50.Text = p43
end
function v_u_1.IsBoostAtMax(_)
	-- upvalues: (ref) v_u_18, (copy) v_u_8
	return v_u_18 >= v_u_8.MAX_BOOST_AMOUNT
end
function v_u_1.GetMaxBoostAmount(_)
	-- upvalues: (copy) v_u_8
	return v_u_8.MAX_BOOST_AMOUNT
end
function v_u_1.GetNextBoostCost(_)
	-- upvalues: (copy) v_u_8, (ref) v_u_19
	local v51 = v_u_8.COST_RATE_OF_INCREASE
	local v52 = v_u_19
	local v53 = math.pow(v51, v52)
	return math.ceil(v53)
end
function v_u_1.GetNextBoostAmount(_)
	-- upvalues: (copy) v_u_10, (ref) v_u_18, (copy) v_u_8
	return v_u_10.RoundToDP(v_u_18 + v_u_8.BOOST_RATE_OF_INCREASE, 2)
end
function v_u_1.Initialise(_)
	-- upvalues: (copy) v_u_15, (copy) v_u_16, (copy) v_u_25, (copy) v_u_1
	if not v_u_15:IsRunning() then
		v_u_15:Start()
	end
	v_u_16.Parent = workspace
	if v_u_25.Text == "Item Name" then
		v_u_1:UpdateUI("Placeholder", "Placeholder", "Placeholder")
	end
end
function v_u_1.Remove(_)
	-- upvalues: (copy) v_u_16
	v_u_16.Parent = script
end
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	for _, v54 in v_u_2:GetPlayers() do
		if v_u_1:HasBeenAssignedABTest(v54) then
			v55 = true
			::l4::
			if v55 then
				v_u_1:Initialise()
			end
			return
		end
	end
	local v55 = false
	goto l4
end)
v_u_2.PlayerAdded:Connect(function(p56)
	-- upvalues: (copy) v_u_1, (copy) v_u_16
	if v_u_1:HasBeenAssignedABTest(p56) then
		if v_u_16.Parent ~= workspace then
			v_u_1:Initialise()
		end
	end
end)
v_u_2.PlayerRemoving:Connect(function(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_17, (copy) v_u_2
	if v_u_1:HasBeenAssignedABTest(v_u_17) then
		return
	end
	for _, v57 in v_u_2:GetPlayers() do
		if v_u_1:HasBeenAssignedABTest(v57) then
			v58 = true
			::l6::
			if not v58 then
				v_u_1:Remove()
			end
			return
		end
	end
	local v58 = false
	goto l6
end)
v14.OnClientEvent:Connect(function(p_u_59, p_u_60, p61)
	-- upvalues: (copy) v_u_1
	local v_u_62 = p61 == "Seed" and "Holdable" or p61
	task.defer(function()
		-- upvalues: (ref) v_u_1, (copy) p_u_59, (copy) p_u_60, (ref) v_u_62
		v_u_1:UpdateUI(p_u_59, p_u_60, v_u_62)
	end)
end)
v13.OnClientEvent:Connect(function(p63, _, p64)
	-- upvalues: (ref) v_u_18, (ref) v_u_19, (copy) v_u_35, (copy) v_u_34, (copy) v_u_6, (copy) v_u_10, (copy) v_u_1
	v_u_18 = p63
	v_u_19 = p64
	v_u_35.Text = ("\240\159\141\128 Luck Boost: %*x \240\159\141\128"):format(v_u_18)
	v_u_34.Text = ("\240\159\141\128 Luck Boost: %*x \240\159\141\128"):format(v_u_18)
	v_u_6:UpdateText({
		["Title"] = "Admin Board Booster",
		["Header"] = "Are you sure you want to boost the Admin Board?",
		["Middle"] = ("This will cost %*\194\162!"):format((v_u_10.FormatCompactPrice(v_u_1:GetNextBoostCost()))),
		["Footer"] = ("This will increase the Luck Boost to %*x! (Chance & Cost resets every event)"):format((v_u_1:GetNextBoostAmount()))
	}, "Admin Board Booster")
end)
return v_u_1