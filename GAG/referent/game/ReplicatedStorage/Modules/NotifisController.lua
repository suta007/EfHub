local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require("./DataService")
local v_u_4 = require("./GuiController")
local v_u_5 = require("../Comma_Module")
local v_u_6 = require(v1.Modules.TradeControllers.TradingController)
local v7 = v2.LocalPlayer.PlayerGui
local v_u_8 = v7:WaitForChild("TradeNotifs")
local v_u_9 = v_u_8:WaitForChild("PromptPurchase")
local v_u_10 = v_u_8:WaitForChild("PurchaseCompleted")
local v_u_11 = v7:WaitForChild("UnfairTrade"):WaitForChild("UnfairTrade")
v7:WaitForChild("TradingUI")
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_29 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_29, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_6
		v_u_4:UsePopupAnims(v_u_8)
		for _, v15 in v_u_8:GetChildren() do
			local v16 = v15:FindFirstChild("Close", 9000000000)
			if v16 and v15.Name ~= "UnfairTrade" then
				v16.Txt.Activated:Connect(function()
					-- upvalues: (ref) v_u_29
					v_u_29:Close()
				end)
			end
		end
		v_u_9.Options.All.Activated:Connect(function()
			-- upvalues: (ref) v_u_29
			v_u_29:Close("Robux")
		end)
		v_u_9.Options.Tier.Activated:Connect(function()
			-- upvalues: (ref) v_u_29
			v_u_29:Close("Tokens")
		end)
		v_u_10.Ok.Activated:Connect(function()
			-- upvalues: (ref) v_u_29
			v_u_29:Close()
		end)
		v_u_11.Options.Yes.Activated:Connect(function()
			-- upvalues: (ref) v_u_6
			v_u_6:Accept()
		end)
	end,
	["Open"] = function(_, p17, p18)
		-- upvalues: (ref) v_u_13, (copy) v_u_8, (copy) v_u_4, (ref) v_u_14, (ref) v_u_12
		if v_u_13 then
			v_u_13.Visible = false
			v_u_13 = nil
		end
		local v19 = v_u_8:FindFirstChild(p17)
		if v19 then
			v19.Visible = true
			v_u_13 = v19
		end
		local v20 = v_u_4:GetStateForGroup(v_u_4:GetGroupForGui(v_u_8)).Gui:Get()
		if v20 == v_u_8 then
			v_u_14 = nil
		else
			v_u_14 = v20
		end
		v_u_12 = p18
		v_u_4:Open(v_u_8)
	end,
	["Close"] = function(_, p21)
		-- upvalues: (ref) v_u_12, (copy) v_u_4, (copy) v_u_8, (ref) v_u_14
		if v_u_12 and p21 ~= nil then
			task.defer(v_u_12, p21)
			v_u_12 = nil
		end
		v_u_4:Close(v_u_8)
		if v_u_14 then
			v_u_4:Open(v_u_14)
			v_u_14 = nil
		end
	end,
	["PromptPurchase"] = function(_, p22, p23, p24)
		-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_5, (copy) v_u_29
		v_u_9.Title.Text = p22
		local v25 = v_u_3:GetData()
		v_u_9.Bottom.Price.Label.Text = v_u_5.Comma(v25.TradeData.Tokens)
		v_u_9.Options.All.Price.Text = "Buy \238\128\130 " .. v_u_5.Comma(p23) .. " Robux"
		v_u_9.Options.Tier.Price.Text = v_u_5.Comma(p23) .. " Tokens"
		v_u_29:Open("PromptPurchase", p24)
	end,
	["PurchaseCompleted"] = function(_, p26, p27)
		-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_29
		v_u_10.Bottom.Label.Text = ("You have successfully bought %*."):format(p26)
		v_u_10.Bottom.Price.Label.Text = v_u_5.Comma(p27)
		v_u_29:Open("PurchaseCompleted")
		game.SoundService.Purchase:Play()
	end,
	["HideAllUI"] = function(_)
		-- upvalues: (copy) v_u_8
		for _, v28 in v_u_8:GetChildren() do
			if v28:IsA("ImageLabel") then
				v28.Visible = false
			end
		end
	end
}
task.spawn(v_u_29.Start, v_u_29)
return v_u_29