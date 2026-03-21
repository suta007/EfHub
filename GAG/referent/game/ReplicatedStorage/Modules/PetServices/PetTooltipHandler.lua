local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
require(v1.Modules.CreateTagHandler)({
	["Tag"] = "PetTooltip",
	["OnInstanceAdded"] = function(p_u_3)
		-- upvalues: (copy) v_u_2
		if p_u_3 then
			local v4 = p_u_3.Parent
			if v4 then
				local v5 = v4.Parent
				if v5 then
					local v6 = p_u_3:FindFirstChild("TooltipText")
					v6.TextTransparency = 1
					p_u_3.BackgroundTransparency = 1
					local v_u_7 = v_u_2:Create(p_u_3, TweenInfo.new(0.2), {
						["BackgroundTransparency"] = 0.4
					})
					local v_u_8 = v_u_2:Create(v6, TweenInfo.new(0.2), {
						["TextTransparency"] = 0
					})
					local v_u_9 = v_u_2:Create(p_u_3, TweenInfo.new(0.2), {
						["BackgroundTransparency"] = 1
					})
					local v_u_10 = v_u_2:Create(v6, TweenInfo.new(0.2), {
						["TextTransparency"] = 1
					})
					local v_u_11 = p_u_3:GetAttribute("ForceTooltip")
					local v_u_12 = false
					local v_u_13 = nil
					v5.MouseEnter:Connect(function()
						-- upvalues: (ref) v_u_12, (ref) v_u_11, (ref) v_u_13, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
						v_u_12 = true
						if v_u_11 ~= false and v_u_12 or v_u_11 then
							if not v_u_13 then
								v_u_13 = true
								v_u_7:Play()
								v_u_8:Play()
								return
							end
						elseif v_u_13 then
							v_u_13 = false
							v_u_9:Play()
							v_u_10:Play()
						end
					end)
					v5.MouseLeave:Connect(function()
						-- upvalues: (ref) v_u_12, (ref) v_u_11, (ref) v_u_13, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
						v_u_12 = false
						if v_u_11 ~= false and v_u_12 or v_u_11 then
							if not v_u_13 then
								v_u_13 = true
								v_u_7:Play()
								v_u_8:Play()
								return
							end
						elseif v_u_13 then
							v_u_13 = false
							v_u_9:Play()
							v_u_10:Play()
						end
					end)
					p_u_3:GetAttributeChangedSignal("ForceTooltip"):Connect(function()
						-- upvalues: (ref) v_u_11, (copy) p_u_3, (ref) v_u_12, (ref) v_u_13, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
						v_u_11 = p_u_3:GetAttribute("ForceTooltip")
						if v_u_11 ~= false and v_u_12 or v_u_11 then
							if not v_u_13 then
								v_u_13 = true
								v_u_7:Play()
								v_u_8:Play()
								return
							end
						elseif v_u_13 then
							v_u_13 = false
							v_u_9:Play()
							v_u_10:Play()
						end
					end)
				end
			else
				return
			end
		else
			return
		end
	end
})
return {}