local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.FFlags.Packages.Replion)
local v3 = require(v1.Modules.Signal)
require(script.Parent.Types)
local v24 = {
	["_loaded"] = false,
	["_updatedSignal"] = v3.new(),
	["_loadedSignal"] = v3.new(),
	["IsLoaded"] = function(_)
		-- upvalues: (copy) v_u_2
		return v_u_2.Client:WaitReplion("FFlags"):Get("Loaded")
	end,
	["OnLoad"] = function(p4, p5)
		return p4._loadedSignal:Connect(p5)
	end,
	["OnUpdate"] = function(p6, p7)
		return p6._updatedSignal:Connect(p7)
	end,
	["OnChange"] = function(_, p8, p9)
		-- upvalues: (copy) v_u_2
		return v_u_2.Client:WaitReplion("FFlags"):OnChange({ "Values", p8 }, p9)
	end,
	["Get"] = function(p10, p11, p12)
		-- upvalues: (copy) v_u_2
		local v13 = v_u_2.Client:WaitReplion("FFlags")
		if not p10:IsLoaded() then
			p10._loadedSignal:Wait()
		end
		local v14 = v13:Get({ "Values", p11 })
		if v14 == nil then
			return p12
		else
			return v14
		end
	end,
	["GetInstant"] = function(_, p15, p16)
		-- upvalues: (copy) v_u_2
		local v17 = v_u_2.Client:GetReplion("FFlags")
		if v17 then
			local v18 = v17:Get({ "Values", p15 })
			if v18 == nil then
				return p16
			else
				return v18
			end
		else
			return p16
		end
	end,
	["_loadMemoryStore"] = function(_)
		warn("FFlags:_loadMemoryStore() cannot be used on the client!")
		return false
	end,
	["_loadDataStore"] = function(_)
		warn("FFlags:_loadDataStore() cannot be used on the client!")
		return false
	end,
	["Set"] = function(_)
		warn("FFlags:Set() cannot be used on the client!")
		return false
	end,
	["Load"] = function(_)
		warn("FFlags:Load() cannot be used on the client!")
		return false
	end,
	["Start"] = function(p_u_19)
		-- upvalues: (copy) v_u_2
		local v_u_20 = v_u_2.Client:WaitReplion("FFlags")
		p_u_19._loaded = v_u_20:Get("Loaded")
		local v_u_21 = nil
		v_u_21 = v_u_20:OnChange("Loaded", function(p22, p23)
			-- upvalues: (copy) p_u_19, (copy) v_u_20, (ref) v_u_21
			if p22 and not p23 then
				p_u_19._loaded = p22
				p_u_19._loadedSignal:Fire(v_u_20.Data)
				if v_u_21.Connected then
					v_u_21:Disconnect()
				end
			end
		end)
		v_u_20:OnChange("LastChange", function(_, _)
			-- upvalues: (copy) p_u_19, (copy) v_u_20
			p_u_19._updatedSignal:Fire(v_u_20.Data)
		end)
	end
}
task.spawn(v24.Start, v24)
return v24