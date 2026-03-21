local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
game:GetService("TweenService")
local v_u_3 = require(v1.Data.PetRegistry).PetList
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6)
	-- upvalues: (copy) v_u_4
	local v7 = v_u_4
	local v8 = setmetatable({}, v7)
	local v9 = p6 or {}
	v8.NestPosition = p5
	v8.PetTypes = v9.PetTypes
	v8.BirdCount = #v9.PetTypes or 1
	v8.FlyRadius = v9.FlyRadius or 15
	v8.FlyHeightMin = v9.FlyHeightMin or 8
	v8.FlyHeightMax = v9.FlyHeightMax or 15
	v8.FlySpeed = v9.FlySpeed or 2
	v8.EatDuration = v9.EatDuration or 3
	v8.DescentSpeed = v9.DescentSpeed or 2
	v8.AscentSpeed = v9.AscentSpeed or 4
	v8.Birds = {}
	v8.FoodItems = {}
	v8.Running = false
	v8.Connection = nil
	return v8
end
function v_u_4.Start(p_u_10)
	-- upvalues: (copy) v_u_2
	if not p_u_10.Running then
		p_u_10.Running = true
		for v11 = 1, p_u_10.BirdCount do
			p_u_10:SpawnBird(v11)
		end
		p_u_10.Connection = v_u_2.Heartbeat:Connect(function(p12)
			-- upvalues: (copy) p_u_10
			p_u_10:Update(p12)
		end)
	end
end
function v_u_4.Stop(p13)
	if p13.Running then
		p13.Running = false
		if p13.Connection then
			p13.Connection:Disconnect()
			p13.Connection = nil
		end
		for _, v14 in p13.Birds do
			if v14.Model then
				v14.Model:Destroy()
			end
		end
		table.clear(p13.Birds)
	end
end
function v_u_4.SpawnBird(p15, p16)
	-- upvalues: (copy) v_u_3
	local v17 = p15.PetTypes[p16]
	local v18 = v_u_3[v17]
	local v19 = script.PetModels:FindFirstChild(v17)
	if v18 and v19 then
		local v20 = v19:Clone()
		v20.Name = "DecorativeBird_" .. p16
		if v20.PrimaryPart then
			v20.PrimaryPart.Anchored = true
			v20.PrimaryPart.CanCollide = false
		end
		local v21 = {
			["Model"] = v20,
			["State"] = "Flying",
			["Angle"] = p16 / p15.BirdCount * 3.141592653589793 * 2,
			["Height"] = math.random(p15.FlyHeightMin, p15.FlyHeightMax),
			["Speed"] = p15.FlySpeed + (math.random() - 0.5) * 0.5,
			["TargetFoodData"] = nil
		}
		local v22 = p15:GetFlyPosition(v21.Angle, v21.Height)
		v20:PivotTo(CFrame.new(v22))
		v20.Parent = workspace
		local v23 = v20:FindFirstChild("AnimationController")
		if v23 then
			v23 = v23:FindFirstChild("Animator")
		end
		if v23 and v18.Animations then
			v21.Animations = {}
			for v24, v25 in v18.Animations do
				local v26 = v23:LoadAnimation(v25)
				v26.Looped = true
				v21.Animations[v24] = v26
			end
			if v21.Animations.Walk then
				v21.Animations.Walk:Play()
			elseif v21.Animations.Idle then
				v21.Animations.Idle:Play()
			end
		end
		local v27 = p15.Birds
		table.insert(v27, v21)
	else
		warn("Invalid pet type:", v17)
	end
end
function v_u_4.GetFlyPosition(p28, p29, p30)
	local v31 = p28.NestPosition.X + math.cos(p29) * p28.FlyRadius
	local v32 = p28.NestPosition.Z + math.sin(p29) * p28.FlyRadius
	local v33 = p28.NestPosition.Y + p30
	return Vector3.new(v31, v33, v32)
end
function v_u_4.Update(p34, p35)
	for _, v36 in p34.Birds do
		if v36.State == "Flying" then
			p34:UpdateFlying(v36, p35)
		elseif v36.State == "Descending" then
			p34:UpdateDescending(v36, p35)
		elseif v36.State == "Eating" then
			p34:UpdateEating(v36, p35)
		elseif v36.State == "Ascending" then
			p34:UpdateAscending(v36, p35)
		end
	end
	p34:AssignBirdsToFood()
end
function v_u_4.GetUntargetedFood(p37)
	for _, v38 in p37.FoodItems do
		local v39 = false
		for _, v40 in p37.Birds do
			if v40.TargetFoodData and v40.TargetFoodData.Food == v38 then
				v39 = true
				break
			end
		end
		if not v39 then
			return v38
		end
	end
	return nil
