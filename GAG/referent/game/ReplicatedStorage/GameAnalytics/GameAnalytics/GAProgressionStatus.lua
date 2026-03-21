return (function(p1)
	return setmetatable({}, {
		["__index"] = p1,
		["__metatable"] = false,
		["__newindex"] = function(p2, p3, p4)
			error("Attempt to modify read-only table: " .. p2 .. ", key=" .. p3 .. ", value=" .. p4)
		end
	})
end)({
	["Start"] = "Start",
	["Complete"] = "Complete",
	["Fail"] = "Fail"
})