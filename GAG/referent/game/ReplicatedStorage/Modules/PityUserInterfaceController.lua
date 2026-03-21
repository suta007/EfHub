local v_u_1 = {}
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Modules.DataService)
local v_u_5 = require(v3.Data.EnumRegistry.ItemTypeEnums)
local v_u_6 = require(v3.Data.EnumRegistry.InventoryServiceEnums)
local v_u_7 = require(v3.Data.PityData)
local v8 = v2.LocalPlayer
local v_u_9 = v8.Character
local v_u_10 = v8.PlayerGui:WaitForChild("PityUI")
local _ = v_u_10.MainFrame.INSERTION_POINT
local v_u_11 = v_u_10.MainFrame.INSERTION_POINT.PITY_ITEM_TEMPLATE.TemplateSmaller.ITEM_ICON
local v_u_12 = v_u_10.MainFrame.INSERTION_POINT.PITY_ITEM_TEMPLATE.TemplateSmaller.ITEM_COUNTER
local v_u_13 = v_u_10.MainFrame.INSERTION_POINT.PITY_ITEM_TEMPLATE.TemplateSmaller.RainbowBackground
local v_u_14 = nil
local function v_u_24()
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (ref) v_u_14, (copy) v_u_7, (copy) v_u_1
	local v15 = v_u_9:FindFirstChildWhichIsA("Tool")
	local v16
	if v15 then
		v16 = v15:GetAttribute(v_u_6.ITEM_TYPE)
	else
		v16 = v15
	end
	local v17 = v16 == v_u_5["Seed Pack"]
	local v18 = v16 == v_u_5.PetEgg
	if v15 then
		local v19
		if v17 then
			v19 = v15:GetAttribute(v_u_6.Type)
		elseif v18 then
			v19 = v15:GetAttribute(v_u_6.EggName)
		else
			v19 = nil
		end
		v_u_14 = v19
	else
		v_u_14 = nil
	end
	local v20 = v_u_14 and v_u_7[v_u_14]
	if v20 then
		v20 = v_u_7[v_u_14].Items
	end
	if v20 then
		for _, v21 in v20 do
			if v21.Pity then
				v20 = true
				goto l21
			end
		end
		v20 = false
		goto l21
	else
		::l21::
		local v22 = v_u_1
		local v23
		if v20 == nil then
			v23 = false
		else
			v23 = v_u_14 ~= nil
		end
		v22:Toggle(v23)
		return
	end
end
local function v26(p25)
	-- upvalues: (copy) v_u_24
	p25.ChildAdded:Connect(v_u_24)
	p25.ChildRemoved:Connect(v_u_24)
end
if v_u_9 then
	v_u_9.ChildAdded:Connect(v_u_24)
	v_u_9.ChildRemoved:Connect(v_u_24)
end
v8.CharacterAdded:Connect(v26)
local function v_u_32()
	-- upvalues: (ref) v_u_14, (copy) v_u_7, (copy) v_u_4
	if v_u_14 then
		local v27 = v_u_7[v_u_14]
		if not v27 then
			return false
		end
		local v28 = v_u_4:GetData().Pity[v_u_14] or 0
		local v29 = (1 / 0)
		local v30 = nil
		for _, v31 in v27.Items do
			if v31.Pity and (v28 < v31.Pity and v31.Pity < v29) then
				v29 = v31.Pity
				v30 = v31
			end
		end
		return v30
	end
end
function v_u_1.Render(_)
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_32, (copy) v_u_12, (copy) v_u_7, (ref) v_u_14, (copy) v_u_4, (copy) v_u_13
	if v_u_10.Enabled then
		local v33 = v_u_11
		local v34 = v_u_32()
		v33.Image = v34 and v34.Icon or ""
		local v35 = v_u_12
		local v36 = v_u_7[v_u_14] and (v_u_4:GetData().Pity[v_u_14] or 0) or false
		local v37 = v_u_32()
		v35.Text = ("%*/%*"):format(v36, v37 and v37.Pity or 0)
		local v38 = v_u_13
		local v39 = v_u_32()
		local v40
		if v39 then
			v40 = v39.Type == "RainbowSeed" and true or string.find(v39.RewardId, "Rainbow ") ~= nil
		else
			v40 = false
		end
		v38.Visible = v40
	end
end
v_u_4:GetPathSignal("Pity/@"):Connect(function()
	-- upvalues: (copy) v_u_1
	v_u_1:Render()
end)
v_u_1:Render()
function v_u_1.Toggle(_, p41)
	-- upvalues: (copy) v_u_10, (copy) v_u_1
	v_u_10.Enabled = p41
	if p41 then
		v_u_1:Render()
	end
end
return v_u_1