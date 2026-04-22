local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v_u_1.Modules.GuiController)
local v_u_4 = require(v_u_1.Modules.SetupButton)
local v_u_5 = require(v_u_1.Modules.SeasonPass.SeasonPassToggler)
local v_u_6 = require(v_u_1.Modules.GardenGuideController)
local v_u_7 = require(v_u_1.Data.GardenGuideData)
local v_u_8 = require(v_u_1.Modules.UpdateService)
local v_u_9 = require(v_u_1.Modules.DataService)
require(v_u_1.Modules.CountDictionary)
local v_u_10 = require(v_u_1.Modules.RebirthUnlocksSharedService)
local v_u_11 = v_u_2.LocalPlayer
local v_u_12 = v_u_11.PlayerGui
local v_u_13 = v_u_12.Hud_UI
local v_u_14 = v_u_12:WaitForChild("RebirthConfirmation", 30)
local v24 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_3, (copy) v_u_12, (copy) v_u_7, (copy) v_u_11, (copy) v_u_6, (copy) v_u_5, (copy) v_u_1, (copy) v_u_9, (copy) v_u_10, (copy) v_u_2, (copy) v_u_14, (copy) v_u_8
		v_u_4({
			["instance"] = v_u_13.SideBtns.Shop,
			["offset"] = 0.075,
			["onclick"] = function()
				-- upvalues: (ref) v_u_3, (ref) v_u_12
				v_u_3:Toggle(v_u_12.Shop_UI)
			end
		})
		v_u_13.SideBtns.GardenGuide.Visible = not v_u_7.UseTool
		v_u_13.SideBtns.GardenGuide.Visible = not v_u_11:GetAttribute("FirstTimePlayer")
		v_u_11:GetAttributeChangedSignal("FirstTimePlayer"):Connect(function()
			-- upvalues: (ref) v_u_13, (ref) v_u_11
			v_u_13.SideBtns.GardenGuide.Visible = not v_u_11:GetAttribute("FirstTimePlayer")
		end)
		v_u_4({
			["instance"] = v_u_13.SideBtns.GardenGuide,
			["offset"] = 0.075
		})
		v_u_13.SideBtns.GardenGuide.Activated:Connect(function()
			-- upvalues: (ref) v_u_6
			v_u_6:Toggle()
		end)
		v_u_13.SideBtns.Pass.Visible = not v_u_11:GetAttribute("FirstTimePlayer")
		v_u_11:GetAttributeChangedSignal("FirstTimePlayer"):Connect(function()
			-- upvalues: (ref) v_u_13, (ref) v_u_11
			v_u_13.SideBtns.Pass.Visible = not v_u_11:GetAttribute("FirstTimePlayer")
		end)
		v_u_4({
			["instance"] = v_u_13.SideBtns.Pass,
			["offset"] = 0.1,
			["onclick"] = function()
				-- upvalues: (ref) v_u_5
				v_u_5:Toggle()
			end
		})
		local v_u_15 = require(v_u_1.Modules.AdminQuestUIController)
		local v_u_16 = v_u_13.SideBtns.AdminQuest.Notify
		v_u_15.OnNotifStateChanged:Connect(function()
			-- upvalues: (copy) v_u_16, (copy) v_u_15
			v_u_16.Visible = v_u_15.Notif
		end)
		local function v19()
			-- upvalues: (ref) v_u_11, (ref) v_u_9, (ref) v_u_13, (copy) v_u_15
			local v17 = true
			if v17 then
				v17 = not v_u_11:GetAttribute("FirstTimePlayer")
			end
			local v18 = v_u_9:GetData()
			if v17 then
				v17 = v18.AdminQuest ~= nil
			end
			v_u_13.SideBtns.AdminQuest.Visible = v17
			if not v17 then
				v_u_15:Close()
			end
		end
		local v20 = true
		if v20 then
			v20 = not v_u_11:GetAttribute("FirstTimePlayer")
		end
		local v21 = v_u_9:GetData()
		if v20 then
			v20 = v21.AdminQuest ~= nil
		end
		v_u_13.SideBtns.AdminQuest.Visible = v20
		if not v20 then
			v_u_15:Close()
		end
		v_u_9:GetPathSignal("AdminQuest/@"):Connect(v19)
		v_u_4({
			["instance"] = v_u_13.SideBtns.AdminQuest,
			["offset"] = 0.075,
			["onclick"] = function()
				-- upvalues: (copy) v_u_15
				v_u_15:Toggle()
			end
		})
		if v_u_10:HasBeenAssignedABTest(v_u_2.LocalPlayer) then
			v_u_13.SideBtns.Ascend.Visible = true
			v_u_4({
				["instance"] = v_u_13.SideBtns.Ascend,
				["offset"] = 0.075,
				["onclick"] = function()
					-- upvalues: (ref) v_u_3, (ref) v_u_14
					v_u_3:Open(v_u_14)
				end
			})
			v_u_13.SideBtns.Ascend.Visible = not v_u_11:GetAttribute("FirstTimePlayer")
			local v_u_22 = nil
			v_u_22 = v_u_11:GetAttributeChangedSignal("FirstTimePlayer"):Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_13, (ref) v_u_22
				local v23 = not v_u_11:GetAttribute("FirstTimePlayer")
				v_u_13.SideBtns.Ascend.Visible = v23
				if v23 and v_u_22 then
					v_u_22:Disconnect()
					v_u_22 = nil
				end
			end)
		end
		while v_u_8:IsHiddenFromUpdate("Trade Tokens") do
			task.wait(1)
		end
		v_u_13.SideBtns.Trade.Visible = not v_u_11:GetAttribute("FirstTimePlayer")
		v_u_4({
			["instance"] = v_u_13.SideBtns.Trade,
			["offset"] = 0.1,
			["onclick"] = function()
				-- upvalues: (ref) v_u_3, (ref) v_u_12
				v_u_3:Toggle(v_u_12.TradeMenu)
			end
		})
	end
}
task.spawn(v24.Start, v24)
return v24