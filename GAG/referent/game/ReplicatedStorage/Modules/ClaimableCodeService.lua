local v_u_1 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("ClaimableCodeService")
return {
	["ClaimCode"] = function(_, p2)
		-- upvalues: (copy) v_u_1
		return v_u_1:FireServer("ClaimCode", p2)
	end
}