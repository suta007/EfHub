local v1 = game:GetService("CollectionService")
game:GetService("RunService")
require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v_u_2 = nil
local v_u_3 = require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v4 = require(game.ReplicatedStorage.Modules.DataService)
local v_u_5 = not v_u_3:GetSetting("PerformanceMode")
if v_u_5 then
	local v_u_6 = nil
	v_u_6 = v4:GetPathSignal("Settings/@"):Connect(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_3, (ref) v_u_6, (ref) v_u_2
		v_u_5 = not v_u_3:GetSetting("PerformanceMode")
		if not v_u_5 then
			if v_u_6 then
				v_u_6:Disconnect()
				v_u_6 = nil
			end
			if v_u_2 then
				v_u_2:Disconnect()
				v_u_2 = nil
			end
		end
	end)
	local function v13(p_u_7)
		-- upvalues: (ref) v_u_5, (ref) v_u_2
		if p_u_7:IsDescendantOf(workspace) then
			if p_u_7:IsA("Model") then
				if p_u_7.PrimaryPart then
					return
				elseif v_u_5 then
					local v_u_12 = task.spawn(function()
						-- upvalues: (ref) v_u_5, (copy) p_u_7
						while v_u_5 do
							local v8 = task.wait(0.03333333333333333)
							local v9 = p_u_7:GetPivot()
							local v10 = CFrame.Angles
							local v11 = -90 * v8
							p_u_7:PivotTo(v9 * v10(0, 0, (math.rad(v11))))
						end
					end)
					p_u_7.Destroying:Once(function()
						-- upvalues: (ref) v_u_12
						if v_u_12 then
							task.cancel(v_u_12)
						end
					end)
				elseif v_u_2 then
					v_u_2:Disconnect()
				end
			else
				return
			end
		else
			return
		end
	end
	local _ = v1:GetInstanceAddedSignal("HamsterWheel"):Connect(v13)
	for _, v14 in v1:GetTagged("HamsterWheel") do
		v13(v14)
	end
end