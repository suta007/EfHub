local v_u_1 = game:GetService("MarketplaceService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players")
local v_u_4 = v_u_3.LocalPlayer
local v_u_5 = v_u_4.PlayerGui:WaitForChild("GiftPlayerList")
local v_u_6 = require(v_u_2.Modules.MarketController)
local v_u_7 = require(v_u_2.Modules.GuiController)
local v_u_8 = require(v_u_2.Data.GiftData)
local v_u_9 = v_u_2.GameEvents.SeasonPass.GetPlayersWithSeasonPass
local v_u_35 = {
	["CurrentProduct"] = nil,
	["PromptGift"] = function(_, p10)
		-- upvalues: (copy) v_u_8, (copy) v_u_35, (copy) v_u_9, (copy) v_u_5, (copy) v_u_7
		local v11 = v_u_8[p10]
		if v11 then
			v_u_35.CurrentProduct = v11.NormalId
			local v12 = v_u_9:InvokeServer()
			local v13 = 0
			for _, v14 in v_u_5.Frame.ScrollingFrame:GetChildren() do
				if v14:IsA("Frame") then
					v14.Visible = true
					if p10 == "Season Pass" and v12[v14.Name] then
						v14.Visible = false
						v13 = v13 + 1
					end
				end
			end
			v_u_7:Open(v_u_5)
		else
			warn((("Gift not found for \"%*\""):format(p10)))
		end
	end,
	["PromptGiftFromGiftId"] = function(_, p15)
		-- upvalues: (copy) v_u_8, (copy) v_u_35
		local v16 = nil
		for v17, v18 in v_u_8 do
			if p15 == v18.GiftId then
				v16 = v17
				break
			end
		end
		if v16 then
			v_u_35:PromptGift(v16)
		else
			warn((("Gift not found for \"%*\""):format(p15)))
		end
	end,
	["PromptGiftFromNormalId"] = function(_, p19)
		-- upvalues: (copy) v_u_8, (copy) v_u_35
		local v20 = nil
		for v21, v22 in v_u_8 do
			if p19 == v22.NormalId then
				v20 = v21
				break
			end
		end
		if v20 then
			v_u_35:PromptGift(v20)
		else
			warn((("Gift not found for \"%*\""):format(p19)))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_35, (copy) v_u_1, (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
		v_u_7:UsePopupAnims(v_u_5)
		local v_u_23 = false
		local v_u_24 = nil
		v_u_5.Frame.Close.Activated:Connect(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_5
			v_u_7:Close(v_u_5)
		end)
		v_u_6.PromptProductPurchaseInitiated:Connect(function(_, p25)
			-- upvalues: (ref) v_u_35, (ref) v_u_24, (ref) v_u_5
			if p25 == v_u_35.CurrentProduct then
				v_u_24 = true
				v_u_5.Black.ZIndex = 1000
			end
		end)
		v_u_1.PromptProductPurchaseFinished:Connect(function()
			-- upvalues: (ref) v_u_24, (ref) v_u_5, (ref) v_u_7
			if v_u_24 then
				v_u_24 = false
				v_u_5.Black.ZIndex = -1
				v_u_7:Close(v_u_5)
			end
		end)
		local function v29(p_u_26)
			-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_35, (ref) v_u_23, (ref) v_u_24, (ref) v_u_7, (ref) v_u_2, (ref) v_u_3
			if p_u_26 ~= v_u_4 then
				local v27 = v_u_5.Frame.ScrollingFrame.UIListLayout.Template:Clone()
				local v28 = p_u_26.UserId
				v27.Name = tostring(v28)
				v27.Button.Headshot.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=180&h=180"):format(p_u_26.UserId)
				v27.Button.Username.Text = ("@%*"):format(p_u_26.Name)
				v27.Parent = v_u_5.Frame.ScrollingFrame
				v27.Button.Activated:Connect(function()
					-- upvalues: (ref) v_u_35, (ref) v_u_23, (ref) v_u_24, (ref) v_u_7, (ref) v_u_5, (ref) v_u_2, (copy) p_u_26
					if v_u_35.CurrentProduct then
						if not (v_u_23 or v_u_24) then
							v_u_7:Close(v_u_5)
							v_u_23 = true
							v_u_2.GameEvents.Gift.SendGiftTo:FireServer({
								["productId"] = v_u_35.CurrentProduct,
								["targetUserId"] = p_u_26.UserId
							})
							task.wait(3)
							v_u_23 = false
						end
					else
						return
					end
				end)
				v_u_5.Frame.ScrollingFrame.NoPlayers.Visible = #v_u_3:GetPlayers() <= 1
			end
		end
		v_u_3.PlayerAdded:Connect(v29)
		for _, v30 in v_u_3:GetPlayers() do
			task.spawn(v29, v30)
		end
		v_u_5.Frame.ScrollingFrame.NoPlayers.Visible = #v_u_3:GetPlayers() <= 1
		v_u_3.PlayerRemoving:Connect(function(p31)
			-- upvalues: (ref) v_u_5, (ref) v_u_3
			local v32 = v_u_5.Frame.ScrollingFrame
			local v33 = p31.UserId
			local v34 = v32:FindFirstChild((tostring(v33)))
			if v34 then
				v34:Destroy()
			end
			v_u_5.Frame.ScrollingFrame.NoPlayers.Visible = #v_u_3:GetPlayers() <= 1
		end)
	end
}
task.spawn(v_u_35.Start, v_u_35)
return v_u_35