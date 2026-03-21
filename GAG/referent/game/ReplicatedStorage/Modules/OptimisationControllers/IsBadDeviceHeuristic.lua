local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = { 813163219, 327423121 }
local v_u_4 = require(v1.Modules.OptimisationControllers.IsMobile)
local v_u_5 = require(v1.Modules.IsDev)
return function()
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	if v_u_5() and table.find(v_u_3, v_u_2.UserId) then
		return true
	elseif v_u_4() then
		if UserSettings().GameSettings.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
			return false
		else
			return UserSettings().GameSettings.SavedQualityLevel.Value <= Enum.SavedQualitySetting.QualityLevel4.Value
		end
	else
		return false
	end
end