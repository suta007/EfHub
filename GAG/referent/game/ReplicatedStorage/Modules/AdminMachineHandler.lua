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
local v_u_12 = require(v_u_4.Modules.UpdateService)
local v13 = v_u_4.GameEvents
local v14 = v13.AdminMachineUpdateBoost
local v15 = v13.AdminMachineUpdateUI
local v_u_16 = v7.AdminMachine
local v_u_17 = script.AdminBoard or game.CollectionService:GetTagged("AdminBoard")[1]
local v_u_18 = v_u_2.LocalPlayer
local v_u_19 = v_u_8.MIN_BOOST_AMOUNT
local v_u_20 = 0
local v_u_21 = false
local v22 = game.CollectionService:GetTagged("AdminBoardGui")[1]:WaitForChild("Container", 30):WaitForChild("Main", 30)
local v23 = v22:WaitForChild("Content", 30)
local v24 = v22:WaitForChild("Header", 30)
local v25 = v23:WaitForChild("EventFrame", 30)
local v_u_26 = v25:WaitForChild("Icon", 30):WaitForChild("Icon", 30)
local v_u_27 = v25:WaitForChild("Name", 30):WaitForChild("Name", 30)
local v_u_28 = v25:WaitForChild("Icon", 30):WaitForChild("Shadow", 30)
local v_u_29 = v25:WaitForChild("Name", 30):WaitForChild("Shadow", 30)
local v30 = v23:WaitForChild("ItemFrame", 30)
local v_u_31 = v30:WaitForChild("Icon", 30):WaitForChild("Icon", 30)
local v_u_32 = v30:WaitForChild("Name", 30):WaitForChild("Name", 30)
local v_u_33 = v30:WaitForChild("Icon", 30):WaitForChild("Shadow", 30)
local v_u_34 = v30:WaitForChild("Name", 30):WaitForChild("Shadow", 30)
local v35 = v24:WaitForChild("LuckBoost", 30)
local v_u_36 = v35:WaitForChild("Shadow", 30)
local v_u_37 = v35:WaitForChild("Label", 30)
local function v_u_41(p38)
	local v39 = game.StarterGui.Bottom_UI.BottomFrame.Holder.List:FindFirstChild(p38)
	if v39 then
		local v40 = v39:FindFirstChild("Icon")
		if v40 then
			return v40.Image, v40.ImageColor3
		else
			return "rbxassetid://6937742258", Color3.fromRGB(255, 255, 255)
		end
	else
		return "rbxassetid://6937742258", Color3.fromRGB(255, 255, 255)
	end
end
function v_u_1.HasBeenAssignedABTest(_, p42)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v43 = nil
	if v_u_3:IsServer() then
		v43 = require(v_u_5.UserGenerated.Server.ServerABTests)
	elseif v_u_3:IsClient() then
		v43 = require(v_u_4.UserGenerated.Client.ClientABTests)
	end
	if v43.GetAssignmentsAsync(p42, true) then
		return v43.GetAttributeAsync(p42, "AB_AdminMachine", false) and true or false
	else
		return false
	end
end
function v_u_1.UpdateUI(_, p44, p45, p46)
	-- upvalues: (copy) v_u_11, (copy) v_u_41, (copy) v_u_26, (copy) v_u_28, (copy) v_u_27, (copy) v_u_29, (copy) v_u_31, (copy) v_u_9, (copy) v_u_33, (copy) v_u_32, (copy) v_u_34
	local v47 = v_u_11[p44]
	if not v47 then
		v47 = v_u_11.Placeholder or {
			["Icon"] = "rbxassetid://6937742258",
			["IconColor"] = Color3.fromRGB(255, 255, 255)
		}
		local v48, v49 = v_u_41(p44)
		if v47 then
			v47.Icon = v48
			v47.IconColor = v49
		end
	end
	v_u_26.Image = v47.Icon
	v_u_26.ImageColor3 = v47.IconColor or Color3.fromRGB(255, 255, 255)
	v_u_28.Image = v47.Icon
	v_u_28.ImageColor3 = v47.IconColor or Color3.fromRGB(255, 255, 255)
	v_u_27.Text = p44
	v_u_29.Text = p44
	v_u_31.Image = v_u_9(p45, p46) or ""
	v_u_33.Image = v_u_9(p45, p46) or ""
	local v50 = v_u_32
	local v51
	if p46 == "Holdable" or not p45 then
		v51 = ("%* Seed"):format(p45)
	else
		v51 = p45
	end
	v50.Text = v51
	local v52 = v_u_34
	if p46 == "Holdable" or not p45 then
		p45 = ("%* Seed"):format(p45)
	end
	v52.Text = p45
