local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Data.AchievementsData)
require(v1.Data.DefaultData)
local v_u_5
if v2:IsServer() then
	v_u_5 = require(game:GetService("ServerScriptService").Modules.DataService)
else
	v_u_5 = require(v1.Modules.DataService)
end
local v_u_6 = v3.LocalPlayer
local v_u_7 = v2:IsServer()
local v_u_8 = v2:IsStudio()
local v_u_9 = {}
local function v_u_15(p10, p11, p12)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
	if v_u_7 then
		local v13 = v_u_5:GetPathSignal(p10, p11)
		if v13 then
			return v13:Connect(p12)
		end
	else
		if p10 ~= v_u_6 then
			return nil
		end
		local v14 = v_u_5:GetPathSignal(p11)
		if v14 then
			return v14:Connect(p12)
		end
	end
end
function v_u_9.GetSeasonData(_, p16, p17)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8
	local v18
	if v_u_7 then
		v18 = v_u_5:GetPlayerData(p16)
	elseif p16 == v_u_6 then
		v18 = v_u_5:GetData()
	else
		v18 = nil
	end
	if v18 then
		return v18.Achievements.Seasons[("Season_%*"):format(p17)]
	end
	if v_u_8 then
		warn("AchievementsShared:GetSeasonData: player data not found")
	end
	return nil
