game:GetService("TweenService")
local v1 = game:GetService("RunService")
game:GetService("Lighting")
local v2 = game:GetService("Players")
game:GetService("ReplicatedStorage")
local v_u_3 = require(script.CrackManager)
local v4 = require(script.BufferManager)
local v_u_5 = require(script.ParallelWorker.ParallelTasks)
local v_u_6 = workspace:WaitForChild("WeatherVisuals")
local v_u_7 = workspace.CurrentCamera
local v_u_8 = v2.LocalPlayer.PlayerGui
local v_u_9 = {}
v_u_9.__index = v_u_9
local v_u_11 = v4.new(function()
	local v10 = Instance.new("ViewportFrame")
	v10.AnchorPoint = Vector2.new(0.5, 0.5)
	v10.Size = UDim2.new(1, 0, 1, 0)
	v10.BackgroundTransparency = 1
	return v10
end)
local v_u_13 = v4.new(function()
	local v12 = Instance.new("SurfaceGui")
	v12.ResetOnSpawn = false
	v12.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
	v12.ClipsDescendants = true
	return v12
end)
local v_u_14 = v4.new(function()
	return Instance.new("Camera")
end)
local v_u_15 = v4.new(function()
	return Instance.new("Part")
end)
local function v_u_17(p16)
	if p16:IsA("Part") then
		p16.Size = Vector3.new(1, 1, 1)
		p16.CFrame = CFrame.new()
		p16.Transparency = 0
		p16.Anchored = false
		p16.CanCollide = true
		p16.CanTouch = true
		p16.CanQuery = true
		p16.Color = Color3.new(1, 1, 1)
		p16.Material = Enum.Material.Plastic
		p16.CastShadow = true
		p16.Name = "Part"
		return
	elseif p16:IsA("SurfaceGui") then
		p16.Adornee = nil
		p16.ResetOnSpawn = true
		p16.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
		p16.PixelsPerStud = 50
		p16.ClipsDescendants = false
		p16.Face = Enum.NormalId.Front
		p16.ZIndexBehavior = Enum.ZIndexBehavior.Global
		p16.Enabled = true
		p16.Brightness = 1
		p16.LightInfluence = 1
		p16.AlwaysOnTop = false
		p16.ToolPunchThroughDistance = 0
		p16.Name = "SurfaceGui"
		p16.Parent = nil
	elseif p16:IsA("ViewportFrame") then
		p16.CurrentCamera = nil
		p16.AnchorPoint = Vector2.new(0, 0)
		p16.Size = UDim2.new(0, 100, 0, 100)
		p16.Position = UDim2.new(0, 0, 0, 0)
		p16.LightDirection = Vector3.new(-1, -1, -1)
		p16.BackgroundTransparency = 0
		p16.BorderSizePixel = 1
		p16.Ambient = Color3.new(1, 1, 1)
		p16.Name = "ViewportFrame"
	end
end
function v_u_9.new(p18, p19, p20)
	-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_17, (copy) v_u_11, (copy) v_u_15, (copy) v_u_14, (copy) v_u_3
	local v21 = v_u_9
	local v22 = setmetatable({}, v21)
	local v23 = v_u_13:get()
	v_u_17(v23)
	local v24 = v_u_11:get()
	v_u_17(v24)
	local v25 = v_u_15:get()
	v_u_17(v25)
	local v26 = v_u_14:get()
	v22.SurfaceGui = v23
	v22.Viewport = v24
	v22.Part = v25
	v22.vCam = v26
	v22.Model = p18
	v22:_setInstanceProps()
	v22:setCFrame(p19 or CFrame.new())
	v22:setSize(p20 or Vector3.new(45, 0.15, 45))
	v22:_updateSurfaceInfo()
	v_u_3:add(v22)
	return v22
