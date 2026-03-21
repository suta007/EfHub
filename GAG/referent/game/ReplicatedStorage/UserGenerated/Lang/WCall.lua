local function v_u_2(p1)
	warn((("%*\nStack Begin\n%*Stack End"):format(tostring(p1), (debug.traceback(nil, 3)))))
end
return function(p3, ...)
	-- upvalues: (copy) v_u_2
	return xpcall(p3, v_u_2, ...)
end