end
function v_u_9.ValidateParameters(_, p19, p20, p21)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_4, (copy) v_u_9
	local v22
	if v_u_7 then
		v22 = v_u_5:GetPlayerData(p19)
	elseif p19 == v_u_6 then
		v22 = v_u_5:GetData()
	else
		v22 = nil
	end
	if not v22 then
		if v_u_8 then
			warn("AchievementsShared:ValidateParameters: player data not found")
		end
		return false
	end
	if type(p21) ~= "table" then
		if v_u_8 then
			warn("AchievementsShared:ValidateParameters: arguments is not a table")
		end
		return false
	end
	if p20 == "Season" then
		if #p21 ~= 1 then
			if v_u_8 then
				warn((("AchievementsShared:ValidateParameters: arguments got unexpected length for %*, expected 1, got %*"):format(p20, #p21)))
			end
			return false
		end
		local v23 = p21[1]
		local v24 = tonumber(v23)
		if v24 == nil then
			if v_u_8 then
				warn("AchievementsShared:ValidateParameters: failed to parse first arguments as a number")
			end
			return false
		end
		if v_u_4.Seasons[v24] ~= nil then
			return true
		end
		if v_u_8 then
			warn("AchievementsShared:ValidateParameters: failed to find season")
		end
		return false
	end
	if p20 == "Set" then
		if #p21 ~= 2 then
			if v_u_8 then
				warn((("AchievementsShared:ValidateParameters: arguments got unexpected length for %*, expected 2, got %*"):format(p20, #p21)))
			end
			return false
		end
		local v25 = p21[1]
		if not v_u_9:ValidateParameters(p19, "Season", { v25 }) then
			return false
		end
		local v26 = p21[2]
		if type(v26) ~= "string" then
			if v_u_8 then
				warn((("AchievementsShared:ValidateParameters: arguments got unexpected length for %*, expected 2, got %*"):format(p20, #p21)))
			end
			return false
		end
		local v27 = tonumber(v25)
		if v_u_4.Seasons[v27].Sets[v26] then
			return true
		end
		if v_u_8 then
			warn((("AchievementsShared:ValidateParameters: set %* doesn\'t exist for season %*"):format(v26, v25)))
		end
		return false
	end
	if p20 ~= "Quest" then
		return false
	end
	if #p21 ~= 3 then
		if v_u_8 then
			warn((("AchievementsShared:ValidateParameters: arguments got unexpected length for %*, expected 3, got %*"):format(p20, #p21)))
		end
		return false
	end
	local v28 = p21[1]
	local v29 = p21[2]
	if not v_u_9:ValidateParameters(p19, "Set", { v28, v29 }) then
		return false
	end
	local v30 = tonumber(v28)
	local v31 = v_u_4.Seasons[v30].Sets[v29].Quests
	local v32 = p21[3]
	if type(v32) == "string" then
		for _, v33 in v31 do
			if v33.Id == v32 then
				return true
			end
		end
	elseif type(v32) == "number" and v31[v32] ~= nil then
		return true
	end
	return false
end
function v_u_9.IsCompleted(_, p34, p35, p36)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_4
	local v37
	if v_u_7 then
		v37 = v_u_5:GetPlayerData(p34)
	elseif p34 == v_u_6 then
		v37 = v_u_5:GetData()
	else
		v37 = nil
	end
	if not v37 then
		if v_u_8 then
			warn("AchievementsShared:IsCompleted: player data not found")
		end
		return false
	end
	if type(p36) ~= "table" then
		if v_u_8 then
			warn("AchievementsShared:IsCompleted: arguments is not a table")
		end
		return false
	end
	if not v_u_9:ValidateParameters(p34, p35, p36) then
		return false
	end
	if v_u_9:IsClaimed(p34, p35, p36) then
		return true
	end
	local v38 = v_u_4.Seasons
	local v39 = p36[1]
	local v40 = v38[tonumber(v39)]
	local v41 = v37.Achievements.Seasons[("Season_%*"):format(p36[1])]
	if v40 == nil or v41 == nil then
		if v_u_8 then
			warn((("AchievementsShared:IsCompleted: Season doesn\'t exist for %*"):format(p36[1])))
		end
		return false
	end
	local v42
	if p36[2] then
		v42 = v40.Sets[p36[2]]
	else
		v42 = nil
	end
	local v43
	if p36[2] then
		v43 = v41.Sets[p36[2]]
	else
		v43 = nil
	end
	if p36[2] and (v42 == nil or v43 == nil) then
		if v_u_8 then
			warn((("AchievementsShared:IsCompleted: Season set doesn\'t exist for season %*, set %*"):format(p36[1], p36[2])))
		end
		return false
	end
	if p35 == "Season" then
		for v44 in v40.Sets do
			if not v_u_9:IsCompleted(p34, "Set", { p36[1], v44 }) then
				return false
			end
		end
		return true
	end
	if p35 == "Set" then
		for _, v45 in v42.Quests do
			if not v_u_9:IsCompleted(p34, "Quest", { p36[1], p36[2], v45.Id }) then
				return false
			end
		end
		return true
	end
	if p35 ~= "Quest" then
		return false
	end
	local v46 = p36[1]
	tonumber(v46)
	local v47 = p36[3]
	if type(v47) == "string" then
		local v48 = v43.Quests[v47]
		if v48 == nil then
			return false
		end
		for _, v49 in v42.Quests do
			if v49.Id == v47 and v48.Progress >= v49.Target then
				return true
			end
		end
		return false
	end
	if type(v47) ~= "number" then
		return false
	end
	local v50 = v42.Quests[v47]
	local v51
	if v50 then
		v51 = v43.Quests[v50.Id]
	else
		v51 = nil
	end
	if v51 ~= nil then
		return v51.Progress >= v50.Target
	end
	if v_u_8 then
		warn((("AchievementsShared:IsCompleted: Quest data doesn\'t exist for %*, %*, %*"):format(p36[1], p36[2], p36[3])))
	end
	return false
end
function v_u_9.IsClaimed(_, p52, p53, p54)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_4
	local v55
	if v_u_7 then
		v55 = v_u_5:GetPlayerData(p52)
	elseif p52 == v_u_6 then
		v55 = v_u_5:GetData()
	else
		v55 = nil
	end
	if v55 then
		if type(p54) == "table" then
			local v56 = v_u_4.Seasons
			local v57 = p54[1]
			local v58 = v56[tonumber(v57)]
			local v59 = v55.Achievements.Seasons[("Season_%*"):format(p54[1])]
			if v58 == nil or v59 == nil then
				if v_u_8 then
					warn((("AchievementsShared:IsClaimed: Season doesn\'t exist for %*"):format(p54[1])))
				end
				return false
			else
				local v60
				if p54[2] then
					v60 = v58.Sets[p54[2]]
				else
					v60 = nil
				end
				local v61
				if p54[2] then
					v61 = v59.Sets[p54[2]]
				else
					v61 = nil
				end
				if p54[2] and (v60 == nil or v61 == nil) then
					if v_u_8 then
						warn((("AchievementsShared:IsClaimed: Season set doesn\'t exist for season %*, set %*"):format(p54[1], p54[2])))
					end
					return false
				else
					if p53 == "Season" then
						if v59.Claimed then
							return true
						end
					elseif p53 == "Set" then
						if v61.Claimed then
							return true
						end
					elseif p53 == "Quest" then
						local v62 = p54[3]
						if type(v62) == "string" then
							local v63 = v61.Quests[v62]
							if v63 and v63.Claimed then
								return true
							end
						elseif type(v62) == "number" then
							local v64 = v60.Quests[v62]
							local v65
							if v64 then
								v65 = v61.Quests[v64.Id]
							else
								v65 = nil
							end
							if v65 and v65.Claimed then
								return true
							end
						end
					end
					return false
				end
			end
		else
			if v_u_8 then
				warn("AchievementsShared:IsClaimed: arguments is not a table")
			end
			return false
		end
	else
		if v_u_8 then
			warn("AchievementsShared:IsClaimed: player data not found")
		end
		return false
	end
end
function v_u_9.Observe(_, p66, p67, p_u_68, p_u_69)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_15, (copy) v_u_4
	local v_u_70
	if v_u_7 then
		v_u_70 = v_u_5:GetPlayerData(p66)
	elseif p66 == v_u_6 then
		v_u_70 = v_u_5:GetData()
	else
		v_u_70 = nil
	end
	if not v_u_70 then
		if v_u_8 then
			warn("AchievementsShared:Observe: player data not found")
		end
		return nil
	end
	if not v_u_9:ValidateParameters(p66, p67, p_u_68) then
		return nil
	end
	local v_u_71 = ("Season_%*"):format(p_u_68[1])
	local v72 = ("Achievements/Seasons/%*"):format(v_u_71)
	local v73
	if p_u_68[2] then
		local v74 = p_u_68[2]
		v73 = ("%*/Sets/%*"):format(v72, (tostring(v74)))
	else
		v73 = nil
	end
	if p67 == "Season" then
		local function v76()
			-- upvalues: (copy) v_u_70, (copy) v_u_71, (copy) p_u_69
			local v75 = v_u_70.Achievements.Seasons[v_u_71]
			if v75 then
				p_u_69(v75)
			end
		end
		local v_u_77 = v_u_15(p66, v72, v76)
		local v_u_78 = v_u_15(p66, ("%*/@"):format(v72), v76)
		task.spawn(v76)
		return function()
			-- upvalues: (copy) v_u_77, (copy) v_u_78
			if v_u_77 then
				v_u_77:Disconnect()
			end
			if v_u_78 then
				v_u_78:Disconnect()
			end
		end
	end
	if p67 == "Set" then
		local function v80()
			-- upvalues: (copy) v_u_70, (copy) v_u_71, (copy) p_u_69, (copy) p_u_68
			local v79 = v_u_70.Achievements.Seasons[v_u_71]
			if v79 then
				p_u_69(v79.Sets[p_u_68[2]])
			end
		end
		local v_u_81 = v_u_15(p66, v73, v80)
		local v_u_82 = v_u_15(p66, ("%*/@"):format(v73), v80)
		task.spawn(v80)
		return function()
			-- upvalues: (copy) v_u_81, (copy) v_u_82
			if v_u_81 then
				v_u_81:Disconnect()
			end
			if v_u_82 then
				v_u_82:Disconnect()
			end
		end
	end
	if p67 ~= "Quest" then
		return nil
	end
	local v_u_83 = p_u_68[3]
	if type(v_u_83) == "number" then
		local v84 = v_u_4.Seasons
		local v85 = p_u_68[1]
		local v86 = v84[tonumber(v85)].Sets[p_u_68[2]].Quests[v_u_83]
		if not v86 then
			return nil
		end
		v_u_83 = v86.Id
	end
	local v87 = type(v_u_83) == "string"
	assert(v87)
	local function v90()
		-- upvalues: (copy) v_u_70, (copy) v_u_71, (copy) p_u_68, (copy) p_u_69, (ref) v_u_83
		local v88 = v_u_70.Achievements.Seasons[v_u_71]
		if v88 then
			local v89 = v88.Sets[p_u_68[2]]
			if v89 then
				p_u_69(v89.Quests[v_u_83])
			else
				p_u_69(nil)
			end
		else
			return
		end
	end
	local v_u_91 = v_u_15(p66, ("%*/Quests/%*"):format(v73, v_u_83), v90)
	local v_u_92 = v_u_15(p66, ("%*/Quests/%*/@"):format(v73, v_u_83), v90)
	task.spawn(v90)
	return function()
		-- upvalues: (copy) v_u_91, (copy) v_u_92
		if v_u_91 then
			v_u_91:Disconnect()
		end
		if v_u_92 then
			v_u_92:Disconnect()
		end
	end
end
return v_u_9