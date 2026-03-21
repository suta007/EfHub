local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game.Players.LocalPlayer
local v6 = {
	["Start"] = function()
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v3 = require(v_u_1.UserGenerated.Client.ClientABTests)
		local v4 = v3.GetAssignmentsAsync(v_u_2, true) and v3.GetAttributes(v_u_2)
		if v4 then
			local _ = v4.AB_LoadingVariant or "Variant1"
		end
		local v5 = v_u_2.PlayerGui.LoadingGui
		require(script.Variants.Variant5).new(v5):startLoading()
	end
}
task.spawn(v6.Start)
return v6