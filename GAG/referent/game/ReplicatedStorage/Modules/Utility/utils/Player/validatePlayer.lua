return function(p1, p2)
	if p2 then
		if not p1 then
			return nil
		end
		local v3 = p1.Character or p1.CharacterAdded:Wait()
		return v3, v3:WaitForChild("HumanoidRootPart"), v3:WaitForChild("Humanoid")
	elseif p1 then
		local v4 = p1.Character
		if v4 then
			local v5 = v4:FindFirstChild("HumanoidRootPart")
			if v5 then
				local v6 = v4:FindFirstChild("Humanoid")
				if v6 then
					if v6.Health <= 0 then
						return nil
					else
						return v4, v5, v6
					end
				else
					return nil
				end
			else
				return nil
			end
		else
			return nil
		end
	else
		return nil
	end
end