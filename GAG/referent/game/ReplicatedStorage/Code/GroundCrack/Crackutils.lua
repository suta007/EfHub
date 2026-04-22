local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = v_u_1:GetMouse()
local v_u_3 = workspace.CurrentCamera
return {
	["CastToMouseCFrame"] = function(p4, p5)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v6 = v_u_3:ScreenPointToRay(v_u_2.X, v_u_2.Y)
		local v7 = workspace:Raycast(v6.Origin, v6.Direction * (p4 or 1000), p5)
		if v7 then
			return CFrame.new(v7.Position, v7.Position + v7.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0)
		end
		print("Raycast failed")
		return v_u_2.Hit
	end,
	["CastToCharacterGroundPosition"] = function(p8)
		-- upvalues: (copy) v_u_1
		local v9 = v_u_1.Character
		if v9 then
			local v10 = v9:FindFirstChild("HumanoidRootPart")
			if v10 then
				local v11 = RaycastParams.new()
				v11.FilterType = Enum.RaycastFilterType.Exclude
				v11.FilterDescendantsInstances = { v9 }
				local v12 = workspace
				local v13 = v10.Position
				local v14 = -(p8 or 10)
				local v15 = v12:Raycast(v13, Vector3.new(0, v14, 0), v11)
				if v15 then
					return CFrame.new(v15.Position, v15.Position + v15.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0)
				end
				print("Raycast failed")
				return v10.CFrame
			end
		end
	end
}