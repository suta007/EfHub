local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v_u_5 = v_u_4:WaitForChild("PityHover_UI")
local v_u_6 = {}
local v_u_18 = {
	["AddGuiObject"] = function(_, p_u_7, p8, p9)
		-- upvalues: (copy) v_u_6, (copy) v_u_18, (copy) v_u_5
		local v_u_10 = {
			["pity"] = p8,
			["display"] = p9,
			["layerCollectorAncestor"] = p_u_7:FindFirstAncestorWhichIsA("LayerCollector")
		}
		v_u_6[p_u_7] = v_u_10
		if not v_u_10.layerCollectorAncestor then
			p_u_7.AncestryChanged:Once(function()
				-- upvalues: (copy) v_u_10, (copy) p_u_7, (ref) v_u_18
				v_u_10.layerCollectorAncestor = p_u_7:FindFirstAncestorWhichIsA("LayerCollector")
				if not v_u_10.layerCollectorAncestor then
					v_u_18:RemoveGuiObject(p_u_7)
				end
			end)
		end
		v_u_5.Enabled = next(v_u_6) ~= nil
	end,
	["RemoveGuiObject"] = function(_, p11)
		-- upvalues: (copy) v_u_6, (copy) v_u_5
		v_u_6[p11] = nil
		v_u_5.Enabled = next(v_u_6) ~= nil
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_6, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
		local v_u_12 = script.Hover:Clone()
		v_u_12.Visible = false
		v_u_12.Parent = v_u_5
		v_u_2.PreRender:Connect(function(_)
			-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_1, (ref) v_u_3, (copy) v_u_12, (ref) v_u_4
			if not v_u_5.Enabled then
				return
			end
			local v13 = false
			for _, v14 in v_u_6 do
				if v14.layerCollectorAncestor and v14.layerCollectorAncestor.Enabled then
					v13 = true
					break
				end
			end
			if v13 then
				local v15 = v_u_1:GetMouseLocation() - v_u_3:GetGuiInset()
				v_u_12.Position = UDim2.fromOffset(v15.X + 16, v15.Y + 16)
				v_u_12.Visible = false
				for _, v16 in v_u_4:GetGuiObjectsAtPosition(v15.X, v15.Y) do
					local v17 = v_u_6[v16]
					if v17 then
						v_u_12.Visible = true
						v_u_12.Pity.Text = ("Guaranteed in %* %*"):format(v17.pity, v17.display)
						return
					end
				end
			end
		end)
	end
}
task.spawn(v_u_18.Start, v_u_18)
return v_u_18