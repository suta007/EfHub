return {
	["GenerateArrow"] = function(p1, p2, p3)
		local v4 = game.ReplicatedStorage.Arrow:Clone()
		v4.Random_Seed.Value = p3
		v4.Target_Player.Value = p1.Name
		v4.Anchored = true
		v4.Position = p2
		v4.CanCollide = false
		v4.Parent = game.Workspace.Tutorial_Arrows
		local v5 = Instance.new("Attachment")
		v5.Name = p3
		v5.Parent = p1.Character.HumanoidRootPart
		v5.Name = tostring(p3) .. "_Arrow"
		v5.CFrame = CFrame.new(0, 0, 0)
		v4.Beam.Attachment1 = v5
		v4.Beam.Attachment0 = v4.Attachment
		v4.Attachment.WorldCFrame = CFrame.new(p2)
		return v4
	end,
	["Remove_Arrow"] = function(p6)
		local v7 = p6 and (p6.Parent and game.Players:FindFirstChild(p6.Target_Player.Value))
		if v7 then
			local v8 = v7.Character.HumanoidRootPart
			local v9 = p6.Random_Seed.Value .. "_Arrow"
			local v10 = v8:FindFirstChild((tostring(v9)))
			if v10 then
				v10:Destroy()
			end
			p6:Destroy()
		end
	end
}