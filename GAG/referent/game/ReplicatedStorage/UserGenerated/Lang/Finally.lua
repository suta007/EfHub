local function v_u_2(p1)
	warn((("%*\nStack Begin\n%*Stack End"):format(tostring(p1), (debug.traceback(nil, 3)))))
end
local function v_u_5(p3, p4, ...)
	-- upvalues: (copy) v_u_2
	xpcall(p3, v_u_2)
	if not p4 then
		error((select(1, ...)))
	end
	return ...
end
return function(p6, p7, ...)
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	return v_u_5(p7, xpcall(p6, v_u_2, ...))
end