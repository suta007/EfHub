local v1 = game:GetService("TextChatService")
game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("UserService")
local v_u_4 = {
	["RankMap"] = require(script.RankMap),
	["AnnouncementFormat"] = "<font color=\"rgb(255,165,0)\"><b>%s:</b> %s</font>"
}
function v1.OnIncomingMessage(p_u_5)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v6 = Instance.new("TextChatMessageProperties")
	local v7 = p_u_5.TextSource
	local _ = p_u_5.Text
	local v8 = p_u_5.TextSource
	if v8 then
		v8 = p_u_5.TextSource.UserId
	end
	if v8 then
		v8 = v_u_2:GetPlayerByUserId(v8)
	end
	if v8 then
		if v8 then
			local _ = v_u_4.RankMap[v8:GetRankInGroup(35789249)]
		end
		if v7 then
			pcall(function()
				-- upvalues: (ref) v_u_3, (copy) p_u_5, (ref) v_u_2, (ref) v_u_4
				local v9 = v_u_3:GetUserInfosByUserIdsAsync({ p_u_5.TextSource.UserId })[1]
				if v9 then
					local v10 = v_u_2:GetPlayerByUserId(p_u_5.TextSource.UserId)
					if v10 then
						local v11 = v_u_4.RankMap[v10:GetRankInGroup(35789249)]
						p_u_5.PrefixText = ("%*%*"):format(v11 and v11:format(v10.DisplayName) or v10.DisplayName, v9.HasVerifiedBadge and "\238\128\128" or "")
					end
				else
					return
				end
			end)
		end
	end
	return v6
end