local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = require("../FriendsAPI")
require("../DataService")
require("../Notification")
require("../GuiController")
require("../TradeControllers/TradingController")
local v_u_4 = require("../TradeControllers/TradeInventoryController")
require("../../Data/TradeData")
require(v_u_2.Modules.PlayClickSound)
local v_u_5 = v_u_1.LocalPlayer or v_u_1.PlayerAdded:Wait()
local v_u_6 = v_u_5.PlayerGui.TradeMenu
local v_u_7 = v_u_6.TradeMenuFrame.FrameSECTIONS.Players
local v_u_8 = v_u_7.ScrollingFrame
local v_u_9 = v_u_8.UIListLayout.Template
local v_u_10 = true
local v_u_23 = {
	["SetUpPlayersUI"] = function(_)
		-- upvalues: (copy) v_u_7, (copy) v_u_23, (copy) v_u_6, (copy) v_u_1, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
		v_u_7:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: (ref) v_u_23
			v_u_23:Update()
		end)
		v_u_6:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: (ref) v_u_23
			v_u_23:Update()
		end)
		v_u_1.PlayerAdded:Connect(function(_)
			-- upvalues: (ref) v_u_23
			v_u_23:Update()
		end)
		v_u_1.PlayerRemoving:Connect(function(_)
			-- upvalues: (ref) v_u_23
			v_u_23:Update()
		end)
		v_u_4.OnViewPlayerChanged:Connect(function(_)
			-- upvalues: (ref) v_u_23
			v_u_23:Update()
		end)
		v_u_3:OnFriendshipUpdate(v_u_5, function()
			-- upvalues: (ref) v_u_23
			v_u_23:Update()
		end)
	end,
	["GetCardFor"] = function(_, p_u_11)
		-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_1, (copy) v_u_4, (copy) v_u_6, (copy) v_u_2
		local v12 = p_u_11.UserId
		local v13 = tostring(v12)
		local v14 = v_u_8:FindFirstChild(v13)
		if not v14 then
			v14 = v_u_9:Clone()
			v14.Name = v13
			v14.Title.Text = "@" .. p_u_11.Name
			v14.Headshot.Image = v_u_1:GetUserThumbnailAsync(p_u_11.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size48x48)
			local _ = p_u_11.Name .. " Inventory\'s"
			local v_u_15 = v14.Options.Inventory.Activated:Connect(function()
				-- upvalues: (ref) v_u_4, (copy) p_u_11, (ref) v_u_6
				if v_u_4:CanViewInventory(p_u_11) then
					v_u_4:OpenInventory(p_u_11, v_u_6)
				end
			end)
			local v_u_16 = v14.Options.Send.Activated:Connect(function()
				-- upvalues: (copy) p_u_11, (ref) v_u_2
				if p_u_11.Parent ~= nil then
					v_u_2.GameEvents.TradeEvents.SendRequest:FireServer(p_u_11)
				end
			end)
			v14.Destroying:Once(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_16
				v_u_15:Disconnect()
				v_u_16:Disconnect()
			end)
			v14.Parent = v_u_8
		end
		return v14
	end,
	["Update"] = function(_)
		-- upvalues: (copy) v_u_7, (copy) v_u_6, (ref) v_u_10, (copy) v_u_1, (copy) v_u_23, (copy) v_u_5, (copy) v_u_4
		if v_u_7.Visible and (v_u_6.Enabled and v_u_10) then
			v_u_10 = false
			v_u_7.Empty.Visible = #v_u_1:GetPlayers() < 2
			v_u_23:Clear()
			for _, v17 in v_u_1:GetPlayers() do
				if v17 ~= v_u_5 then
					local v18 = v_u_23:GetCardFor(v17)
					local v19 = v_u_4:CanViewInventory(v17)
					v18.Image = "rbxassetid://101580464985706"
					v18.Options.Send.BackgroundColor3 = Color3.fromRGB(55, 237, 41)
					v18.Options.Send.UIStroke.Color = Color3.fromRGB(11, 152, 0)
					v18.Options.Send.Label.TextTransparency = 0
					v18.Options.Send.Label.UIStroke.Color = Color3.fromRGB(0, 85, 0)
					v18.Options.Send.Label.UIStroke.Transparency = 0
					if v19 then
						v18.Options.Inventory.BackgroundColor3 = Color3.fromRGB(0, 192, 255)
						v18.Options.Inventory.UIStroke.Color = Color3.fromRGB(0, 99, 132)
						v18.Options.Inventory.Label.TextTransparency = 0
						v18.Options.Inventory.Label.UIStroke.Color = Color3.fromRGB(0, 70, 103)
						v18.Options.Inventory.Label.UIStroke.Transparency = 0
					else
						v18.Options.Inventory.BackgroundColor3 = Color3.fromRGB(92, 92, 92)
						v18.Options.Inventory.UIStroke.Color = Color3.fromRGB(65, 65, 65)
						v18.Options.Inventory.Label.TextTransparency = 0.65
						v18.Options.Inventory.Label.UIStroke.Color = Color3.fromRGB(53, 53, 53)
						v18.Options.Inventory.Label.UIStroke.Transparency = 0.75
					end
				end
			end
			v_u_10 = true
		end
	end,
	["Clear"] = function(_)
		-- upvalues: (copy) v_u_8, (copy) v_u_1
		for _, v20 in v_u_8:GetChildren() do
			if not v20:IsA("UIComponent") then
				local v21 = v_u_1
				local v22 = v20.Name
				if not v21:GetPlayerByUserId((tonumber(v22))) then
					v20:Destroy()
				end
			end
		end
	end
}
return v_u_23