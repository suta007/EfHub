local v_u_1 = Instance.new("ObjectValue")
v_u_1.Parent = game.ReplicatedStorage
v_u_1.Name = "CameraTarget"
v_u_1.Value = nil
local v_u_2 = script:WaitForChild("SkipCutscene"):Clone()
game.TweenService:Create(v_u_2.TextLabel, TweenInfo.new(2), {
	["TextTransparency"] = 0,
	["TextStrokeTransparency"] = 0
})
game.TweenService:Create(v_u_2.TextLabel, TweenInfo.new(2), {
	["TextTransparency"] = 1,
	["TextStrokeTransparency"] = 1
})
v_u_2.Parent = game.Players.LocalPlayer.PlayerGui
local v_u_3 = false
local v_u_4 = {}
local v_u_5 = {}
local function v_u_21(p_u_6, p_u_7, p8)
	-- upvalues: (ref) v_u_5, (ref) v_u_4, (ref) v_u_3
	local v_u_9 = require(p_u_6.MarkerEvents)
	v_u_5 = {}
	local v10 = v_u_5
	table.insert(v10, p_u_6)
	local v11 = v_u_5
	table.insert(v11, p_u_7)
	for v12, v13 in p8 do
		local v14 = p_u_7.Rigs:FindFirstChild(v12)
		if v14 then
			local v15 = v14:FindFirstChild("Humanoid") or v14:FindFirstChild("AnimationController", true)
			if v15 then
				v_u_4[v12] = v15:LoadAnimation(v13)
			else
				warn("Didn\'t find controller for " .. v12)
			end
		end
	end
	for v16, v_u_17 in v_u_9 do
		v_u_4.CameraRig:GetMarkerReachedSignal(v16):Connect(function()
			-- upvalues: (copy) v_u_17, (copy) p_u_6, (copy) p_u_7, (ref) v_u_4
			v_u_17(p_u_6, p_u_7, v_u_4)
		end)
	end
	for _, v18 in v_u_4 do
		v18:Play()
	end
	print("LOADED AND SETUP!")
	v_u_4.CameraRig.Stopped:Once(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_9, (copy) p_u_6, (ref) v_u_4
		if v_u_3 == true then
			v_u_9._OnEnd(p_u_6)
		end
		v_u_3 = false
		print("ANIMATION ENDED")
		for _, v19 in v_u_4 do
			v19:Stop()
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_4
		repeat
			task.wait()
		until v_u_3 == false
		for _, v20 in v_u_4 do
			v20:Stop()
		end
	end)
end
local v_u_29 = {
	["attemptDelayedPreload"] = function(p22)
		-- upvalues: (ref) v_u_3
		local v23 = require(p22.IDs)
		local _ = p22.CutsceneFolder
		print("Preloading Started")
		local v24 = {}
		for _, v25 in v23 do
			local v26 = Instance.new("Animation")
			v26.AnimationId = "rbxassetid://" .. tonumber(v25)
			table.insert(v24, v26)
		end
		while true do
			local v27 = v_u_3 == false and v24[1]
			if not v27 then
				break
			end
			game:GetService("ContentProvider"):PreloadAsync({ v27 })
			task.wait(Random.new():NextInteger(1, 80))
			table.remove(v24, 1)
		end
		for _, v28 in v24 do
			v28:Destroy()
		end
	end
}
local function v_u_37(p30)
	-- upvalues: (copy) v_u_21
	local v31 = require(p30.IDs)
	local v32 = p30.CutsceneFolder
	v32.Parent = workspace
	local v33 = {}
	for v34, v35 in v31 do
		local v36 = Instance.new("Animation")
		v36.AnimationId = "rbxassetid://" .. tonumber(v35)
		table.insert(v33, v36)
		v33[v34] = v36
	end
	game:GetService("ContentProvider"):PreloadAsync(v33)
	repeat
		task.wait(0)
	until game:GetService("ContentProvider").RequestQueueSize == 0
	task.wait(2)
	v_u_21(p30, v32, v33)
	return v32
