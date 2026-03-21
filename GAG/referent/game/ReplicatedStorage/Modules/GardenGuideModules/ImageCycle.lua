local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
require(v1.Data.AchievementsData.Types)
local v_u_3 = require(v1.Modules.ItemImageFinder)
local v_u_4 = require(v1.Modules.ItemNameFinder)
require(v1.Data.SeasonPass.SeasonPassData)
local v_u_5 = require(v1.Data.PetRegistry.PetList)
local v_u_6 = require(v1.Data.SeedData)
local v_u_7 = {}
local v8 = {}
local function v_u_11(p9)
	local v10 = p9:FindFirstAncestorOfClass("ScreenGui")
	if v10 and not v10.Enabled then
		return false
	end
	while p9 do
		if p9:IsA("GuiObject") and p9.Visible == false then
			return false
		end
		if not p9.Parent then
			break
		end
		p9 = p9.Parent
	end
	return true
end
local function v_u_22(p12, p13)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	local v14 = {}
	local v15 = {}
	for _, v16 in p12 do
		if v16.Type ~= "XP" then
			local v17 = nil
			if p13 then
				if v16.Type == "Pet" then
					if v_u_5[v16.Value] then
						v17 = v_u_5[v16.Value].SeasonPassIcon
					else
						v17 = v_u_5[v16.Value].Icon
					end
				elseif v16.Type == "Seed" then
					v17 = v_u_6[v16.Value].FruitIcon
				end
			end
			local v18 = v17 or v_u_3(v16.Value, v16.Type)
			local v19 = v16.DisplayName or v_u_4(v16.Value, v16.Type)
			local _ = v16.Type
			local v20 = v16.Quantity <= 1 and "" or (" x%*"):format(v16.Quantity)
			local v21 = ("%*%*%*"):format(not v16.Variant and "" or ("%* "):format(v16.Variant), v19, v20)
			table.insert(v14, v18)
			table.insert(v15, v21)
		end
	end
	return v14, v15
