local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("LocalizationService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("RunService")
local v5 = require(v3.UserGenerated.Concurrency.Cache)
local v_u_6 = require(v3.UserGenerated.Lang.Asserts)
local v_u_9 = v5.new({
	["Callback"] = function(p7)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v8 = v_u_1:GetPlayerByUserId(p7)
		assert(v8, "PlayerNotOnline")
		return v_u_2:GetCountryRegionForPlayerAsync(v8)
	end,
	["AssertKey"] = v_u_6.Integer
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
if v4:IsServer() then
	v_u_1.PlayerAdded:Connect(function(p12)
		-- upvalues: (copy) v_u_9
		v_u_9:GetAsync(p12.UserId)
	end)
else
	task.spawn(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_1
		v_u_9:GetAsync(v_u_1.LocalPlayer.UserId)
	end)
end
return table.freeze({
	["GetCountryRegionForPlayerAsync"] = function(p13, p14)
		-- upvalues: (copy) v_u_6, (copy) v_u_9
		v_u_6.Player(p13)
		v_u_6.Optional(v_u_6.Boolean)(p14)
		if p14 then
			return v_u_9:Get(p13.UserId)
		else
			return v_u_9:GetAsync(p13.UserId)
		end
	end
})