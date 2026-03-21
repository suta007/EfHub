local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v_u_3 = game:GetService("CollectionService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("TweenService")
local v6 = v4.LocalPlayer
local v_u_7 = v6.Character or v6.CharacterAdded:Wait()
local v_u_8 = v_u_7:WaitForChild("Humanoid")
v6.CharacterAdded:Connect(function(p9)
	-- upvalues: (ref) v_u_7, (ref) v_u_8
	v_u_7 = p9
	v_u_8 = v_u_7:WaitForChild("Humanoid")
end)
local v_u_10 = require(v1.Modules.GetMouseToWorld)
local v11 = require(v1.Data.CosmeticRegistry)
local v_u_12 = require(v1.Modules.RoundToNearestNumberVector3)
local v_u_13 = require(v1.Modules.CosmeticServices.CosmeticPhyiscalityService)
require(v1.Modules.PlaySound)
local v_u_14 = v11.InputConfig.MOVEMENT_CONFIG
local v_u_15 = {
	["LastCFrame"] = nil,
	["CollisionPartsCache"] = {},
	["ArchivedY"] = 0,
	["RotationLock"] = false,
	["Target"] = nil
}
local v_u_16 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_16
	v_u_16 = workspace.CurrentCamera
end)
local function v_u_19(p17)
	-- upvalues: (copy) v_u_15
	v_u_15.CollisionPartsCache = {}
	for _, v18 in p17:GetDescendants() do
		if v18:IsA("BasePart") then
			v_u_15.CollisionPartsCache[v18] = v18.CanCollide
			v18.CanCollide = false
		end
	end
end
local v_u_20 = Instance.new("Sound")
v_u_20.SoundId = "rbxassetid://100741940041305"
v_u_20.Volume = 0.5
v_u_20.Looped = true
v_u_20.Parent = v1
function v_u_15.SetTarget(_, p21)
	-- upvalues: (copy) v_u_15, (copy) v_u_20, (copy) v_u_19
	v_u_15.Target = p21
	v_u_20[p21 and "Play" or "Stop"](v_u_20)
	for v22, v23 in v_u_15.CollisionPartsCache do
		v22.CanCollide = v23
	end
	table.clear(v_u_15.CollisionPartsCache)
	if p21 then
		v_u_19(p21)
	end
end
function v_u_15.ToggleRotationLock(_, p24)
	-- upvalues: (copy) v_u_15
	v_u_15.RotationLock = p24
end
local v_u_25 = nil
v2.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_15, (copy) v_u_3, (ref) v_u_7, (copy) v_u_10, (copy) v_u_14, (copy) v_u_12, (ref) v_u_16, (ref) v_u_25, (copy) v_u_5, (copy) v_u_20, (ref) v_u_8, (copy) v_u_13
	local v26 = v_u_15.Target
	if v26 then
		local v27 = RaycastParams.new()
		v27.FilterDescendantsInstances = v_u_3:GetTagged("CosmeticHitBox")
		v27:AddToFilter(v26)
		v27:AddToFilter(workspace.PetsPhysical)
		v27:AddToFilter(v_u_7)
		v27.FilterType = Enum.RaycastFilterType.Exclude
		local v28 = v_u_10(v27, v_u_14.MAX_RAY_DISTANCE)
		if v28 and v28.Instance then
			local v29 = v28.Position
			local v30 = v28.Normal
			v26:GetExtentsSize()
			local v31 = v29 + v30 * 0
			local v32 = v_u_12(v31, v_u_14.MOVEMENT_ROUNDING)
			local v33 = v32.X
			local v34 = v32.Y
			local v35 = v32.Z
			local v36 = v30.X
			local v37 = math.abs(v36)
			local v38 = v30.Y
			local v39 = math.abs(v38)
			local v40 = v30.Z
			local v41 = math.abs(v40)
			local v42 = math.max(v37, v39, v41)
			local v43 = v42 - v39
			if math.abs(v43) < v_u_14.NEAR_ZERO_EPSILON then
				v34 = v31.Y
			else
				local v44 = v42 - v37
				if math.abs(v44) < v_u_14.NEAR_ZERO_EPSILON then
					v33 = v31.X
				else
					v35 = v31.Z
				end
			end
			local v45 = Vector3.new(v33, v34, v35)
			local v46 = v30:Cross(Vector3.new(0, 0, 1))
			local v47
			if v46.Magnitude < v_u_14.NEAR_ZERO_EPSILON then
				v47 = v30:Cross(Vector3.new(1, 0, 0)).Unit
			else
				v47 = v46.Unit
			end
			local v48 = v47:Cross(v30).Unit
			local v49 = v_u_16.CFrame.LookVector
			local v50 = v49.X
			local v51 = v49.Z
			local v52 = Vector3.new(v50, 0, v51)
			local v53 = v52.Magnitude < v_u_14.NEAR_ZERO_EPSILON and Vector3.new(-0, -0, -1) or v52.Unit
			local v54 = v53 - v53:Dot(v30) * v30
			local v55
			if v54.Magnitude < v_u_14.NEAR_ZERO_EPSILON then
				v55 = v48
			else
				v55 = v54.Unit
			end
			local v56 = -2
			for _, v57 in {
				v48,
				-v48,
				v47,
				-v47
			} do
				local v58 = v55:Dot(v57)
				if v58 >= v56 then
					v48 = v57
					v56 = v58
				end
			end
			local v59 = v45 + v48
			local v60
			if v_u_15.RotationLock then
				local v61 = v26:GetPivot().Rotation
				v60 = CFrame.new(v45) * v61
			else
				v60 = CFrame.lookAt(v45, v59, v30)
			end
			local v62 = v26.Parent
			if v_u_15.LastCFrame == v60 then
				if not v_u_25 then
					v_u_25 = task.delay(0.25, function()
						-- upvalues: (ref) v_u_5, (ref) v_u_20
						local v63 = v_u_5:Create(v_u_20, TweenInfo.new(0.2), {
							["Volume"] = 0
						})
						v63.Completed:Once(function()
							-- upvalues: (ref) v_u_20
							v_u_20.Playing = false
						end)
						v63:Play()
					end)
				end
			else
				if v_u_25 then
					task.cancel(v_u_25)
					v_u_25 = nil
					v_u_5:Create(v_u_20, TweenInfo.new(0), {
						["Volume"] = 0.5
					}):Play()
				end
				v_u_8.Sit = false
				v_u_20.Playing = true
				v_u_15.LastCFrame = v60
				local _ = v_u_15.RotationLock
				v_u_13:UpdateCFrame(v62:GetAttribute("CosmeticUUID"), v60)
			end
		else
			return
		end
	else
		return
	end
end)
return v_u_15