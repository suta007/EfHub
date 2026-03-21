local v_u_1 = game:GetService("RunService")
return {
	["_camera"] = workspace.CurrentCamera,
	["_target"] = nil,
	["_offset"] = Vector3.new(0, 0, 0),
	["_connection"] = nil,
	["_lerpSpeed"] = 10,
	["Focus"] = function(p_u_2, p3, p4)
		-- upvalues: (copy) v_u_1
		p_u_2._target = p3
		p_u_2._offset = p4 or Vector3.new(0, 0, 0)
		if p_u_2._connection then
			p_u_2._connection:Disconnect()
		end
		p_u_2._connection = v_u_1.RenderStepped:Connect(function(p5)
			-- upvalues: (copy) p_u_2
			if p_u_2._target then
				local v6 = p_u_2._camera
				local v7 = v6.CFrame.Position
				local v8 = p_u_2._target:GetPivot():PointToWorldSpace(p_u_2._offset)
				local v9 = CFrame.new(v7, v8)
				local v10 = v6.CFrame
				local v11 = p5 * p_u_2._lerpSpeed
				v6.CFrame = v10:Lerp(v9, (math.clamp(v11, 0, 1)))
			end
		end)
	end,
	["Stop"] = function(p12)
		if p12._connection then
			p12._connection:Disconnect()
			p12._connection = nil
		end
	end
}