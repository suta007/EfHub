local v1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v_u_2.Data.SessionTimeLuckData)
local v_u_4 = require(v_u_2.Modules.GetFarm)
local v_u_5 = v1.LocalPlayer
local v18 = {
	["GetCurrentLuck"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_3
		if not v_u_5:GetAttribute("SessionTimeLuckEnabled") then
			return 0
		end
		local v6 = v_u_5:GetAttribute("SessionTimeLuckIndex") or 1
		local v7 = v_u_3.Timer[v6 or 1]
		return not v7 and 0 or v7.Luck
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
		local v8 = nil
		while true do
			v8 = v8 or v_u_4(v_u_5)
			if v8 then
				break
			end
			task.wait(1)
		end
		local v_u_9 = v_u_2.Assets.Models.Luckboard:Clone()
		local v10 = v8:WaitForChild("LuckboardSpawn", 999)
		if v10 then
			v_u_9:PivotTo(v10:GetPivot())
			for v11, v12 in v_u_3.Timer do
				local v13 = v_u_9.Main.SurfaceGui.Frame:FindFirstChild((tostring(v11)))
				if v13 then
					v13.Seconds.Text = ("%* Minutes"):format(v12.Time // 60)
					v13.TextLabel.Text = ("+%*%% Luck"):format(v12.Luck * 100)
				end
			end
			local v_u_14 = v_u_9.Main.SurfaceGui.Frame.ActiveBoost.TextLabel
			local function v17()
				-- upvalues: (ref) v_u_5, (copy) v_u_9, (ref) v_u_2, (ref) v_u_3, (copy) v_u_14
				if v_u_5:GetAttribute("SessionTimeLuckEnabled") then
					v_u_9.Parent = workspace.MapDecorations
					local v15 = v_u_5:GetAttribute("SessionTimeLuckIndex") or 1
					local v16 = v_u_3.Timer[v15 or 1]
					v_u_14.Text = not v16 and "1x Luck" or ("+%*%% Luck"):format(v16.Luck * 100)
				else
					v_u_9.Parent = v_u_2
				end
			end
			v_u_5:GetAttributeChangedSignal("SessionTimeLuckIndex"):Connect(v17)
			v_u_5:GetAttributeChangedSignal("SessionTimeLuckEnabled"):Connect(v17)
			task.spawn(v17)
		else
			v_u_9:Destroy()
		end
	end
}
task.spawn(v18.Start, v18)
return v18