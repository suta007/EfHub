local v1 = game:GetService("Players")
local v_u_2 = game:GetService("HttpService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = v1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Hud_UI")
local v_u_5 = require(v3.Modules.TimeHelper)
local v_u_6 = v4.SideBtns.UpdateTimeUserInterface
local v_u_7 = v_u_6.Template
local v_u_8 = {
	["State"] = {
		["ActiveTimers"] = {}
	}
}
local function v_u_12()
	-- upvalues: (copy) v_u_2
	local v_u_9 = workspace:GetAttribute("UpdateTimerData")
	if not v_u_9 then
		return {}
	end
	local v10, v11 = pcall(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_9
		return v_u_2:JSONDecode(v_u_9)
	end)
	if v10 then
		return v11
	end
	warn("[UpdateTimeUserInterfaceController]: Failed to parse UpdateTimerData!", v11)
	return {}
end
function v_u_8.Render(_)
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
	local v13 = workspace:GetServerTimeNow() // 1
	local v14 = v_u_12()
	local v15 = v_u_8.State.ActiveTimers
	local v16 = {}
	for v17, v18 in v14 do
		local v19 = v18.UpdateTime
		local v20 = v18.UpdateText
		local v21 = ("%*-%*"):format(v17, v20)
		v16[v21] = true
		if not v15[v21] then
			local v22 = v_u_7:Clone()
			v15[v21] = {
				["TimerLabel"] = v22,
				["UpdateTime"] = v19,
				["UpdateText"] = v20
			}
			v22.Parent = v_u_6
			v22.LayoutOrder = v17
			v22.Visible = true
		end
	end
	for v23, v24 in v15 do
		if not v16[v23] then
			v24.TimerLabel:Destroy()
			v15[v23] = nil
		end
	end
	for v25, v26 in v14 do
		local v27 = v26.UpdateTime
		local v28 = v26.UpdateText
		local v29 = v15[("%*-%*"):format(v25, v28)]
		if v29 then
			local v30 = v29.TimerLabel
			local v31 = v27 - v13
			v30.Text = v28:gsub(":UpdateTime:", (v_u_5:GenerateTextFromTime(v31, true)))
			v30.Visible = v31 > 0
		end
	end
end
function v_u_8.Start(_)
	-- upvalues: (copy) v_u_8
	task.spawn(function()
		-- upvalues: (ref) v_u_8
		while true do
			task.wait(1)
			v_u_8:Render()
		end
	end)
end
task.spawn(function()
	-- upvalues: (copy) v_u_8
	v_u_8:Start()
end)
return v_u_8