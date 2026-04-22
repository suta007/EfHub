local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.GuiController)
local v_u_3 = Instance.new("ObjectValue")
v_u_3.Parent = game.ReplicatedStorage
v_u_3.Name = "CameraTarget"
v_u_3.Value = nil
local v_u_4 = script:WaitForChild("SkipCutscene"):Clone()
game.TweenService:Create(v_u_4.TextLabel, TweenInfo.new(2), {
	["TextTransparency"] = 0,
	["TextStrokeTransparency"] = 0
})
game.TweenService:Create(v_u_4.TextLabel, TweenInfo.new(2), {
	["TextTransparency"] = 1,
	["TextStrokeTransparency"] = 1
})
v_u_4.Parent = game.Players.LocalPlayer.PlayerGui
local v_u_5 = false
local v_u_6 = {}
local v_u_7 = {}
local function v_u_23(p_u_8, p_u_9, p10)
	-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_5
	local v_u_11 = require(p_u_8.MarkerEvents)
	v_u_7 = {}
	local v12 = v_u_7
	table.insert(v12, p_u_8)
	local v13 = v_u_7
	table.insert(v13, p_u_9)
	for v14, v15 in p10 do
		local v16 = p_u_9.Rigs:FindFirstChild(v14)
		if v16 then
			local v17 = v16:FindFirstChild("Humanoid") or v16:FindFirstChild("AnimationController", true)
			if v17 then
				v_u_6[v14] = v17:LoadAnimation(v15)
			else
				warn("Didn\'t find controller for " .. v14)
			end
		end
	end
	for v18, v_u_19 in v_u_11 do
		v_u_6.CameraRig:GetMarkerReachedSignal(v18):Connect(function()
			-- upvalues: (copy) v_u_19, (copy) p_u_8, (copy) p_u_9, (ref) v_u_6
			v_u_19(p_u_8, p_u_9, v_u_6)
		end)
	end
	for _, v20 in v_u_6 do
		v20:Play()
	end
	print("LOADED AND SETUP!")
	v_u_6.CameraRig.Stopped:Once(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_11, (copy) p_u_8, (ref) v_u_6
		if v_u_5 == true then
			v_u_11._OnEnd(p_u_8)
		end
		v_u_5 = false
		print("ANIMATION ENDED")
		for _, v21 in v_u_6 do
			v21:Stop()
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_6
		repeat
			task.wait()
		until v_u_5 == false
		for _, v22 in v_u_6 do
			v22:Stop()
		end
	end)
end
local v_u_31 = {
	["attemptDelayedPreload"] = function(p24)
		-- upvalues: (ref) v_u_5
		local v25 = require(p24.IDs)
		local _ = p24.CutsceneFolder
		print("Preloading Started")
		local v26 = {}
		for _, v27 in v25 do
			local v28 = Instance.new("Animation")
			v28.AnimationId = "rbxassetid://" .. tonumber(v27)
			table.insert(v26, v28)
		end
		while true do
			local v29 = v_u_5 == false and v26[1]
			if not v29 then
				break
			end
			game:GetService("ContentProvider"):PreloadAsync({ v29 })
			task.wait(Random.new():NextInteger(1, 80))
			table.remove(v26, 1)
		end
		for _, v30 in v26 do
			v30:Destroy()
		end
	end
}
local function v_u_39(p32)
	-- upvalues: (copy) v_u_23
	local v33 = require(p32.IDs)
	local v34 = p32.CutsceneFolder
	v34.Parent = workspace
	local v35 = {}
	for v36, v37 in v33 do
		local v38 = Instance.new("Animation")
		v38.AnimationId = "rbxassetid://" .. tonumber(v37)
		table.insert(v35, v38)
		v35[v36] = v38
	end
	game:GetService("ContentProvider"):PreloadAsync(v35)
	repeat
		task.wait(0)
	until game:GetService("ContentProvider").RequestQueueSize == 0
	task.wait(2)
	v_u_23(p32, v34, v35)
	return v34
