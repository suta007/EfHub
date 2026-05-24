local v_u_1 = game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v2.Data.BeeEvent.BeeRegistry)
local v_u_5 = require(v2.Modules.DataService)
local v_u_6 = require(v2.Modules.GetFarmAsync)
local v_u_7 = require(v2.Modules.SaveSlotControllers.SaveSlotController)
local v_u_8 = v2.GameEvents.BeeColonyStateService.Reliable
local function v_u_15() -- name: CreateBillboard
	-- upvalues: (copy) v_u_1
	local v9 = Instance.new("Part")
	v9.Name = "BeeNestHover"
	v9.Size = Vector3.new(4.5, 4.5, 0.2)
	v9.Transparency = 1
	v9.Anchored = true
	v9.CanCollide = false
	v9.CanQuery = true
	v9.CanTouch = false
	v9.CastShadow = false
	v_u_1:AddTag(v9, "BeeNestHover")
	local v10 = Instance.new("SurfaceGui")
	v10.Face = Enum.NormalId.Back
	v10.Adornee = v9
	v10.Name = "BeeInfoUI"
	v10.ResetOnSpawn = false
	v10.Parent = v9
	local v11 = Instance.new("Frame")
	v11.Name = "BeeInfo"
	v11.Size = UDim2.new(1, 0, 1, 0)
	v11.BackgroundTransparency = 1
	v11.Visible = true
	v11.Parent = v10
	local v12 = Instance.new("TextLabel")
	v12.Name = "BeeName"
	v12.Size = UDim2.new(0.5, 0, 0.22, 0)
	v12.BackgroundTransparency = 1
	v12.Position = UDim2.new(0.5, 0, 0.1, 0)
	v12.AnchorPoint = Vector2.new(0.5, 0)
	v12.Text = ""
	v12.ZIndex = 999
	v12.TextColor3 = Color3.fromRGB(255, 255, 255)
	v12.TextScaled = true
	v12.Font = Enum.Font.GothamBold
	v12.LayoutOrder = 0
	v12.Parent = v11
	local v13 = Instance.new("ImageLabel")
	v13.Name = "BeeIcon"
	v13.Position = UDim2.new(0.5, 0, 0.56, 0)
	v13.AnchorPoint = Vector2.new(0.5, 0.5)
	v13.Size = UDim2.new(0.75, 0, 0.75, 0)
	v13.BackgroundTransparency = 1
	v13.LayoutOrder = 1
	v13.Parent = v11
	local v14 = Instance.new("UIStroke")
	v14.Thickness = 4
	v14.Color = Color3.fromRGB(0, 0, 0)
	v14.Parent = v12
	return v9
end
local function v_u_23(p16) -- name: GetHiveSlotsAsync
	-- upvalues: (copy) v_u_6
	local v17 = {}
	local v18 = v_u_6(p16)
	if not v18 then
		return v17
	end
	local v19 = v18:WaitForChild("CurrentExpansion", 20)
	if v19 then
		v19 = v19:WaitForChild("Custom", 20)
	end
	if v19 then
		v19 = v19:WaitForChild("Hive", 20)
	end
	if not v19 then
		return v17
	end
	for _, v20 in v19:GetChildren() do
		local v21 = v20.Name
		local v22 = tonumber(v21)
		if v22 then
			v17[v22] = v20.CFrame
		end
	end
	return v17
end
local function v_u_25(p24) -- name: ClearHoverAttributes
	p24:SetAttribute("BeeName", nil)
	p24:SetAttribute("State", nil)
	p24:SetAttribute("BeeState", nil)
	p24:SetAttribute("BeeSlot", nil)
	p24:SetAttribute("IsNesting", nil)
end
local function v_u_31(p26, p27) -- name: RenderSlot
	-- upvalues: (copy) v_u_25, (copy) v_u_4
	local v28 = p26.BeeInfoUI
	local v29 = v28.BeeInfo
	if p27 then
		if p27.Data.State == "Active" then
			v28.Enabled = true
			p26.CanQuery = true
			local v30 = v_u_4[p27.BeeName]
			if v30 then
				local _ = v30.Stats
				p26:SetAttribute("BeeName", p27.BeeName)
				p26:SetAttribute("State", p27.Data.State)
				p26:SetAttribute("BeeState", p27.Data.State)
				p26:SetAttribute("BeeSlot", p27.Data.Slot)
				p26:SetAttribute("IsNesting", true)
				v29.BeeName.Text = v30.DisplayName
				v29.BeeIcon.Image = v30.Icon
			else
				warn((("[BeeColonySlotUserInterface] Missing registry data for bee: %*"):format(p27.BeeName)))
				v29.BeeName.Text = "UNKNOWN BEE"
				v29.BeeIcon.Image = ""
				v_u_25(p26)
			end
		else
			v28.Enabled = false
			p26.CanQuery = true
			v_u_25(p26)
			return
		end
	else
		v28.Enabled = false
		p26.CanQuery = false
		v_u_25(p26)
		return
	end
