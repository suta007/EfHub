local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
require(v1.Modules.GuiController)
local v4 = require(v1.Modules.Trove)
require(v1.Modules.ItemImageFinder)
require(v1.Modules.NumberUtil)
require(v1.Modules.CommaFormatNumber)
require(v1.Modules.GiveServiceCommon)
require(v1.Modules.UpdateService)
require(v1.Modules.Signal)
require(v1.Modules.DataService)
local v5 = require(v1.Modules.EventService)
require(v1.Modules.QuestsController)
local v6 = require(v1.Modules.CreateTagHandler)
local v_u_7 = require(v1.Code.Spr)
require(v1.Modules.MarketController)
require(v1.Modules.UIComponents.QuestView)
local v8 = require(v1.Data.SharedCycleHandlerData)
local _ = v3.LocalPlayer
local v_u_9 = workspace.CurrentCamera
local v_u_10 = v5.new("StealAPetController", "Steal A Pet Event")
local v_u_11 = v8.StealAPetEvent
local v_u_12 = v4.new()
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = {}
local v_u_17 = false
local v_u_18 = { "Texture", "Decal" }
local function v_u_26(p_u_19)
	-- upvalues: (copy) v_u_12, (ref) v_u_13, (copy) v_u_11
	if p_u_19.PrimaryPart then
		local v_u_20 = {
			["RotationX"] = 10,
			["RotationZ"] = 12.5,
			["Height"] = 0.25,
			["RootCFrame"] = p_u_19.PrimaryPart.CFrame,
			["RNG"] = Random.new(),
			["Offset"] = Instance.new("CFrameValue"),
			["Offset2"] = Instance.new("CFrameValue"),
			["Offset3"] = Instance.new("NumberValue")
		}
		v_u_12:Add(v_u_20.Offset)
		v_u_12:Add(v_u_20.Offset2)
		v_u_12:Add(v_u_20.Offset3)
		v_u_12:Add(task.spawn(function()
			-- upvalues: (ref) v_u_13, (copy) p_u_19, (ref) v_u_11, (copy) v_u_20
			while v_u_13 == p_u_19 and p_u_19.Parent do
				local v21 = v_u_11:GetTimeUntilNext() or 30
				local v22 = v_u_20
				local v23 = (600 - v21) * 2
				v22.RotationX = math.clamp(v23, 10, 50)
				local v24 = v_u_20
				local v25 = (600 - v21) * 2
				v24.RotationZ = math.clamp(v25, 10, 50)
				Shake(p_u_19.PrimaryPart, v_u_20)
				task.wait(5)
			end
		end))
	end
end
function Shake(p_u_27, p_u_28, _)
	-- upvalues: (copy) v_u_9, (copy) v_u_12, (copy) v_u_2, (copy) v_u_7
	if p_u_27 then
		local _, v_u_29 = p_u_27.Parent:GetBoundingBox()
		p_u_27.PivotOffset = CFrame.new(0, -v_u_29.Y / 2, 0)
		local function v30()
			-- upvalues: (copy) p_u_27, (ref) v_u_9, (copy) p_u_28, (copy) v_u_29
			if (p_u_27.Position - v_u_9.CFrame.Position).Magnitude <= 200 then
				p_u_27.Parent:PivotTo(p_u_28.RootCFrame * CFrame.new(0, -v_u_29.Y / 2 + p_u_28.Offset3.Value, 0) * p_u_28.Offset.Value * p_u_28.Offset2.Value)
			end
		end
		v_u_12:Add(v_u_2.Heartbeat:Connect(v30))
		v_u_12:Add(task.spawn(function()
			-- upvalues: (ref) v_u_7, (copy) p_u_28, (ref) v_u_12, (copy) v_u_29
			v_u_7.stop(p_u_28.Offset)
			v_u_7.stop(p_u_28.Offset2)
			task.delay(0.1, function()
				task.wait(0.075)
				task.wait(0.075)
				task.wait(0.075)
			end)
			local v31 = v_u_7.target
			local v32 = p_u_28.Offset
			local v33 = 0.3
			local v34 = 15
			local v35 = {}
			local v36 = CFrame.new(0, p_u_28.Height, 0)
			local v37 = CFrame.Angles
			local v38 = 0
			local v39 = 0
			if p_u_28.RNG:NextInteger(0, 1) == 1 then
				local v40 = p_u_28.RotationZ
				v48 = -math.rad(v40)
				if v48 then
					::l3::
					v35.Value = v36 * v37(v38, v39, v48)
					v31(v32, v33, v34, v35)
					local v41 = v_u_7.target
					local v42 = p_u_28.Offset2
					local v43 = {}
					local v44 = CFrame.new(0, p_u_28.Height, 0)
					local v45 = CFrame.Angles
					local v46 = p_u_28.RotationX
					v43.Value = v44 * v45(math.rad(v46), 0, 0)
					v41(v42, 0.3, 15, v43)
					task.wait(0.075)
					v_u_12:Add(task.spawn(function()
						-- upvalues: (ref) v_u_7, (ref) p_u_28, (ref) v_u_29
						v_u_7.target(p_u_28.Offset3, 0.5, 8, {
							["Value"] = v_u_29.Y * 0.2
						})
						task.wait(0.2)
						v_u_7.target(p_u_28.Offset3, 0.5, 8, {
							["Value"] = 0
						})
					end))
					v_u_7.target(p_u_28.Offset, 0.25, 2, {
						["Value"] = CFrame.new(0, 0, 0)
					})
					v_u_7.target(p_u_28.Offset2, 0.15, 2.5, {
						["Value"] = CFrame.new(0, 0, 0)
					})
					return
				end
			end
			local v47 = p_u_28.RotationZ
			local v48 = math.rad(v47)
			goto l3
		end))
	end
