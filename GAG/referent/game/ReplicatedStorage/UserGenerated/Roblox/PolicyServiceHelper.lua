local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("PolicyService")
local v3 = game:GetService("RunService")
local v4 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Cache)
local v_u_5 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v_u_6 = {
	["Discord"] = 0,
	["Facebook"] = 1,
	["Twitch"] = 2,
	["YouTube"] = 3,
	["X"] = 4,
	["GitHub"] = 5,
	["Guilded"] = 6
}
table.freeze(v_u_6)
local v_u_9 = v4.new({
	["Callback"] = function(p7)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v8 = v_u_1:GetPlayerByUserId(p7)
		assert(v8, "PlayerNotOnline")
		return v_u_2:GetPolicyInfoForPlayerAsync(v8)
	end,
	["AssertKey"] = v_u_5.Integer
})
v_u_1.PlayerRemoving:Connect(function(p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_9
	local v_u_11 = p10.UserId
	task.delay(60, function()
		-- upvalues: (ref) v_u_1, (copy) v_u_11, (ref) v_u_9
		if not v_u_1:GetPlayerByUserId(v_u_11) then
			v_u_9:Delete(v_u_11)
		end
	end)
end)
if v3:IsServer() then
	v_u_1.PlayerAdded:Connect(function(p12)
		-- upvalues: (copy) v_u_9
		v_u_9:GetAsync(p12.UserId)
	end)
end
return table.freeze({
	["ExternalLinkReference"] = v_u_6,
	["ExternalLinkReferencesToInts"] = function(p13)
		-- upvalues: (copy) v_u_6
		local v14 = {}
		for _, v15 in ipairs(p13) do
			local v16 = v_u_6[v15]
			if v16 then
				table.insert(v14, v16)
			end
		end
		return v14
	end,
	["GetPolicyInfoForPlayerAsync"] = function(p17, p18)
		-- upvalues: (copy) v_u_5, (copy) v_u_9
		v_u_5.Player(p17)
		v_u_5.Optional(v_u_5.Boolean)(p18)
		if p18 then
			return v_u_9:Get(p17.UserId)
		else
			return v_u_9:GetAsync(p17.UserId)
		end
	end
})