local v_u_1 = {
	["RidingPet"] = nil,
	["LastWeld"] = nil
}
game:GetService("RunService")
game:GetService("ServerScriptService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("Players")
local v4 = game:GetService("UserInputService")
local v_u_5 = v3.LocalPlayer
local v_u_6 = v_u_5.Character
local v_u_7 = nil
local v8 = v_u_5.Character
if v8 then
	v_u_6 = v8
	v_u_7 = v8:WaitForChild("Humanoid")
end
v_u_5.CharacterAdded:Connect(function(p9)
	-- upvalues: (ref) v_u_6, (ref) v_u_7
	if p9 then
		v_u_6 = p9
		v_u_7 = p9:WaitForChild("Humanoid")
	end
end)
local v_u_10 = require(v2.Modules.PetServices.ActivePetsService)
function v_u_1.RidePet(_, p11)
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_1, (ref) v_u_7, (ref) v_u_6
	local v12 = v_u_10:GetClientPetStateUUID(v_u_5.Name, p11)
	if v12 then
		local v13 = v12.Model
		if v13 then
			v_u_1.RidingPet = p11
			v_u_7.Sit = true
			local v14 = v_u_6:WaitForChild("HumanoidRootPart")
			local v15 = v13.PrimaryPart
			local v16 = Instance.new("ManualWeld")
			v16.Part0 = v14
			v16.Part1 = v15
			v16.Name = "Weld"
			v16.Parent = v15
			v16.C0 = v16.C0 * CFrame.new(0, -v13:GetExtentsSize().Y / 2, 0)
			v_u_1.LastWeld = v16
		else
			v_u_1:Unride()
		end
	else
		return
	end
end
function v_u_1.Unride(_)
	-- upvalues: (copy) v_u_1, (ref) v_u_7
	local v17 = v_u_1.LastWeld
	v_u_1.RidingPet = nil
	v_u_7.Jump = true
	if v17 then
		v17:Destroy()
	end
	v_u_1.LastWeld = nil
end
v4.JumpRequest:Connect(function()
	-- upvalues: (copy) v_u_1
	v_u_1:Unride()
end)
return v_u_1