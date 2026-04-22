local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v_u_2 = require(v1.Modules.TradeControllers.TradeWorldController)
local v_u_3 = require(v1.Modules.UpdateService)
require(v1.Modules.Signal)
local v_u_4 = require(v1.Modules.Trove)
local v_u_5 = {}
v_u_5.__index = v_u_5
local v_u_6 = {}
function v_u_5.new(p7, p8)
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	local v9 = v_u_5
	local v10 = setmetatable({}, v9)
	v10.ServiceName = p7
	v10.UpdateServiceKey = p8
	v10.Connections = {}
	v10.IsRunning = false
	v10._trove = v_u_4.new()
	v_u_6[p8] = v10
	return v10
end
function v_u_5.Bind(p11, p12)
	p11._trove:Add(p12)
end
function v_u_5.Unbind(p13, p14)
	p13._trove:Remove(p14)
end
function v_u_5.ClearTrove(p15)
	p15._trove:Clean()
end
function v_u_5.Initialize(p_u_16)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) p_u_16
		if v_u_2:IsInWorld() then
			return
		elseif not v_u_3:IsHiddenAfterUpdate(p_u_16.UpdateServiceKey) then
			if v_u_3:IsHiddenFromUpdate(p_u_16.UpdateServiceKey) then
				v_u_3.OnUpdated:Wait()
				if v_u_3:IsHiddenFromUpdate(p_u_16.UpdateServiceKey) then
					return
				end
				if v_u_3:IsHiddenAfterUpdate(p_u_16.UpdateServiceKey) then
					return
				end
			end
			p_u_16.IsRunning = true
			p_u_16:OnStarted()
			v_u_3.OnUpdated:Wait()
			if v_u_3:IsHiddenAfterUpdate(p_u_16.UpdateServiceKey) then
				p_u_16:Shutdown()
			end
		end
	end)
end
function v_u_5.Shutdown(p17)
	if p17.IsRunning then
		print((("[EventService] [%*] Shutting down..."):format(p17.ServiceName)))
		p17.IsRunning = false
		p17:OnStopped()
		p17:ClearTrove()
		p17._trove:Destroy()
	end
end
function v_u_5.OnStarted(_) end
function v_u_5.OnStopped(_) end
function v_u_5.StartEvent(_) end
function v_u_5.EndEvent(_) end
function v_u_5.IsEventRunning(p18)
	-- upvalues: (copy) v_u_2, (copy) v_u_6
	if v_u_2:IsInWorld() then
		return false
	else
		local v19 = v_u_6[p18]
		if v19 then
			return v19.IsRunning
		else
			return false
		end
	end
end
return v_u_5