end
function v_u_9._setInstanceProps(p27)
	-- upvalues: (copy) v_u_8, (copy) v_u_6
	local v28 = p27.SurfaceGui
	local v29 = p27.Viewport
	local v30 = p27.Part
	local v31 = p27.vCam
	local v32 = p27.Model
	v28.Parent = v_u_8
	v28.Name = "GroundCrackSurfaceGui"
	v28.ResetOnSpawn = false
	v28.Adornee = v30
	v28.Face = Enum.NormalId.Top
	v28.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	v28.MaxDistance = 1000
	v28.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
	v28.PixelsPerStud = 1000
	v28.ClipsDescendants = true
	v29.Parent = v28
	v29.CurrentCamera = v31
	v29.AnchorPoint = Vector2.new(0.5, 0.5)
	v29.Position = UDim2.new(0.5, 0, 0.5, 0)
	v29.Size = UDim2.new(1, 0, 1, 0)
	v29.BackgroundTransparency = 1
	v31.Parent = v29
	v30.Parent = v_u_6
	v30.Transparency = 1
	v30.Anchored = true
	v30.CanCollide = false
	v30.CanTouch = false
	v30.CanQuery = false
	v30.Name = "Crackpart"
	v32.Parent = v29
end
function v_u_9.setCFrame(p33, p34)
	p33.CFrame = p34
	p33.Part.CFrame = p33.CFrame
	p33.Model:PivotTo(p33.Part.CFrame * CFrame.new(0, -p33.Model.PrimaryPart.Size.Y / 2, 0))
	p33:_updateSurfaceInfo()
end
function v_u_9.getCFrame(p35)
	return p35.CFrame
end
function v_u_9.setSize(p36, p37)
	p36.Size = p37
	p36.Part.Size = p36.Size
	p36:_updateSurfaceInfo()
end
function v_u_9.getSize(p38)
	return p38.Size
end
function v_u_9._updateSurfaceInfo(p39)
	-- upvalues: (copy) v_u_5
	local v40 = p39.Part
	local v41 = v40.CFrame
	local v42 = v40.Size
	local v43, v44 = v_u_5.CalculateSurfaceInfo(v41, v42)
	p39.SurfaceInfo = {
		["cf"] = v43,
		["size"] = v44
	}
end
function v_u_9.updateCamera(p45)
	-- upvalues: (copy) v_u_7, (copy) v_u_5
	local v46 = v_u_7.CFrame
	local v47 = p45.SurfaceInfo.cf
	local v48 = p45.SurfaceInfo.size
	local v49 = v_u_7.ViewportSize.y
	if v47 and v48 then
		local v50, v51, v52, v53, v54 = v_u_5.CalculateCameraProperties(v46, v47, v48, v49)
		local v55 = p45.Viewport
		v55.Position = UDim2.new(v55.AnchorPoint.x - v50, 0, v55.AnchorPoint.y - v51, 0)
		v55.Size = UDim2.new(v52, 0, v52, 0)
		v55.BackgroundColor3 = p45.SurfaceGui.Adornee.Color
		p45.SurfaceGui.CanvasSize = Vector2.new(v49 * (v48.x / v48.y), v49)
		p45.vCam.FieldOfView = v54
		p45.vCam.CFrame = CFrame.new(v46.p) * (v47 - v47.p) * CFrame.Angles(0, 3.141592653589793, 0) * v53
	end
end
function v_u_9.Destroy(p56)
	-- upvalues: (copy) v_u_3, (copy) v_u_14, (copy) v_u_11, (copy) v_u_13, (copy) v_u_15
	v_u_3:remove(p56)
	v_u_14:release(p56.vCam)
	v_u_11:release(p56.Viewport)
	v_u_13:release(p56.SurfaceGui)
	v_u_15:release(p56.Part)
	p56.Model:Destroy()
end
v1.PreAnimation:Connect(function(_)
	-- upvalues: (copy) v_u_3
	v_u_3:updateAllCameras()
end)
setmetatable(v_u_9, {
	["__index"] = function(p57, p58)
		if rawget(p57, p58) then
			return rawget(p57, p58)
		end
		error(string.format("\'%s\' is not a valid member of \'Crack\'", p58), 2)
	end
})
return v_u_9