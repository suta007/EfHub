local v1 = script.Parent.Parent:WaitForChild("CommonUtils")
if require(v1:WaitForChild("FlagUtil")).getUserFlag("UserPlayerScriptsCanUseLCC") then
	local v2 = game:GetService("Players")
	local v3 = {}
	local v_u_4 = nil
	local v_u_5 = nil
	local v_u_6 = Instance.new("BindableEvent")
	local v_u_7 = nil
	local function v9(p8)
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (copy) v_u_6, (ref) v_u_7
		v_u_4 = p8:FindFirstChild("AbilityManagerActor")
		v_u_5 = p8:FindFirstChildOfClass("Humanoid")
		while not v_u_5 do
			p8.ChildAdded:wait()
			v_u_5 = p8:FindFirstChildOfClass("Humanoid")
		end
		v_u_6:Fire()
		if v_u_7 then
			v_u_7:Disconnect()
			v_u_7 = nil
		end
		v_u_7 = v_u_5:GetPropertyChangedSignal("EvaluateStateMachine"):Connect(function()
			-- upvalues: (ref) v_u_6
			v_u_6:Fire()
		end)
	end
	local v10 = v2.LocalPlayer
	v10.CharacterAdded:Connect(v9)
	if v10.Character then
		v9(v10.Character)
	end
	function v3.isEnabled(_)
		-- upvalues: (ref) v_u_4, (ref) v_u_5
		local v11 = v_u_4 ~= nil and v_u_5
		if v11 then
			v11 = not v_u_5.EvaluateStateMachine
		end
		return v11
	end
	function v3.GetEnabledChangedSignal(_)
		-- upvalues: (copy) v_u_6
		return v_u_6.Event
	end
	return v3
end