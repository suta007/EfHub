game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
require(v1.Types.TweenReplicationServiceTypes)
local v_u_3 = v1.GameEvents.TweenEvent
local v_u_11 = {
	["ProcessTween"] = function(_, p4)
		-- upvalues: (copy) v_u_2
		local v5 = p4.Instance
		local v6 = p4.TweenInfoArray
		local v7 = p4.PropertiesMap
		local v_u_8 = v_u_2:Create(v5, TweenInfo.new(table.unpack(v6)), v7)
		v_u_8.Completed:Connect(function()
			-- upvalues: (copy) v_u_8
			v_u_8:Destroy()
		end)
		v_u_8:Play()
	end,
	["Init"] = function(_) end,
	["Start"] = function(p_u_9)
		-- upvalues: (copy) v_u_3
		v_u_3.OnClientEvent:Connect(function(p10)
			-- upvalues: (copy) p_u_9
			p_u_9:ProcessTween(p10)
		end)
	end
}
task.spawn(function()
	-- upvalues: (copy) v_u_11
	v_u_11:Init()
	v_u_11:Start()
end)
return v_u_11