end
local function v_u_64(p_u_40, p_u_41)
	-- upvalues: (copy) v_u_3, (ref) v_u_5, (copy) v_u_4, (copy) v_u_31, (ref) v_u_7, (ref) v_u_6
	v_u_3.Value = p_u_40.DefaultCameraAttach.Value
	local v_u_42 = require(p_u_40.MarkerEvents)
	local v_u_43 = require(p_u_40.FoV)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	local v_u_44 = workspace.CurrentCamera
	local v_u_45 = v_u_44.FieldOfView
	local v_u_46 = 0
	game:GetService("RunService"):BindToRenderStep("CameraTargetUpdate", Enum.RenderPriority.Camera.Value, function(p47)
		-- upvalues: (ref) v_u_5, (ref) v_u_3, (ref) v_u_46, (copy) v_u_43, (copy) v_u_44, (ref) v_u_45
		if v_u_5 == false then
			game:GetService("RunService"):UnbindFromRenderStep("CameraTargetUpdate")
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
			workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
			workspace.CurrentCamera.FieldOfView = 70
			v_u_3.Value = nil
		else
			workspace.CurrentCamera.CFrame = v_u_3.Value.CFrame
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
			v_u_46 = v_u_46 + p47 * 60
			local v48 = v_u_46
			local v49 = v_u_43[math.ceil(v48)]
			if v49 ~= nil then
				local v50 = v_u_46
				if math.ceil(v50) >= #v_u_43 then
					return
				end
				v_u_44.FieldOfView = v_u_45
				local v51 = v_u_45
				local v52 = p47 * 10
				v_u_45 = v51 + (v49 - v51) * v52
			end
		end
	end)
	local v_u_53 = {}
	for _, v54 in game.Players.LocalPlayer.PlayerGui:GetChildren() do
		if v54:IsA("LayerCollector") and not v54:HasTag("ShowDuringCutscene") then
			v_u_53[v54] = v54.Enabled
			v54.Enabled = false
		end
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_4
		task.wait(4)
		if not v_u_5 then
			v_u_4.TextLabel.TextTransparency = 1
			v_u_4.TextLabel.UIStroke.Transparency = 1
		end
	end)
	game.Lighting.Blur.Enabled = false
	local v_u_55 = 0
	local v_u_56 = p_u_40.CutsceneMaxLength.Value or 60
	task.spawn(function()
		-- upvalues: (ref) v_u_55, (copy) v_u_56, (ref) v_u_5, (copy) v_u_53, (ref) v_u_31
		while v_u_55 < v_u_56 and v_u_5 == true do
			v_u_55 = v_u_55 + game:GetService("RunService").Heartbeat:Wait()
		end
		for v57, v58 in v_u_53 do
			if v57:IsDescendantOf(game.Players.LocalPlayer) then
				v57.Enabled = v58
			end
		end
		task.spawn(function()
			local v59 = game.Players.LocalPlayer.PlayerGui
			v59.Bottom_UI.Enabled = true
			v59.GearHover_UI.Enabled = true
			v59.Gift_Notification.Enabled = true
			v59.Hud_UI.Enabled = true
			v59.PetUI.Enabled = true
			v59.PickupTally.Enabled = true
			v59.PlantHover_UI.Enabled = true
			v59.Pop_Effect.Enabled = true
			v59.Rejoin_UI.Enabled = true
			v59.Sheckles_UI.Enabled = true
			v59.Teleport_UI.Enabled = true
			v59.Top_Notification.Enabled = true
			v59.Tutorial_UI.Enabled = true
			if v59:FindFirstChild("TouchGui") then
				v59.TouchGui.Enabled = true
			end
			v59.BackpackGui.Enabled = true
		end)
		game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.FieldOfView = 70
		task.delay(5, function()
			game.Lighting.Cutscene.Brightness = 0
		end)
		v_u_31.Stop()
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_42, (copy) p_u_40, (copy) p_u_41
		v_u_42._OnStart(p_u_40, p_u_41)
	end)
	repeat
		task.wait()
	until v_u_5 == false
	v_u_5 = false
	for v60, v61 in v_u_53 do
		if v60:IsDescendantOf(game.Players.LocalPlayer) then
			v60.Enabled = v61
		end
	end
	for _, v62 in v_u_7 do
		v62:Destroy()
	end
	for _, v63 in game.CollectionService:GetTagged("RemoveMeIfCutsceneEnd") do
		v63:Destroy()
	end
	v_u_6 = {}
	v_u_7 = {}
	p_u_40:Destroy()
	game.SoundService.Music.Volume = 1
	game.Lighting.Blur.Enabled = true
end
function v_u_31.Play(p65, p_u_66)
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_39, (copy) v_u_64
	if not v_u_5 then
		for _, v67 in game.Players.LocalPlayer.PlayerGui:GetChildren() do
			if v67:IsA("LayerCollector") and v_u_2:GetStateForGui(v67).Visible:Get() then
				v_u_2:Close(v67)
			end
		end
		print(p_u_66)
		game.SoundService.Music.Volume = 0
		v_u_5 = true
		if p_u_66 then
			task.wait(3)
		end
		local v68 = p65:Clone()
		task.spawn(function()
			-- upvalues: (copy) p_u_66
			if p_u_66 then
				task.wait(2)
			end
		end)
		if v_u_5 then
			v_u_64(v68, (v_u_39(v68)))
		end
		task.wait(3)
		v_u_5 = false
	end
end
function v_u_31.Stop()
	-- upvalues: (ref) v_u_5
	if v_u_5 then
		task.wait(3)
		v_u_5 = false
		task.wait(2)
		task.spawn(function()
			game.Lighting.Cutscene.Brightness = 0
		end)
		task.spawn(function()
			local v69 = game.Players.LocalPlayer.PlayerGui
			v69.Bottom_UI.Enabled = true
			v69.GearHover_UI.Enabled = true
			v69.Gift_Notification.Enabled = true
			v69.Hud_UI.Enabled = true
			v69.PetUI.Enabled = true
			v69.PickupTally.Enabled = true
			v69.PlantHover_UI.Enabled = true
			v69.Pop_Effect.Enabled = true
			v69.Rejoin_UI.Enabled = true
			v69.Sheckles_UI.Enabled = true
			v69.Teleport_UI.Enabled = true
			v69.Top_Notification.Enabled = true
			v69.Tutorial_UI.Enabled = true
			if v69:FindFirstChild("TouchGui") then
				v69.TouchGui.Enabled = true
			end
			v69.BackpackGui.Enabled = true
			v69.ProximityPrompts.Enabled = true
		end)
		game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.FieldOfView = 70
	end
end
game.ReplicatedStorage.GameEvents.CutsceneHandler.OnClientEvent:Connect(function(p70)
	-- upvalues: (copy) v_u_31
	v_u_31.Play(p70)
end)
return v_u_31