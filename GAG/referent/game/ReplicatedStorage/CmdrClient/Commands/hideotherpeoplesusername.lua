local v_u_1 = game:GetService("Players")
return {
	["Name"] = "hideotherpeoplesusername",
	["Aliases"] = { "hopu" },
	["Description"] = "[Client] Hide other peoples usernames!",
	["Group"] = "GameCommands",
	["Args"] = {},
	["ClientRun"] = function()
		-- upvalues: (copy) v_u_1
		local v2 = 0
		for _, v3 in workspace.Farm:GetChildren() do
			local v4 = v3:FindFirstChild("Sign", true)
			if v4 then
				local v5 = v4:FindFirstChild("SurfaceGui", true)
				if v5 then
					v5:Destroy()
				end
			end
		end
		for _, v6 in v_u_1:GetPlayers() do
			local v7 = v6.Character
			if v7 then
				local v8 = v7:FindFirstChild("Humanoid")
				if v8 then
					v2 = v2 + 1
					v8.NameDisplayDistance = 0
					v8.HealthDisplayDistance = 0
				end
			end
		end
		return ("Hidden other people\'s usernames! %*"):format(v2)
	end
}