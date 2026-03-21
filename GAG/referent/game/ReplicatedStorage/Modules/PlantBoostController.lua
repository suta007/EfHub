local v_u_1 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")
return {
	["Boost"] = function(_, p2)
		-- upvalues: (copy) v_u_1
		v_u_1.PlantBoostServiceEvents.Boost:FireServer(p2)
	end
}