local v1 = {}
local v_u_2 = false
local v_u_3 = require(game.ReplicatedStorage.Code.CameraShaker)
local v4 = game.Lighting.ColorCorrection:Clone()
v4.Name = script.Name
v4.Parent = game.Lighting
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_6 = script.Assets.Sky:Clone()
v_u_5.AddSkybox(v_u_6)
local v_u_7 = require(game.ReplicatedStorage.Modules.Spring)
local v_u_8 = require(game:GetService("ReplicatedStorage"):WaitForChild("Data"):WaitForChild("PetRegistry")).PetList
local v_u_9 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Trove"))
game:GetService("RunService")
local v_u_11 = v_u_3.new(Enum.RenderPriority.Camera.Value, function(p10)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p10
end)
function CreateEvent()
	-- upvalues: (copy) v_u_9, (ref) v_u_2, (copy) v_u_11, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3
	local v_u_12 = v_u_9.new()
	v_u_2 = true
	v_u_11:Start()
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
		v_u_5.UpdateSkybox(v_u_6, 2)
		local v13 = game.Workspace.BasePlate.TopBaseplate
		v_u_7.target(v13, 1, 2, {
			["Color"] = Color3.fromRGB(183, 176, 96)
		})
		v_u_7.target(game.Lighting, 1, 2, {
			["Ambient"] = Color3.fromRGB(204, 192, 157)
		})
		v_u_7.target(game.Lighting.Atmosphere, 1, 2, {
			["Density"] = 0.45
		})
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_12, (ref) v_u_8
		local v_u_14 = workspace:WaitForChild("PetsWaldo")
		if v_u_14 then
			local v_u_15 = {}
			local v_u_16 = {}
			local v_u_17 = 0
			v_u_12:Add(game:GetService("RunService").Heartbeat:Connect(function(p18)
				-- upvalues: (ref) v_u_17, (copy) v_u_15, (copy) v_u_16, (copy) v_u_14, (ref) v_u_8
				v_u_17 = v_u_17 + p18
				while v_u_17 >= 0.03333333333333333 and game.Workspace:GetAttribute("JandelWaldo") == true do
					v_u_17 = v_u_17 - 0.03333333333333333
					local v19 = game.Players.LocalPlayer.Character
					if v19 and v19.PrimaryPart then
						table.clear(v_u_15)
						table.clear(v_u_16)
						for _, v20 in v_u_14:GetChildren() do
							if (v20.PrimaryPart.Position - v19.PrimaryPart.Position).Magnitude <= 30 then
								local v21 = v20.PrimaryPart.Position
								local v22 = v19.PrimaryPart.Position
								local v23 = CFrame.lookAt
								local v24 = v20.PrimaryPart.Position
								local v25 = v22.X
								local v26 = v21.Y
								local v27 = v22.Z
								local v28 = v23(v24, (Vector3.new(v25, v26, v27))) * v_u_8[v20.Name].WeldOffset
								local v29 = v_u_15
								local v30 = v20.PrimaryPart
								table.insert(v29, v30)
								local v31 = v_u_16
								table.insert(v31, v28)
							end
						end
						if #v_u_15 > 0 then
							workspace:BulkMoveTo(v_u_15, v_u_16, Enum.BulkMoveMode.FireCFrameChanged)
						end
					end
				end
			end))
		end
	end)
	local function v64()
		-- upvalues: (copy) v_u_12, (ref) v_u_11, (ref) v_u_3
		if game.Workspace:GetAttribute("JandelWaldo_SpawnSign") == true then
			local v32 = v_u_12:Add(script.Assets.Missing_Sign:Clone())
			v32:PivotTo(v32:GetPivot() * CFrame.new(0, -10, 0))
			v32.Parent = workspace.WeatherVisuals
			local v33 = v32:GetPivot() * CFrame.new(0, 10, 0)
			local v34 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local v35 = game:GetService("TweenService"):Create(v32.PrimaryPart, v34, {
				["CFrame"] = v33
			})
			v_u_11:ShakeSustain(v_u_3.Presets.Bump)
			task.delay(1.5, function()
				-- upvalues: (ref) v_u_11
				v_u_11:StopSustained(2)
			end)
			v35:Play()
			v_u_12:Add(script.Assets.HayBale:Clone()).Parent = game.Workspace.WeatherVisuals
			local v36 = v_u_12:Add(script.Assets.SurfaceGui:Clone())
			v36.Parent = game.Players.LocalPlayer.PlayerGui
			v36.Adornee = v32.Primary
			local v37 = v36:FindFirstChildOfClass("ViewportFrame")
			if v37 then
				v37:ClearAllChildren()
				local v38 = game:GetService("CollectionService"):GetTagged("JandelWaldo_Model")[1]
				if v38 then
					local v39 = v38:Clone()
					v39.Parent = v37
					local v_u_40 = Instance.new("Camera")
					v_u_40.Parent = v37
					v37.CurrentCamera = v_u_40
					local v_u_41, v42 = v39:GetBoundingBox()
					local v_u_43 = v42.Y * 0.5
					local v44 = v42.X
					local v45 = v42.Y
					local v46 = v42.Z
					local v_u_47 = math.max(v44, v45, v46) * 1.25
					local v_u_48 = 0
					v_u_12:Add(game:GetService("RunService").RenderStepped:Connect(function(p49)
						-- upvalues: (ref) v_u_48, (copy) v_u_47, (copy) v_u_41, (copy) v_u_43, (copy) v_u_40
						v_u_48 = v_u_48 + 0.4363323129985824 * p49
						local v50 = v_u_47
						local v51 = CFrame.Angles(0, v_u_48, 0) * Vector3.new(0, 0, v50)
						local v52 = v_u_41.Position + v51
						local v53 = v_u_43 * 0.6
						local v54 = v52 + Vector3.new(0, v53, 0)
						local v55 = v_u_40
						local v56 = CFrame.new
						local v57 = v_u_41.Position
						local v58 = v_u_43 * 0.25
						v55.CFrame = v56(v54, v57 + Vector3.new(0, v58, 0))
					end))
					if game.Players.LocalPlayer.Character then
						local v59 = game.Players.LocalPlayer.Character
						local v60 = CFrame.lookAt
						local v61 = (v32.Primary.CFrame * CFrame.new(-5, 0, 0)).Position
						local v62 = math.random(0, 5)
						local v63 = math.random
						v59:PivotTo(v60(v61 + Vector3.new(v62, 0, v63(-5, 5)), v32.Primary.Position))
					end
				end
			else
				return
			end
		else
			return
		end
	end
	v_u_12:Add(game.Workspace:GetAttributeChangedSignal("JandelWaldo_SpawnSign"):Connect(v64))
	task.spawn(function()
		-- upvalues: (copy) v_u_12
		local v_u_65 = v_u_12:Add(script.Assets:FindFirstChild("ObbyTimer"):Clone())
		v_u_65.Parent = game.Players.LocalPlayer.PlayerGui
		v_u_12:Add(workspace:GetAttributeChangedSignal("JandelWaldoTimer"):Connect(function()
			-- upvalues: (copy) v_u_65
			local v66 = workspace:GetAttribute("JandelWaldoTimer")
			if v66 then
				v_u_65.TextLabel.Text = v66
			else
				v_u_65:Destroy()
			end
		end))
	end)
	if game.Workspace:GetAttribute("JandelWaldo_SpawnSign") then
		v64()
	end
	task.delay(3, function()
		-- upvalues: (copy) v_u_12
		for _, v_u_67 in workspace:WaitForChild("PetsWaldo"):GetChildren() do
			for _, v68 in v_u_67:GetDescendants() do
				if v68:IsA("ProximityPrompt") then
					v_u_12:Add(v68.Triggered:Connect(function()
						-- upvalues: (copy) v_u_67, (ref) v_u_12
						if not v_u_67:GetAttribute("Target") then
							local v69 = v_u_12:Add(script.Assets.SmokeEffect:Clone())
							v69.Anchored = true
							v69.CanCollide = false
							v69.Massless = true
							v69:PivotTo(v_u_67.PrimaryPart.CFrame)
							v69.Parent = game.Workspace.WeatherVisuals
							game:GetService("Debris"):AddItem(v69, 5)
							v69.PixelSmoke:Emit(15)
							v_u_67:Destroy()
						end
					end))
				end
			end
		end
	end)
	repeat
		task.wait(0.1)
	until v_u_2 == false
	v_u_5.UpdateSkybox(v_u_6, -1)
	v_u_7.target(game.Workspace.BasePlate.TopBaseplate, 1, 2, {
		["Color"] = Color3.fromRGB(91, 154, 76)
	})
	v_u_7.target(game.Lighting, 1, 2, {
		["Ambient"] = Color3.fromRGB(138, 138, 138)
	})
	v_u_7.target(game.Lighting.Atmosphere, 1, 2, {
		["Density"] = 0
	})
	v_u_12:Destroy()
end
workspace:GetAttributeChangedSignal("JandelWaldo"):Connect(function()
	-- upvalues: (ref) v_u_2
	if workspace:GetAttribute("JandelWaldo") then
		CreateEvent()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("JandelWaldo") then
	task.defer(CreateEvent)
else
	v_u_2 = false
end
return v1