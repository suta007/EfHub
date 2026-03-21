local v_u_1 = {}
game:GetService("ServerScriptService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
game:GetService("GuiService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players")
local v_u_6 = require(v_u_2.Modules.DataService)
local v_u_7 = require(v_u_2.Data.GardenLevel.GardenLevelData)
local v_u_8 = require(v_u_2.Code.Particle2D)
require(v_u_2.Code.Spr)
local v_u_9 = require(v_u_2.Modules.UpdateService)
local v_u_10 = require(v_u_2.Modules.SoundPlayer)
require(v_u_2.Data.SoundData)
local v11 = v_u_2:WaitForChild("GameEvents"):WaitForChild("RE_ExperienceGained")
local v_u_12 = v5.LocalPlayer.PlayerGui:WaitForChild("Experience Bar")
local v_u_13 = v_u_12:FindFirstChild("CurrentLevelTextLabel", true)
local v_u_14 = v_u_12:FindFirstChild("NextLevelTextLabel", true)
local v_u_15 = v_u_12:FindFirstChild("PROGRESS_FILL", true)
local v_u_16 = v_u_12:FindFirstChild("PROGRESSION_AMOUNT", true)
local function v_u_35()
	-- upvalues: (copy) v_u_14, (copy) v_u_12, (copy) v_u_3, (copy) v_u_8
	local v17 = Random.new()
	for _ = 1, 10 do
		local v18 = v17:NextNumber(0, 359)
		local v19 = v17:NextInteger(20, 45)
		local v20 = v17:NextNumber(-10, 10)
		local v21 = math.rad(v18)
		local v22 = v20 * math.cos(v21)
		local v23 = math.rad(v18)
		local v24 = v20 * math.sin(v23)
		local v25 = v_u_14.AbsolutePosition + v_u_14.AbsoluteSize / 2
		local v_u_26
		if v17:NextInteger(0, 1) == 1 then
			v_u_26 = script.Sparkle:Clone()
		else
			v_u_26 = script.Sparkle2:Clone()
		end
		v_u_26.Position = UDim2.fromOffset(v25.X, v25.Y) + UDim2.fromOffset(v22, v24)
		v_u_26.Size = UDim2.fromOffset(v19, v19)
		v_u_26.Parent = v_u_12
		local v_u_27 = v17:NextNumber(0, 0.5)
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_26, (copy) v_u_27
			local v28 = {
				["ImageTransparency"] = v_u_27
			}
			v_u_3:Create(v_u_26, TweenInfo.new(1), v28):Play()
			task.wait(1)
			v_u_3:Create(v_u_26, TweenInfo.new(1), {
				["ImageTransparency"] = 1
			}):Play()
		end)
		local v29 = UDim2.fromOffset
		local v30 = math.rad(v18)
		local v31 = math.cos(v30) * 500
		local v32 = math.rad(v18)
		local v33 = v29(v31, math.sin(v32) * -500)
		local v34 = UDim2.fromOffset(0, 4)
		v_u_8.createParticle(v_u_26, 1.5, v33, v17:NextInteger(-45, 45), v34, UDim2.fromOffset(5, 5), 0, 0, nil, 0.3)
	end
