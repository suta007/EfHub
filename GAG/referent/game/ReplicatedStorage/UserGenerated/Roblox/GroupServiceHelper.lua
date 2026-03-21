local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("GroupService")
local v3 = game:GetService("RunService")
local v4 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Cache)
local v_u_5 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v_u_7 = v4.new({
	["Callback"] = function(p6)
		-- upvalues: (copy) v_u_2
		return v_u_2:GetGroupsAsync(p6)
	end,
	["AssertKey"] = v_u_5.Integer,
	["MaxAge"] = (1 / 0)
})
v_u_1.PlayerRemoving:Connect(function(p8)
	-- upvalues: (copy) v_u_1, (copy) v_u_7
	local v_u_9 = p8.UserId
	task.delay(60, function()
		-- upvalues: (ref) v_u_1, (copy) v_u_9, (ref) v_u_7
		if not v_u_1:GetPlayerByUserId(v_u_9) then
			v_u_7:Delete(v_u_9)
		end
	end)
end)
if v3:IsServer() then
	v_u_1.PlayerAdded:Connect(function(p10)
		-- upvalues: (copy) v_u_7
		v_u_7:GetAsync(p10.UserId)
	end)
else
	task.spawn(function()
		-- upvalues: (copy) v_u_7, (copy) v_u_1
		v_u_7:GetAsync(v_u_1.LocalPlayer.UserId)
	end)
end
return table.freeze({
	["Cache"] = v_u_7,
	["GetGroupsAsync"] = function(p11, p12)
		-- upvalues: (copy) v_u_5, (copy) v_u_7
		v_u_5.Integer(p11)
		v_u_5.Optional(v_u_5.Boolean)(p12)
		if p12 then
			return v_u_7:Get(p11)
		else
			return v_u_7:GetAsync(p11)
		end
	end
})