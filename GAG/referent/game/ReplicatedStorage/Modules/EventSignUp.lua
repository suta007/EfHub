local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("SocialService")
local v_u_3 = require(v1.Modules.Icon)
local _ = game.Players.LocalPlayer.PlayerGui
local v_u_7 = {
	["NextEventId"] = "3723457354830840373",
	["_getRsvpStatus"] = function(_)
		-- upvalues: (copy) v_u_2, (copy) v_u_7
		local v4, v5 = pcall(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_7
			return v_u_2:GetEventRsvpStatusAsync(v_u_7.NextEventId)
		end)
		if v4 then
			return v5
		end
		warn((("[EventSignUp]: Could not get RSVP status for eventId %*!"):format(v_u_7.NextEventId)))
		return Enum.RsvpStatus.None
	end,
	["Start"] = function()
		-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_2
		local v_u_6 = v_u_3.new()
		v_u_6:setName("EVENT NOTIFY")
		v_u_6:setOrder(1)
		v_u_6:setLabel("EVENT NOTIFY")
		v_u_6:align("Right")
		v_u_6:setCaption("Get notified for the next event!")
		if v_u_7:_getRsvpStatus() == Enum.RsvpStatus.Going then
			v_u_6:destroy()
		end
		v_u_6.selected:Connect(function(_)
			-- upvalues: (ref) v_u_7, (copy) v_u_6, (ref) v_u_2
			if v_u_7.NextEventId == "" or v_u_7.NextEventId == nil then
				warn("[EventSignUp]: Invalid NextEventId!")
			else
				v_u_6:deselect()
				if v_u_2:PromptRsvpToEventAsync(v_u_7.NextEventId) == Enum.RsvpStatus.Going then
					v_u_6:destroy()
				end
			end
		end)
	end
}
task.spawn(v_u_7.Start)
return v_u_7