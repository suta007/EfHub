local v1 = game:GetService("SoundService")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.Modules.SoundPlayer)
local v_u_6 = require(v4.Data.SoundData)
local v_u_7 = require(game.ReplicatedStorage:WaitForChild("Cutscene_Module"))
local v_u_8 = game.Players.LocalPlayer
TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v_u_9 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
require(game.ReplicatedStorage:WaitForChild("RichText"))
TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local v_u_10 = game.SoundService.NPC_SFX.Sam
local _ = game.SoundService.Response_Text
function Create_Text(p11)
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_9, (copy) v_u_3, (copy) v_u_10
	local v12 = v_u_8.PlayerGui:WaitForChild("Rejoin_UI")
	for _, v13 in pairs(v12:GetDescendants()) do
		if v13:IsA("TextLabel") then
			v_u_2:Create(v13, v_u_9, {
				["TextStrokeTransparency"] = 1,
				["TextTransparency"] = 1
			}):Play()
			v_u_3:AddItem(v13.Parent, v_u_9.Time)
		end
	end
	local v14 = script.Frame:Clone()
	v14.TextLabel.Text = p11
	v_u_2:Create(v14.TextLabel, v_u_9, {
		["TextTransparency"] = 0,
		["TextStrokeTransparency"] = 0
	}):Play()
	v14.Parent = v12
	local v15 = string.len(p11)
	while v15 >= 1 do
		task.wait()
		if v_u_10.TimePosition > 0.075 or v_u_10.Playing == false then
			v_u_10.TimePosition = 0
			v_u_10.Playing = true
			v_u_10.PlaybackSpeed = 1 + math.random(-5, 5) / 100
		end
		v15 = v15 - 1
		local v16 = v14.TextLabel
		v16.MaxVisibleGraphemes = v16.MaxVisibleGraphemes + 1
	end
end
function End()
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_9, (copy) v_u_3
	local v17 = v_u_8.PlayerGui:WaitForChild("Rejoin_UI")
	for _, v18 in pairs(v17:GetDescendants()) do
		if v18:IsA("TextLabel") then
			v_u_2:Create(v18, v_u_9, {
				["TextStrokeTransparency"] = 1,
				["TextTransparency"] = 1
			}):Play()
			v_u_3:AddItem(v18.Parent, v_u_9.Time)
		end
	end
end
local v_u_19 = v1.Music.Tunes
game.ReplicatedStorage.GameEvents:WaitForChild("Start_Cutscene").OnClientEvent:Connect(function(p20)
	-- upvalues: (copy) v_u_7, (copy) v_u_19, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3
	Create_Text("Your garden grew while you were gone!")
	task.wait(3)
	End()
	task.wait(1)
	Create_Text("When you left it looked like this...")
	task.wait(0.5)
	task.wait(p20 - 0.5)
	v_u_7.Flash(0.75)
	task.spawn(function()
		-- upvalues: (ref) v_u_19, (ref) v_u_5, (ref) v_u_6, (ref) v_u_2
		local _ = v_u_19.Volume
		local v21 = v_u_5:PlaySound(v_u_6.General.Growth.YourGardenGrewCutscene, {
			["Volume"] = 2
		})
		v_u_2:Create(v21, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
			["Volume"] = 1
		}):Play()
		task.wait(5.2)
		v_u_2:Create(v21, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
			["Volume"] = 2
		}):Play()
	end)
	task.wait(1.125)
	Create_Text("This is your garden now!")
	task.spawn(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_2, (ref) v_u_9, (ref) v_u_3
		task.wait(2)
		local v22 = v_u_8.PlayerGui:WaitForChild("Rejoin_UI")
		for _, v23 in pairs(v22:GetDescendants()) do
			if v23:IsA("TextLabel") then
				v_u_2:Create(v23, v_u_9, {
					["TextStrokeTransparency"] = 1,
					["TextTransparency"] = 1
				}):Play()
				v_u_3:AddItem(v23.Parent, v_u_9.Time)
			end
		end
	end)
end)