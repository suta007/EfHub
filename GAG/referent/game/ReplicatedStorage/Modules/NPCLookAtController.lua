game:GetService("CollectionService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.Observers)
local v_u_5 = v3.LocalPlayer
local v_u_6 = {}
local v_u_39 = {
	["UpdateTranslation"] = function(_, p7)
		-- upvalues: (copy) v_u_6
		local v8 = p7 * -15
		local v9 = math.exp(v8)
		for v10, v11 in next, v_u_6 do
			local v12
			if v11.TargetPart then
				v12 = v11.TargetPart:GetPivot()
			else
				v12 = nil
			end
			if v12 and v10:GetPivot():ToObjectSpace(v12).Z < 0 then
				local v13 = v11.Head.CFrame.Position - v12.Position
				local v14 = v11.Neck.C0
				local v15 = v11.InitialNeckC0
				local v16 = CFrame.Angles
				local v17 = v13.Y / vector.magnitude(v13)
				local v18 = math.atan(v17) * 0.5
				local v19 = vector.normalize(v13)
				local v20 = v11.Torso.CFrame.LookVector
				local v21 = v15 * v16(v18, 0, vector.cross(v19, v20).y * 0.8)
				v11.Neck.C0 = v21:Lerp(v14, v9)
			else
				local v22 = v11.Neck.C0
				local v23 = v11.InitialNeckC0
				v11.Neck.C0 = v23:Lerp(v22, v9)
			end
		end
	end,
	["Update"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_6
		local v24 = v_u_5.Character
		local v25
		if v24 then
			v25 = v24:FindFirstChild("Head")
		else
			v25 = nil
		end
		local v26
		if v25 then
			v26 = v25:GetPivot()
		else
			v26 = nil
		end
		for v27, v28 in next, v_u_6 do
			if v28.Neck then
				local v29 = false
				if v26 then
					local v30 = v26.Position - v27:GetPivot().Position
					v29 = vector.magnitude(v30) <= 30 and true or v29
				end
				if v29 then
					v28.TargetPart = v25
				else
					v28.TargetPart = nil
				end
			end
		end
	end,
	["AddNPC"] = function(_, p31)
		-- upvalues: (copy) v_u_6
		local v32 = p31:WaitForChild("Torso")
		if v32 then
			local v33 = p31:WaitForChild("Head")
			if v33 then
				local v34 = v32:WaitForChild("Neck")
				if v34 then
					v_u_6[p31] = {
						["Torso"] = v32,
						["Head"] = v33,
						["Neck"] = v34,
						["InitialNeckC0"] = v34.C0
					}
				else
					warn((("Failed to find Neck for npc \"%*\""):format((p31:GetFullName()))))
				end
			else
				warn((("Failed to find Head for npc \"%*\""):format((p31:GetFullName()))))
				return
			end
		else
			warn((("Failed to find Torso for npc \"%*\""):format((p31:GetFullName()))))
			return
		end
	end,
	["RemoveNPC"] = function(_, p35)
		-- upvalues: (copy) v_u_6
		v_u_6[p35] = nil
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_39, (copy) v_u_2
		v_u_4.observeTag("NPCLookAt", function(p_u_36)
			-- upvalues: (ref) v_u_39
			v_u_39:AddNPC(p_u_36)
			return function()
				-- upvalues: (ref) v_u_39, (copy) p_u_36
				v_u_39:RemoveNPC(p_u_36)
			end
		end, { workspace })
		local v_u_37 = 0
		v_u_2.PostSimulation:Connect(function(p38)
			-- upvalues: (ref) v_u_39, (ref) v_u_37
			v_u_39:UpdateTranslation(p38)
			v_u_37 = v_u_37 + p38
			if v_u_37 >= 0.05 then
				v_u_37 = 0
				v_u_39:Update()
			end
		end)
	end
}
task.spawn(v_u_39.Start, v_u_39)
return v_u_39