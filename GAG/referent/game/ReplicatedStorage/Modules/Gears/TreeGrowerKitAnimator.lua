local v_u_1 = {}
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v_u_4.Code.Bezier)
local v_u_6 = require(v_u_4.Modules.TweenModel)
local v_u_7 = v_u_4.GameEvents.RunTreeGrowKitAnimation
local v8 = {
	["North"] = Vector3.new(-0, -0, -1),
	["East"] = Vector3.new(1, 0, 0),
	["South"] = Vector3.new(0, 0, 1),
	["West"] = Vector3.new(-1, -0, -0)
}
local v_u_9 = {
	["Can"] = {
		["Model"] = script.Can,
		["Count"] = 0,
		["Direction"] = v8.North
	},
	["Fertiliser"] = {
		["Model"] = script.Fertiliser,
		["Count"] = 0,
		["Direction"] = v8.East
	},
	["Reclaimer"] = {
		["Model"] = script.Reclaimer,
		["Count"] = 0,
		["Direction"] = v8.South
	},
	["Trowel"] = {
		["Model"] = script.Trowel,
		["Count"] = 0,
		["Direction"] = v8.West
	}
}
function v_u_1.StartAnimation(_, p10, p11)
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5
	if v_u_3:IsServer() then
		v_u_7:FireClient(p10, p11)
		return
	else
		local v12 = require(v_u_4.Modules.SoundPlayer)
		local v13 = require(v_u_4.Data.SoundData)
		if p10 then
			if p11 then
				local v14 = p10.Character or p10.CharacterAdded:Wait()
				local v15 = v14:FindFirstChildOfClass("Tool")
				local v16
				if v15 and v15:HasTag("TreeGrowerKit") then
					v16 = v15:FindFirstChild("Tree Grower Kit")
				else
					v16 = nil
				end
				local v17 = v_u_9
				local v18 = (1 / 0)
				local v19 = nil
				for v20, v21 in pairs(v17) do
					if v21.Count < v18 then
						v18 = v21.Count
						v19 = v20
					end
				end
				local v22 = v_u_9[v19]
				v22.Count = v22.Count + 1
				local v23 = v_u_9[v19].Model:Clone()
				local v24 = (v16 and v16:GetPivot() or v14:GetPivot()) * CFrame.new(v_u_9[v19].Direction * 5)
				v23:PivotTo(v24)
				if v16 then
					local v25 = v16:FindFirstChild(v19)
					if v25 then
						v23:PivotTo(v25:GetPivot())
					end
					v_u_6(v23, TweenInfo.new(1, Enum.EasingStyle.Elastic), {
						["CFrame"] = v24,
						["Scale"] = v23:GetScale()
					}):Play()
				end
				local v26 = {
					["PlaybackSpeed"] = math.random(95, 105) / 100
				}
				v12:PlaySound(v13.Tools.Generic.Equip, v26)
				v12:PlaySound(v13.General.PopSound, v26)
				v23.Parent = workspace.Visuals
				task.wait(1.1)
				local v27 = 0
				while v27 < 1 do
					v27 = v27 + game:GetService("RunService").Heartbeat:Wait()
					local v28 = v24.Position
					local v29 = p11:GetPivot().Position
					local v30 = (v28 + v29) / 2
					local v31 = v28.Y + 7
					local v32 = v30 + Vector3.new(0, v31, 0)
					local v33 = v_u_5.new(v28, v32, v29):Get((game.TweenService:GetValue(v27 / 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)))
					v23:PivotTo(CFrame.new(v33))
				end
				v12:PlaySound("rbxassetid://131982914016274", v26)
				v12:PlaySound("rbxassetid://98997625344529", v26)
				if v23 then
					v23:Destroy()
				end
				local v34 = v_u_9[v19]
				v34.Count = v34.Count - 1
			end
		else
			return
		end
	end
end
if v_u_3:IsClient() then
	v_u_7.OnClientEvent:Connect(function(p35)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		v_u_1:StartAnimation(v_u_2.LocalPlayer, p35)
	end)
end
return v_u_1