local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_3 = require(v2.Modules.GuiController)
local v_u_4 = require(v2.Modules.RebirthShared)
local v_u_5 = require(v2.Modules.DataService)
local v_u_6 = require(v2.Modules.ItemImageFinder)
local v_u_7 = require(v2.Modules.NumberUtil)
local v8 = require(v2.Modules.MutationHandler)
local v_u_9 = require(v2.Modules.CalculateRebirthReward)
require(v2:WaitForChild("Comma_Module"))
local v_u_10 = require(v2.Modules.Spring)
local v_u_11 = require(v2.Data.RebirthConfigData)
local v_u_12 = v2:WaitForChild("GameEvents").BuyRebirth
local v_u_13 = v1.LocalPlayer
local v_u_14 = v_u_13:WaitForChild("PlayerGui"):WaitForChild("RebirthConfirmation")
local v15 = v_u_14:WaitForChild("Frame"):WaitForChild("ProgressBar")
local v_u_16 = v15:WaitForChild("ShecklesProgressBar")
local v_u_17 = v15:WaitForChild("ShecklesAmount")
local v_u_18 = v_u_14:FindFirstChild("RequiredItemTemplate", true)
local v_u_19 = v_u_14:FindFirstChild("RebirthDetails", true)
local v_u_20 = v_u_14:FindFirstChild("AscensionTimer", true)
local v_u_21 = v_u_14:FindFirstChild("ReceiveText", true)
local v_u_22 = v8:GetMutations()
local v_u_23 = true
local v_u_24 = false
local v25 = {}
local function v_u_28()
	-- upvalues: (copy) v_u_5, (copy) v_u_11, (copy) v_u_20, (copy) v_u_7
	while true do
		local v26 = workspace:GetServerTimeNow()
		local v27 = v_u_5:GetData().RebirthData.LastRebirthTime + v_u_11.RESET_TIME - math.floor(v26)
		if v27 <= 0 then
			v_u_20.Visible = false
		else
			v_u_20.Visible = true
			v_u_20.Text = "Next Ascension " .. v_u_7.compactFormat(v27)
		end
		task.wait(1)
	end
end
local function v_u_39()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_13, (copy) v_u_16, (copy) v_u_17, (copy) v_u_7, (copy) v_u_14
	local v29 = v_u_5:GetData()
	if v29 then
		local v30 = v_u_4:CalculatePrice(v29.RebirthData.TotalRebirths, v_u_13)
		local v31 = v29.Sheckles / v30
		local v32 = math.min(v31, 1)
		v_u_16.Size = UDim2.fromScale(v32, 1)
		local v33 = v_u_17
		local v34 = v_u_7.DisplaySheckles
		local v35 = v29.Sheckles
		v33.Text = v34((math.round(v35))) .. " / " .. v_u_7.DisplaySheckles(v30)
		local v36 = v_u_5:GetData()
		local v37
		if v36 then
			local v38 = v_u_4:CalculatePrice(v36.RebirthData.TotalRebirths, v_u_13)
			v37 = v_u_4:IsRebirthAvailable(v_u_13)
			if v37 then
				v37 = v38 <= v36.Sheckles
			end
		else
			v37 = false
		end
		v_u_14.Frame.ItemFrame.Frame.Confirm.HoverImage = v37 and "rbxassetid://71551639169723" or "rbxassetid://138411009141674"
		v_u_14.Frame.ItemFrame.Frame.Confirm.Image = v37 and "rbxassetid://96160773850314" or "rbxassetid://104713419928195"
	end
end
local function v_u_43()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_13, (copy) v_u_7, (copy) v_u_21, (copy) v_u_9, (ref) v_u_24
	local v40 = v_u_5:GetData()
	if v40 then
		local v41 = v_u_4:CalculatePrice(v40.RebirthData.TotalRebirths, v_u_13)
		local v42 = v_u_7.FormatCompactPrice(v41)
		v_u_21.Text = ("You will get <font color=\"#5dd937\">%* Garden Coins</font> but lose <font color=\"#FF0000\">%*</font> sheckles!"):format(v_u_9(v40.Sheckles), v42)
		if v_u_24 then
			v_u_21.Text = ("You will get <font color=\"#5dd937\">%* Garden Coins</font> but lose <font color=\"#FF0000\">ALL</font> your sheckles!"):format((v_u_9(v40.Sheckles)))
		end
	end
