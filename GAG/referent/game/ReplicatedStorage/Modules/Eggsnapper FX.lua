local v1 = game:GetService("CollectionService")
local v_u_2 = require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v3 = require(game.ReplicatedStorage.Modules.DataService)
local v_u_4 = not v_u_2:GetSetting("PerformanceMode")
local v_u_5 = {}
local function v_u_8(p6)
	-- upvalues: (ref) v_u_4, (copy) v_u_5
	if v_u_4 then
		if p6:IsDescendantOf(workspace) then
			if not v_u_5[p6] then
				local v7 = p6:FindFirstChild("AnimationController")
				if not v7 then
					return
				end
				v_u_5[p6] = v7:LoadAnimation(script.Animation)
			end
			v_u_5[p6]:Play()
			v_u_5[p6]:AdjustSpeed(1)
		end
	else
		return
	end
end
local v_u_9 = {}
local function v12(p_u_10)
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_5
	if p_u_10 then
		if not v_u_9[p_u_10] then
			v_u_8(p_u_10)
			v_u_9[p_u_10] = p_u_10.AncestryChanged:Connect(function()
				-- upvalues: (copy) p_u_10, (ref) v_u_8, (ref) v_u_5
				if p_u_10:IsDescendantOf(workspace) then
					v_u_8(p_u_10)
					return
				else
					local v11 = p_u_10
					if v_u_5[v11] then
						v_u_5[v11]:Stop()
					end
				end
			end)
			p_u_10.Destroying:Once(function()
				-- upvalues: (ref) v_u_9, (copy) p_u_10
				v_u_9[p_u_10]:Disconnect()
			end)
		end
	else
		return
	end
end
v1:GetInstanceAddedSignal("Eggsnapper"):Connect(v12)
v1:GetInstanceRemovedSignal("Eggsnapper"):Connect(function(p13)
	-- upvalues: (copy) v_u_5
	if v_u_5[p13] then
		v_u_5[p13]:Stop()
	end
end)
local v_u_14 = v_u_4
for _, v15 in v1:GetTagged("Eggsnapper") do
	v12(v15)
end
local v_u_16 = nil
v_u_16 = v3:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_14, (copy) v_u_2, (copy) v_u_5, (copy) v_u_9, (ref) v_u_16
	v_u_14 = not v_u_2:GetSetting("PerformanceMode")
	if not v_u_14 then
		for v17, v18 in v_u_5 do
			v18:Stop()
			local v19 = v_u_9[v17]
			if v19 then
				v19:Disconnect()
			end
		end
		if v_u_16 then
			v_u_16:Disconnect()
			v_u_16 = nil
		end
	end
end)
return v_u_5