end
local function v_u_61(p49)
	-- upvalues: (copy) v_u_7, (ref) v_u_15, (copy) v_u_18
	if p49 and p49.PrimaryPart then
		p49.Parent = workspace
		local v50 = p49:GetScale()
		for v51 = 1, 6 do
			local v52 = v51 * 3
			local v53 = v51 % 2 == 0 and 1 or -1
			local v54 = v_u_7.target
			local v55 = {}
			local v56 = v_u_15
			local v57 = CFrame.Angles
			local v58 = v52 * v53
			v55.Pivot = v56 * v57(0, 0, (math.rad(v58)))
			v54(p49, 0.5, 20, v55)
			task.wait(0.05)
		end
		local v59 = {
			["Pivot"] = v_u_15
		}
		v_u_7.target(p49, 0.5, 20, v59)
		task.wait(0.1)
		v_u_7.target(p49, 0.6, 2, {
			["Pivot"] = v_u_15 + Vector3.new(0, 10, 0)
		})
		v_u_7.target(p49, 0.6, 2, {
			["Scale"] = v50 * 2
		})
		for _, v60 in p49:GetDescendants() do
			if v60:IsA("BasePart") then
				v_u_7.target(v60, 0.7, 1, {
					["Transparency"] = 1
				})
			elseif table.find(v_u_18, v60.ClassName) then
				v_u_7.target(v60, 0.7, 1, {
					["Transparency"] = 1
				})
			elseif v60:IsA("ParticleEmitter") then
				v60.Enabled = false
			end
		end
		task.wait(2)
		v_u_7.stop(p49)
		p49:Destroy()
	end
end
local function v_u_67(p62)
	-- upvalues: (copy) v_u_7
	if p62 and p62.PrimaryPart then
		local v63 = p62.PrimaryPart.CFrame
		local v64 = p62:GetScale()
		for _, v65 in p62:GetDescendants() do
			if v65:IsA("BasePart") then
				v65.Transparency = 1
			end
		end
		p62:ScaleTo(0.1)
		p62:PivotTo(v63 + Vector3.new(0, -2, 0))
		for _, v66 in p62:GetDescendants() do
			if v66:IsA("BasePart") and v66.Name ~= "HitBox" then
				v_u_7.target(v66, 0.6, 5, {
					["Transparency"] = 0
				})
			end
		end
		v_u_7.target(p62, 0.5, 4, {
			["Scale"] = v64,
			["Pivot"] = v63
		})
		task.wait(0.5)
		v_u_7.stop(p62)
		p62:ScaleTo(v64)
		p62:PivotTo(v63)
	end
end
local function v_u_69(p68)
	-- upvalues: (ref) v_u_14, (ref) v_u_15
	if v_u_14 then
		v_u_14:Destroy()
		v_u_14 = nil
		v_u_15 = nil
	end
	v_u_14 = p68:Clone()
	v_u_15 = p68:GetPivot()
	v_u_14.Name = "HatchClone"
	v_u_14:RemoveTag("StealEggSpawner")
	if v_u_14.PrimaryPart then
		v_u_14.PrimaryPart.PivotOffset = CFrame.new()
	end
end
local function v_u_73(p70)
	-- upvalues: (copy) v_u_10, (copy) v_u_16, (ref) v_u_17, (copy) v_u_12, (ref) v_u_14, (copy) v_u_61, (ref) v_u_15, (ref) v_u_13, (copy) v_u_67, (copy) v_u_69, (copy) v_u_26
	if v_u_10.IsRunning then
		if not v_u_17 then
			v_u_17 = true
			v_u_12:Clean()
			for _, v71 in p70:GetDescendants() do
				if v71:IsA("BasePart") then
					v71.Transparency = 1
				end
			end
			if v_u_14 and v_u_14.PrimaryPart then
				v_u_61(v_u_14)
				v_u_14 = nil
				v_u_15 = nil
			end
			v_u_13 = p70
			v_u_67(p70)
			v_u_69(p70)
			v_u_26(p70)
			v_u_17 = false
		end
	else
		local v72 = v_u_16
		table.insert(v72, p70)
		return
	end
end
local function v76(p74)
	-- upvalues: (copy) v_u_10, (copy) v_u_16, (ref) v_u_13, (copy) v_u_73
	if v_u_10.IsRunning then
		if p74 ~= v_u_13 then
			v_u_73(p74)
		end
	else
		local v75 = v_u_16
		table.insert(v75, p74)
	end
end
function v_u_10.OnStarted(_)
	-- upvalues: (copy) v_u_11, (copy) v_u_16, (copy) v_u_10, (ref) v_u_13, (copy) v_u_73
	if not v_u_11:IsRunning() then
		v_u_11:Start(game.ReplicatedFirst.GlobalUpdateTime.Value)
	end
	for _, v77 in v_u_16 do
		if v_u_10.IsRunning then
			if v77 ~= v_u_13 then
				v_u_73(v77)
			end
		else
			local v78 = v_u_16
			table.insert(v78, v77)
		end
	end
	table.clear(v_u_16)
end
function v_u_10.OnEnded(_)
	-- upvalues: (copy) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_15
	v_u_12:Clean()
	v_u_13 = nil
	if v_u_14 then
		v_u_14:Destroy()
		v_u_14 = nil
		v_u_15 = nil
	end
end
v6({
	["Tag"] = "StealEggSpawner",
	["OnInstanceAdded"] = v76
})
return v_u_10