end
local v_u_36 = {}
local v_u_37 = false
local v_u_38 = nil
function v_u_1.UpdateProgression(_)
	-- upvalues: (ref) v_u_37, (copy) v_u_36, (copy) v_u_12, (copy) v_u_3, (copy) v_u_7, (ref) v_u_38, (copy) v_u_15, (copy) v_u_13, (copy) v_u_14, (copy) v_u_16, (copy) v_u_10, (copy) v_u_2, (copy) v_u_4, (copy) v_u_35, (copy) v_u_1
	if v_u_37 then
		return
	else
		local v39 = table.remove(v_u_36, 1)
		if v39 then
			local v40, v41, v42 = table.unpack(v39)
			v_u_37 = true
			v_u_12.Enabled = true
			v_u_3:Create(v_u_12.Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				["Position"] = UDim2.fromScale(0.5, 0.15)
			}):Play()
			task.wait(0.1)
			local v43 = v_u_7.GetMaxLevel()
			local v44 = v_u_7.CalculateLevel(v40)
			local v45 = math.min(v44, v43)
			local v46 = v_u_7.CalculateXPForLevel
			local v47 = math.min(v40, v46(v43))
			local v48 = v_u_7.CalculateXPForLevel
			local v49 = math.min(v41, v48(v43))
			local v50 = v_u_7.CalculateLevel(v49)
			local v51 = math.min(v50, v43)
			local v52 = v43 <= v51
			local v53
			if v45 == v51 then
				v53 = false
			else
				v53 = not v42
			end
			for v54 = v45, v51 do
				local v55 = v43 <= v54 and true or v42
				local v56 = v_u_7.CalculateXPForLevel(v54)
				local v57 = v_u_7.CalculateXPForLevel(v54 + 1)
				local v58 = v57 - v56
				local v59 = math.min(v57, v49)
				if v53 and (not v55 and v45 < v54) then
					if v_u_38 then
						v_u_38:Stop()
						v_u_38 = nil
					end
					v_u_15.Size = UDim2.fromScale(0, 1)
				end
				v_u_13.Text = math.min(v54, v43)
				local v60 = v_u_14
				local v61 = v54 + 1
				v60.Text = math.min(v61, v43)
				local v62 = v54 == v43 and 1 or (v59 - v56) / v58
				if v55 then
					v_u_15.Size = UDim2.fromScale(v62, 1)
					v_u_16.Text = v52 and "Max Level" or ("%*/%*"):format(v_u_7.GetXPEarnedCurrentLevel(v59), v58)
				else
					v_u_3:Create(v_u_15, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						["Size"] = UDim2.fromScale(v62, 1)
					}):Play()
					local v_u_63 = v_u_10:PlaySound("rbxassetid://107236243618748", nil, nil, v_u_2)
					v_u_63.Ended:Once(function()
						-- upvalues: (copy) v_u_63
						v_u_63:Destroy()
					end)
					v_u_63:Play()
					v_u_38 = v_u_63
					local v64 = 0
					while v64 < 0.5 do
						v64 = v64 + v_u_4.Heartbeat:Wait()
						local v65 = v64 / 0.5
						local v66 = math.clamp(v65, 0, 1)
						local v67 = math.lerp(v47, v59, v66)
						local v68 = math.floor(v67)
						local v69 = v_u_7.GetXPEarnedCurrentLevel(v68)
						if v68 == v59 then
							v69 = v_u_7.GetXPEarnedCurrentLevel(v68 - 1) + 1
						end
						v_u_16.Text = ("%*/%*"):format(v69, v58)
					end
				end
				if v53 and not v55 then
					local v_u_70 = v_u_10:PlaySound("rbxassetid://98153553011954", nil, nil, v_u_2)
					v_u_70.Ended:Once(function()
						-- upvalues: (copy) v_u_70
						v_u_70:Destroy()
					end)
					v_u_70:Play()
					local v71 = v_u_3:Create(v_u_14.Parent.UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						["Scale"] = 1.15
					})
					v71:Play()
					v_u_35()
					v71.Completed:Wait()
					v_u_3:Create(v_u_14.Parent.UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
						["Scale"] = 1
					}):Play()
				end
				v47 = v59
			end
			local v72 = v42 and 4 or 2
			while v72 > 0 and #v_u_36 <= 0 do
				v72 = v72 - task.wait(0.1)
			end
			v_u_37 = false
			if #v_u_36 > 0 then
				v_u_1:UpdateProgression()
			end
			v_u_3:Create(v_u_12.Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
				["Position"] = UDim2.fromScale(0.5, -0.5)
			}):Play()
			task.wait(0.5)
			v_u_12.Enabled = false
		end
	end
end
v11.OnClientEvent:Connect(function(p73, p74)
	-- upvalues: (copy) v_u_36, (ref) v_u_38, (copy) v_u_1
	local v75 = v_u_36
	table.insert(v75, { p73, p74 })
	if v_u_38 then
		v_u_38:Stop()
	end
	v_u_1:UpdateProgression()
end)
function v_u_1.Start(_)
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_36, (copy) v_u_1
	local v76 = v_u_6:GetData()
	if v76 then
		if not v_u_9:IsHiddenFromUpdate("Garden Levels") then
			local v77 = v76.GardenLevel.TotalExperience
			local v78 = v_u_36
			table.insert(v78, { v77, v77, true })
			v_u_1:UpdateProgression()
		end
	else
		return
	end
end
task.spawn(v_u_1.Start, v_u_1)
return v_u_1