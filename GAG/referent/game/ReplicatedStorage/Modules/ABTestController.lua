local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("HttpService")
local v3 = game:GetService("Players")
local v4 = require(script:WaitForChild("TypedSignal"))
local v_u_5 = require(v_u_1.GameAnalytics)
local v_u_6 = require(v_u_1.Modules.ABTestExperiments)
require(v_u_1.Modules.ABTestExperiments.ABTestTypes)
local v_u_7 = v3.LocalPlayer
local v24 = {
	["_loaded"] = false,
	["_loadedSignal"] = v4.new(),
	["_remoteConfigs"] = {},
	["_runExperiments"] = function(p8)
		-- upvalues: (copy) v_u_6, (copy) v_u_7
		if p8._remoteConfigs then
			for _, v9 in v_u_6 do
				if not v9.Disabled then
					local v10 = p8._remoteConfigs[v9.RemoteConfig] or v9.DefaultState
					local v11 = v9.States[v10]
					if v11 and v11.Client then
						task.defer(v11.Client, v_u_7, v10)
					end
				end
			end
		end
	end,
	["IsLoaded"] = function(p12)
		return p12._loaded
	end,
	["OnLoad"] = function(p13, p14)
		return p13._loadedSignal:Connect(p14)
	end,
	["GetRemoteConfig"] = function(p15, p16)
		return p15._remoteConfigs[p16], p15:IsLoaded()
	end,
	["Start"] = function(p_u_17)
		-- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_2
		v_u_5:initClient()
		v_u_1:WaitForChild("GameAnalyticsRemoteConfigs").OnClientEvent:Connect(function(p18)
			-- upvalues: (ref) v_u_2, (copy) p_u_17
			if typeof(p18) == "table" then
				local v19 = {}
				for v20, v21 in p18 do
					local v22, v23 = pcall(v_u_2.JSONDecode, v_u_2, v21)
					if v22 then
						if v23 == nil then
							v23 = v21
						end
					else
						v23 = v21
					end
					v19[v20] = v23
				end
				p_u_17._remoteConfigs = v19
				if not p_u_17._loaded then
					p_u_17._loaded = true
					p_u_17._loadedSignal:Fire(v19)
					p_u_17:_runExperiments()
				end
			end
		end)
	end
}
task.spawn(v24.Start, v24)
return v24