local v_u_1 = {}
local function v_u_5(p2, p3, p4)
	p2[p3] = p4
end
function v_u_1.isAnInstance(p6)
	local _, v7 = pcall(Game.IsA, p6, "Instance")
	return v7 == true
end
function v_u_1.isALibrary(p_u_8)
	if not pcall(function()
		-- upvalues: (copy) p_u_8
		local v9 = p_u_8.GetApi
		local v10 = type(v9) == "function"
		assert(v10)
	end) then
		return false
	end
	local _, v11 = pcall(string.dump, p_u_8.GetApi)
	return v11 == "unable to dump given function"
end
function v_u_1.isAnEnum(p12)
	return pcall(Enum.Material.GetEnumItems, p12) == true
end
function v_u_1.coerceIntoEnum(p13, p14)
	-- upvalues: (copy) v_u_1
	if v_u_1.isAnEnum(p14) then
		local v15 = next
		local v16, v17 = p14:GetEnumItems()
		for _, v18 in v15, v16, v17 do
			if p13 == v18 or (p13 == v18.Name or p13 == v18.Value) then
				return v18
			end
		end
	else
		error("The \'enum\' argument must be an enum.", 2)
	end
	error("The value cannot be coerced into a enum item of the specified type.", 2)
end
function v_u_1.isOfEnumType(p19, p20)
	-- upvalues: (copy) v_u_1
	if v_u_1.isAnEnum(p20) then
		return pcall(v_u_1.coerceIntoEnum, p19, p20) == true
	end
	error("The \'enum\' argument must be an enum.", 2)
end
local v_u_21 = Instance.new("Color3Value")
function v_u_1.isAColor3(p22)
	-- upvalues: (copy) v_u_5, (copy) v_u_21
	return pcall(v_u_5, v_u_21, "Value", p22) == true
end
local v_u_23 = Instance.new("CFrameValue")
function v_u_1.isACoordinateFrame(p24)
	-- upvalues: (copy) v_u_5, (copy) v_u_23
	return pcall(v_u_5, v_u_23, "Value", p24) == true
end
local v_u_25 = Instance.new("BrickColorValue")
function v_u_1.isABrickColor(p26)
	-- upvalues: (copy) v_u_5, (copy) v_u_25
	return pcall(v_u_5, v_u_25, "Value", p26) == true
end
local v_u_27 = Instance.new("RayValue")
function v_u_1.isARay(p28)
	-- upvalues: (copy) v_u_5, (copy) v_u_27
	return pcall(v_u_5, v_u_27, "Value", p28) == true
end
local v_u_29 = Instance.new("Vector3Value")
function v_u_1.isAVector3(p30)
	-- upvalues: (copy) v_u_5, (copy) v_u_29
	return pcall(v_u_5, v_u_29, "Value", p30) == true
end
function v_u_1.isAVector2(p_u_31)
	return pcall(function()
		-- upvalues: (copy) p_u_31
		return Vector2.new() + p_u_31
	end) == true
end
local v_u_32 = Instance.new("Frame")
function v_u_1.isAUdim2(p33)
	-- upvalues: (copy) v_u_5, (copy) v_u_32
	return pcall(v_u_5, v_u_32, "Position", p33) == true
end
function v_u_1.isAUDim(p_u_34)
	return pcall(function()
		-- upvalues: (copy) p_u_34
		return UDim.new() + p_u_34
	end) == true
end
local v_u_35 = Instance.new("ArcHandles")
function v_u_1.isAAxis(p36)
	-- upvalues: (copy) v_u_5, (copy) v_u_35
	return pcall(v_u_5, v_u_35, "Axes", p36) == true
end
local v_u_37 = Instance.new("Handles")
function v_u_1.isAFace(p38)
	-- upvalues: (copy) v_u_5, (copy) v_u_37
	return pcall(v_u_5, v_u_37, "Faces", p38) == true
end
function v_u_1.isASignal(p_u_39)
	local v40, v41 = pcall(function()
		-- upvalues: (copy) p_u_39
		return Game.AllowedGearTypeChanged.connect(p_u_39)
	end)
	if v40 and v41 then
		v41:disconnect()
		return true
	end
end
function v_u_1.getArchetype(p42)
	return p42:gsub(".", function(p43)
		return p43:byte()
	end)
end
function v_u_1.getSignal(p44)
	return p44.MarketplaceService, p44.MarketplaceService.GetProductInfo
end
function v_u_1.checkChild(p45)
	return p45.JobId ~= ""
end
function v_u_1.getType(p46)
	-- upvalues: (copy) v_u_1
	local v47 = type(p46)
	if v47 ~= "userdata" then
		return v47
	end
	if v_u_1.isAnInstance(p46) then
		return p46.ClassName
	end
	if v_u_1.isAColor3(p46) then
		return "Color3"
	end
	if v_u_1.isACoordinateFrame(p46) then
		return "CFrame"
	end
	if v_u_1.isABrickColor(p46) then
		return "BrickColor"
	end
	if v_u_1.isAUDim2(p46) then
		return "UDim2"
	end
	if v_u_1.isAUDim(p46) then
		return "UDim"
	end
	if v_u_1.isAVector3(p46) then
		return "Vector3"
	end
	if v_u_1.isAVector2(p46) then
		return "Vector2"
	end
	if v_u_1.isARay(p46) then
		return "Ray"
	end
	if v_u_1.isAnEnum(p46) then
		return "Enum"
	end
	if v_u_1.isASignal(p46) then
		return "RBXScriptSignal"
	end
	if v_u_1.isALibrary(p46) then
		return "RbxLibrary"
	end
	if v_u_1.isAAxis(p46) then
		return "Axes"
	end
	if v_u_1.isAFace(p46) then
		return "Faces"
	end
end
function v_u_1.isAnInt(p48)
	local v49
	if type(p48) == "number" then
		v49 = p48 % 1 == 1
	else
		v49 = false
	end
	return v49
end
function v_u_1.isPositiveInt(p50)
	local v51 = value
	local v52
	if type(v51) == "number" and p50 > 0 then
		v52 = math.floor(p50) == p50
	else
		v52 = false
	end
	return v52
end
function v_u_1.isAnArray(p53)
	-- upvalues: (copy) v_u_1
	if type(p53) ~= "table" then
		return false
	end
	local v54 = 0
	local v55 = 0
	for v56, _ in next, p53 do
		if not v_u_1.isPositiveInt(v56) then
			return false
		end
		v54 = math.max(v54, v56)
		v55 = v55 + 1
	end
	return v54 == v55
end
return v_u_1