end
local function v_u_56()
	-- upvalues: (ref) v_u_23, (copy) v_u_14, (copy) v_u_5, (copy) v_u_19, (copy) v_u_18, (copy) v_u_6, (copy) v_u_22
	if v_u_23 then
		local v44 = v_u_5:GetData()
		if v44 then
			local v45 = v44.RebirthData
			if v45 then
				local v46 = v45.RequiredPlants
				for _, v47 in v_u_19:GetChildren() do
					if v47:IsA("Frame") and not v47:IsA("UIGridLayout") then
						v47:Destroy()
					end
				end
				for _, v48 in v46 do
					local v49 = v_u_18:Clone()
					v49.Parent = v_u_19
					v49.Visible = true
					local v50 = v_u_6(v48.FruitName, "Holdable")
					if v50 then
						v49.Detail.ItemImageLabel.Image = v50
					end
					v49.Detail.ItemImageLabel.Visible = true
					local v51 = ""
					for v52, v53 in v48.Mutations do
						local v54 = v_u_22[v53]
						local v55 = ("<font color=\"#%*\">%*</font>"):format(v54.Color:ToHex(), v53)
						if v54.StrokeColor then
							v55 = ("<stroke color=\"#%*\">%*</stroke>"):format(v54.StrokeColor:ToHex(), v55)
						end
						v51 = v51 .. ("%*%*"):format(v55, v52 == #v48.Mutations and "" or "<br/>")
					end
					v49.ItemName.Text = v48.FruitName
					v49.ItemMutations.Text = v51
					v49.ItemAmount.Visible = false
				end
			end
		else
			return
		end
	else
		v_u_14.Frame.Display.Visible = false
		return
	end
end
local function v_u_60()
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_4, (copy) v_u_13, (copy) v_u_10, (copy) v_u_20, (copy) v_u_5, (copy) v_u_12, (copy) v_u_39, (copy) v_u_56, (copy) v_u_43
	v_u_14.Frame.Frame.ExitButton.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_14
		v_u_3:Close(v_u_14)
	end)
	v_u_14.Frame.ItemFrame.Frame.Cancel.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_14
		v_u_3:Close(v_u_14)
	end)
	v_u_14.Frame.ItemFrame.Frame.Confirm.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_13, (ref) v_u_10, (ref) v_u_20, (ref) v_u_5, (ref) v_u_3, (ref) v_u_14, (ref) v_u_12
		if not v_u_4:IsRebirthAvailable(v_u_13) then
			v_u_10.stop(v_u_20)
			v_u_10.stop(v_u_20.UIStroke)
			v_u_20.UIStroke.Color = Color3.fromRGB(100, 25, 25)
			v_u_20.TextColor3 = Color3.fromRGB(255, 75, 75)
			v_u_10.target(v_u_20, 1, 1, {
				["TextColor3"] = Color3.fromRGB(255, 255, 255)
			})
			v_u_10.target(v_u_20.UIStroke, 1, 1, {
				["Color"] = Color3.fromRGB(0, 63, 0)
			})
		end
		local v57 = v_u_5:GetData()
		local v58
		if v57 then
			local v59 = v_u_4:CalculatePrice(v57.RebirthData.TotalRebirths, v_u_13)
			v58 = v_u_4:IsRebirthAvailable(v_u_13)
			if v58 then
				v58 = v59 <= v57.Sheckles
			end
		else
			v58 = false
		end
		if v58 then
			v_u_3:Close(v_u_14)
			v_u_12:FireServer()
		end
	end)
	v_u_39()
	v_u_56()
	v_u_43()
end
function v25.Start(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_14, (copy) v_u_60, (copy) v_u_5, (copy) v_u_39, (copy) v_u_43, (copy) v_u_56, (copy) v_u_28
	v_u_3:UsePopupAnims(v_u_14)
	v_u_60()
	v_u_5:GetPathSignal("Sheckles"):Connect(function()
		-- upvalues: (ref) v_u_39, (ref) v_u_43
		v_u_39()
		v_u_43()
	end)
	v_u_5:GetPathSignal("RebirthData"):Connect(function()
		-- upvalues: (ref) v_u_39, (ref) v_u_56
		v_u_39()
		v_u_56()
	end)
	v_u_5:GetPathSignal("RebirthData/@"):Connect(function()
		-- upvalues: (ref) v_u_39, (ref) v_u_56
		v_u_39()
		v_u_56()
	end)
	task.spawn(v_u_28)
end
local v61 = require(v2.UserGenerated.Client.ClientABTests)
if v61.GetAssignmentsAsync(v_u_13, true) then
	local v62 = v61.GetAttributes(v_u_13)
	local v63 = v62 and v62.AB_AscensionVariant
	if v63 then
		v_u_24 = v63 == "AllShecklesNoPlant" and true or v63 == "AllShecklesNeedPlant"
		v_u_23 = v63 ~= "RequiredShecklesNoPlant" and v63 ~= "AllShecklesNoPlant"
	end
end
task.spawn(v25.Start, v25)
return v25