end
function v_u_4.AssignBirdsToFood(p41)
	for _, v42 in p41.Birds do
		if v42.State == "Flying" or v42.State == "Ascending" then
			local v43 = p41:GetUntargetedFood()
			if v43 then
				v42.State = "Descending"
				v42.TargetFoodData = {
					["Food"] = v43,
					["Callback"] = nil
				}
			end
		end
	end
end
function v_u_4.UpdateFlying(p44, p45, p46)
	p45.Angle = p45.Angle + p45.Speed * p46
	local v47 = p45.Angle * 2
	local v48 = math.sin(v47) * 0.5
	local v49 = p44:GetFlyPosition(p45.Angle, p45.Height + v48)
	local v50 = p45.Model:GetPivot()
	local v51 = v50.Position:Lerp(v49, p46 * 5)
	local v52 = p44:GetFlyPosition(p45.Angle + 0.1, p45.Height)
	local v53 = v50:Lerp(CFrame.lookAt(v51, v52), p46 * 5)
	p45.Model:PivotTo(CFrame.new(v51) * (v53 - v53.Position))
end
function v_u_4.UpdateDescending(p54, p55, p56)
	if p55.TargetFoodData or p55.TargetFoodData.Food then
		local v57 = p55.Model:GetPivot()
		local v58 = v57.Position
		local v59 = p55.TargetFoodData.Food.Position + Vector3.new(0, 0, 0)
		local v60 = v58:Lerp(v59, p54.DescentSpeed * p56)
		local v61 = v57:Lerp(CFrame.lookAt(v60, v59), p56 * 8)
		p55.Model:PivotTo(CFrame.new(v60) * (v61 - v61.Position))
		if (v60 - v59).Magnitude < 0.5 then
			p55.State = "Eating"
			p55.EatStartTime = os.clock()
			if p55.Animations and p55.Animations.Idle then
				if p55.Animations.Walk then
					p55.Animations.Walk:Stop()
				end
				p55.Animations.Idle:Play()
			end
		end
	else
		p55.State = "Flying"
	end
end
function v_u_4.UpdateEating(p62, p63, _)
	if os.clock() - p63.EatStartTime >= p62.EatDuration then
		p63.State = "Ascending"
		if p63.TargetFoodData and p63.TargetFoodData.Food then
			local v64 = table.find(p62.FoodItems, p63.TargetFoodData.Food)
			if v64 then
				table.remove(p62.FoodItems, v64)
			end
			if p63.TargetFoodData.Food.Parent then
				p63.TargetFoodData.Food.Parent:Destroy()
			end
			if p63.TargetFoodData.Callback then
				task.spawn(p63.TargetFoodData.Callback)
			end
		end
		p63.TargetFoodData = nil
		if p63.Animations and p63.Animations.Walk then
			if p63.Animations.Idle then
				p63.Animations.Idle:Stop()
			end
			p63.Animations.Walk:Play()
		end
	end
end
function v_u_4.UpdateAscending(p65, p66, p67)
	local v68 = p66.Model:GetPivot()
	local v69 = v68.Position
	local v70 = p65:GetFlyPosition(p66.Angle, p66.Height)
	local v71 = v69:Lerp(v70, p65.AscentSpeed * p67)
	local v72 = p65:GetFlyPosition(p66.Angle + 0.1, p66.Height)
	local v73 = v68:Lerp(CFrame.lookAt(v71, v72), p67 * 5)
	p66.Model:PivotTo(CFrame.new(v71) * (v73 - v73.Position))
	if (v71 - v70).Magnitude < 1 then
		p66.State = "Flying"
	end
end
function v_u_4.AddFood(p74, p75, p76)
	local v77 = p74.FoodItems
	table.insert(v77, p75)
	local v78 = {}
	for _, v79 in p74.Birds do
		if v79.State == "Flying" then
			table.insert(v78, v79)
		end
	end
	if #v78 > 0 then
		local v80 = v78[math.random(1, #v78)]
		v80.State = "Descending"
		v80.TargetFoodData = {
			["Food"] = p75,
			["Callback"] = p76
		}
	end
end
function v_u_4.RemoveFood(p81, p82)
	local v83 = table.find(p81.FoodItems, p82)
	if v83 then
		table.remove(p81.FoodItems, v83)
	end
	for _, v84 in p81.Birds do
		if v84.TargetFoodData and v84.TargetFoodData.Food == p82 then
			v84.State = "Ascending"
			v84.TargetFoodData = nil
		end
	end
end
return v_u_4