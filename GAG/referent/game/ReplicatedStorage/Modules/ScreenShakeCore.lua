local v1 = {}
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = workspace.CurrentCamera
local v_u_5 = game.Players.LocalPlayer
local v_u_6 = false
local v_u_7 = nil
local v_u_8 = Vector3.new(0, 0, 0)
local v_u_9 = 0
local v_u_10 = 0
v1.RootPart = nil
v1.Humanoid = nil
function lerp(p11, p12, p13)
	return p11 + (p12 - p11) * p13
end
local function v_u_17()
	-- upvalues: (ref) v_u_8, (ref) v_u_9, (copy) v_u_4
	local v14 = v_u_9
	local v15 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v14)))
	local v16 = v_u_4
	v16.CFrame = v16.CFrame * v15
end
function v1.ScreenShake(_, p_u_18, p_u_19, p_u_20, p_u_21, p_u_22, p_u_23)
	-- upvalues: (ref) v_u_7, (copy) v_u_3, (ref) v_u_10, (ref) v_u_6, (copy) v_u_2, (copy) v_u_17, (ref) v_u_9, (ref) v_u_8, (copy) v_u_4, (copy) v_u_5
	task.spawn(function()
		-- upvalues: (copy) p_u_18, (copy) p_u_19, (ref) p_u_20, (copy) p_u_21, (ref) v_u_7, (ref) v_u_3, (copy) p_u_23, (ref) p_u_22, (ref) v_u_10, (ref) v_u_6, (ref) v_u_2, (ref) v_u_17, (ref) v_u_9, (ref) v_u_8, (ref) v_u_4, (ref) v_u_5
		if p_u_18 == "Normal" then
			if p_u_19[1] == "Tilt" then
				local v_u_24 = Instance.new("NumberValue")
				v_u_24.Value = 0
				local v25 = p_u_20
				task.spawn(function()
					-- upvalues: (ref) p_u_21, (ref) p_u_19, (ref) v_u_7, (ref) v_u_3, (copy) v_u_24
					v_u_7 = v_u_3:Create(v_u_24, TweenInfo.new(p_u_21 / p_u_19[2], Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
						["Value"] = 1
					}):Play()
					task.wait(p_u_21 / p_u_19[2])
					local v26 = false
					for _ = 1, p_u_19[2] do
						if v26 == false then
							v26 = true
							v_u_7 = v_u_3:Create(v_u_24, TweenInfo.new(p_u_21 / p_u_19[2], Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
								["Value"] = -1
							}):Play()
						else
							v26 = false
							v_u_7 = v_u_3:Create(v_u_24, TweenInfo.new(p_u_21 / p_u_19[2], Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
								["Value"] = 1
							}):Play()
						end
						task.wait(p_u_21 / p_u_19[2])
					end
				end)
				local v27 = tick() + p_u_21
				if p_u_23 == nil then
					v_u_10 = v_u_10 + 1
					if v_u_10 <= 1 then
						v_u_6 = true
						v_u_2:BindToRenderStep("ScreenShake", Enum.RenderPriority.Camera.Value + 1, v_u_17)
					end
					while v27 - tick() > 0 do
						v_u_2.RenderStepped:Wait()
						p_u_20 = v25 * v_u_24.Value
						v_u_9 = p_u_20 * p_u_22 * (v27 - tick())
					end
					v_u_10 = v_u_10 - 1
					if v_u_10 <= 0 then
						if v_u_6 == true then
							v_u_2:UnbindFromRenderStep("ScreenShake")
							local v28 = v_u_9
							local v29 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v28)))
							local v30 = v_u_4
							v30.CFrame = v30.CFrame * v29
						end
						v_u_6 = false
					end
				else
					p_u_22 = p_u_22 * (1 - (p_u_23[1] - p_u_23[2]).Magnitude / p_u_23[3])
					if p_u_22 <= 0 then
						return
					end
					v_u_10 = v_u_10 + 1
					if v_u_10 <= 1 then
						v_u_6 = true
						v_u_2:BindToRenderStep("ScreenShake", Enum.RenderPriority.Camera.Value + 1, v_u_17)
					end
					while v27 - tick() > 0 do
						v_u_2.RenderStepped:Wait()
						p_u_20 = v25 * v_u_24.Value
						v_u_9 = p_u_20 * p_u_22 * (v27 - tick())
					end
					v_u_10 = v_u_10 - 1
					if v_u_10 <= 0 then
						if v_u_6 == true then
							v_u_2:UnbindFromRenderStep("ScreenShake")
							local v31 = v_u_9
							local v32 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v31)))
							local v33 = v_u_4
							v33.CFrame = v33.CFrame * v32
						end
						v_u_6 = false
					end
				end
				if v_u_24 then
					v_u_24:Destroy()
					return
				end
			elseif p_u_19[1] == "Vector" then
				local v34 = tick() + p_u_21
				if p_u_23 == nil then
					local v35 = math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick())
					local v36 = math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick())
					local v37 = math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick())
					v_u_10 = v_u_10 + 1
					if v_u_10 <= 1 then
						v_u_6 = true
						v_u_2:BindToRenderStep("ScreenShake", Enum.RenderPriority.Camera.Value + 1, v_u_17)
					end
					while v34 - tick() > 0 do
						v_u_2.RenderStepped:Wait()
						v_u_8 = Vector3.new(v35, v36, v37)
						v35 = lerp(v35, math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick()), 0.75)
						v36 = lerp(v36, math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick()), 0.75)
						v37 = lerp(v37, math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick()), 0.75)
					end
					v_u_10 = v_u_10 - 1
					if v_u_10 <= 0 then
						if v_u_6 == true then
							v_u_2:UnbindFromRenderStep("ScreenShake")
							local v38 = v_u_9
							local v39 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v38)))
							local v40 = v_u_4
							v40.CFrame = v40.CFrame * v39
						end
						v_u_6 = false
						return
					end
				else
					p_u_22 = p_u_22 * (1 - (p_u_23[1] - p_u_23[2]).Magnitude / p_u_23[3])
					if p_u_22 <= 0 then
						return
					end
					local v41 = math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick())
					local v42 = math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick())
					local v43 = math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick())
					v_u_10 = v_u_10 + 1
					if v_u_10 <= 1 then
						v_u_6 = true
						v_u_2:BindToRenderStep("ScreenShake", Enum.RenderPriority.Camera.Value + 1, v_u_17)
					end
					while v34 - tick() > 0 do
						v_u_2.RenderStepped:Wait()
						v_u_8 = Vector3.new(v41, v42, v43)
						v41 = lerp(v41, math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick()), 0.75)
						v42 = lerp(v42, math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick()), 0.75)
						v43 = lerp(v43, math.random(-p_u_20, p_u_20) * p_u_22 * (v34 - tick()), 0.75)
					end
					v_u_10 = v_u_10 - 1
					if v_u_10 <= 0 then
						if v_u_6 == true then
							v_u_2:UnbindFromRenderStep("ScreenShake")
							local v44 = v_u_9
							local v45 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v44)))
							local v46 = v_u_4
							v46.CFrame = v46.CFrame * v45
						end
						v_u_6 = false
						return
					end
				end
			end
		elseif p_u_18 == "Constant" then
			if p_u_19[1] == "Tilt" then
				if p_u_23 == nil then
					local v_u_47 = Instance.new("BoolValue")
					v_u_47.Name = p_u_19[2]
					v_u_47.Parent = v_u_5
					local v_u_48 = nil
					local v_u_49 = false
					v_u_48 = v_u_47:GetPropertyChangedSignal("Parent"):Connect(function()
						-- upvalues: (ref) v_u_9, (ref) v_u_49, (ref) v_u_47, (ref) v_u_48
						v_u_9 = 0
						v_u_49 = true
						v_u_47 = nil
						if v_u_48 then
							v_u_48:Disconnect()
						end
					end)
					local v_u_50 = Instance.new("NumberValue")
					v_u_50.Value = 0
					local v51 = p_u_20
					task.spawn(function()
						-- upvalues: (ref) p_u_21, (ref) v_u_7, (ref) v_u_3, (copy) v_u_50
						v_u_7 = v_u_3:Create(v_u_50, TweenInfo.new(p_u_21, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Value"] = 1
						}):Play()
						task.wait(p_u_21)
						local v52 = false
						while true do
							if v52 == false then
								v52 = true
								v_u_7 = v_u_3:Create(v_u_50, TweenInfo.new(p_u_21, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
									["Value"] = -1
								}):Play()
							else
								v52 = false
								v_u_7 = v_u_3:Create(v_u_50, TweenInfo.new(p_u_21, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
									["Value"] = 1
								}):Play()
							end
							task.wait(p_u_21)
						end
					end)
					v_u_10 = v_u_10 + 1
					if v_u_10 <= 1 then
						v_u_6 = true
						v_u_2:BindToRenderStep("ScreenShake", Enum.RenderPriority.Camera.Value + 1, v_u_17)
					end
					while v_u_49 ~= true do
						v_u_2.RenderStepped:Wait()
						p_u_20 = v51 * v_u_50.Value
						v_u_9 = p_u_20 * p_u_22
					end
					v_u_9 = 0
					v_u_10 = v_u_10 - 1
					if v_u_10 <= 0 then
						if v_u_6 == true then
							v_u_2:UnbindFromRenderStep("ScreenShake")
							local v53 = v_u_9
							local v54 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v53)))
							local v55 = v_u_4
							v55.CFrame = v55.CFrame * v54
						end
						v_u_6 = false
					end
				else
					local _ = p_u_22 * (1 - (p_u_23[1].Position - p_u_23[2].Position).Magnitude / p_u_23[3])
					local v_u_56 = Instance.new("BoolValue")
					v_u_56.Name = p_u_19[2]
					v_u_56.Parent = v_u_5
					local v_u_57 = nil
					local v_u_58 = false
					v_u_57 = v_u_56:GetPropertyChangedSignal("Parent"):Connect(function()
						-- upvalues: (ref) v_u_9, (ref) v_u_58, (ref) v_u_56, (ref) v_u_57
						v_u_9 = 0
						v_u_58 = true
						v_u_56 = nil
						if v_u_57 then
							v_u_57:Disconnect()
						end
					end)
					local v_u_59 = Instance.new("NumberValue")
					v_u_59.Value = 0
					local v60 = p_u_20
					task.spawn(function()
						-- upvalues: (ref) p_u_21, (ref) v_u_7, (ref) v_u_3, (copy) v_u_59
						v_u_7 = v_u_3:Create(v_u_59, TweenInfo.new(p_u_21, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
							["Value"] = 1
						}):Play()
						task.wait(p_u_21)
						local v61 = false
						while true do
							if v61 == false then
								v61 = true
								v_u_7 = v_u_3:Create(v_u_59, TweenInfo.new(p_u_21, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
									["Value"] = -1
								}):Play()
							else
								v61 = false
								v_u_7 = v_u_3:Create(v_u_59, TweenInfo.new(p_u_21, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
									["Value"] = 1
								}):Play()
							end
							task.wait(p_u_21)
						end
					end)
					v_u_10 = v_u_10 + 1
					if v_u_10 <= 1 then
						v_u_6 = true
						v_u_2:BindToRenderStep("ScreenShake", Enum.RenderPriority.Camera.Value + 1, v_u_17)
					end
					while true do
						local v62 = p_u_22 * (1 - (p_u_23[1].Position - p_u_23[2].Position).Magnitude / p_u_23[3])
						if v_u_58 == true or (p_u_23[1] == nil or p_u_23[2] == nil) then
							break
						end
						v_u_2.RenderStepped:Wait()
						if v62 > 0 then
							p_u_20 = v60 * v_u_59.Value
							v_u_9 = p_u_20 * v62
						end
					end
					v_u_9 = 0
					v_u_10 = v_u_10 - 1
					if v_u_10 <= 0 then
						if v_u_6 == true then
							v_u_2:UnbindFromRenderStep("ScreenShake")
							local v63 = v_u_9
							local v64 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v63)))
							local v65 = v_u_4
							v65.CFrame = v65.CFrame * v64
						end
						v_u_6 = false
					end
				end
			end
			if p_u_19[1] == "Vector" then
				if p_u_23 ~= nil then
					local v66 = p_u_22 * (1 - (p_u_23[1].Position - p_u_23[2].Position).Magnitude / p_u_23[3])
					local v_u_67 = Instance.new("BoolValue")
					v_u_67.Name = p_u_19[2]
					v_u_67.Parent = v_u_5
					local v_u_68 = nil
					local v_u_69 = false
					v_u_68 = v_u_67:GetPropertyChangedSignal("Parent"):Connect(function()
						-- upvalues: (ref) v_u_8, (ref) v_u_69, (ref) v_u_67, (ref) v_u_68
						v_u_8 = Vector3.new(0, 0, 0)
						v_u_69 = true
						v_u_67 = nil
						if v_u_68 then
							v_u_68:Disconnect()
						end
					end)
					local v70 = math.random(-p_u_20, p_u_20) * v66
					local v71 = math.random(-p_u_20, p_u_20) * v66
					local v72 = math.random(-p_u_20, p_u_20) * v66
					v_u_10 = v_u_10 + 1
					if v_u_10 <= 1 then
						v_u_6 = true
						v_u_2:BindToRenderStep("ScreenShake", Enum.RenderPriority.Camera.Value + 1, v_u_17)
					end
					while v_u_69 ~= true and (p_u_23[1] ~= nil and p_u_23[2] ~= nil) do
						local v73 = p_u_22 * (1 - (p_u_23[1].Position - p_u_23[2].Position).Magnitude / p_u_23[3])
						v_u_2.RenderStepped:Wait()
						if v73 > 0 then
							v_u_8 = Vector3.new(v70, v71, v72)
							v70 = lerp(v70, math.random(-p_u_20, p_u_20) * v73, 0.75)
							v71 = lerp(v71, math.random(-p_u_20, p_u_20) * v73, 0.75)
							v72 = lerp(v72, math.random(-p_u_20, p_u_20) * v73, 0.75)
						end
					end
					v_u_8 = Vector3.new(0, 0, 0)
					v_u_10 = v_u_10 - 1
					if v_u_10 <= 0 then
						if v_u_6 == true then
							v_u_2:UnbindFromRenderStep("ScreenShake")
							local v74 = v_u_9
							local v75 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v74)))
							local v76 = v_u_4
							v76.CFrame = v76.CFrame * v75
						end
						v_u_6 = false
					end
					return
				end
				local v_u_77 = Instance.new("BoolValue")
				v_u_77.Name = p_u_19[2]
				v_u_77.Parent = v_u_5
				local v_u_78 = nil
				local v_u_79 = false
				v_u_78 = v_u_77:GetPropertyChangedSignal("Parent"):Connect(function()
					-- upvalues: (ref) v_u_8, (ref) v_u_79, (ref) v_u_77, (ref) v_u_78
					v_u_8 = Vector3.new(0, 0, 0)
					v_u_79 = true
					v_u_77 = nil
					if v_u_78 then
						v_u_78:Disconnect()
					end
				end)
				local v80 = math.random(-p_u_20, p_u_20) * p_u_22
				local v81 = math.random(-p_u_20, p_u_20) * p_u_22
				local v82 = math.random(-p_u_20, p_u_20) * p_u_22
				v_u_10 = v_u_10 + 1
				if v_u_10 <= 1 then
					v_u_6 = true
					v_u_2:BindToRenderStep("ScreenShake", Enum.RenderPriority.Camera.Value + 1, v_u_17)
				end
				while v_u_79 ~= true do
					v_u_2.RenderStepped:Wait()
					v_u_8 = Vector3.new(v80, v81, v82)
					v80 = lerp(v80, math.random(-p_u_20, p_u_20) * p_u_22, 0.75)
					v81 = lerp(v81, math.random(-p_u_20, p_u_20) * p_u_22, 0.75)
					v82 = lerp(v82, math.random(-p_u_20, p_u_20) * p_u_22, 0.75)
				end
				v_u_8 = Vector3.new(0, 0, 0)
				v_u_10 = v_u_10 - 1
				if v_u_10 <= 0 then
					if v_u_6 == true then
						v_u_2:UnbindFromRenderStep("ScreenShake")
						local v83 = v_u_9
						local v84 = CFrame.new(v_u_8) * CFrame.Angles(0, 0, (math.rad(v83)))
						local v85 = v_u_4
						v85.CFrame = v85.CFrame * v84
					end
					v_u_6 = false
				end
			end
		end
	end)
end
return v1