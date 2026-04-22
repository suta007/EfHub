task.wait(1)
local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = v1.LocalPlayer
local v_u_5 = v_u_4:WaitForChild("Current_Biome")
script.Parent:WaitForChild("WeatherClient")
local v_u_6 = {}
local v_u_7 = nil
local v_u_8 = nil
function Turn_Off(p9, p10)
	-- upvalues: (copy) v_u_2
	if p9 then
		v_u_2:Create(p9, TweenInfo.new(p10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
			["Volume"] = 0
		}):Play()
	end
end
function Turn_On(p11, p12)
	-- upvalues: (copy) v_u_2
	if p11 then
		v_u_2:Create(p11, TweenInfo.new(p12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
			["Volume"] = p11:GetAttribute("DefaultVolume") or 0.15
		}):Play()
	end
end
function PlayFolderMusic(_, p13, p14, p15, p16)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (ref) v_u_8, (ref) v_u_7
	local v17 = p15 or true
	local v18 = p14 or v_u_5.Value
	if p16 or true then
		for _, v19 in ipairs(v_u_6) do
			if v19.Folder.Name ~= v18 then
				for _, v20 in pairs(v19.Folder:GetChildren()) do
					Turn_Off(v20, 7)
				end
			end
		end
	end
	if v17 then
		for _, v21 in ipairs(v_u_6) do
			if v21.Folder.Name == v18 then
				v_u_8 = v21.Folder
			end
		end
	end
	local v22 = nil
	for _, v23 in ipairs(v_u_6) do
		if v23.Folder == v_u_8 then
			v22 = v23.ActiveTrack
		end
	end
	if v_u_7 ~= v22 and v_u_7 ~= nil then
		Turn_Off(v_u_7, p13)
	end
	v_u_7 = v22
	if v22 then
		v22.Playing = true
		Turn_On(v22, p13)
	end
end
function ChangeTrack()
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_6
		local v24 = false
		while v24 == false do
			task.wait()
			for _, v25 in pairs(v_u_3.Music_Folder:GetDescendants()) do
				if v25:IsA("Sound") and v25.Playing == true then
					v24 = true
				end
			end
			PlayFolderMusic(v_u_6, 1, nil, false, false)
		end
	end)
end
function UpdateBiomeMusic()
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (ref) v_u_8
	if game.ReplicatedStorage.Night_Time.Value == false then
		for _, v26 in pairs(v_u_6) do
			if v26.Folder.Name == v_u_5.Value then
				v_u_8 = v26.Folder
			end
		end
		ChangeTrack()
	end
end
for _, v27 in ipairs(v_u_3.Music_Folder:GetChildren()) do
	local v28 = {
		["Folder"] = v27,
		["ActiveTrack"] = v27:GetChildren()[1] or nil
	}
	table.insert(v_u_6, v28)
end
for _, v29 in ipairs(v_u_6) do
	for _, v30 in pairs(v29.Folder:GetChildren()) do
		v30.Volume = 0
	end
end
for _, v_u_31 in pairs(v_u_6) do
	task.spawn(function()
		-- upvalues: (copy) v_u_31
		while true do
			while true do
				local v32 = v_u_31.Folder:GetChildren()
				if #v32 <= 0 then
					break
				end
				local v33 = v32[math.random(1, #v32)]
				v_u_31.ActiveTrack = v33
				task.wait(v33.TimeLength)
			end
			task.wait(0.1)
		end
	end)
end
ChangeTrack()
UpdateBiomeMusic()
v_u_5:GetPropertyChangedSignal("Value"):Connect(function()
	UpdateBiomeMusic()
end)
workspace:GetAttributeChangedSignal("DiscoEvent"):Connect(function()
	-- upvalues: (copy) v_u_2
	local v34 = workspace:GetAttribute("DiscoEvent")
	local v35 = game:GetService("SoundService")
	local v_u_36 = v35.Disco
	local v37 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	if v34 then
		v_u_36.Volume = 0
		v_u_36:Play()
		v_u_2:Create(v_u_36, v37, {
			["Volume"] = 0.2
		}):Play()
		v_u_2:Create(v35.Music.Tunes.Music, v37, {
			["Volume"] = 0
		}):Play()
	else
		v_u_2:Create(v_u_36, v37, {
			["Volume"] = 0
		}):Play()
		v_u_2:Create(v35.Music.Tunes.Music, v37, {
			["Volume"] = 1
		}):Play()
		task.delay(1, function()
			-- upvalues: (copy) v_u_36
			v_u_36:Stop()
		end)
	end
end)
local v_u_38 = {
	["ArmageddonEvent"] = "Armageddon",
	["AuroraBorealis"] = "Aurora_Borealis",
	["CrystalBeams"] = "Crystal_Beams",
	["BloodMoonEvent"] = "Night_Time",
	["FullMoon"] = "Full_Moon",
	["MegaHarvest"] = "Mega_Harvest",
	["NightEvent"] = "Night_Time",
	["ShootingStars"] = "Shooting_Stars",
	["CupidsArrows"] = "Cupids_Arrows",
	["SummerHarvest"] = "Summer_Harvest",
	["SuperStorm"] = "Shooting_Stars",
	["TropicalRain"] = "Tropical_Rain",
	["SantaIsHereEvent"] = "Blizzard",
	["ChristmasCrackersEvent"] = "Blizzard",
	["JandelsLastStand"] = "Armageddon"
}
workspace.AttributeChanged:Connect(function(p39)
	-- upvalues: (copy) v_u_38, (copy) v_u_6
	local v40
	if v_u_38[p39] then
		v40 = v_u_38[p39]
	else
		v40 = p39
	end
	if workspace:GetAttribute(p39) then
		PlayFolderMusic(v_u_6, 7, v40)
	else
		PlayFolderMusic(v_u_6, 7)
	end
end)
v_u_4:GetAttributeChangedSignal("PlayerDigging"):Connect(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	if v_u_4:GetAttribute("PlayerDigging") then
		local v41 = require(game.ReplicatedStorage.Data.DiggingMinigame.DiggingEventConfigData)
		local v42 = v41.GetCurrentTheme()
		if v42 == "DISABLED" then
			return
		else
			local v43 = v41.THEME_DATA[v42].Music
			if v43 then
				PlayFolderMusic(v_u_6, 7, v43)
			end
		end
	else
		PlayFolderMusic(v_u_6, 7)
		return
	end
end)