end
local function v_u_62(p_u_38, p_u_39)
	-- upvalues: (copy) v_u_1, (ref) v_u_3, (copy) v_u_2, (copy) v_u_29, (ref) v_u_5, (ref) v_u_4
	v_u_1.Value = p_u_38.DefaultCameraAttach.Value
	local v_u_40 = require(p_u_38.MarkerEvents)
	local v_u_41 = require(p_u_38.FoV)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	local v_u_42 = workspace.CurrentCamera
	local v_u_43 = v_u_42.FieldOfView
	local v_u_44 = 0
	game:GetService("RunService"):BindToRenderStep("CameraTargetUpdate", Enum.RenderPriority.Camera.Value, function(p45)
		-- upvalues: (ref) v_u_3, (ref) v_u_1, (ref) v_u_44, (copy) v_u_41, (copy) v_u_42, (ref) v_u_43
		if v_u_3 == false then
			game:GetService("RunService"):UnbindFromRenderStep("CameraTargetUpdate")
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
			workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
			workspace.CurrentCamera.FieldOfView = 70
			v_u_1.Value = nil
		else
			workspace.CurrentCamera.CFrame = v_u_1.Value.CFrame
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
			v_u_44 = v_u_44 + p45 * 60
			local v46 = v_u_44
			local v47 = v_u_41[math.ceil(v46)]
			if v47 ~= nil then
				local v48 = v_u_44
				if math.ceil(v48) >= #v_u_41 then
					return
				end
				v_u_42.FieldOfView = v_u_43
				local v49 = v_u_43
				local v50 = p45 * 10
				v_u_43 = v49 + (v47 - v49) * v50
			end
		end
	end)
	local v_u_51 = {}
	for _, v52 in game.Players.LocalPlayer.PlayerGui:GetChildren() do
		if v52:IsA("LayerCollector") and not v52:HasTag("ShowDuringCutscene") then
			v_u_51[v52] = v52.Enabled
			v52.Enabled = false
		end
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_2
		task.wait(4)
		if not v_u_3 then
			v_u_2.TextLabel.TextTransparency = 1
			v_u_2.TextLabel.UIStroke.Transparency = 1
		end
	end)
	game.Lighting.Blur.Enabled = false
	local v_u_53 = 0
	local v_u_54 = p_u_38.CutsceneMaxLength.Value or 60
	task.spawn(function()
		-- upvalues: (ref) v_u_53, (copy) v_u_54, (ref) v_u_3, (copy) v_u_51, (ref) v_u_29
		while v_u_53 < v_u_54 and v_u_3 == true do
			v_u_53 = v_u_53 + game:GetService("RunService").Heartbeat:Wait()
		end
		for v55, v56 in v_u_51 do
			if v55:IsDescendantOf(game.Players.LocalPlayer) then
				v55.Enabled = v56
			end
		end
		task.spawn(function()
			local v57 = game.Players.LocalPlayer.PlayerGui
			v57.Bottom_UI.Enabled = true
			v57.GearHover_UI.Enabled = true
			v57.Gift_Notification.Enabled = true
			v57.Hud_UI.Enabled = true
			v57.PetUI.Enabled = true
			v57.PickupTally.Enabled = true
			v57.PlantHover_UI.Enabled = true
			v57.Pop_Effect.Enabled = true
			v57.Rejoin_UI.Enabled = true
			v57.Sheckles_UI.Enabled = true
			v57.Teleport_UI.Enabled = true
			v57.Top_Notification.Enabled = true
			v57.Tutorial_UI.Enabled = true
			if v57:FindFirstChild("TouchGui") then
				v57.TouchGui.Enabled = true
			end
			v57.BackpackGui.Enabled = true
		end)
		game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.FieldOfView = 70
		task.delay(5, function()
			game.Lighting.Cutscene.Brightness = 0
		end)
		v_u_29.Stop()
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_40, (copy) p_u_38, (copy) p_u_39
		v_u_40._OnStart(p_u_38, p_u_39)
	end)
	repeat
		task.wait()
	until v_u_3 == false
	v_u_3 = false
	for v58, v59 in v_u_51 do
		if v58:IsDescendantOf(game.Players.LocalPlayer) then
			v58.Enabled = v59
		end
	end
	for _, v60 in v_u_5 do
		v60:Destroy()
	end
	for _, v61 in game.CollectionService:GetTagged("RemoveMeIfCutsceneEnd") do
		v61:Destroy()
	end
	v_u_4 = {}
	v_u_5 = {}
	p_u_38:Destroy()
	game.SoundService.Music.Volume = 1
	game.Lighting.Blur.Enabled = true
end
function v_u_29.Play(p63, p_u_64)
	-- upvalues: (ref) v_u_3, (copy) v_u_37, (copy) v_u_62
	if not v_u_3 then
		print(p_u_64)
		game.SoundService.Music.Volume = 0
		v_u_3 = true
		if p_u_64 then
			task.wait(3)
		end
		local v65 = p63:Clone()
		task.spawn(function()
			-- upvalues: (copy) p_u_64
			if p_u_64 then
				task.wait(2)
			end
		end)
		if v_u_3 then
			v_u_62(v65, (v_u_37(v65)))
		end
		task.wait(3)
		v_u_3 = false
	end
end
function v_u_29.Stop()
	-- upvalues: (ref) v_u_3
	if v_u_3 then
		task.wait(3)
		v_u_3 = false
		task.wait(2)
		task.spawn(function()
			game.Lighting.Cutscene.Brightness = 0
		end)
		task.spawn(function()
			local v66 = game.Players.LocalPlayer.PlayerGui
			v66.Bottom_UI.Enabled = true
			v66.GearHover_UI.Enabled = true
			v66.Gift_Notification.Enabled = true
			v66.Hud_UI.Enabled = true
			v66.PetUI.Enabled = true
			v66.PickupTally.Enabled = true
			v66.PlantHover_UI.Enabled = true
			v66.Pop_Effect.Enabled = true
			v66.Rejoin_UI.Enabled = true
			v66.Sheckles_UI.Enabled = true
			v66.Teleport_UI.Enabled = true
			v66.Top_Notification.Enabled = true
			v66.Tutorial_UI.Enabled = true
			if v66:FindFirstChild("TouchGui") then
				v66.TouchGui.Enabled = true
			end
			v66.BackpackGui.Enabled = true
			v66.ProximityPrompts.Enabled = true
		end)
		game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.FieldOfView = 70
	end
end
game.ReplicatedStorage.GameEvents.CutsceneHandler.OnClientEvent:Connect(function(p67)
	-- upvalues: (copy) v_u_29
	v_u_29.Play(p67)
end)
return v_u_29