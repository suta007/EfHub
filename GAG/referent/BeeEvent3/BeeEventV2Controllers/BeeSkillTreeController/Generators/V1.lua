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
	-- upvalues: (copy) v_u_7
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
local function v_u_30(p17, p18, p19, p20, p21, p22, p23) -- name: placeNode
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2
	local v_u_24 = v_u_4:Clone()
	v_u_24.Size = Vector3.new(0, 0, 0)
	local v25 = CFrame.new
	local v26 = p17.X + p18 * v_u_6.X
	local v27 = p17.Y
	local v28 = p17.Z + p19 * v_u_6.Y
	v_u_24.CFrame = v25((Vector3.new(v26, v27, v28)))
	v_u_24.Color = p20
	local v29 = v_u_24:FindFirstChild("Highlight")
	if v29 then
		v29.Color = Color3.new(p20.R * 0.25, p20.G * 0.25, p20.B * 0.25)
	end
	v_u_24.Surface.Icon.Image = p21
	v_u_24.Surface.Label.Text = p22
	v_u_24.Parent = Folder
	task.delay(p23, function()
		-- upvalues: (ref) v_u_2, (copy) v_u_24
		v_u_2.target(v_u_24, 1, 3, {
			["Size"] = Vector3.new(4.632, 0.107, 5.327)
		})
	end)
	return v_u_24
end
function v3.generate(p31, p32, p33) -- name: generate
	-- upvalues: (copy) v_u_5, (copy) v_u_16, (copy) v_u_30
	local v34 = workspace:FindFirstChild("SkillTree") or Instance.new("Folder")
	v34.Name = "SkillTree"
	v34.Parent = workspace
	math.randomseed(p31)
	local v35 = #v_u_5
	local v36 = {}
	local v37 = nil
	local v38 = {}
	for _, v39 in p33 do
		if v39.IsOrigin then
			v37 = v39
		else
			table.insert(v36, v39)
		end
	end
	local v40 = v_u_16()
	local v42 = v_u_30(p32, 0, 0, v40, v37.Icon, v37.Name:gsub("(%u)", function(p41)
		return " " .. p41
	end):gsub("^ ", "") .. "<br/>" .. (({
		"I",
		"II",
		"III",
		"IV",
		"V",
		"VI",
		"VII",
		"VIII",
		"IX",
		"X"
	})[1] or tostring(1)), 0)
	v42.Name = v37.Name .. "_I"
	table.insert(v38, v42)
	local v43 = {}
	for v44 = 1, v35 do
		table.insert(v43, v44)
	end
	local v45 = table.remove(v43, math.random(#v43))
	local v46 = v_u_5[v45]
	local v47 = v_u_5[(v45 - 2) % v35 + 1]
	local v48 = v46.X
	local v49 = v46.Y
	for v50 = 2, v37.Tiers do
		local v51 = v50 % 2 == 0 and v46 and v46 or v47
		local v52 = v_u_30
		local v53 = v37.Icon
		local v55 = v37.Name:gsub("(%u)", function(p54)
			return " " .. p54
		end):gsub("^ ", "") .. "<br/>" .. (({
			"I",
			"II",
			"III",
			"IV",
			"V",
			"VI",
			"VII",
			"VIII",
			"IX",
			"X"
		})[v50] or tostring(v50))
		local v56 = v48 ^ 2 + v49 ^ 2
		local v57 = v52(p32, v48, v49, v40, v53, v55, math.sqrt(v56) * 0.15)
		v57.Name = v37.Name .. "_" .. (({
			"I",
			"II",
			"III",
			"IV",
			"V",
			"VI",
			"VII",
			"VIII",
			"IX",
			"X"
		})[v50] or tostring(v50))
		table.insert(v38, v57)
		v48 = v48 + v51.X
		v49 = v49 + v51.Y
	end
	for _, v58 in v36 do
		local v59 = v_u_16()
		local v60 = table.remove(v43, math.random(#v43))
		local v61 = v_u_5[v60]
		local v62 = v_u_5[(v60 - 2) % v35 + 1]
		local v63 = v61.X
		local v64 = v61.Y
		for v65 = 1, v58.Tiers do
			local v66 = v65 % 2 == 1 and v61 and v61 or v62
			local v67 = v_u_30
			local v68 = v58.Icon
			local v70 = v58.Name:gsub("(%u)", function(p69)
				return " " .. p69
			end):gsub("^ ", "") .. "<br/>" .. (({
				"I",
				"II",
				"III",
				"IV",
				"V",
				"VI",
				"VII",
				"VIII",
				"IX",
				"X"
			})[v65] or tostring(v65))
			local v71 = v63 ^ 2 + v64 ^ 2
			local v72 = v67(p32, v63, v64, v59, v68, v70, math.sqrt(v71) * 0.15)
			v72.Name = v58.Name .. "_" .. (({
				"I",
				"II",
				"III",
				"IV",
				"V",
				"VI",
				"VII",
				"VIII",
				"IX",
				"X"
			})[v65] or tostring(v65))
			table.insert(v38, v72)
			v63 = v63 + v66.X
			v64 = v64 + v66.Y
		end
	end
	return v38
end
return v3