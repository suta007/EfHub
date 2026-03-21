local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("SocialService")
local v_u_3 = require(v_u_1.Modules.PlatformProvider)
local v_u_11 = {
	["Prompt"] = function(_, p_u_4, p5)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v6 = string.lower(v_u_3:GetPlatform())
		local v7 = v6 == "computer" and "pc" or (v6 == "unknowncomputerormobile" and "mobile" or v6)
		if table.find(string.split(p5, "/"), v7) then
			xpcall(function()
				-- upvalues: (ref) v_u_2, (copy) p_u_4
				v_u_2:PromptRsvpToEventAsync(p_u_4)
			end, warn)
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_1, (copy) v_u_11
		v_u_1.GameEvents.PromptRSVP.OnClientEvent:Connect(function(p8, p9, p10)
			-- upvalues: (ref) v_u_11
			if p10 then
				task.wait(Random.new():NextInteger(30, 120))
			end
			v_u_11:Prompt(p8, p9)
		end)
	end
}
task.spawn(v_u_11.Start, v_u_11)
return v_u_11