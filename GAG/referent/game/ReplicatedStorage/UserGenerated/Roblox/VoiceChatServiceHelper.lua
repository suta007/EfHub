local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("VoiceChatService")
local v3 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Cache)
local v_u_4 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v_u_6 = v3.new({
	["Callback"] = function(p5)
		-- upvalues: (copy) v_u_2
		return v_u_2:IsVoiceEnabledForUserIdAsync(p5)
	end,
	["AssertKey"] = v_u_4.Integer,
	["MaxAge"] = (1 / 0)
})
v_u_1.PlayerRemoving:Connect(function(p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_6
	local v_u_8 = p7.UserId
	task.delay(60, function()
		-- upvalues: (ref) v_u_1, (copy) v_u_8, (ref) v_u_6
		if not v_u_1:GetPlayerByUserId(v_u_8) then
			v_u_6:Delete(v_u_8)
		end
	end)
end)
task.spawn(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_1
	v_u_6:GetAsync(v_u_1.LocalPlayer.UserId)
end)
return table.freeze({
	["IsVoiceEnabledForUserIdAsync"] = function(p9, p10)
		-- upvalues: (copy) v_u_4, (copy) v_u_6
		v_u_4.Integer(p9)
		v_u_4.Optional(v_u_4.Boolean)(p10)
		if p10 then
			return v_u_6:Get(p9)
		else
			return v_u_6:GetAsync(p9)
		end
	end
})