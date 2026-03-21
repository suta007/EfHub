local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v_u_3 = v2:IsServer()
local v4 = require(v1.Modules.CreateTagHandler)
local v_u_5 = nil
local v_u_6 = nil
if v_u_3 then
	v_u_5 = require(game:GetService("ServerScriptService").Modules.SoundPlayerServer)
else
	v_u_6 = require(v1.Modules.SoundPlayer)
end
local v_u_7 = require(v1.Data.SoundData)
local v_u_8 = v1:WaitForChild("Silver_Reference")
local v_u_9 = v1:WaitForChild("Gold_Reference")
local v_u_10 = v1:WaitForChild("Rainbow_Reference")
local v_u_11 = v1:WaitForChild("Diamond_Reference")
local v_u_12 = {}
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {}
local function v_u_23(p19, p20)
	for _, v21 in p20:GetChildren() do
		local v22 = v21:Clone()
		v22.Parent = p19
		v22:AddTag("Cleanup_Variant")
		if v22:IsA("Texture") then
			v22.Transparency = 1
		end
	end
end
local function v_u_25(p24)
	-- upvalues: (copy) v_u_18, (copy) v_u_16, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_17
	if p24:HasTag("RainbowPart") then
		p24:RemoveTag("RainbowPart")
	end
	if v_u_18[p24] then
		v_u_18[p24]:Disconnect()
		v_u_18[p24] = nil
	end
	if v_u_16[p24] ~= nil then
		p24.Reflectance = v_u_16[p24]
		v_u_16[p24] = nil
	end
	if v_u_13[p24] then
		p24.Color = Color3.new(1, 1, 1)
		p24.Color = v_u_13[p24]
		v_u_13[p24] = nil
	end
	if v_u_14[p24] then
		p24.Material = v_u_14[p24]
		v_u_14[p24] = nil
	end
	if v_u_15[p24] ~= nil then
		p24.MaterialVariant = v_u_15[p24]
		v_u_15[p24] = nil
	end
	if p24:IsA("UnionOperation") and v_u_17[p24] ~= nil then
		p24.UsePartColor = v_u_17[p24]
		v_u_17[p24] = nil
	end
	if p24:HasTag("VariantVisual") then
		p24:RemoveTag("VariantVisual")
	end
end
local function v_u_36(p26, p_u_27, p28)
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_23, (copy) v_u_18, (copy) v_u_7, (copy) v_u_3, (ref) v_u_5, (ref) v_u_6
	local function v_u_32(p29)
		-- upvalues: (copy) v_u_32, (ref) v_u_13, (ref) v_u_14, (ref) v_u_15, (ref) v_u_16, (ref) v_u_17, (copy) p_u_27, (ref) v_u_23, (ref) v_u_18
		for _, v_u_30 in p29:GetChildren() do
			if v_u_30:IsA("Model") then
				v_u_32(v_u_30)
			end
			if v_u_30:IsA("BasePart") or v_u_30:IsA("UnionOperation") then
				v_u_13[v_u_30] = v_u_13[v_u_30] or v_u_30.Color
				v_u_14[v_u_30] = v_u_14[v_u_30] or v_u_30.Material
				v_u_15[v_u_30] = v_u_15[v_u_30] ~= nil and v_u_15[v_u_30] or v_u_30.MaterialVariant
				v_u_16[v_u_30] = v_u_16[v_u_30] ~= nil and v_u_16[v_u_30] or v_u_30.Reflectance
				if v_u_30:IsA("UnionOperation") and v_u_17[v_u_30] == nil then
					v_u_17[v_u_30] = v_u_30.UsePartColor
				end
				if v_u_30:IsA("UnionOperation") then
					v_u_30.UsePartColor = true
				end
				v_u_30.Color = p_u_27.Color
				v_u_30.Material = p_u_27.Material
				v_u_30.MaterialVariant = p_u_27.MaterialVariant
				v_u_30:AddTag("VariantVisual")
				if v_u_30.Transparency == 1 then
					if v_u_18[v_u_30] then
						v_u_18[v_u_30]:Disconnect()
					end
					v_u_18[v_u_30] = v_u_30.Changed:Connect(function(p31)
						-- upvalues: (copy) v_u_30, (ref) v_u_18, (ref) v_u_23, (ref) p_u_27
						if p31 == "Transparency" then
							if v_u_30.Transparency == 0 then
								if v_u_18[v_u_30] then
									v_u_18[v_u_30]:Disconnect()
								end
								v_u_18[v_u_30] = nil
								v_u_23(v_u_30, p_u_27)
							end
						else
							return
						end
					end)
				else
					v_u_23(v_u_30, p_u_27)
				end
			end
		end
	end
	v_u_32(p26)
	local v33 = p26:FindFirstChild("Handle") or (p26:FindFirstChild("1") or p26:FindFirstChild("Base"))
	if not v33 then
		warn((("%* doesn\'t have a parent for SFX!"):format(p26.Name)))
	end
	local v34 = v_u_7.General.VariantVisuals[p28]
	local v35 = v34.PlaybackSpeed or 1
	if v_u_3 then
		v_u_5:PlaySound(v34.Id, nil, {
			["Looped"] = true,
			["PlaybackSpeed"] = v35 + math.random(-5, 5) / 100,
			["Volume"] = v34.Volume
		}, nil, v33 or p26, { "Cleanup_Variant", "VariantSFX" })
	else
		v_u_6:PlaySound(v34.Id, {
			["Looped"] = true,
			["PlaybackSpeed"] = v35 + math.random(-5, 5) / 100,
			["Volume"] = v34.Volume
		}, nil, v33 or p26, { "Cleanup_Variant", "VariantSFX" })
	end
