local v1 = script.Parent
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Modules.GuiController)
local v_u_5 = require(v3.Modules.PetEquipSlotsUIController)
local v6 = require(v3.Modules.TradeControllers.TradeWorldController)
require(v3.Modules.Notification)
local v_u_7 = v2.LocalPlayer
local v8 = script.Parent.Parent.Parent
if v6:IsInWorld() and v8 then
	v8.Visible = false
	v8.Buttons.Go.Interactable = false
else
	v1.Activated:Connect(function()
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
		v_u_5:RefreshUI()
		v_u_5:SetMode("Equip")
		v_u_4:Open(v_u_7.PlayerGui:WaitForChild("PetEquipSlots_UI"))
	end)
end