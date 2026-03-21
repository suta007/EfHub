game:GetService("TextChatService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Chalk)
local v3 = v1:WaitForChild("GameEvents"):WaitForChild("DisplayChatMessage")
local v_u_4 = require(game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ChatMiddleware"):WaitForChild("RankMap"))
local v_u_5 = require(script.Parent)
v3.OnClientEvent:Connect(function(p6)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
	if type(p6) == "string" then
		v_u_5(p6)
	else
		local v7 = p6.Message
		local v8 = p6.Author
		if v8 and v8.Name then
			local v9 = v8.NameColor and v_u_2.color(v8.NameColor)(v8.Name) or v8.Name
			if v8.Rank then
				v9 = v_u_4[v8.Rank]:format(v9) or v9
			end
			v7 = ("%*%* %*"):format(v9, v8.Verified and utf8.char(57344) or "", v7)
		end
		v_u_5(v7)
	end
end)
return nil