end
local function v_u_42(p37)
	-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_17, (copy) v_u_23, (copy) v_u_10, (copy) v_u_7, (copy) v_u_3, (ref) v_u_5, (ref) v_u_6
	if p37 then
		for _, v38 in p37:GetDescendants() do
			if v38:IsA("BasePart") then
				local v39 = v38:FindFirstAncestorWhichIsA("Model")
				if not (v39 and v39:HasTag("Harvestable")) then
					v_u_13[v38] = v_u_13[v38] or v38.Color
					v_u_16[v38] = v_u_16[v38] ~= nil and v_u_16[v38] or v38.Reflectance
					if v38:IsA("UnionOperation") and v_u_17[v38] == nil then
						v_u_17[v38] = v38.UsePartColor
					end
					if v38:IsA("UnionOperation") then
						v38.UsePartColor = true
					end
					v38.Reflectance = 0.25
					v_u_23(v38, v_u_10)
					v38:AddTag("RainbowPart")
					v38:AddTag("VariantVisual")
				end
			end
		end
		local v40 = p37:FindFirstChild("Handle") or (p37:FindFirstChild("1") or p37)
		if not v40 then
			warn((("VariantVisuals:Rainbow | %* doesn\'t have a parent for SFX!"):format(p37.Name)))
		end
		local v41 = v_u_7.General.VariantVisuals.Rainbow_SFX
		if v_u_3 then
			v_u_5:PlaySound(v41.Id, nil, {
				["Looped"] = true,
				["PlaybackSpeed"] = 1 + math.random(-5, 5) / 100,
				["Volume"] = v41.Volume
			}, nil, v40 or p37, { "Cleanup_Variant", "VariantSFX" })
		else
			v_u_6:PlaySound(v41.Id, {
				["Looped"] = true,
				["PlaybackSpeed"] = 1 + math.random(-5, 5) / 100,
				["Volume"] = v41.Volume
			}, nil, v40 or p37, { "Cleanup_Variant", "VariantSFX" })
		end
	else
		warn("VariantVisuals:Rainbow | no plant provided!")
		return
	end
end
local v_u_48 = {
	["Normal"] = function(p43)
		-- upvalues: (copy) v_u_12
		return v_u_12:ClearVisuals(p43)
	end,
	["Silver"] = function(p44)
		-- upvalues: (copy) v_u_36, (copy) v_u_8
		return v_u_36(p44, v_u_8, "Silver_SFX")
	end,
	["Gold"] = function(p45)
		-- upvalues: (copy) v_u_36, (copy) v_u_9
		return v_u_36(p45, v_u_9, "Gold_SFX")
	end,
	["Diamond"] = function(p46)
		-- upvalues: (copy) v_u_36, (copy) v_u_11
		return v_u_36(p46, v_u_11, "Diamond_SFX")
	end,
	["Rainbow"] = function(p47)
		-- upvalues: (copy) v_u_42
		return v_u_42(p47)
	end
}
function v_u_12.SetVisualsForInstance(_, p49, p50)
	-- upvalues: (copy) v_u_12, (copy) v_u_48
	v_u_12:ClearVisuals(p49)
	local v51 = v_u_48[p50]
	if v51 and (p50 ~= "" and p50 ~= "Normal") then
		v51(p49)
	end
end
function v_u_12.SetVisuals(_, p_u_52)
	-- upvalues: (copy) v_u_12, (copy) v_u_48
	if p_u_52 then
		task.spawn(function()
			-- upvalues: (ref) v_u_12, (copy) p_u_52, (ref) v_u_48
			v_u_12:ClearVisuals(p_u_52)
			local v53 = p_u_52:FindFirstChild("Variant")
			local v54 = v53 and v53.Value or ""
			if v_u_48[v54] and (v54 ~= "" and v54 ~= "Normal") then
				while not p_u_52:HasTag("PlantGenerated") do
					task.wait(0.1)
				end
				v_u_12:SetVisualsForInstance(p_u_52, v54)
			end
		end)
	else
		warn("VariantVisuals:SetVisuals | plant is nil!")
	end
end
function v_u_12.ClearVisuals(_, p55)
	-- upvalues: (copy) v_u_25
	if p55 then
		for _, v56 in p55:GetDescendants() do
			if v56:HasTag("Cleanup_Variant") or v56:HasTag("VariantSFX") then
				v56:Destroy()
			end
		end
		for _, v57 in p55:GetDescendants() do
			if (v57:IsA("BasePart") or v57:IsA("UnionOperation")) and (v57:HasTag("VariantVisual") or v57:HasTag("RainbowPart")) then
				v_u_25(v57)
			end
		end
	else
		warn("VariantVisuals:ClearVisuals | plant is nil!")
	end
end
if v2:IsServer() then
	v4({
		["Tag"] = "PlantGenerated",
		["OnInstanceAdded"] = function(p58)
			-- upvalues: (copy) v_u_12
			if not p58:HasTag("Generating") then
				v_u_12:SetVisuals(p58)
			end
		end,
		["OnInstanceRemoved"] = function(p59)
			-- upvalues: (copy) v_u_12
			v_u_12:ClearVisuals(p59)
		end
	})
end
return v_u_12