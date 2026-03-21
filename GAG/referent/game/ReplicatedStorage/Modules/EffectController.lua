local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = script.Effects
local v_u_4 = script.Libraries
local v_u_5 = v2.GameEvents.EffectRequest
require(script.Types)
local v_u_6 = require(v2.Modules.Trove)
local v_u_7 = {}
local v31 = {
	["Init"] = function(p_u_8, _)
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
		p_u_8.Components = {}
		p_u_8.Libraries = {}
		for _, v_u_9 in v_u_3:GetDescendants() do
			if v_u_9.ClassName == "ModuleScript" then
				task.spawn(function()
					-- upvalues: (copy) v_u_9, (copy) p_u_8
					local v10, v11 = pcall(require, v_u_9)
					if v10 then
						p_u_8.Components[v_u_9.Name] = v11
					end
				end)
			end
		end
		for _, v_u_12 in v_u_4:GetChildren() do
			if v_u_12.ClassName == "ModuleScript" then
				task.spawn(function()
					-- upvalues: (copy) v_u_12, (copy) p_u_8
					local v13, v14 = pcall(require, v_u_12)
					if v13 then
						p_u_8.Libraries[v_u_12.Name] = v14
					end
				end)
			end
		end
		v_u_5.OnClientEvent:Connect(function(p15)
			-- upvalues: (copy) p_u_8
			p_u_8:Play(p15)
		end)
	end,
	["SplitName"] = function(_, p16)
		local v17 = p16:split("/")
		if v17 then
			return v17[1], v17[2]
		end
	end,
	["FetchComponent"] = function(p18, p19)
		if p18.Components[p19] then
			return p18.Components[p19]
		end
		warn((("Invalid Effect Name: %*, Component not Found."):format(p19)))
		return nil
	end,
	["FetchCache"] = function(_, p20, p21)
		-- upvalues: (copy) v_u_7, (copy) v_u_6
		if not v_u_7[p20] then
			v_u_7[p20] = {}
		end
		if not v_u_7[p20][p21] then
			v_u_7[p20][p21] = {
				["Cache"] = {},
				["Container"] = v_u_6.new()
			}
		end
		return v_u_7[p20][p21]
	end,
	["Play"] = function(p22, p23)
		if p23.caster then
			local v24, v25 = p22:SplitName(p23.name_State)
			local v26 = p22:FetchComponent(v24)
			local v27
			if v26 then
				v27 = v26[v25]
			else
				v27 = v26
			end
			local v28
			if v26 then
				v28 = p22:FetchCache(p23.caster, v26)
			else
				v28 = v26
			end
			if v26 and (v27 and v28) then
				task.spawn(v27, {
					["Caster"] = p23.caster,
					["Parameters"] = p23.parameters,
					["Libraries"] = p22.Libraries,
					["Default"] = p22.Libraries.Default,
					["Cache"] = v28.Cache,
					["Container"] = v28.Container
				})
				return true
			else
				warn((("Component Found: %*, Callback Found: %*, Cache Found: %*."):format(v26, v27, v28)))
				return false
			end
		else
			warn(("No caster found in data table %*."):format(p23), p23)
			return
		end
	end,
	["Request"] = function(p29, p30)
		-- upvalues: (copy) v_u_5
		if p30.caster then
			if p29:Play(p30) then
				v_u_5:FireServer(p30)
			end
		end
	end
}
task.spawn(v31.Init, v31, v1.LocalPlayer)
return v31