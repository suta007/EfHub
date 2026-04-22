local v_u_1 = game:GetService("ReplicatedStorage")
return {
	["GetRaffleDataAsync"] = function(_)
		-- upvalues: (copy) v_u_1
		return v_u_1.GameEvents.EasterRaffleService.GetRaffleDataAsync:InvokeServer()
	end,
	["GetPlayerRaffleDataAsync"] = function(_)
		-- upvalues: (copy) v_u_1
		return v_u_1.GameEvents.EasterRaffleService.GetPlayerRaffleDataAsync:InvokeServer()
	end,
	["SubmitEgg"] = function(_)
		-- upvalues: (copy) v_u_1
		v_u_1.GameEvents.EasterRaffleService.SubmitEgg:FireServer()
	end
}