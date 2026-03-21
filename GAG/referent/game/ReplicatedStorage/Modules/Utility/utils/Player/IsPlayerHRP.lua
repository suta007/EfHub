return function(p1)
	local v2 = p1.Parent
	if v2 then
		local v3 = game.Players:GetPlayerFromCharacter(v2)
		if v3 and p1 == v2:FindFirstChild("HumanoidRootPart") then
			return v3
		else
			return false
		end
	else
		return false
	end
end