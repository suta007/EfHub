local v_u_1 = game:GetService("LocalizationService")
local v_u_2 = game.Players.LocalPlayer.PlayerGui
v_u_2:WaitForChild("BackpackGui")
local v3 = game:GetService("Players")
if v3.LocalPlayer == nil then
	v3:GetPropertyChangedSignal("LocalPlayer"):Wait()
end
local v_u_4 = nil
local v_u_5 = {}
return {
	["FormatByKey"] = function(_, p6, p7)
		-- upvalues: (ref) v_u_4, (copy) v_u_2, (copy) v_u_1
		if v_u_4 == nil then
			v_u_4 = v_u_2.CoreScriptLocalization:GetTranslator(v_u_1.RobloxLocaleId)
		end
		return v_u_4:FormatByKey(p6, p7)
	end,
	["FormatByKeyForLocale"] = function(_, p8, p9, p10)
		-- upvalues: (copy) v_u_5, (copy) v_u_2
		local v11 = v_u_5[p9]
		if not v11 then
			v11 = v_u_2.CoreScriptLocalization:GetTranslator(p9)
			v_u_5[p9] = v11
		end
		return v11:FormatByKey(p8, p10)
	end
}