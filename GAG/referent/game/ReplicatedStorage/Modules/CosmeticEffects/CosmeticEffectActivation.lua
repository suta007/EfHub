local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = require(v1.Modules.CosmeticEffects.CosmeticEffectsUtils)
local v_u_7 = require(v1.Modules.CosmeticEffects.CosmeticEffectInvoker)
local v8 = require(v1.Modules.CreateTagHandler)
local v_u_9 = workspace.CurrentCamera
local v_u_10 = v3.LocalPlayer
local v_u_11 = {}
local function v_u_15(p12)
	-- upvalues: (copy) v_u_9, (ref) v_u_11
	local v13 = v_u_9:ViewportPointToRay(p12.X, p12.Y)
	local v14 = RaycastParams.new()
	v14.FilterDescendantsInstances = v_u_11
	v14.FilterType = Enum.RaycastFilterType.Include
	return workspace:Raycast(v13.Origin, v13.Direction * 50, v14)
end
local function v_u_20(p16)
	-- upvalues: (copy) v_u_15, (copy) v_u_7
	local v17 = v_u_15(p16)
	if v17 then
		local v18 = v17.Instance
		if v18 then
			if v18 then
				repeat
					v18 = v18.Parent
				until not v18 or v18:HasTag("CosmeticEffect")
			end
			if v18 then
				local v19 = v18:GetAttribute("EffectType")
				if v19 then
					v_u_7:PlayEffect(v18, v19)
				else
					warn((("No EffectType attribute found on %*"):format(v18)))
				end
			else
				warn("Cannot find Cosmetic Model Instance")
				return
			end
		else
			return
		end
	else
		return
	end
end
v_u_2.InputBegan:Connect(function(p21, p22)
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_20, (copy) v_u_2
	if not p22 then
		local v23 = v_u_6.IsPlayerOnFarm(v_u_10)
		if p21.UserInputType == Enum.UserInputType.MouseButton1 and v23 then
			v_u_20(v_u_2:GetMouseLocation())
		end
	end
end)
v_u_2.TouchTap:Connect(function(p24, p25)
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_20, (copy) v_u_5
	if not p25 then
		local v26 = v_u_6.IsPlayerOnFarm(v_u_10)
		if #p24 > 0 and v26 then
			v_u_20(p24[1] + v_u_5:GetGuiInset())
		end
	end
end)
v8({
	["Tag"] = "CosmeticEffect",
	["OnInstanceAdded"] = function(p27)
		-- upvalues: (ref) v_u_11, (copy) v_u_4
		if p27:IsDescendantOf(workspace) then
			v_u_11 = v_u_4:GetTagged("CosmeticEffect")
		end
	end,
	["OnInstanceRemoved"] = function(_)
		-- upvalues: (ref) v_u_11, (copy) v_u_4
		v_u_11 = v_u_4:GetTagged("CosmeticEffect")
	end
})
return {}