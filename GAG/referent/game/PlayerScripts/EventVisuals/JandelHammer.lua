local v_u_1 = false
local v_u_2 = require(game.ReplicatedStorage.Field_Of_View_Module)
require(game.ReplicatedStorage.Code.BodyShaker)
require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_3 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_5 = v_u_3.new(Enum.RenderPriority.Camera.Value, function(p4)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p4
end)
local function v_u_8(p6)
	-- upvalues: (ref) v_u_1, (copy) v_u_5, (copy) v_u_3, (copy) v_u_2
	v_u_1 = true
	if not workspace:GetAttribute("JandelHammer_Landed" .. p6) then
		v_u_5:Start()
		v_u_5:ShakeSustain(v_u_3.Presets.Earthquake)
		workspace:GetAttributeChangedSignal("JandelHammer_Landed" .. p6):Once(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_3
			v_u_5:StopSustained(2)
			v_u_5:Shake(v_u_3.Presets.Explosion)
		end)
	end
	if not workspace:GetAttribute("JandelHammer_Pull" .. p6) then
		workspace:GetAttributeChangedSignal("JandelHammer_Grabbed" .. p6):Once(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_3
			v_u_5:ShakeSustain(v_u_3.Presets.WeakEarthquake)
			task.wait(1)
			v_u_5:StopSustained(0.5)
		end)
	end
	if not workspace:GetAttribute("JandelHammer_Grabbed" .. p6) then
		workspace:GetAttributeChangedSignal("JandelHammer_Grabbed" .. p6):Once(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_2, (ref) v_u_3
			v_u_5:StopSustained(0.5)
			v_u_2.Change_FOV(65, 0.5)
			v_u_5:Shake(v_u_3.Presets.Bump)
			task.wait(0.5)
			v_u_2.Change_FOV(70, 0.5)
		end)
	end
	if not workspace:GetAttribute("JandelHammer_Slam" .. p6) then
		workspace:GetAttributeChangedSignal("JandelHammer_Slam" .. p6):Once(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_5, (ref) v_u_3
			local v_u_7 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			if v_u_7 then
				v_u_7 = game.Players.LocalPlayer.Character
			end
			if v_u_7 then
				v_u_7.Humanoid.JumpPower = 150
				v_u_7.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				task.delay(0.1, function()
					-- upvalues: (copy) v_u_7
					v_u_7.Humanoid.JumpPower = 50
				end)
			end
			v_u_2.Change_FOV(50, 0.5)
			v_u_5:Shake(v_u_3.Presets.Explosion)
			task.wait(0.5)
			v_u_2.Change_FOV(70, 0.5)
		end)
	end
end
workspace:GetAttributeChangedSignal("JandelHammer"):Connect(function()
	-- upvalues: (copy) v_u_8
	local v9 = workspace:GetAttribute("JandelHammer")
	if v9 then
		v_u_8(v9)
	end
end)
local v10 = workspace:GetAttribute("JandelHammer")
if v10 then
	v_u_8(v10)
end