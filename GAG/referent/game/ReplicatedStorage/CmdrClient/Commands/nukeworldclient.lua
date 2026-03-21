local v_u_1 = game:GetService("Players")
return {
	["Name"] = "nukeworldclient",
	["Aliases"] = { "nwc" },
	["Description"] = "[Client] Clears the world aside from basepart",
	["Group"] = "GameCommands",
	["Args"] = {},
	["ClientRun"] = function()
		-- upvalues: (copy) v_u_1
		local v2 = workspace:WaitForChild("BasePlate")
		local v3 = {}
		for _, v4 in v_u_1:GetPlayers() do
			if v4.Character then
				local v5 = v4.Character
				table.insert(v3, v5)
			end
		end
		for _, v6 in workspace:GetDescendants() do
			if v6:IsA("BasePart") and not (v6:IsA("Terrain") or v6:IsDescendantOf(v2)) then
				local v7 = false
				for _, v8 in v3 do
					if v6:IsDescendantOf(v8) then
						v7 = true
						break
					end
				end
				if not v7 then
					v6:Destroy()
				end
			end
		end
	end
}