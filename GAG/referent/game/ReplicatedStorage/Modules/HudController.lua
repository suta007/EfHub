local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v_u_1.Modules.GuiController)
local v_u_4 = require(v_u_1.Modules.SetupButton)
require(v_u_1.Modules.SeasonPass.SeasonPassToggler)
local v_u_5 = require(v_u_1.Modules.GardenGuideController)
local v_u_6 = require(v_u_1.Data.GardenGuideData)
local v_u_7 = require(v_u_1.Modules.UpdateService)
local v_u_8 = require(v_u_1.Modules.DataService)
require(v_u_1.Modules.CountDictionary)
local v_u_9 = require(v_u_1.Modules.RebirthUnlocksSharedService)
local v_u_10 = v_u_2.LocalPlayer
local v_u_11 = v_u_10.PlayerGui
local v_u_12 = v_u_11.Hud_UI
local v_u_13 = v_u_11:WaitForChild("RebirthConfirmation", 30)
local v23 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (copy) v_u_11, (copy) v_u_6, (copy) v_u_10, (copy) v_u_5, (copy) v_u_1, (copy) v_u_8, (copy) v_u_9, (copy) v_u_2, (copy) v_u_13, (copy) v_u_7
		v_u_4({
			["instance"] = v_u_12.SideBtns.Shop,
			["offset"] = 0.075,
			["onclick"] = function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11
				v_u_3:Toggle(v_u_11.Shop_UI)
			end
		})
		v_u_12.SideBtns.GardenGuide.Visible = not v_u_6.UseTool
		v_u_12.SideBtns.GardenGuide.Visible = not v_u_10:GetAttribute("FirstTimePlayer")
		v_u_10:GetAttributeChangedSignal("FirstTimePlayer"):Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_10
			v_u_12.SideBtns.GardenGuide.Visible = not v_u_10:GetAttribute("FirstTimePlayer")
		end)
		v_u_4({
			["instance"] = v_u_12.SideBtns.GardenGuide,
			["offset"] = 0.075
		})
		v_u_12.SideBtns.GardenGuide.Activated:Connect(function()
			-- upvalues: (ref) v_u_5
			v_u_5:Toggle()
		end)
		v_u_12.SideBtns.Pass.Visible = false
		local v_u_14 = require(v_u_1.Modules.AdminQuestUIController)
		local v_u_15 = v_u_12.SideBtns.AdminQuest.Notify
		v_u_14.OnNotifStateChanged:Connect(function()
			-- upvalues: (copy) v_u_15, (copy) v_u_14
			v_u_15.Visible = v_u_14.Notif
		end)
		local function v18()
			-- upvalues: (ref) v_u_10, (ref) v_u_8, (ref) v_u_12, (copy) v_u_14
			local v16 = true
			if v16 then
				v16 = not v_u_10:GetAttribute("FirstTimePlayer")
			end
			local v17 = v_u_8:GetData()
			if v16 then
				v16 = v17.AdminQuest ~= nil
			end
			v_u_12.SideBtns.AdminQuest.Visible = v16
			if not v16 then
				v_u_14:Close()
			end
		end
		local v19 = true
		if v19 then
			v19 = not v_u_10:GetAttribute("FirstTimePlayer")
		end
		local v20 = v_u_8:GetData()
		if v19 then
			v19 = v20.AdminQuest ~= nil
		end
		v_u_12.SideBtns.AdminQuest.Visible = v19
		if not v19 then
			v_u_14:Close()
		end
		v_u_8:GetPathSignal("AdminQuest/@"):Connect(v18)
		v_u_4({
			["instance"] = v_u_12.SideBtns.AdminQuest,
			["offset"] = 0.075,
			["onclick"] = function()
				-- upvalues: (copy) v_u_14
				v_u_14:Toggle()
			end
		})
		if v_u_9:HasBeenAssignedABTest(v_u_2.LocalPlayer) then
			v_u_12.SideBtns.Ascend.Visible = true
			v_u_4({
				["instance"] = v_u_12.SideBtns.Ascend,
				["offset"] = 0.075,
				["onclick"] = function()
					-- upvalues: (ref) v_u_3, (ref) v_u_13
					v_u_3:Open(v_u_13)
				end
			})
			v_u_12.SideBtns.Ascend.Visible = not v_u_10:GetAttribute("FirstTimePlayer")
			local v_u_21 = nil
			v_u_21 = v_u_10:GetAttributeChangedSignal("FirstTimePlayer"):Connect(function()
				-- upvalues: (ref) v_u_10, (ref) v_u_12, (ref) v_u_21
				local v22 = not v_u_10:GetAttribute("FirstTimePlayer")
				v_u_12.SideBtns.Ascend.Visible = v22
				if v22 and v_u_21 then
					v_u_21:Disconnect()
					v_u_21 = nil
				end
			end)
		end
		while v_u_7:IsHiddenFromUpdate("Trade Tokens") do
			task.wait(1)
		end
		v_u_12.SideBtns.Trade.Visible = not v_u_10:GetAttribute("FirstTimePlayer")
		v_u_4({
			["instance"] = v_u_12.SideBtns.Trade,
			["offset"] = 0.1,
			["onclick"] = function()
				-- upvalues: (ref) v_u_3, (ref) v_u_11
				v_u_3:Toggle(v_u_11.TradeMenu)
			end
		})
	end
}
task.spawn(v23.Start, v23)
return v23