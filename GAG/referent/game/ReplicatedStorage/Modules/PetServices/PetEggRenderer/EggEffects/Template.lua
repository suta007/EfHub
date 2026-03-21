local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(game.ReplicatedStorage.Modules.TweenModel)
require(game.ReplicatedStorage.Modules.SkinService)
require(v1.Modules.SelectiveAssetReplication)
local v_u_3 = require(v1.Modules.SoundPlayer)
local v_u_4 = require(v1.Data.SoundData)
local _ = require(game.ReplicatedStorage.Data.PetRegistry).PetList
local v5 = game.ReplicatedStorage:WaitForChild("Assets")
v5:WaitForChild("Models"):WaitForChild("EggModels")
local v_u_6 = v5.VFX
return function(p_u_7)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2, (copy) v_u_6
	task.spawn(function()
		-- upvalues: (copy) p_u_7, (ref) v_u_3, (ref) v_u_4, (ref) v_u_2, (ref) v_u_6
		local v8 = p_u_7:GetPivot() * CFrame.new(0, 3, 0)
		local v9 = p_u_7:GetScale() * 2
		v_u_3:PlaySound(v_u_4.General.PetEggRenderer.RisingAccent)
		v_u_2(p_u_7, TweenInfo.new(1), {
			["CFrame"] = v8
		}):Play()
		task.wait(0.1)
		local v10 = v_u_2(p_u_7, TweenInfo.new(2), {
			["Scale"] = v9
		})
		v10:Play()
		v10.Completed:Connect(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) p_u_7, (ref) v_u_6
			os.clock()
			v_u_3:PlaySound(v_u_4.General.PetEggRenderer.Pop)
			local v11 = Instance.new("Part")
			v11.Size = p_u_7:GetExtentsSize()
			v11.CFrame = p_u_7:GetPivot()
			v11.Anchored = true
			v11.CanCollide = false
			v11.Transparency = 1
			v11.Parent = workspace.Visuals
			local v12 = v_u_6.EggPop.PopParticles:Clone()
			v12.Color = ColorSequence.new(p_u_7.PrimaryPart.Color)
			v12.Parent = v11
			v12:Emit(20)
			warn((("TryDoHatchAnim | Couldnt get PetType from %* in time!"):format((p_u_7:GetFullName()))))
			p_u_7:Destroy()
			task.wait(2)
			v11:Destroy()
		end)
	end)
end