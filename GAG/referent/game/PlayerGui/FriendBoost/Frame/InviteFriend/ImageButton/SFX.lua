local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.SetupButton)
local v_u_3 = game.SoundService.Hover
local v_u_4 = game.SoundService.Click
local v5 = game:GetService("UserInputService")
v2({
	["instance"] = script.Parent,
	["offset"] = 0.1,
	["onhover"] = not v5.TouchEnabled and (function()
		-- upvalues: (copy) v_u_3
		v_u_3.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_3.TimePosition = 0
		v_u_3.Playing = true
	end or nil) or nil,
	["onclick"] = function()
		-- upvalues: (copy) v_u_4
		v_u_4.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_4.TimePosition = 0
		v_u_4.Playing = true
	end
})