end
local v_u_32 = {
	["Billboards"] = {}
}
local function v_u_40(p33, _) -- name: ProcessStateSynchronize
	-- upvalues: (copy) v_u_5, (copy) v_u_32, (copy) v_u_31
	local v34 = v_u_5:GetData().BeeEventData.BeeInventoryData
	for _, v35 in p33 do
		for v36, v37 in v35.ActiveBees do
			local v38 = v34[v36]
			if v38 then
				local v39 = v38.Data.Slot
				if v39 then
					v39 = v_u_32.Billboards[v39]
				end
				if v39 then
					v_u_31(v39, v38)
					if v37.Speed ~= nil then
						v39:SetAttribute("Speed", v37.Speed)
					end
					if v37.PollinationQuality ~= nil then
						v39:SetAttribute("PollinationQuality", v37.PollinationQuality)
					end
					if v37.PollinationRate ~= nil then
						v39:SetAttribute("PollinationRate", v37.PollinationRate)
					end
				end
			end
		end
	end
end
local function v_u_49(p41, _) -- name: ProcessStateUpdate
	-- upvalues: (copy) v_u_5, (copy) v_u_32, (copy) v_u_31
	local v42 = v_u_5:GetData().BeeEventData.BeeInventoryData
	for _, v43 in p41 do
		for v44, v45 in v43 do
			local v46 = v42[v44]
			if v46 then
				local v47 = v46.Data
				if v47 then
					v47 = v46.Data.Slot
				end
				if v47 then
					local v48 = v_u_32.Billboards[v47]
					if v48 then
						v_u_31(v48, v46)
						if v45.Speed ~= nil then
							v48:SetAttribute("Speed", v45.Speed)
						end
						if v45.PollinationQuality ~= nil then
							v48:SetAttribute("PollinationQuality", v45.PollinationQuality)
						end
						if v45.PollinationRate ~= nil then
							v48:SetAttribute("PollinationRate", v45.PollinationRate)
						end
					end
				end
			end
		end
	end
end
local function v_u_51(p50) -- name: OnReliable
	-- upvalues: (copy) v_u_40, (copy) v_u_49
	if p50.Synchronize then
		v_u_40(p50.Synchronize)
	end
	if p50.Create then
		v_u_49(p50.Create)
	end
	if p50.StateUpdate then
		v_u_49(p50.StateUpdate)
	end
end
function v_u_32.ClearRender(p52) -- name: ClearRender
	-- upvalues: (copy) v_u_25
	for _, v53 in p52.Billboards do
		local v54 = v53.BeeInfoUI
		local _ = v54.BeeInfo
		v54.Enabled = false
		v53.CanQuery = false
		v_u_25(v53)
	end
end
function v_u_32.EnsureBillboards(p55) -- name: EnsureBillboards
	-- upvalues: (copy) v_u_23, (copy) v_u_3, (copy) v_u_15
	for v56, v57 in v_u_23(v_u_3.LocalPlayer) do
		if not p55.Billboards[v56] then
			local v58 = v_u_15()
			v58:SetAttribute("Slot", v56)
			v58.CFrame = v57 * CFrame.new(0, 0, 0.1)
			v58.Parent = workspace
			p55.Billboards[v56] = v58
		end
	end
end
function v_u_32.RenderAsync(p59) -- name: RenderAsync
	-- upvalues: (copy) v_u_5, (copy) v_u_31
	for _, v60 in v_u_5:GetData().BeeEventData.BeeInventoryData do
		local v61 = v60.Data.Slot
		local v62 = p59.Billboards[v61]
		if v62 then
			v_u_31(v62, v60)
		else
			warn("[BeeColonySlotUserInterface] Missing billboards for player\'s bee slot!")
		end
	end
end
function v_u_32.Start(p_u_63) -- name: Start
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_51
	v_u_5:GetPathSignal("BeeEventData/BeeInventoryData/@"):Connect(function()
		-- upvalues: (ref) v_u_7, (copy) p_u_63
		if v_u_7:GetCurrentSaveSlot().IsBeeSlot then
			p_u_63:EnsureBillboards()
			p_u_63:ClearRender()
			p_u_63:RenderAsync()
		end
	end)
	v_u_7:GetSaveSlotChangeSignal():Connect(function()
		-- upvalues: (ref) v_u_7, (copy) p_u_63
		if v_u_7:GetCurrentSaveSlot().IsBeeSlot then
			p_u_63:EnsureBillboards()
			p_u_63:ClearRender()
			p_u_63:RenderAsync()
		else
			p_u_63:ClearRender()
		end
	end)
	v_u_5:GetPathSignal("BeeEventData/BeeSkillTree/@"):Connect(function()
		-- upvalues: (ref) v_u_7, (copy) p_u_63
		if v_u_7:GetCurrentSaveSlot().IsBeeSlot then
			p_u_63:EnsureBillboards()
			p_u_63:ClearRender()
			p_u_63:RenderAsync()
		end
	end)
	if v_u_7:GetCurrentSaveSlot().IsBeeSlot then
		p_u_63:EnsureBillboards()
		p_u_63:RenderAsync()
	end
	v_u_8.OnClientEvent:Connect(v_u_51)
	v_u_8:FireServer("RequestSync")
end
task.spawn(v_u_32.Start, v_u_32)
return v_u_32