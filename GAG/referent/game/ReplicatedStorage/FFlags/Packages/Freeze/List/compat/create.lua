local v_u_1 = require(script.Parent.Parent.Parent.utils.deprecationWarning)
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	v_u_1("List." .. script.Name, "table.create")
	return table.create(p2, p3)
end