end
function v_u_1.IsBoostAtMax(_)
	-- upvalues: (ref) v_u_19, (copy) v_u_8
	return v_u_19 >= v_u_8.MAX_BOOST_AMOUNT
end
function v_u_1.GetMaxBoostAmount(_)
	-- upvalues: (copy) v_u_8
	return v_u_8.MAX_BOOST_AMOUNT
end
function v_u_1.GetNextBoostCost(_)
	-- upvalues: (copy) v_u_8, (ref) v_u_20
	local v53 = v_u_8.COST_RATE_OF_INCREASE
	local v54 = v_u_20
	local v55 = math.pow(v53, v54)
	return math.ceil(v55)
end
function v_u_1.GetNextBoostAmount(_)
	-- upvalues: (copy) v_u_10, (ref) v_u_19, (copy) v_u_8
	return v_u_10.RoundToDP(v_u_19 + v_u_8.BOOST_RATE_OF_INCREASE, 2)
end
function v_u_1.Initialise(_)
	-- upvalues: (ref) v_u_21, (copy) v_u_12, (copy) v_u_16, (copy) v_u_17, (copy) v_u_27, (copy) v_u_1
	if not v_u_21 and (workspace:GetServerTimeNow() < 1776024000 and not v_u_12:IsUpdateDone()) then
		if not v_u_16:IsRunning() then
			v_u_16:Start()
		end
		v_u_17.Parent = workspace
		if v_u_27.Text == "Item Name" then
			v_u_1:UpdateUI("Placeholder", "Placeholder", "Placeholder")
		end
	end
end
function v_u_1.Remove(_)
	-- upvalues: (copy) v_u_17
	v_u_17.Parent = script
end
task.spawn(function()
	-- upvalues: (ref) v_u_21, (copy) v_u_12, (copy) v_u_1, (copy) v_u_2
	if v_u_21 and true or (workspace:GetServerTimeNow() >= 1776024000 and true or (v_u_12:IsUpdateDone() and true or false)) then
		v_u_1:Remove()
		return
	end
	for _, v56 in v_u_2:GetPlayers() do
		if v_u_1:HasBeenAssignedABTest(v56) then
			v57 = true
			::l13::
			if v57 then
				v_u_1:Initialise()
			end
			return
		end
	end
	local v57 = false
	goto l13
end)
v_u_12.OnUpdated:Connect(function()
	-- upvalues: (ref) v_u_21, (copy) v_u_1
	v_u_21 = true
	v_u_1:Remove()
end)
v_u_2.PlayerAdded:Connect(function(p58)
	-- upvalues: (copy) v_u_1, (copy) v_u_17
	if v_u_1:HasBeenAssignedABTest(p58) then
		if v_u_17.Parent ~= workspace then
			v_u_1:Initialise()
		end
	end
end)
v_u_2.PlayerRemoving:Connect(function(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_18, (copy) v_u_2
	if v_u_1:HasBeenAssignedABTest(v_u_18) then
		return
	end
	for _, v59 in v_u_2:GetPlayers() do
		if v_u_1:HasBeenAssignedABTest(v59) then
			v60 = true
			::l6::
			if not v60 then
				v_u_1:Remove()
			end
			return
		end
	end
	local v60 = false
	goto l6
end)
v15.OnClientEvent:Connect(function(p_u_61, p_u_62, p63)
	-- upvalues: (copy) v_u_1
	local v_u_64 = p63 == "Seed" and "Holdable" or p63
	task.defer(function()
		-- upvalues: (ref) v_u_1, (copy) p_u_61, (copy) p_u_62, (ref) v_u_64
		v_u_1:UpdateUI(p_u_61, p_u_62, v_u_64)
	end)
end)
v14.OnClientEvent:Connect(function(p65, _, p66)
	-- upvalues: (ref) v_u_19, (ref) v_u_20, (copy) v_u_37, (copy) v_u_36, (copy) v_u_6, (copy) v_u_10, (copy) v_u_1
	v_u_19 = p65
	v_u_20 = p66
	v_u_37.Text = ("\240\159\141\128 Luck Boost: %*x \240\159\141\128"):format(v_u_19)
	v_u_36.Text = ("\240\159\141\128 Luck Boost: %*x \240\159\141\128"):format(v_u_19)
	v_u_6:UpdateText({
		["Title"] = "Admin Board Booster",
		["Header"] = "Are you sure you want to boost the Admin Board?",
		["Middle"] = ("This will cost %*\194\162!"):format((v_u_10.FormatCompactPrice(v_u_1:GetNextBoostCost()))),
		["Footer"] = ("This will increase the Luck Boost to %*x! (Chance & Cost resets every event)"):format((v_u_1:GetNextBoostAmount()))
	}, "Admin Board Booster")
end)
return v_u_1