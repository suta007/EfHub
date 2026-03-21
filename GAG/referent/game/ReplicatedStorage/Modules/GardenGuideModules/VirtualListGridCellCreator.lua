local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = require(v1.Modules.GardenGuideModules.DataModules.GGStaticData)
require(v1.Modules.TradePlaza.TradePlazaUtils)
require(v1.Modules.TradeTokens.TokenRAPController)
require(v1.Modules.TradeTokens.TokenRAPUtil)
require(v1.Modules.NumberUtil)
require(v1.Modules.TradeControllers.TradeItemHoverController)
require(v1.Modules.TradeTokens.TokenRAPChartController)
local v_u_4 = require(v1.Modules.TradeTokens.TokenRAPController)
require(v1.Data.TradeData)
local v_u_5 = require(script.VListDataProcessors)
local v_u_6 = require(script.VListCellRenderers)
local v_u_7 = require(script.VListCellFunctionality)
require(script.VListTypes)
local _ = v2.LocalPlayer.PlayerGui.TradeBoothInventory
local v_u_8 = v1.Data.TradePlaza.IndexTemplates.ItemTemplate
local _ = v3.RarityColorMap
local _ = v3.AnimatedColors
local v_u_9 = {}
return {
	["CreateGridCell"] = function(p_u_10, _, p_u_11, p_u_12)
		-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7
		local v13 = v_u_5[p_u_11]
		if v13 then
			local v_u_14 = v13(p_u_10)
			local v_u_15 = p_u_12.ExistingCell or v_u_8:Clone()
			v_u_6.RenderCell(v_u_15, v_u_14, p_u_12)
			local v_u_16
			if v_u_14.RAPValue and v_u_14.RAPValue ~= 0 or p_u_11 == "GardenGuide" then
				v_u_16 = nil
			else
				local v_u_17 = v_u_4:GetRAPById(p_u_10.type, p_u_10.id)
				v_u_16 = task.defer(function()
					-- upvalues: (ref) v_u_17, (ref) v_u_4, (copy) p_u_10, (copy) v_u_15
					while not v_u_17 do
						v_u_17 = v_u_4:GetRAPByIdAsync(p_u_10.type, p_u_10.id)
						task.wait(0.5)
					end
					if v_u_17 and v_u_15:IsDescendantOf(game) then
						v_u_15:SetAttribute("RAPValue", v_u_17)
					end
					return nil
				end)
			end
			if not v_u_9[v_u_15] then
				v_u_9[v_u_15] = v_u_15.SENSOR.Activated:Connect(function()
					-- upvalues: (ref) v_u_7, (copy) p_u_11, (copy) v_u_15, (copy) v_u_14, (copy) p_u_12
					v_u_7[p_u_11](v_u_15, v_u_14, p_u_12)
				end)
				v_u_15.Destroying:Once(function()
					-- upvalues: (ref) v_u_16, (ref) v_u_9, (copy) v_u_15
					if v_u_16 then
						task.cancel(v_u_16)
					end
					v_u_9[v_u_15]:Disconnect()
					v_u_9[v_u_15] = nil
				end)
			end
			return v_u_15
		end
		warn((("No processor for %*"):format(p_u_11)))
	end
}