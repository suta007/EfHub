local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TextChatService")
local v_u_3 = require(game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ChatMiddleware"):WaitForChild("RankMap"))
local v_u_4 = require(v1.Modules.Chalk)
return function(p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	if type(p5) == "string" then
		v_u_2.TextChannels.RBXGeneral:DisplaySystemMessage(p5)
	else
		local v6 = p5.Message
		local v7 = p5.Author
		if v7 and v7.Name then
			local v8 = v7.NameColor and v_u_4.color(v7.NameColor)(v7.Name) or v7.Name
			if v7.Rank then
				v8 = v_u_3[v7.Rank]:format(v8) or v8
			end
			v6 = ("%*%* %*"):format(v8, v7.Verified and utf8.char(57344) or "", v6)
		end
		v_u_2.TextChannels.RBXGeneral:DisplaySystemMessage(v6)
	end
end