local v_u_1 = {
	["particleList"] = {}
}
game.Players.LocalPlayer:GetMouse()
function v_u_1.createParticle(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: (copy) v_u_1
	local v12 = UDim2.new(p6.X.Scale + p6.X.Offset / workspace.Camera.ViewportSize.X, 0, p6.Y.Scale + p6.Y.Offset / workspace.Camera.ViewportSize.Y, 0)
	local v13 = UDim2.new(p4.X.Scale + p4.X.Offset / workspace.Camera.ViewportSize.X, 0, p4.Y.Scale + p4.Y.Offset / workspace.Camera.ViewportSize.Y, 0)
	local v14 = {
		["baseObject"] = p2,
		["lifeSpan"] = p3,
		["initVelocity"] = v13,
		["workingVelocity"] = v13,
		["rotVelocity"] = p5,
		["acceleration"] = v12,
		["sizeChange"] = UDim2.new(p7.X.Scale + p7.X.Offset / workspace.Camera.ViewportSize.X, 0, p7.Y.Scale + p7.Y.Offset / workspace.Camera.ViewportSize.Y, 0),
		["transparencyShift"] = p8,
		["movementMode"] = p9,
		["parentObject"] = p10,
		["elapsedTime"] = 0,
		["drag"] = p11 or 0
	}
	if p10 then
		p2.Parent = p10
	end
	local v15 = false
	if #v_u_1.particleList < 200 then
		local v16 = v_u_1.particleList
		table.insert(v16, v14)
		return #v_u_1.particleList
	end
	for v17, _ in ipairs(v_u_1.particleList) do
		if not v_u_1.particleList[v17 + 1] then
			v15 = v17 + 1
		end
	end
	local v18 = v15 or 1
	if v18 < 4 then
		v_u_1.particleList[v18] = v14
		return v18
	end
	if v14[1] then
		v14[1]:Destroy()
	end
end
function v_u_1.updateParticle(p19)
	-- upvalues: (copy) v_u_1
	for v20, v21 in pairs(v_u_1.particleList) do
		if v21 ~= nil then
			local v22 = 2 ^ (v21.elapsedTime * -v21.drag)
			v21.workingVelocity = UDim2.new(v21.workingVelocity.X.Scale * v22, v21.workingVelocity.X.Offset * v22, v21.workingVelocity.Y.Scale * v22, v21.workingVelocity.Y.Offset * v22)
			v21.baseObject.Position = v21.baseObject.Position + UDim2.new(v21.workingVelocity.X.Scale * p19, v21.workingVelocity.X.Offset * p19, v21.workingVelocity.Y.Scale * p19, v21.workingVelocity.Y.Offset * p19)
			v_u_1.particleList[v20].workingVelocity = v_u_1.particleList[v20].workingVelocity + UDim2.new(v21.acceleration.X.Scale * p19, v21.acceleration.X.Offset * p19, v21.acceleration.Y.Scale * p19, v21.acceleration.Y.Offset * p19)
			if v21.baseObject.AbsoluteSize.X > 0 or v21.baseObject.AbsoluteSize.Y > 0 then
				v21.baseObject.Size = v21.baseObject.Size + UDim2.new(v21.sizeChange.X.Scale * p19, v21.sizeChange.X.Offset * p19, v21.sizeChange.Y.Scale * p19, v21.sizeChange.Y.Offset * p19)
			else
				v21.baseObject.Size = UDim2.new(0, 0, 0, 0)
			end
			v21.baseObject.Rotation = v21.baseObject.Rotation + v21.rotVelocity * p19
			v21.baseObject.ImageTransparency = v21.baseObject.ImageTransparency + v21.transparencyShift * p19
			if v21.lifeSpan >= 0 then
				v_u_1.particleList[v20].lifeSpan = v_u_1.particleList[v20].lifeSpan - p19
				local v23 = v_u_1.particleList[v20]
				v23.elapsedTime = v23.elapsedTime + p19
			else
				v21.baseObject:Destroy()
				v_u_1.particleList[v20] = nil
			end
		end
	end
end
game:GetService("RunService").Heartbeat:Connect(v_u_1.updateParticle)
return v_u_1