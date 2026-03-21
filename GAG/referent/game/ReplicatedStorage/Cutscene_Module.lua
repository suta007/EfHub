local v1 = {}
local v_u_2 = game:GetService("TweenService")
function v1.Start_Cutscene(p3)
	local v4 = game.Workspace.CurrentCamera
	local v5 = nil
	for _, v6 in pairs(game.Workspace.Farm:GetChildren()) do
		if v6.Important.Data.Owner == p3.Name then
			v5 = v6
		end
	end
	if v5 then
		v4.CameraSubject = v5.Cutscene_Model.Orbit_Camera
		v4.CameraType = Enum.CameraType.Fixed
	end
end
function v1.End_Cutscene(p7)
	local v8 = game.Workspace.CurrentCamera
	v8.CameraSubject = p7.Character.Humanoid
	v8.CameraType = Enum.CameraType.Fixed
end
local v_u_9 = require(game.ReplicatedStorage.Field_Of_View_Module)
function v1.Flash(p10)
	-- upvalues: (copy) v_u_2, (copy) v_u_9
	local v11 = TweenInfo.new(p10, Enum.EasingStyle.Cubic)
	local v_u_12 = TweenInfo.new(p10 * 4, Enum.EasingStyle.Quad)
	local v_u_13 = game:GetService("Players").LocalPlayer.PlayerGui.Rejoin_UI.Frame
	v_u_2:Create(v_u_13, v11, {
		["BackgroundTransparency"] = 0
	}):Play()
	v_u_9.Change_FOV(90, v11.Time)
	task.delay(v11.Time + 1.5, function()
		-- upvalues: (ref) v_u_9, (copy) v_u_12, (ref) v_u_2, (copy) v_u_13
		v_u_9.Change_FOV(70, v_u_12.Time / 2)
		v_u_2:Create(v_u_13, v_u_12, {
			["BackgroundTransparency"] = 1
		}):Play()
	end)
end
return v1