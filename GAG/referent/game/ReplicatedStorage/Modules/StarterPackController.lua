local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = v_u_1.LocalPlayer
local v4 = v_u_3.PlayerGui
local v_u_5 = v4.Hud_UI
local v_u_6 = v4.StarterPack_UI
local v_u_7 = require(v2.Modules.ABTestController)
local v_u_8 = require(v2.Modules.MarketController)
local v_u_9 = require(v2.Modules.GuiController)
local v_u_10 = require(v2.Modules.DataService)
local v_u_11 = require(v2.Modules.TimeHelper)
local v_u_12 = require(v2.Modules.NumberUtil)
local v_u_13 = require(v2.Data.DevProductIds)
local v_u_33 = {
	["_createVariant1"] = function(_)
		-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (copy) v_u_13, (copy) v_u_8, (copy) v_u_10, (copy) v_u_12
		local v_u_14 = v_u_9:GetStateForGui(v_u_6)
		local v_u_15 = v_u_6.Frame.Variant1
		v_u_5.SideBtns.StarterPack.Button.Label.Text = "Starter Pack"
		v_u_5.SideBtns.StarterPack.Button.PepperPack.Visible = false
		v_u_15.Buy.Activated:Connect(function()
			-- upvalues: (ref) v_u_13, (ref) v_u_8
			v_u_8:PromptPurchase(v_u_13.StarterPackVariant1.PurchaseID, Enum.InfoType.Product)
		end)
		v_u_15.Close.Activated:Connect(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_6
			v_u_9:Close(v_u_6)
		end)
		local function v21()
			-- upvalues: (ref) v_u_10, (ref) v_u_12, (copy) v_u_15, (ref) v_u_5, (copy) v_u_14, (ref) v_u_9, (ref) v_u_6
			local v16 = v_u_10:GetData()
			if v16 then
				local v17 = v16.StarterPack.Timer
				if v17 then
					local v18 = v_u_12.compactFormat(v17)
					v_u_15.Timer.Text = ("%* Left"):format(v18)
					v_u_5.SideBtns.StarterPack.Button.Timer.Text = ("%* Left"):format(v18)
				end
				local v19 = v_u_5.SideBtns.StarterPack
				local v20
				if v17 then
					v20 = v17 > 0
				else
					v20 = v17
				end
				v19.Visible = v20
				if v17 and (v17 <= 0 and v_u_14.Visible:Get()) then
					v_u_9:Close(v_u_6)
				end
			end
		end
		task.spawn(v21)
		local v22 = v_u_10
		assert(v22:GetPathSignal("StarterPack/@")):Connect(v21)
	end,
	["_createVariant2"] = function(_)
		-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_9, (copy) v_u_6, (copy) v_u_13, (copy) v_u_8, (copy) v_u_11, (copy) v_u_12
		local v_u_23 = v_u_10:GetData()
		if v_u_23 then
			v_u_5.SideBtns.StarterPack.Button.Label.Text = "Pepper Pack"
			v_u_5.SideBtns.StarterPack.Button.PepperPack.Visible = true
			local v_u_24 = v_u_9:GetStateForGui(v_u_6)
			local v_u_25 = v_u_6.Frame.Variant2
			v_u_25.Buy.Activated:Connect(function()
				-- upvalues: (ref) v_u_13, (ref) v_u_8
				v_u_8:PromptPurchase(v_u_13.StarterPackVariant2.PurchaseID, Enum.InfoType.Product)
			end)
			v_u_25.Close.Activated:Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_6
				v_u_9:Close(v_u_6)
			end)
			local _ = v_u_23.StarterPack.Timer
			local function v29()
				-- upvalues: (copy) v_u_23, (copy) v_u_25, (ref) v_u_11, (ref) v_u_5, (ref) v_u_12, (copy) v_u_24, (ref) v_u_9, (ref) v_u_6
				local v26 = v_u_23.StarterPack.Timer
				if v26 then
					v_u_25.Timer.Text = ("Expires in %*"):format((v_u_11:GenerateTextFromTime(v26, false)))
					v_u_25.Prog.Fill.Size = UDim2.fromScale(v26 / 420, 1)
					v_u_5.SideBtns.StarterPack.Button.Timer.Text = ("%* Left"):format((v_u_12.compactFormat(v26)))
				end
				local v27 = v_u_5.SideBtns.StarterPack
				local v28
				if v26 then
					v28 = v26 > 0
				else
					v28 = v26
				end
				v27.Visible = v28
				if v26 and (v26 <= 0 and v_u_24.Visible:Get()) then
					v_u_9:Close(v_u_6)
				end
			end
			task.spawn(v29)
			local v30 = v_u_10
			assert(v30:GetPathSignal("StarterPack/@")):Connect(v29)
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_1, (copy) v_u_5, (copy) v_u_33
		v_u_9:UsePopupAnims(v_u_6)
		while (not v_u_7:IsLoaded() or v_u_3:GetAttribute("AB_StarterPack") == nil) and v_u_3:IsDescendantOf(v_u_1) do
			task.wait(1)
		end
		if v_u_3:IsDescendantOf(v_u_1) then
			local v31 = v_u_3:GetAttribute("AB_StarterPack") or "Variant1"
			for _, v32 in v_u_6.Frame:GetChildren() do
				if v32:IsA("GuiObject") then
					v32.Visible = v32.Name == v31
				end
			end
			v_u_5.SideBtns.StarterPack.Button.Activated:Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_6
				v_u_9:Open(v_u_6)
			end)
			v_u_5.SideBtns.StarterPack.Button.PepperPack.Activated:Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_6
				v_u_9:Open(v_u_6)
			end)
			if v31 == "Variant1" then
				v_u_33:_createVariant1()
			else
				v_u_33:_createVariant2()
			end
		else
			return
		end
	end
}
task.spawn(v_u_33.Start, v_u_33)
return v_u_33