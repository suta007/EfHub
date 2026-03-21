local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("ContentProvider")
game:GetService("RunService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.UpdateService)
local v_u_5 = require(v1.Modules.IsDev)
local v_u_6 = {
	[script.jandel] = "Instance",
	[script.jandelFloat] = "Instance",
	["74100090243310"] = "Sound",
	[script.jandelStorm] = "Instance",
	["142376088"] = "Sound",
	[script.underTheSea] = "Instance",
	["84171656137056"] = "Sound",
	["99445078556609"] = "Sound",
	["1846552051"] = "Sound",
	["9125402735"] = "Sound",
	["1542459939"] = "Sound",
	["122907949849153"] = "Sound",
	[script.jandelHammer] = "Instance",
	["80584356758887"] = "Sound",
	["9117985663"] = "Sound",
	["75213214992269"] = "Sound",
	["1079408535"] = "Sound",
	[script.jandelKatana] = "Instance",
	[script.volcano] = "Instance",
	["121762378458854"] = "Sound",
	["89910008498080"] = "Sound",
	["93514478924854"] = "Sound",
	["138129472843424"] = "Sound",
	[script.meteorStrike] = "Instance",
	["81271421661459"] = "Sound",
	["84265920549272"] = "Sound",
	["1848052307"] = "Sound",
	["3981355300"] = "Sound",
	["8292289200"] = "Sound",
	[script.stoplight] = "Instance",
	["131438286776408"] = "Sound",
	["103750154394322"] = "Sound",
	["97711263230645"] = "Sound",
	["96736432929535"] = "Sound",
	["105215331534171"] = "Sound",
	["80820991520058"] = "Sound",
	["125718385982992"] = "Sound",
	["117093826727273"] = "Sound",
	["116689943122507"] = "Sound",
	["12222253"] = "Sound",
	[script.Beanaura] = "Instance",
	["115766119628419"] = "Sound",
	[script.BoomboxParty] = "Instance",
	["167123203"] = "Sound",
	["6883650972"] = "Sound",
	["1846368080"] = "Sound",
	["6586979979"] = "Sound",
	["9064263922"] = "Sound",
	["3165700530"] = "Sound",
	[script.Tsunami] = "Instance",
	[script.RainDance] = "Instance",
	["687874741"] = "Sound",
	["126520360641941"] = "Sound",
	["129550333091181"] = "Sound",
	["120203977334120"] = "Sound",
	["8493073620"] = "Sound",
	[script.IceKing] = "Instance",
	["132933848310796"] = "Sound",
	["127162522205233"] = "Sound",
	["88681038076429"] = "Sound",
	[script.GiantSwordPull] = "Instance",
	["9128724164"] = "Sound",
	["1847184317"] = "Sound",
	["6270529350"] = "Sound",
	["6680960510"] = "Sound",
	[script.Supernova] = "Instance",
	["9114428742"] = "Sound",
	[script.Eruption] = "Instance",
	["9116638811"] = "Sound",
	["9119482201"] = "Sound",
	["9116673944"] = "Sound",
	[script.GiantCauldron] = "Instance",
	["238895410"] = "Sound",
	["6860710840"] = "Sound",
	["112797079504478"] = "Sound",
	["107467482558699"] = "Sound",
	[script.PermafrostExplosion] = "Instance",
	["9047876673"] = "Sound",
	[script.RestockFever] = "Instance",
	["1842150599"] = "Sound",
	["1848059186"] = "Sound",
	["1846627640"] = "Sound",
	["1846627694"] = "Sound",
	[script.Blizzard] = "Instance",
	["93808705439016"] = "Sound",
	[script["David\'s December Drop"]] = "Instance",
	[script.DiscoParty] = "Instance",
	["6670092634"] = "Sound",
	[script.IceRink] = "Instance",
	[script.GiantCandyCaneRain] = "Instance",
	[script.SantaIsHere] = "Instance",
	[script.ChristmasCrackers] = "Instance",
	["71284123166666"] = "Sound",
	["78351662589992"] = "Sound",
	["9126201834"] = "Sound",
	["5189782994"] = "Sound",
	["9118772469"] = "Sound",
	["8927189937"] = "Sound",
	["9085909202"] = "Sound",
	["9116406610"] = "Sound",
	[script.GiantSnowballDodge] = "Instance",
	[script.WhiteElephant] = "Instance"
}
local v_u_20 = {
	["Instances"] = {},
	["CreateInstance"] = function(_, p7, p8)
		if p8 ~= "Sound" then
			if p8 ~= "Instance" then
				warn((("Unsupported asset type in Preload list: %* (%*)"):format(p8, p7)))
				return nil
			end
			local v9 = typeof(p7) == "Instance"
			assert(v9)
			return p7:GetChildren()
		end
		local v10 = type(p7) == "string"
		assert(v10)
		local v11 = Instance.new("Sound")
		v11.Volume = 0
		if not string.find(p7, "rbxassetid") then
			p7 = ("rbxassetid://%*"):format(p7)
		end
		v11.SoundId = p7
		return v11
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_20, (copy) v_u_2
		local v12 = Random.new(v_u_3.LocalPlayer.UserId):NextInteger(50, 130)
		local v13 = Random.new(v_u_3.LocalPlayer.UserId):NextInteger(2, 3)
		if not v_u_5() then
			if v_u_4:IsUpdateDone() then
				table.clear(v_u_6)
				for _, v_u_14 in script:GetChildren() do
					xpcall(function()
						-- upvalues: (copy) v_u_14
						v_u_14:Destroy()
					end, warn)
				end
				return
			end
			while v_u_4:GetRemainingTimeUntilUpdate() > 60 * v12 do
				task.wait(1)
			end
		end
		local v15 = 0
		for v_u_16, v17 in v_u_6 do
			local v18 = v_u_20:CreateInstance(v_u_16, v17)
			if type(v18) == "table" then
				for _, v_u_19 in v18 do
					xpcall(function()
						-- upvalues: (ref) v_u_2, (copy) v_u_19
						v_u_2:PreloadAsync({ v_u_19 })
					end, warn)
					v_u_19:Destroy()
					v15 = v15 + 1
					task.wait(v13)
				end
			elseif v18 ~= nil then
				xpcall(function()
					-- upvalues: (ref) v_u_2, (copy) v_u_16
					v_u_2:PreloadAsync({ v_u_16 })
				end, warn)
				v18:Destroy()
				v15 = v15 + 1
				task.wait(v13)
			end
		end
		table.clear(v_u_6)
	end
}
task.spawn(v_u_20.Start, v_u_20)
return nil