local v1 = game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v4 = require(v2.Modules.DataService)
local v_u_5 = require(v2.Modules.Settings.SettingsService)
local v_u_6 = script.GlowTexture
local v_u_7 = {
	["Ancestors"] = {},
	["FancyTextures"] = {}
}
local v_u_8 = {
	"Front",
	"Back",
	"Right",
	"Left",
	"Top",
	"Bottom"
}
local v_u_9 = { "R", "G", "B" }
local v_u_10 = v_u_5:GetSetting("Textures")
local function v_u_18(p11)
	-- upvalues: (copy) v_u_9
	local v12 = {
		["R"] = 0,
		["G"] = 0,
		["B"] = 0
	}
	local v13 = 0
	local v14 = 0
	for v15 = 1, #v_u_9 do
		local v16 = v_u_9[v15]
		local v17 = p11[v16]
		v12[v16] = v17
		if v13 < v17 then
			v14 = v16
			v13 = v17
		end
	end
	v12[v14] = 25555
	return Color3.new(v12.R, v12.G, v12.B)
end
local function v_u_26(p19, p20)
	-- upvalues: (copy) v_u_18, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_3
	if p20 then
		local v21 = v_u_18(p19.Color)
		if not v_u_7.FancyTextures[p19] then
			v_u_7.FancyTextures[p19] = {}
		end
		for v22 = 1, #v_u_8 do
			local v23 = v_u_6:Clone()
			v23.Parent = p19
			v23.Face = v_u_8[v22]
			v23.Color3 = v21
			v23.Transparency = 1
			v_u_3:Create(v23, TweenInfo.new(0.5), {
				["Transparency"] = 0.4
			}):Play()
			local v24 = v_u_7.FancyTextures[p19]
			table.insert(v24, v23)
		end
	elseif v_u_7.FancyTextures[p19] then
		for _, v25 in v_u_7.FancyTextures[p19] do
			v_u_3:Create(v25, TweenInfo.new(0.75), {
				["Transparency"] = 1
			}):Play()
			game.Debris:AddItem(v25, 0.75)
		end
	end
end
local function v_u_37(p_u_27)
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (ref) v_u_10, (copy) v_u_26
	local v_u_28 = p_u_27:FindFirstAncestorWhichIsA("Model")
	if v_u_28 then
		p_u_27:SetAttribute("BaseMaterial", p_u_27.Material.Name)
		if v_u_7.Ancestors[v_u_28] then
			local v29 = v_u_7.Ancestors[v_u_28]
			table.insert(v29, p_u_27)
		else
			v_u_7.Ancestors[v_u_28] = { p_u_27 }
		end
		p_u_27.Touched:Connect(function(p30)
			-- upvalues: (copy) v_u_28, (copy) p_u_27, (ref) v_u_3, (ref) v_u_7, (ref) v_u_10, (ref) v_u_26
			local v31 = p30.Parent
			if v31 then
				if game.Players:GetPlayerFromCharacter(v31) then
					local v32 = v_u_28:FindFirstChild("Age", true)
					if v32 then
						local v33 = v32.Value
						local v34 = p_u_27.Name
						if v33 < tonumber(v34) then
							return
						elseif not v_u_28:GetAttribute("GlowToggled") then
							v_u_28:SetAttribute("GlowToggled", true)
							local v35 = v_u_28:FindFirstChild("GlowLight", true)
							if v35 then
								v35.Brightness = 0
								v_u_3:Create(v35, TweenInfo.new(0.3), {
									["Brightness"] = 1
								}):Play()
							end
							for _, v_u_36 in v_u_7.Ancestors[v_u_28] do
								if v_u_10 then
									v_u_26(v_u_36, true)
								else
									v_u_36.Material = "Neon"
								end
								task.delay(8, function()
									-- upvalues: (copy) v_u_36, (ref) v_u_26
									v_u_36.Material = v_u_36:GetAttribute("BaseMaterial")
									v_u_26(v_u_36, false)
								end)
							end
							task.wait(8)
							if v35 then
								v_u_3:Create(v35, TweenInfo.new(0.3), {
									["Brightness"] = 0
								}):Play()
							end
							task.wait(1)
							v_u_28:SetAttribute("GlowToggled", false)
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		end)
	end
end
v1:GetInstanceAddedSignal("GlowPart"):Connect(function(p38)
	-- upvalues: (copy) v_u_37
	v_u_37(p38)
end)
v4:GetPathSignal("Settings/Textures"):Connect(function()
	-- upvalues: (ref) v_u_10, (copy) v_u_5, (copy) v_u_7, (copy) v_u_26
	v_u_10 = v_u_5:GetSetting("Textures")
	if not v_u_10 then
		for v39, _ in v_u_7.FancyTextures do
			v_u_26(v39, false)
		end
	end
end)
return v_u_7