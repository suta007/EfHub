local v_u_1 = {}
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = require(v3.Data.CosmeticRegistry.CosmeticMutableStats)
local v_u_6 = require(v3.Modules.CosmeticServices.CosmeticUpgradeService)
local v_u_7 = require(v3.Modules.CosmeticServices.CosmeticService)
local v_u_8 = require(v3.Modules.NumberUtil)
local v_u_9 = require(v3.Modules.MarketController)
local v_u_10 = require(v3.Modules.DataService)
local v_u_11 = require(v3.Modules.UseDynamicPrices)
local v_u_12 = require(v3.Comma_Module)
local v_u_13 = v2.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Shop_UI").Frame:WaitForChild("ScrollingFrame"):WaitForChild("CosmeticProducts")
local v_u_14 = v_u_13.List
local v_u_15 = v_u_14.Template
function v_u_1.GenerateCosmeticUpgrades(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_9, (copy) v_u_12, (copy) v_u_4, (copy) v_u_10, (copy) v_u_14, (copy) v_u_13
	local v16 = false
	for v_u_17, v_u_18 in v_u_5 do
		if v_u_18.UpgradeData.Enabled then
			v16 = true
			local v19 = v_u_15:Clone()
			v19.Visible = true
			local v_u_20 = v19:FindFirstChild("SHECKLES_TEXT", true)
			local v_u_21 = v19:FindFirstChild("ROBUX_TEXT", true)
			local v_u_22 = v19:FindFirstChild("EXTRA_TEXT", true)
			local v_u_23 = v19:FindFirstChild("UPGRADE_TEXT", true)
			local v_u_24 = v19:FindFirstChild("INCREMENT_TEXT", true)
			local v_u_25 = false
			local function v_u_35()
				-- upvalues: (ref) v_u_8, (ref) v_u_6, (copy) v_u_17, (copy) v_u_18, (copy) v_u_20, (ref) v_u_7, (copy) v_u_22, (copy) v_u_23, (copy) v_u_24, (ref) v_u_25, (copy) v_u_21, (ref) v_u_11, (ref) v_u_9, (ref) v_u_12, (ref) v_u_4
				local v26 = v_u_8.DisplaySheckles(v_u_6:GetUpgradePrice(v_u_17, v_u_6:GetUpgradeLevel(v_u_17)))
				local v27 = v_u_18.UpgradeData.FallbackPrice
				v_u_20.Text = ("%*"):format(v26)
				local v28 = v_u_7:GetMutableStat(v_u_17)
				local v29 = v_u_6:GetUpgradeValue(v_u_17, v_u_18.UpgradeData.MaxUpgrade) + v_u_18.Default
				v_u_22.Text = ("%*/%* Extra!"):format(v_u_6:GetUpgradeLevel(v_u_17), v_u_18.UpgradeData.MaxUpgrade)
				v_u_23.Text = v_u_18.Text
				v_u_24.Text = ("+%*"):format(v_u_18.UpgradeData.Increment)
				v_u_25 = v29 <= v28
				v_u_20.Visible = not v_u_25
				if v_u_25 then
					v_u_21.Text = "MAX"
				elseif v_u_11 or v27 == nil then
					if not v_u_11 then
						warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_21:GetFullName()))))
					end
					v_u_9:SetPriceLabel(v_u_21, v_u_18.UpgradeData.ProductId, ":robux: :value:")
				else
					v_u_21.Text = ("%* %*"):format(utf8.char(57346), (v_u_12.Comma(v27)))
				end
				local v30 = v_u_4
				local v31 = v_u_21
				local v32 = TweenInfo.new(0.4)
				local v33 = {}
				local v34
				if v_u_25 then
					v34 = UDim2.fromScale(0.65, 0.9)
				else
					v34 = UDim2.fromScale(0.5, 0.9)
				end
				v33.Size = v34
				v30:Create(v31, v32, v33):Play()
			end
			v19.LayoutOrder = v_u_18.LayoutOrder
			v_u_35()
			v_u_10:GetPathSignal((("CosmeticData/MutableStats/%*"):format(v_u_17))):Connect(function()
				-- upvalues: (copy) v_u_35
				v_u_35()
			end)
			v_u_20.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_25, (copy) v_u_35, (ref) v_u_6, (copy) v_u_17
				if not v_u_25 then
					v_u_35()
					v_u_6:Upgrade(v_u_17)
				end
			end)
			v_u_21.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_25, (copy) v_u_35, (ref) v_u_9, (copy) v_u_18
				if not v_u_25 then
					v_u_35()
					v_u_9:PromptPurchase(v_u_18.UpgradeData.ProductId, Enum.InfoType.Product)
				end
			end)
			v19.Parent = v_u_14
		end
	end
	v_u_13.Visible = v16
end
task.delay(1, function()
	-- upvalues: (copy) v_u_1
	v_u_1:GenerateCosmeticUpgrades()
end)
return v_u_1