local function v_u_8(p1, p2, p3)
	local v4 = {
		{
			["Name"] = "Default",
			["Modifier"] = 1
		}
	}
	if p3 == "Plant" or (p3 == "Grow" or p3 == "BottomDisplay") then
		local v5
		if p2 then
			v5 = p2:GetAttribute("FruitVariantLuck")
		else
			v5 = nil
		end
		if type(v5) == "number" and v5 ~= 1 then
			local v6 = {
				["Name"] = "FruitVariantLuck",
				["Modifier"] = v5 - 1
			}
			table.insert(v4, v6)
		end
	end
	if (p3 == "Plant" or p3 == "Grow") and p1:GetAttribute("AB_FTUELuckBoost_Active") then
		table.insert(v4, {
			["Name"] = "LuckBoostFTUE",
			["Modifier"] = 2
		})
	end
	if p3 == "BottomDisplay" then
		local v7 = p1:GetAttribute("SessionTimeLuck")
		if v7 and v7 ~= 0 then
			table.insert(v4, {
				["Name"] = "SessionTimeLuck",
				["Modifier"] = v7
			})
		end
	end
	return v4
end
return {
	["GetModifiers"] = v_u_8,
	["GetLuck"] = function(p9, p10, p11, p12)
		-- upvalues: (copy) v_u_8
		local v13 = 0
		for _, v14 in v_u_8(p9, p10, p11) do
			if not (p12 and table.find(p12, v14.Name)) then
				v13 = v13 + v14.Modifier
			end
		end
		return v13 == 0 and 1 or v13
	end,
	["Listen"] = function(p15, p16)
		local v_u_17 = {}
		local v18 = p15:GetAttributeChangedSignal("SessionTimeLuck")
		table.insert(v_u_17, v18:Connect(p16))
		local v_u_19 = task.spawn(p16)
		return function()
			-- upvalues: (copy) v_u_19, (copy) v_u_17
			if coroutine.status(v_u_19) == "suspended" then
				pcall(task.cancel, v_u_19)
			end
			for _, v20 in v_u_17 do
				if v20.Connected then
					v20:Disconnect()
				end
			end
			table.clear(v_u_17)
		end
	end
}