local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players")
local v_u_5 = os.clock
local v_u_6 = {
	"Accessory",
	"Shirt",
	"Pants",
	"BodyColors",
	"Humanoid"
}
local v_u_7 = {
	["InvalidInstance"] = "Incorrect type of instance given (%s). Can only track BaseParts, Models or Characters",
	["RootNotFound"] = "WorldModel \'Root\' not found under viewportframe: %s",
	["NotDescendantOfWorkspace"] = "Object: %s is not a descendant of workspace."
}
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new(p9)
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	if p9 and p9.Object then
		local v10 = v_u_8
		local v_u_11 = setmetatable(p9, v10)
		v_u_11.RenderPriority = v_u_11.RenderPriority or Enum.RenderPriority.Camera.Value + 1
		v_u_11.RenderedProperties = v_u_11.RenderedProperties or { "CFrame" }
		local v12 = v_u_11.RenderPriority
		if typeof(v12) == "EnumItem" then
			v_u_11.RenderPriority = v_u_11.RenderPriority.Value
		end
		v_u_11.Object.Destroying:Once(function()
			-- upvalues: (copy) v_u_11
			v_u_11:Destroy()
		end)
		return v_u_11
	end
	error(v_u_7.InvalidInstance:format(p9 and p9.Object or "nil"))
end
function v_u_8.Update(p13, p14, p_u_15)
	-- upvalues: (copy) v_u_7
	if p13._renderframe and p13._renderframe:FindFirstChild("Root") then
		for v16 = 1, #p13.RenderedProperties do
			local v_u_17 = p13.RenderedProperties[v16]
			if pcall(function()
				-- upvalues: (copy) p_u_15, (copy) v_u_17
				return p_u_15[v_u_17] ~= nil
			end) then
				p14[v_u_17] = p_u_15[v_u_17]
			end
		end
	else
		local v18 = error
		local v19 = v_u_7.RootNotFound
		local v20 = p13._renderframe
		v18(v19:format((tostring(v20))))
	end
end
function v_u_8.Start(p_u_21, p_u_22)
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_2, (copy) v_u_6
	if p_u_21._active then
		return
	elseif p_u_21.Object:IsDescendantOf(workspace) then
		local v23 = v_u_4.LocalPlayer
		local v24 = p_u_21.Parent
		p_u_21._active = true
		p_u_21._connection_id = v_u_2:GenerateGUID(false)
		if not p_u_21.Parent then
			v24 = v23.PlayerGui:FindFirstChild("ViewportManagerScreenGUI") or Instance.new("ScreenGui")
			v24.Name = "ViewportManagerScreenGUI"
			v24.IgnoreGuiInset = true
			v24.Parent = v23.PlayerGui
			v24.Destroying:Once(function()
				-- upvalues: (copy) p_u_21
				p_u_21:Destroy()
			end)
		end
		p_u_21._renderframe = Instance.new("ViewportFrame")
		p_u_21._renderframe.Size = UDim2.fromScale(1, 1)
		p_u_21._renderframe.BackgroundTransparency = 1
		p_u_21._renderframe.LightDirection = Vector3.new(1, -1, -1)
		p_u_21._renderframe.Ambient = Color3.fromRGB(138, 138, 138)
		p_u_21._renderframe.LightColor = Color3.new(1, 1, 1)
		p_u_21._renderframe.CurrentCamera = workspace.CurrentCamera
		p_u_21._renderframe.Name = ("VFM%*"):format(p_u_21._connection_id)
		p_u_21._renderframe.Parent = v24
		p_u_21._renderframe.ZIndex = p_u_21.ZIndex or p_u_21._renderframe.ZIndex
		if p_u_21._renderframe:FindFirstChildOfClass("WorldModel") then
			p_u_21._renderframe:FindFirstChildOfClass("WorldModel").Name = "Root"
		else
			local v25 = Instance.new("WorldModel")
			v25.Parent = p_u_21._renderframe
			v25.Name = "Root"
		end
		p_u_21._connections = {}
		p_u_21._viewportobject = Instance.new("Model")
		p_u_21._viewportobject.Parent = p_u_21._renderframe.Root
		p_u_21._viewportobject.Name = ""
		if p_u_21.Object:IsA("Model") then
			local v26 = p_u_21.Object:FindFirstChild("Humanoid")
			local v27 = p_u_21.Object:GetChildren()
			local function v_u_35(p28, p29)
				-- upvalues: (copy) p_u_21, (ref) v_u_35, (copy) p_u_22
				for _, v30 in p28 do
					if p_u_21.GetModelDescendants and v30:IsA("Model") then
						local v31 = Instance.new("Model")
						local v32 = v30.Name
						local v33 = p_u_21._viewportobject
						v31.Name = v32
						v31.Parent = v33
						v_u_35(v30:GetChildren(), v31)
					end
					if v30:IsA("BasePart") then
						local v34 = v30:Clone()
						v34.CFrame = v30.CFrame
						v34.Anchored = true
						v34.Parent = p29 or p_u_21._viewportobject
						p_u_21:AddConnection(v34, v30, p_u_22)
					end
				end
			end
			v_u_35(v27)
			if v26 then
				v26.Died:Once(function()
					-- upvalues: (copy) p_u_21
					p_u_21:Destroy()
				end)
				for _, v36 in v27 do
					if table.find(v_u_6, v36.ClassName) then
						local v37 = v36:Clone()
						v37.Parent = p_u_21._viewportobject
						if v36:IsA("Accessory") and v36:FindFirstChild("Handle") then
							local v38 = v36.Handle
							p_u_21:AddConnection(v37.Handle, v38, p_u_22)
						end
					end
				end
			end
		elseif p_u_21.Object:IsA("BasePart") then
			local v39 = p_u_21.Object:Clone()
			v39.CFrame = p_u_21.Object.CFrame
			v39.Anchored = true
			v39.Parent = p_u_21._viewportobject
			p_u_21:AddConnection(v39, p_u_21.Object, p_u_22)
		end
	else
		local v40 = error
		local v41 = v_u_7.NotDescendantOfWorkspace
		local v42 = p_u_21.Object
		v40(v41:format((tostring(v42))))
		return
	end
