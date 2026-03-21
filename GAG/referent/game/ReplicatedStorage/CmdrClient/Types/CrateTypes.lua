local v1 = game:GetService("RunService")
local v2 = game:GetService("ReplicatedStorage")
local v3
if v1:IsServer() then
	v3 = game:GetService("ServerStorage").Assets.CrateModels
else
	v3 = require(v2.Modules.SelectiveAssetReplication):GetAssetAsync("Assets", "CrateModels")
end
local v_u_4 = require(script.Parent.Parent.Shared.Util)
local v_u_5 = {}
for _, v6 in v3:GetChildren() do
	local v7 = v6.Name
	table.insert(v_u_5, v7)
end
local v8 = v1:IsClient() and game.Players.LocalPlayer.PlayerGui:WaitForChild("ReplicatedAssets", 30)
if v8 then
	v8:WaitForChild("Assets", 30):WaitForChild("CrateModels", 30):Destroy()
end
local v_u_13 = {
	["Transform"] = function(p9)
		-- upvalues: (copy) v_u_4, (copy) v_u_5
		return v_u_4.MakeFuzzyFinder(v_u_5)(p9)
	end,
	["Validate"] = function(p10)
		return #p10 > 0, "No seeds could be found."
	end,
	["Autocomplete"] = function(p11)
		-- upvalues: (copy) v_u_4
		return v_u_4.GetNames(p11)
	end,
	["Parse"] = function(p12)
		return p12[1]
	end,
	["Default"] = function(_)
		return "Common"
	end,
	["ArgumentOperatorAliases"] = {
		["me"] = ".",
		["all"] = "*",
		["others"] = "**",
		["random"] = "?"
	}
}
return function(p14)
	-- upvalues: (copy) v_u_13
	p14:RegisterType("cratetype", v_u_13)
end