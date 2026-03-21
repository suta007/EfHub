local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v3 = {}
local v_u_4 = require(v_u_1.Modules.TradeControllers.TradeWorldController)
local v_u_5 = require(v_u_1.Modules.ABTestController)
require(v_u_1.Modules.IsDev)
function v3.Start(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_5, (copy) v_u_2
	if not v_u_4:IsInWorld() then
		local v_u_6 = nil
		v_u_1.GameEvents.Tutorial.Start.OnClientEvent:Connect(function(p7)
			-- upvalues: (ref) v_u_6, (ref) v_u_5, (ref) v_u_2
			local v8 = v_u_6
			local v9
			if type(v8) == "function" then
				v_u_6()
				v9 = 10
			else
				v9 = 10
			end
			while not v_u_5:IsLoaded() and v9 > 0 do
				v9 = v9 - task.wait(1)
			end
			local v10 = p7 or v_u_2:GetAttribute("AB_TutorialVariant") or "Variant1"
			local v11 = script.Variants:FindFirstChild(v10) or script.Variants:FindFirstChild("Variant1")
			if v11 then
				v_u_6 = require(v11)()
			else
				warn("No tutorial variant found to start")
			end
		end)
	end
end
task.spawn(v3.Start, v3)
return v3