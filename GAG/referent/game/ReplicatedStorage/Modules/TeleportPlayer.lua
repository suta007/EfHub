local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = v1:WaitForChild("GameEvents"):WaitForChild("PlayerTeleportTriggered")
return function(p_u_4, p_u_5, p_u_6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_7 = p_u_4.Character
	if v_u_7 then
		local v_u_8 = v_u_7:WaitForChild("Humanoid", 1)
		if v_u_8 then
			if game.Workspace:GetAttribute("Stoplight") then
				return
			elseif v_u_8.Sit then
				v_u_8.Sit = false
				v_u_8:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
				task.delay(0.1, function()
					-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) p_u_5, (ref) v_u_2, (copy) p_u_4, (copy) p_u_6, (ref) v_u_3
					v_u_8:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
					v_u_7:PivotTo(p_u_5)
					if v_u_2:IsServer() then
						require(game.ServerScriptService.Modules.PlayerTeleportObserverService):NotifyTeleport(p_u_4, p_u_6)
					else
						v_u_3:FireServer(p_u_6)
					end
				end)
				return
			else
				v_u_7:PivotTo(p_u_5)
				if v_u_2:IsServer() then
					require(game.ServerScriptService.Modules.PlayerTeleportObserverService):NotifyTeleport(p_u_4, p_u_6)
				else
					v_u_3:FireServer(p_u_6)
				end
			end
		else
			return
		end
	else
		return
	end
end