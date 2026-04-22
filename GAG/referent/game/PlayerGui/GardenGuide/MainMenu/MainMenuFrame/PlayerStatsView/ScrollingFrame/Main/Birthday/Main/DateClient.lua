game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.GameTimeUtils)
local v_u_3 = require(v1.Data.NPCLevels.NPCLevelData)
local v_u_4 = require(v1.Modules.Chalk)
local v_u_5 = require(v1.Modules.UpdateService)
local v6 = v1.GameEvents.DayChanged_RE
local v_u_7 = script.Parent.Group
local v_u_8 = v_u_7.DateLabel
local v_u_9 = v_u_7.BdayLabel
local function v_u_22()
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_2, (copy) v_u_8, (copy) v_u_3, (copy) v_u_9, (copy) v_u_4
	if v_u_5:IsHiddenFromUpdate("NPCBirthday") then
		v_u_7.Visible = false
	else
		v_u_7.Visible = true
	end
	local v10, v11 = v_u_2:GameDateFromTime((workspace:GetServerTimeNow()))
	v_u_8.Text = ("%* %*"):format(v10, (v_u_2:GetMonthName(v11)))
	local v12 = v_u_3:GetDaysTillAllBdays()
	local v13 = (1 / 0)
	local v14 = {}
	for _, v15 in v12 do
		if v15 < v13 then
			v13 = v15
		end
	end
	for v16, v17 in v12 do
		if v17 == v13 then
			table.insert(v14, v16)
		end
	end
	if #v14 > 0 then
		local v18 = ""
		for v19, v20 in v14 do
			v18 = v18 .. (v19 > 1 and ", " or "") .. v20
		end
		local v21 = ("Birthday%*"):format(#v14 > 1 and "s" or "")
		if v13 == 0 then
			v_u_9.Text = ("%* for %* %*"):format(v21, v_u_4.green(v18), (v_u_4.orange("TODAY!")))
		else
			("day%*"):format(v13 > 1 and "s" or "")
			v_u_9.Text = ""
		end
	else
		v_u_9.Text = ""
		return
	end
end
v6.OnClientEvent:Connect(v_u_22)
task.spawn(function()
	-- upvalues: (copy) v_u_22
	while true do
		v_u_22()
		task.wait(math.random(30, 60))
	end
end)