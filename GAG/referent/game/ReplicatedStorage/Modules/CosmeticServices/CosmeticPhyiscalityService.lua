local v_u_1 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("CosmeticPhysicalityService_Unreliable")
return {
	["UpdateCFrame"] = function(_, p2, p3)
		-- upvalues: (copy) v_u_1
		v_u_1:FireServer("UpdateCFrame", p2, p3)
	end
}