local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("RunService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = game:GetService("TweenService")
require(v2.Modules.TradeControllers.TradingController)
local v_u_7 = require(v2.Modules.TradeControllers.TradingUserInterfaceController.TradeUIItemRenderers)
local v_u_8 = v4.LocalPlayer.PlayerGui
v_u_8:WaitForChild("TradingUI")
local v_u_9 = v_u_8:WaitForChild("TradeItemHover").TradeItemHover
local v10 = {}
local v_u_11 = v_u_9.CanvasGroup.Main.Stats
local v_u_12 = 0
local v_u_13 = 0
local v_u_14 = false
local v_u_15 = false
local v_u_16 = nil
local v_u_17 = false
local v_u_18 = 0
local v_u_19 = {}
local function v_u_23()
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_8
	local v20 = v_u_1:GetMouseLocation() - v_u_5:GetGuiInset()
	local v21 = nil
	for _, v22 in v_u_8:GetGuiObjectsAtPosition(v20.X, v20.Y) do
		if v22:IsDescendantOf(v_u_8) and (v22:HasTag("TradingUserInterfaceTargetable") and (v20 - v22.AbsolutePosition).Magnitude < (1 / 0)) then
			v21 = v22
		end
	end
	return v21
end
function v10.AddItemToData(_, p24, p25)
	-- upvalues: (ref) v_u_19
	v_u_19[p24] = p25
end
function v10.ClearItemsData(_)
	-- upvalues: (ref) v_u_19
	table.clear(v_u_19)
	v_u_19 = {}
end
v3.RenderStepped:Connect(function(p26)
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_9, (copy) v_u_23, (ref) v_u_12, (ref) v_u_16, (ref) v_u_14, (ref) v_u_13, (ref) v_u_15, (copy) v_u_11, (ref) v_u_18, (copy) v_u_6, (ref) v_u_17, (copy) v_u_7, (ref) v_u_19
	local v27 = v_u_1:GetMouseLocation() - v_u_5:GetGuiInset()
	v_u_9.Position = UDim2.fromOffset(v27.X, v27.Y)
	local v28 = v_u_23()
	local v29
	if v_u_16 == v28 and v28 ~= nil then
		local v30 = v_u_12 + p26
		v29 = math.clamp(v30, 0, 0.2)
	else
		v29 = 0
	end
	v_u_12 = v29
	v_u_16 = v28
	v_u_14 = v_u_12 >= 0.2
	if v_u_14 then
		local v31 = v_u_13 + p26
		v_u_13 = math.clamp(v31, 0, 1)
	end
	v_u_15 = v_u_13 >= 1
	if v_u_11.AbsoluteCanvasSize.Y >= v_u_11.AbsoluteWindowSize.Y and v_u_15 then
		v_u_18 = v_u_18 + v_u_11.AbsoluteCanvasSize.Y / 25 * p26
		local v32 = v_u_18 % v_u_11.AbsoluteCanvasSize.Y
		v_u_6:Create(v_u_11, TweenInfo.new(0.1), {
			["CanvasPosition"] = Vector2.new(0, v32)
		}):Play()
	end
	if v_u_14 ~= v_u_17 then
		v_u_18 = 0
		v_u_13 = 0
		v_u_17 = v_u_14
		v_u_7.CleanUpAllSegments()
		if v28 then
			v28 = v28:GetAttribute("UUID")
		end
		local v33 = v_u_19[v28]
		local v34 = v33 and v_u_7.ItemRenderers[v33.type]
		if v34 then
			v34(v33)
			local _ = #v_u_11:GetChildren() <= 2
		end
		local v35 = {
			["GroupTransparency"] = v_u_14 and 0 or 1
		}
		v_u_6:Create(v_u_9.CanvasGroup, TweenInfo.new(0.1), v35):Play()
	end
end)
return v10