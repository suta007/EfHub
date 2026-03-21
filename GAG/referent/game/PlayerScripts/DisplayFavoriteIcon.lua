game:GetService("RunService")
game:GetService("CollectionService")
local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GetFarmAsync)
local v3 = game:GetService("Players")
require(v1.Modules.GetFarm)
local v_u_4 = v3.LocalPlayer
local v_u_5 = v_u_4.Character or v_u_4.CharacterAdded:Wait()
local v_u_6 = script:WaitForChild("LockBillboardGui")
local v_u_7 = {}
local v_u_8 = {}
if v_u_4:GetAttribute("FavoriteIconsEnabled") == nil then
	v_u_4:SetAttribute("FavoriteIconsEnabled", true)
end
local function v_u_12(p9)
	-- upvalues: (copy) v_u_5
	local v10 = v_u_5:FindFirstChild("HumanoidRootPart")
	if v10 and p9:IsA("Model") then
		local v11 = p9.PrimaryPart or p9:FindFirstChildWhichIsA("BasePart")
		if v11 then
			return (v10.Position - v11.Position).Magnitude <= 30
		else
			return false
		end
	else
		return false
	end
end
local function v_u_17(p_u_13)
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_8
	if v_u_7[p_u_13] then
		return
	else
		local v14 = p_u_13.PrimaryPart or p_u_13:FindFirstChildWhichIsA("BasePart")
		if v14 then
			local v15 = v_u_6:Clone()
			v15.Adornee = v14
			v15.Parent = p_u_13
			v15.Enabled = false
			v_u_7[p_u_13] = v15
			v_u_8[p_u_13] = false
			p_u_13.AncestryChanged:Connect(function(_, p16)
				-- upvalues: (ref) v_u_7, (copy) p_u_13, (ref) v_u_8
				if not p16 and v_u_7[p_u_13] then
					v_u_7[p_u_13]:Destroy()
					v_u_7[p_u_13] = nil
					v_u_8[p_u_13] = nil
				end
			end)
		end
	end
end
local v18 = require(v1.Modules.CreateTagHandler)
local v_u_19 = {}
local v_u_20 = v2(v_u_4)
v18({
	["Tag"] = "Harvestable",
	["OnInstanceAdded"] = function(p21)
		-- upvalues: (copy) v_u_20, (copy) v_u_19
		if p21:IsDescendantOf(v_u_20) then
			v_u_19[p21] = true
		end
	end,
	["OnInstanceRemoved"] = function(p22)
		-- upvalues: (copy) v_u_19
		v_u_19[p22] = nil
	end
})
task.spawn(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_19, (copy) v_u_7, (copy) v_u_8, (copy) v_u_17, (copy) v_u_12
	while true do
		while true do
			task.wait(0.5)
			if v_u_4:GetAttribute("FavoriteIconsEnabled") == false then
				break
			end
			local v23 = v_u_4.Character
			if v23 then
				v23 = v_u_4.Character:FindFirstChildOfClass("Tool")
			end
			if not (v23 and v23.Name:match("Favorite")) then
				v23 = nil
			end
			for v24 in v_u_19 do
				if v24:GetAttribute("Favorited") then
					v_u_17(v24)
					local v25 = v23 or v_u_12(v24)
					local v26 = v_u_7[v24]
					if v26 and v_u_8[v24] ~= v25 then
						v26.Enabled = v25
						v_u_8[v24] = v25
					end
				else
					local v27 = v_u_7[v24]
					if v27 and v_u_8[v24] ~= false then
						v27.Enabled = false
						v_u_8[v24] = false
					end
				end
			end
		end
		for v28 in v_u_19 do
			local v29 = v_u_7[v28]
			if v29 and v_u_8[v28] ~= false then
				v29.Enabled = false
				v_u_8[v28] = false
			end
		end
	end
end)