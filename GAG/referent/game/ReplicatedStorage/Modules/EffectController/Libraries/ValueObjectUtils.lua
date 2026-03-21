local v1 = {}
local v_u_2 = {
	["nil"] = "StringValue",
	["boolean"] = "BoolValue",
	["BrickColor"] = "BrickColorValue",
	["CFrame"] = "CFrameValue",
	["Color3"] = "Color3Value",
	["number"] = "NumberValue",
	["Instance"] = "ObjectValue",
	["Ray"] = "RayValue",
	["string"] = "StringValue",
	["Vector3"] = "Vector3Value"
}
function v1.GetClassFromType(p3)
	-- upvalues: (copy) v_u_2
	return v_u_2[p3]
end
function v1.ConvertTypeToClass(p4)
	-- upvalues: (copy) v_u_2
	return Instance.new(v_u_2[p4])
end
return v1