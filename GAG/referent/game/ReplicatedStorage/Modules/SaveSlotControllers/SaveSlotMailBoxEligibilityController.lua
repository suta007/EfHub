local v1 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local v2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v1.Modules.DataService)
local v_u_4 = require(v1.Modules.UpdateService)
require(v1.Modules.GetFarmAsync)(v2)
local function v_u_8(p5, p6)
	local v7 = p5:GetAttribute("DefaultCFrame")
	if not v7 then
		v7 = p5:GetPivot()
		p5:SetAttribute("DefaultCFrame", v7)
	end
	if not p6 then
		v7 = CFrame.new(0, 1000000000, 0)
	end
	p5:PivotTo(v7)
end
local v_u_9 = require(v1.Modules.SaveSlotControllers.SaveSlotController)
local function v_u_16()
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_8
	local v10 = v_u_3:GetData()
	local v11 = not v_u_4:IsHiddenFromUpdate("Save Slots")
	if v10.Sheckles >= 10000000 then
		v_u_9:RememberUnlockage()
	end
	for _, v12 in workspace.Farm:GetChildren() do
		local v13 = v12:FindFirstChild("Mailbox")
		if v13 then
			local v14 = v_u_8
			local v15
			if v11 then
				v15 = v10.SaveSlots.UnlockedBefore
			else
				v15 = v11
			end
			v14(v13, v15)
		end
	end
end
v_u_3:GetPathSignal("Sheckles"):Connect(v_u_16)
v_u_3:GetPathSignal("SaveSlots/UnlockedBefore"):Connect(v_u_16)
task.spawn(v_u_16)
v_u_16()
local v17 = {}
for _, v_u_18 in workspace.Farm:GetChildren() do
	xpcall(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_16
		v_u_18.Important.Data.Owner:GetPropertyChangedSignal("Value"):Connect(v_u_16)
	end, warn)
	v_u_18.ChildAdded:Connect(function(p19)
		-- upvalues: (copy) v_u_16
		if p19.Name == "Mailbox" then
			v_u_16()
		end
	end)
	v_u_18.ChildRemoved:Connect(function(p20)
		-- upvalues: (copy) v_u_16
		if p20.Name == "Mailbox" then
			v_u_16()
		end
	end)
end
task.spawn(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_16
	while v_u_4:IsHiddenFromUpdate("Save Slots") do
		task.wait(1)
	end
	v_u_16()
end)
return v17