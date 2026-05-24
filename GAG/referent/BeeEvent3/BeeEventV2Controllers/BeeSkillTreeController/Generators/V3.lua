local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Spring)
local v3 = {}
v3.__index = v3
local v_u_4 = script.Parent.Parent.Node
local v_u_5 = {
	Vector2.new(1, 0),
	Vector2.new(0.5, 1),
	Vector2.new(-0.5, 1),
	Vector2.new(-1, 0),
	Vector2.new(-0.5, -1),
	Vector2.new(0.5, -1)
}
local v_u_6 = Vector2.new(5.095199966430664, 4.527950119972229)
local v_u_7 = {}
local function v_u_16() -- name: pickColor
	-- upvalues: (ref) v_u_7
	local v8 = 0
	while true do
		local v9 = math.random()
		local v10 = false
		for _, v11 in v_u_7 do
			local v12 = v9 - v11
			local v13 = math.abs(v12)
			local v14 = 1 - v13
			if math.min(v13, v14) < 0.15 then
				v10 = true
			end
		end
		v8 = v8 + 1
		if not v10 or v8 > 100 then
			local v15 = v_u_7
			table.insert(v15, v9)
			return Color3.fromHSV(v9, 0.6, 0.9)
		end
	end
end
function v3.generate(p17, p_u_18, p19) -- name: generate
	-- upvalues: (ref) v_u_7, (copy) v_u_5, (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_16
	local v_u_20 = workspace:FindFirstChild("SkillTree") or Instance.new("Folder")
	v_u_20.Name = "SkillTree"
	v_u_20.Parent = workspace
	math.randomseed(p17)
	v_u_7 = {}
	local v21 = #v_u_5
	local v22 = {}
	local v_u_23 = {}
	local v_u_24 = {}
	local v25 = nil
	for _, v26 in p19 do
		if v26.IsOrigin then
			v25 = v26
		else
			table.insert(v22, v26)
		end
	end
	local v_u_27 = nil
	local v_u_28 = nil
	local function v_u_38(p29) -- name: revealAdjacents
		-- upvalues: (ref) v_u_5, (copy) v_u_23, (ref) v_u_28
		for _, v30 in v_u_5 do
			local v31 = v_u_23
			local v32 = p29.q + v30.X
			local v33 = p29.r + v30.Y
			local v34 = v32 * 10
			local v35 = math.round(v34)
			local v36 = v33 * 10
			local v37 = v31[v35 .. "," .. math.round(v36)]
			if v37 and v37.state == "hidden" then
				v_u_28(v37)
			end
		end
	end
	v_u_28 = function(p39)
		-- upvalues: (ref) v_u_2, (copy) v_u_20
		if p39.state == "hidden" then
			p39.state = "adjacent"
			local v40 = p39.node
			v_u_2.target(v40, 1, 3, {
				["Color"] = nil,
				["Size"] = Vector3.new(4.632, 0.107, 5.327),
				["Color"] = Color3.fromRGB(80, 80, 80)
			})
			local v41 = v40:FindFirstChild("Highlight")
			if v41 then
				v_u_2.target(v41, 1, 3, {
					["Color"] = Color3.fromRGB(30, 30, 30)
				})
			end
			v40.Surface.Icon.Image = ""
			v40.Surface.Icon.Size = UDim2.fromScale(0, 0)
			v40.Surface.Label.Text = "???"
			v40.Surface.Label.Position = UDim2.fromScale(0.5, 0.5)
			v40.Surface.Label.AnchorPoint = Vector2.new(0.5, 0.5)
			v40.Parent = v_u_20
		end
	end
	local function v_u_48(p_u_42)
		-- upvalues: (ref) v_u_2, (copy) v_u_20, (copy) v_u_38, (ref) v_u_27
		if p_u_42.state == "adjacent" or p_u_42.state == "hidden" then
			p_u_42.state = "revealed"
			local v43 = p_u_42.node
			local v44 = v43:FindFirstChildOfClass("ClickDetector")
			if v44 then
				v44:Destroy()
			end
			v43.Color = p_u_42.color
			local v45 = v43:FindFirstChild("Highlight")
			if v45 then
				local v46 = p_u_42.color
				v45.Color = Color3.new(v46.R * 0.25, v46.G * 0.25, v46.B * 0.25)
			end
			v43.Surface.Icon.Image = p_u_42.icon
			v43.Surface.Icon.Size = UDim2.fromScale(0, 0)
			v43.Surface.Label.Position = p_u_42.labelPosition
			v43.Surface.Label.AnchorPoint = p_u_42.labelAnchorPoint
			v43.Surface.Label.Text = p_u_42.displayName .. "<br/>(0/" .. p_u_42.tiers .. ")"
			v_u_2.target(v43.Surface.Icon, 1, 3, {
				["Size"] = p_u_42.iconSize
			})
			v43.Parent = v_u_20
			v_u_2.target(v43, 1, 3, {
				["Color"] = nil,
				["Size"] = Vector3.new(4.632, 0.107, 5.327),
				["Color"] = p_u_42.color
			})
			v_u_38(p_u_42)
			local v47 = Instance.new("ClickDetector")
			v47.CursorIcon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
			v47.MaxActivationDistance = 1000
			v47.Parent = v43
			v47.MouseClick:Connect(function()
				-- upvalues: (ref) v_u_27, (copy) p_u_42
				v_u_27(p_u_42)
			end)
		end
	end
	v_u_27 = function(p49)
		-- upvalues: (ref) v_u_5, (copy) v_u_23, (ref) v_u_48, (ref) v_u_28
		if p49.state == "hidden" or (p49.state == "adjacent" or p49.state == "maxed") then
			return
		else
			p49.current = p49.current + 1
			local v50 = p49.node
			if p49.current >= p49.tiers then
				p49.state = "maxed"
				local v51 = v50:FindFirstChildOfClass("ClickDetector")
				if v51 then
					v51:Destroy()
				end
				v50.Surface.Label.Text = p49.displayName .. "<br/>[MAX]"
				for _, v52 in v_u_5 do
					local v53 = v_u_23
					local v54 = p49.q + v52.X
					local v55 = p49.r + v52.Y
					local v56 = v54 * 10
					local v57 = math.round(v56)
					local v58 = v55 * 10
					local v59 = v53[v57 .. "," .. math.round(v58)]
					if v59 then
						if v59.state == "adjacent" then
							v_u_48(v59)
						elseif v59.state == "hidden" then
							v_u_28(v59)
						end
					end
				end
			else
				v50.Surface.Label.Text = p49.displayName .. "<br/>(" .. p49.current .. "/" .. p49.tiers .. ")"
			end
		end
	end
	local function v79(p60, p61, p62, p63, p64, p65) -- name: placeNode
		-- upvalues: (ref) v_u_4, (copy) p_u_18, (ref) v_u_6, (copy) v_u_23, (copy) v_u_24
		local v66 = v_u_4:Clone()
		v66.Size = Vector3.new(0, 0, 0)
		local v67 = CFrame.new
		local v68 = p_u_18
		local v69 = v68.X + p60 * v_u_6.X
		local v70 = v68.Y
		local v71 = v68.Z + p61 * v_u_6.Y
		v66.CFrame = v67((Vector3.new(v69, v70, v71)))
		v66.Color = p62
		local v72 = v66:FindFirstChild("Highlight")
		if v72 then
			v72.Color = Color3.new(p62.R * 0.25, p62.G * 0.25, p62.B * 0.25)
		end
		v66.Surface.Icon.Image = p63
		v66.Surface.Label.Text = p64
		v66.Parent = nil
		local v73 = {
			["node"] = nil,
			["q"] = nil,
			["r"] = nil,
			["color"] = nil,
			["icon"] = nil,
			["displayName"] = nil,
			["tiers"] = nil,
			["current"] = 0,
			["state"] = "hidden",
			["iconSize"] = nil,
			["labelPosition"] = nil,
			["labelAnchorPoint"] = nil,
			["node"] = v66,
			["q"] = p60,
			["r"] = p61,
			["color"] = p62,
			["icon"] = p63,
			["displayName"] = p64,
			["tiers"] = p65,
			["iconSize"] = v66.Surface.Icon.Size,
			["labelPosition"] = v66.Surface.Label.Position,
			["labelAnchorPoint"] = v66.Surface.Label.AnchorPoint
		}
		local v74 = v_u_23
		local v75 = p60 * 10
		local v76 = math.round(v75)
		local v77 = p61 * 10
		v74[v76 .. "," .. math.round(v77)] = v73
		local v78 = v_u_24
		table.insert(v78, v73)
		return v73
	end
	local v80 = v_u_48
	local v81 = {}
	for v82 = 1, v21 do
		table.insert(v81, v82)
	end
	local v84 = v79(0, 0, v_u_16(), v25.Icon, v25.Name:gsub("(%u)", function(p83)
		return " " .. p83
	end):gsub("^ ", ""), v25.Tiers)
	local v85 = table.remove(v81, math.random(#v81))
	local v86 = v_u_5[v85]
	local v87 = v_u_5[(v85 - 2) % v21 + 1]
	local v88 = v86.X
	local v89 = v86.Y
	for _ = 2, v25.Tiers do
		v88 = v88 + v86.X
		v89 = v89 + v87.Y
	end
	for _, v90 in v22 do
		local v91 = v_u_16()
		local v92 = table.remove(v81, math.random(#v81))
		local v93 = v_u_5[v92]
		local _ = v_u_5[(v92 - 2) % v21 + 1]
		v79(v93.X, v93.Y, v91, v90.Icon, v90.Name:gsub("(%u)", function(p94)
			return " " .. p94
		end):gsub("^ ", ""), v90.Tiers)
	end
	v84.state = "adjacent"
	v80(v84)
	return v_u_24, v_u_23
end
return v3