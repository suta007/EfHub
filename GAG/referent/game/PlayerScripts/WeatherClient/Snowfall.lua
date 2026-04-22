local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("Lighting")
local v_u_4 = require(v1.Modules.SkyboxManager)
require(v1.Modules.Maid)
local v_u_5 = script.Sky
local v_u_6 = v3:FindFirstChild("Atmosphere")
function OnStart()
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_6
	v_u_4.UpdateSkybox(v_u_5, 2)
	local v_u_7 = v_u_2:Create(v_u_6, TweenInfo.new(1), {
		["Density"] = 0.3
	})
	v_u_7.Completed:Connect(function()
		-- upvalues: (copy) v_u_7
		v_u_7:Destroy()
	end)
	v_u_7:Play()
end
function OnStop()
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_6
	v_u_4.UpdateSkybox(v_u_5, 1)
	local v_u_8 = v_u_2:Create(v_u_6, TweenInfo.new(1), {
		["Density"] = 0
	})
	v_u_8.Completed:Connect(function()
		-- upvalues: (copy) v_u_8
		v_u_8:Destroy()
	end)
	v_u_8:Play()
end
function Start()
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	v_u_4.AddSkybox(v_u_5)
	if workspace:GetAttribute(script.Name) then
		OnStart()
	end
	workspace:GetAttributeChangedSignal(script.Name):Connect(function()
		local v9 = workspace:GetAttribute(script.Name)
		if v9 == true then
			OnStart()
		elseif v9 == false then
			OnStop()
		end
	end)
end
task.spawn(function()
	Start()
end)
return {}