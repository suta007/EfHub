local v1 = {}
local _ = workspace.CurrentCamera
local v_u_2 = require(game.ReplicatedStorage.Modules.Notification)
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Modules.SoundPlayer)
local v_u_5 = require(v3.Data.SoundData)
local v_u_6 = false
local v_u_7 = nil
local function v_u_18(_)
	-- upvalues: (ref) v_u_6, (copy) v_u_2, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5
	if v_u_6 == true then
		return
	else
		v_u_6 = true
		local v8 = workspace.WeatherVisuals:WaitForChild("OBBY", 10)
		if v8 == nil then
			warn("NO OBBY")
		else
			for _, v_u_9 in v8:GetDescendants() do
				if v_u_9:IsA("BasePart") then
					task.spawn(function()
						-- upvalues: (copy) v_u_9
						local v10 = v_u_9.CFrame
						local v11 = v_u_9
						v11.CFrame = v11.CFrame * CFrame.new(math.random(-500, 500), math.random(300, 500), math.random(-500, 500))
						task.wait(math.random(1, 100) * 0.01)
						game.TweenService:Create(v_u_9, TweenInfo.new(1.5), {
							["CFrame"] = v10
						}):Play()
					end)
				end
			end
			local v_u_12 = nil
			v8.Destroying:Once(function()
				-- upvalues: (ref) v_u_12
				if v_u_12 then
					v_u_12:Disconnect()
				end
			end)
			v_u_12 = v8.winners.ChildAdded:Connect(function(p13)
				-- upvalues: (ref) v_u_2
				local v14 = game.Players:GetPlayerByUserId(p13.Name)
				if v14 then
					v_u_2:CreateNotification(v14.Name .. " completed the obby and won a Jump Pad cosmetic!")
				end
			end)
			v_u_7 = script.ObbyTimer:Clone()
			v_u_7.Parent = game.Players.LocalPlayer.PlayerGui
			local v_u_15 = nil
			v_u_7.Destroying:Once(function()
				-- upvalues: (ref) v_u_15
				if v_u_15 then
					v_u_15:Disconnect()
				end
			end)
			v_u_15 = v8:WaitForChild("Timer").Changed:Connect(function(p16)
				-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_7
				if p16 < 11 then
					local v17 = {
						["RollOffMaxDistance"] = 10000,
						["RollOffMinDistance"] = 10,
						["RollOffMode"] = Enum.RollOffMode.Inverse,
						["Volume"] = 1,
						["PlaybackSpeed"] = 1.5
					}
					v_u_4:PlaySound(v_u_5.Weather.Obby.ding, v17, nil, v_u_7)
				end
				v_u_7.TextLabel.Text = "Obby Time: " .. math.clamp(p16, 0, 999)
			end)
		end
	end
end
local function v_u_21(_)
	-- upvalues: (ref) v_u_6, (ref) v_u_7
	if v_u_6 == false then
		return
	else
		if v_u_7 then
			v_u_7:Destroy()
		end
		v_u_6 = false
		local v19 = workspace.WeatherVisuals:WaitForChild("OBBY", 10)
		if v19 == nil then
			warn("NO OBBY")
		else
			for _, v_u_20 in v19:GetDescendants() do
				if v_u_20:IsA("BasePart") then
					task.spawn(function()
						-- upvalues: (copy) v_u_20
						task.wait(math.random(1, 100) * 0.01)
						game.TweenService:Create(v_u_20, TweenInfo.new(1.5), {
							["CFrame"] = v_u_20.CFrame * CFrame.new(math.random(-500, 500), math.random(300, 500), math.random(-500, 500))
						}):Play()
					end)
				end
			end
		end
	end
end
workspace:GetAttributeChangedSignal("Obby"):Connect(function()
	-- upvalues: (copy) v_u_18, (copy) v_u_21
	if workspace:GetAttribute("Obby") then
		v_u_18()
	else
		v_u_21()
	end
end)
if workspace:GetAttribute("Obby") then
	task.defer(function()
		-- upvalues: (copy) v_u_18
		v_u_18(true)
	end)
else
	v_u_21(true)
end
return v1