end
function v_u_8.AddConnection(p_u_43, p_u_44, p_u_45, p46)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_1
	if p46 then
		p_u_43:Update(p_u_44, p_u_45)
	else
		local v_u_47 = v_u_5()
		local v_u_48 = ("%*%*"):format(v_u_2:GenerateGUID(false):sub(1, 7), p_u_43._connection_id)
		v_u_1:BindToRenderStep(v_u_48, p_u_43.RenderPriority, function(_)
			-- upvalues: (copy) p_u_44, (copy) p_u_45, (copy) p_u_43, (copy) v_u_48, (ref) v_u_1, (ref) v_u_5, (ref) v_u_47
			if p_u_44 and p_u_45 then
				if not p_u_43.Framerate or v_u_5() - v_u_47 >= 1 / p_u_43.Framerate then
					v_u_47 = v_u_5()
					p_u_43:Update(p_u_44, p_u_45)
				end
			else
				local v49 = table.find(p_u_43._connections, v_u_48)
				if v49 then
					v_u_1:UnbindFromRenderStep(v_u_48)
					table.remove(p_u_43._connections, v49)
				end
				return
			end
		end)
		local v50 = p_u_43._connections
		table.insert(v50, v_u_48)
	end
end
function v_u_8.PlayOnce(p51, p52)
	if p52 then
		p51:Start(true)
		task.spawn(p51.PlayFade, p51, p52)
	end
end
function v_u_8.PlayFade(p53, p54)
	-- upvalues: (copy) v_u_3
	if p54 and p53._renderframe then
		if p54.StopTracking then
			p53:Stop()
		end
		local v55 = p54.Time or 0.5
		local v56 = p54.Ease or "Linear"
		local v57 = p53._renderframe
		if p54.StopTracking then
			p53._renderframe = nil
		end
		local v58 = Enum.EasingStyle[v56]
		local v59 = v_u_3:Create(v57, TweenInfo.new(v55, v58), {
			["ImageTransparency"] = 1
		})
		v59:Play()
		v59.Completed:Wait()
		v59:Destroy()
		v57:Destroy()
	end
end
function v_u_8.Destroy(p60, p61)
	if p60._active then
		p60:PlayFade(p61)
		p60:Stop()
		if p60._renderframe then
			p60._renderframe:Destroy()
		end
		for v62 in p60 do
			p60[v62] = nil
		end
	end
end
function v_u_8.Stop(p63)
	-- upvalues: (copy) v_u_1
	p63._active = false
	if p63._connections then
		for _, v64 in p63._connections do
			v_u_1:UnbindFromRenderStep(v64)
		end
		p63._connections = nil
	end
end
return v_u_1:IsServer() and {} or v_u_8