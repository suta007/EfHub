local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = {}
local v_u_3 = require(v1.Modules.GetFarm)
local v_u_4 = require(v1.Code.Manhattan2D)
local v_u_5 = require(v1.Modules.GetCornersOfPart)
function v_u_2.IsWithinFarm(_, p6, p7)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v8 = v_u_3(p6)
	if v8 then
		return v_u_4(p7.Position, v8.PetArea)
	end
end
function v_u_2.IsModelInFarm(_, p9, p10, p11)
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	local v12 = p11.PrimaryPart
	if v12 then
		local v13 = v12:Clone()
		v13.CFrame = p10 * CFrame.new(0, v13.Size.Y / 2, 0)
		local v14 = v_u_5(v13)
		v13:Destroy()
		for _, v15 in v14 do
			if not v_u_2:IsWithinFarm(p9, v15) then
				return false
			end
		end
		return true
	end
end
function v_u_2.GetDeterministicIndexFromUUID(_, p16, p17)
	local v18 = 0
	for v19 = 1, #p16 do
		v18 = (v18 + string.byte(p16, v19) * v19) % 2147483648
	end
	return v18 % p17 + 1
end
return v_u_2