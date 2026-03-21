local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.Modules.CreateTagHandler)
local v_u_4 = v_u_1.LocalPlayer.Character or v_u_1.LocalPlayer.CharacterAdded:Wait()
local v_u_5 = {}
local v_u_6 = nil
local v_u_7 = true
local function v_u_14(p8)
	-- upvalues: (copy) v_u_1
	local v9 = p8:GetAttribute("Owner")
	if v9 and v_u_1:GetPlayerByUserId(v9) then
		return v_u_1:GetPlayerByUserId(v9)
	else
		local v10 = p8.Parent
		if v10 then
			local v11 = v10.Parent
			if v11 then
				local v12 = v11:FindFirstChild("Data")
				if v12 then
					local v13 = v12:FindFirstChild("Owner")
					if v13 then
						return v_u_1:FindFirstChild(v13.Value) or nil
					else
						return nil
					end
				else
					return nil
				end
			else
				return nil
			end
		else
			return nil
		end
	end
end
local function v_u_17()
	-- upvalues: (copy) v_u_5, (ref) v_u_6, (ref) v_u_7
	for _, v15 in v_u_5 do
		local v16 = v15:FindFirstChildOfClass("BillboardGui")
		if not v16 then
			return
		end
		v16.Enabled = false
	end
	if v_u_6 then
		v_u_7 = false
		task.cancel(v_u_6)
		v_u_6 = nil
	end
end
v3({
	["Tag"] = "TendablePlant",
	["OnInstanceAdded"] = function(p18)
		-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_5, (ref) v_u_6, (copy) v_u_17, (ref) v_u_7, (copy) v_u_4
		if p18:IsDescendantOf(workspace) then
			task.wait(3)
			local v19 = v_u_14(p18)
			if v19 then
				if v19 == v_u_1.LocalPlayer then
					if v_u_5[p18] then
						return
					else
						local v20 = p18:FindFirstChild("Grow")
						local v21
						if v20 then
							local v22 = p18:GetAttribute("MaxAge")
							if v22 then
								local v23 = v20:FindFirstChild("Age")
								if v23 then
									v21 = v22 <= v23.Value
								else
									v21 = false
								end
							else
								v21 = false
							end
						else
							v21 = false
						end
						if v21 then
							return
						else
							local v24 = p18:FindFirstChild("TendableUIHolder")
							if v24 then
								v_u_5[p18] = v24
								if not v_u_6 then
									v_u_17()
									v_u_7 = true
									v_u_6 = task.spawn(function()
										-- upvalues: (ref) v_u_7, (ref) v_u_4, (ref) v_u_1, (ref) v_u_5
										while v_u_7 do
											task.wait(1)
											local v25 = nil
											local v26 = (1 / 0)
											if v_u_4 then
												local v27 = v_u_4:FindFirstChild("HumanoidRootPart")
												if v27 then
													for _, v28 in v_u_5 do
														if v28 then
															local v29 = (v27.Position - v28.Position).Magnitude
															if v29 < v26 then
																v25 = v28
															else
																v29 = v26
															end
															local v30 = v28:FindFirstChildOfClass("BillboardGui")
															if v30 then
																v30.Enabled = false
																v26 = v29
															else
																v26 = v29
															end
														end
													end
													local v31 = v25 and v25:FindFirstChildOfClass("BillboardGui")
													if v31 then
														if v26 <= 20 then
															v31.Enabled = true
														else
															v31.Enabled = false
														end
													end
												end
											else
												v_u_1.LocalPlayer.CharacterAdded:Wait()
											end
										end
									end)
								end
							end
						end
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	end,
	["OnInstanceRemoved"] = function(p32)
		-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_5, (ref) v_u_6, (copy) v_u_17
		local v33 = v_u_14(p32)
		if v33 then
			if v33 == v_u_1.LocalPlayer then
				v_u_5[p32] = nil
				if v_u_6 then
					for _, _ in v_u_5 do
						v34 = true
						break
					end
					local v34 = false
					if not v34 then
						v_u_17()
					end
				end
			end
		else
			return
		end
	end
})
v3({
	["Tag"] = "TendablePlantMultiHarvest",
	["OnInstanceAdded"] = function(p35)
		-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_5, (ref) v_u_6, (copy) v_u_17, (ref) v_u_7, (copy) v_u_4
		if p35:IsDescendantOf(workspace) then
			task.wait(3)
			local v36 = v_u_14(p35)
			if v36 then
				if v36 == v_u_1.LocalPlayer then
					if v_u_5[p35] then
						return
					else
						local v37 = p35:FindFirstChild("TendableUIHolder")
						if v37 then
							v_u_5[p35] = v37
							if not v_u_6 then
								v_u_17()
								v_u_7 = true
								v_u_6 = task.spawn(function()
									-- upvalues: (ref) v_u_7, (ref) v_u_4, (ref) v_u_1, (ref) v_u_5
									while v_u_7 do
										task.wait(1)
										local v38 = nil
										local v39 = (1 / 0)
										if v_u_4 then
											local v40 = v_u_4:FindFirstChild("HumanoidRootPart")
											if v40 then
												for _, v41 in v_u_5 do
													if v41 then
														local v42 = (v40.Position - v41.Position).Magnitude
														if v42 < v39 then
															v38 = v41
														else
															v42 = v39
														end
														local v43 = v41:FindFirstChildOfClass("BillboardGui")
														if v43 then
															v43.Enabled = false
															v39 = v42
														else
															v39 = v42
														end
													end
												end
												local v44 = v38 and v38:FindFirstChildOfClass("BillboardGui")
												if v44 then
													if v39 <= 20 then
														v44.Enabled = true
													else
														v44.Enabled = false
													end
												end
											end
										else
											v_u_1.LocalPlayer.CharacterAdded:Wait()
										end
									end
								end)
							end
						end
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	end,
	["OnInstanceRemoved"] = function(p45)
		-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_5, (ref) v_u_6, (copy) v_u_17
		local v46 = v_u_14(p45)
		if v46 then
			if v46 == v_u_1.LocalPlayer then
				v_u_5[p45] = nil
				if v_u_6 then
					for _, _ in v_u_5 do
						v47 = true
						break
					end
					local v47 = false
					if not v47 then
						v_u_17()
					end
				end
			end
		else
			return
		end
	end
})
v_u_17()
v_u_7 = true
v_u_6 = task.spawn(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_4, (copy) v_u_1, (copy) v_u_5
	while v_u_7 do
		task.wait(1)
		local v48 = nil
		local v49 = (1 / 0)
		if v_u_4 then
			local v50 = v_u_4:FindFirstChild("HumanoidRootPart")
			if v50 then
				for _, v51 in v_u_5 do
					if v51 then
						local v52 = (v50.Position - v51.Position).Magnitude
						if v52 < v49 then
							v48 = v51
						else
							v52 = v49
						end
						local v53 = v51:FindFirstChildOfClass("BillboardGui")
						if v53 then
							v53.Enabled = false
							v49 = v52
						else
							v49 = v52
						end
					end
				end
				local v54 = v48 and v48:FindFirstChildOfClass("BillboardGui")
				if v54 then
					if v49 <= 20 then
						v54.Enabled = true
					else
						v54.Enabled = false
					end
				end
			end
		else
			v_u_1.LocalPlayer.CharacterAdded:Wait()
		end
	end
end)