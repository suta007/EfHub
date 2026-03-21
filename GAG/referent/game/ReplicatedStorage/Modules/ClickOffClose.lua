local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = game:GetService("UserInputService")
local v_u_4 = v2.LocalPlayer.PlayerGui
local v_u_5 = {}
local v6 = {}
local v_u_7 = {
	["CosmeticUI"] = true,
	["Trading"] = true,
	["TradingUI"] = true,
	["TokensInfo"] = true,
	["BuyTokens"] = true,
	["TradingPin"] = true,
	["TradeNotifs"] = true,
	["BuyCarrotsUI"] = true
}
local v_u_8 = {
	["InsertionPoint"] = true,
	["USER_IMAGE"] = true
}
local function v_u_12(p9)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_8
	for _, v10 in v_u_4:GetGuiObjectsAtPosition(p9.X, p9.Y) do
		local v11 = v10:FindFirstAncestorOfClass("ScreenGui")
		if (v10.BackgroundTransparency ~= 1 and v10.Visible or (v_u_7[v10.Name] or (v_u_7[v10.Parent.Name] or v_u_7[v11]))) and not (v_u_8[v10.Name] and v_u_8[v11]) then
			return true
		end
	end
	return false
end
function v6.AddGui(p13)
	-- upvalues: (ref) v_u_5
	if not table.find(v_u_5, p13) then
		local v14 = v_u_5
		table.insert(v14, p13)
	end
end
function v6.RemoveGui(p15)
	-- upvalues: (ref) v_u_5
	local v16 = table.find(v_u_5, p15)
	if v16 then
		if #v_u_5 > 1 then
			if table.find(v_u_5, p15) == 1 then
				v_u_5 = {}
			end
		else
			table.remove(v_u_5, v16)
		end
	else
		return
	end
end
v3.InputBegan:Connect(function(p17, p18)
	-- upvalues: (copy) v_u_12, (ref) v_u_5, (copy) v_u_1
	if not p18 then
		if (p17.UserInputType == Enum.UserInputType.MouseButton1 or p17.UserInputType == Enum.UserInputType.Touch) and not v_u_12(p17.Position) then
			local v19 = #v_u_5
			local v20 = table.remove(v_u_5, #v_u_5)
			if not v20 then
				return
			end
			local v21 = require(v_u_1.Modules.GuiController)
			if v19 > 1 then
				local v22 = v_u_5[#v_u_5]
				v21:Close(v20)
				v21:Open(v22)
				return
			end
			if v19 == 1 then
				v21:Close(v20)
			end
		end
	end
end)
return v6