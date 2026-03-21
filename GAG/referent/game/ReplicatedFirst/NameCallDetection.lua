local v_u_1 = nil
task.spawn(function()
	-- upvalues: (ref) v_u_1
	while true do
		task.wait(1)
		xpcall(function()
			return game:________SKIBIDI_TOILET()
		end, function()
			-- upvalues: (ref) v_u_1
			local v2 = debug.info(2, "f")
			if not v_u_1 then
				v_u_1 = v2
			end
			if v2 == v_u_1 then
				return
			else
				while true do

				end
			end
		end)
	end
end)