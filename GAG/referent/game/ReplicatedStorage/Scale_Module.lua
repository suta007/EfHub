return {
	["Scale"] = function(p1, p2)
		debug.profilebegin("PlantScale1")
		if p1:FindFirstChild("PlantModel") then
			p1:FindFirstChild("PlantModel"):ScaleTo(p2)
		else
			for _, v3 in pairs(p1:GetDescendants()) do
				if v3:IsA("BasePart") then
					if v3:GetAttribute("OG_SIZE") == nil then
						v3:SetAttribute("OG_SIZE", v3.Size)
					end
					v3.Size = v3:GetAttribute("OG_SIZE") * p2
					v3:IsA("MeshPart")
					local v4 = v3:FindFirstChildOfClass("SpecialMesh")
					if v4 then
						if v4:GetAttribute("OG_SCALE") == nil then
							v4:SetAttribute("OG_SCALE", v4.Scale)
						end
						v4.Scale = v4:GetAttribute("OG_SCALE") * p2
					end
				elseif v3:IsA("Motor6D") then
					if v3:GetAttribute("OG_C0") == nil and v3:GetAttribute("OG_C1") == nil then
						v3:SetAttribute("OG_C0", v3.C0)
						v3:SetAttribute("OG_C1", v3.C1)
					end
					local v5 = v3:GetAttribute("OG_C0")
					local v6 = v3:GetAttribute("OG_C1")
					v3.C0 = CFrame.new(v5.Position * p2) * (v5 - v5.Position)
					v3.C1 = CFrame.new(v6.Position * p2) * (v6 - v6.Position)
				end
			end
			debug.profileend()
		end
	end
}