end
function v8.CycleRewardImages(p23, p24, p25, p_u_26, p27, p28)
	-- upvalues: (copy) v_u_22, (copy) v_u_7, (copy) v_u_2, (copy) v_u_11
	local v29, v_u_30 = v_u_22(p27, p28)
	if not v_u_7[p_u_26.Name] then
		v_u_7[p_u_26.Name] = true
		local v31 = p_u_26:FindFirstChild((("%*B"):format(p23.Name)))
		if not v31 then
			v31 = p23:Clone()
			v31.Name = ("%*B"):format(p23.Name)
			v31.Parent = p23.Parent
		end
		local v_u_32 = p23
		local v_u_33 = v31
		local v_u_34 = v29
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_7, (copy) p_u_26, (ref) v_u_11, (copy) v_u_34, (ref) v_u_33, (ref) v_u_32
			local v_u_35 = Enum.EasingStyle.Linear
			TweenInfo.new(0.5, v_u_35)
			local v_u_36 = {}
			local function v44(p37, p38, p39)
				-- upvalues: (ref) v_u_2, (copy) v_u_35, (ref) v_u_36
				local v40 = v_u_2:Create(p37, TweenInfo.new(0.5, v_u_35), {
					[p39] = 1
				})
				local v41 = v_u_2:Create(p38, TweenInfo.new(0.5, v_u_35), {
					[p39] = 0
				})
				local v42 = v_u_36
				table.insert(v42, v40)
				local v43 = v_u_36
				table.insert(v43, v41)
			end
			local v45 = 1
			while v_u_7[p_u_26.Name] do
				task.wait(1)
				if p_u_26.Visible and v_u_11(p_u_26) then
					local v46 = v_u_34[v45]
					if v46 then
						v_u_36 = {}
						if v_u_33:IsA("ImageLabel") then
							v_u_33.Image = v46
							v_u_33.ImageTransparency = 1
							v44(v_u_32, v_u_33, "ImageTransparency")
						elseif v_u_33:IsA("TextLabel") then
							v_u_33.Text = v_u_34[v45]
							v_u_33.TextTransparency = 1
							v44(v_u_32, v_u_33, "TextTransparency")
							local v47 = v_u_32:FindFirstChild("UIStroke")
							local v48 = v_u_33:FindFirstChild("UIStroke")
							if v47 and v48 then
								v48.Transparency = 1
								v44(v47, v48, "Transparency")
							end
						end
						for _, v49 in v_u_36 do
							v49:Play()
						end
						task.wait(0.5)
						local v50 = v_u_32
						v_u_32 = v_u_33
						v_u_33 = v50
						local v51 = (v45 + 1) % (#v_u_34 + 1)
						v45 = math.max(v51, 1)
						if #v_u_34 == 1 then
							task.wait(1)
							v_u_32.Name = v_u_33.Name
							v_u_33:Destroy()
							break
						end
					end
				else
					task.wait(5)
				end
			end
		end)
		if #v_u_30 > 0 then
			if p24 then
				local v52 = p_u_26:FindFirstChild((("%*B"):format(p24.Name)))
				if not v52 then
					v52 = p24:Clone()
					v52.Name = ("%*B"):format(p24.Name)
					v52.Parent = p24.Parent
				end
				local v_u_53 = p24
				local v_u_54 = v52
				task.spawn(function()
					-- upvalues: (ref) v_u_2, (ref) v_u_7, (copy) p_u_26, (ref) v_u_11, (copy) v_u_30, (ref) v_u_54, (ref) v_u_53
					local v_u_55 = Enum.EasingStyle.Linear
					TweenInfo.new(0.5, v_u_55)
					local v_u_56 = {}
					local function v64(p57, p58, p59)
						-- upvalues: (ref) v_u_2, (copy) v_u_55, (ref) v_u_56
						local v60 = v_u_2:Create(p57, TweenInfo.new(0.5, v_u_55), {
							[p59] = 1
						})
						local v61 = v_u_2:Create(p58, TweenInfo.new(0.5, v_u_55), {
							[p59] = 0
						})
						local v62 = v_u_56
						table.insert(v62, v60)
						local v63 = v_u_56
						table.insert(v63, v61)
					end
					local v65 = 1
					while v_u_7[p_u_26.Name] do
						task.wait(1)
						if p_u_26.Visible and v_u_11(p_u_26) then
							local v66 = v_u_30[v65]
							if v66 then
								v_u_56 = {}
								if v_u_54:IsA("ImageLabel") then
									v_u_54.Image = v66
									v_u_54.ImageTransparency = 1
									v64(v_u_53, v_u_54, "ImageTransparency")
								elseif v_u_54:IsA("TextLabel") then
									v_u_54.Text = v_u_30[v65]
									v_u_54.TextTransparency = 1
									v64(v_u_53, v_u_54, "TextTransparency")
									local v67 = v_u_53:FindFirstChild("UIStroke")
									local v68 = v_u_54:FindFirstChild("UIStroke")
									if v67 and v68 then
										v68.Transparency = 1
										v64(v67, v68, "Transparency")
									end
								end
								for _, v69 in v_u_56 do
									v69:Play()
								end
								task.wait(0.5)
								local v70 = v_u_53
								v_u_53 = v_u_54
								v_u_54 = v70
								local v71 = (v65 + 1) % (#v_u_30 + 1)
								v65 = math.max(v71, 1)
								if #v_u_30 == 1 then
									task.wait(1)
									v_u_53.Name = v_u_54.Name
									v_u_54:Destroy()
									break
								end
							end
						else
							task.wait(5)
						end
					end
				end)
			end
			if p25 then
				local v72 = p_u_26:FindFirstChild((("%*B"):format(p25.Name)))
				if not v72 then
					v72 = p25:Clone()
					v72.Name = ("%*B"):format(p25.Name)
					v72.Parent = p25.Parent
				end
				local v_u_73 = p25
				local v_u_74 = v72
				task.spawn(function()
					-- upvalues: (ref) v_u_2, (ref) v_u_7, (copy) p_u_26, (ref) v_u_11, (copy) v_u_30, (ref) v_u_74, (ref) v_u_73
					local v_u_75 = Enum.EasingStyle.Linear
					TweenInfo.new(0.5, v_u_75)
					local v_u_76 = {}
					local function v84(p77, p78, p79)
						-- upvalues: (ref) v_u_2, (copy) v_u_75, (ref) v_u_76
						local v80 = v_u_2:Create(p77, TweenInfo.new(0.5, v_u_75), {
							[p79] = 1
						})
						local v81 = v_u_2:Create(p78, TweenInfo.new(0.5, v_u_75), {
							[p79] = 0
						})
						local v82 = v_u_76
						table.insert(v82, v80)
						local v83 = v_u_76
						table.insert(v83, v81)
					end
					local v85 = 1
					while v_u_7[p_u_26.Name] do
						task.wait(1)
						if p_u_26.Visible and v_u_11(p_u_26) then
							local v86 = v_u_30[v85]
							if v86 then
								v_u_76 = {}
								if v_u_74:IsA("ImageLabel") then
									v_u_74.Image = v86
									v_u_74.ImageTransparency = 1
									v84(v_u_73, v_u_74, "ImageTransparency")
								elseif v_u_74:IsA("TextLabel") then
									v_u_74.Text = v_u_30[v85]
									v_u_74.TextTransparency = 1
									v84(v_u_73, v_u_74, "TextTransparency")
									local v87 = v_u_73:FindFirstChild("UIStroke")
									local v88 = v_u_74:FindFirstChild("UIStroke")
									if v87 and v88 then
										v88.Transparency = 1
										v84(v87, v88, "Transparency")
									end
								end
								for _, v89 in v_u_76 do
									v89:Play()
								end
								task.wait(0.5)
								local v90 = v_u_73
								v_u_73 = v_u_74
								v_u_74 = v90
								local v91 = (v85 + 1) % (#v_u_30 + 1)
								v85 = math.max(v91, 1)
								if #v_u_30 == 1 then
									task.wait(1)
									v_u_73.Name = v_u_74.Name
									v_u_74:Destroy()
									break
								end
							end
						else
							task.wait(5)
						end
					end
				end)
			end
		end
	end
	p_u_26.Destroying:Once(function()
		-- upvalues: (ref) v_u_7, (copy) p_u_26
		v_u_7[p_u_26.Name] = nil
	end)
end
return v8