return {
	["Name"] = "blink",
	["Aliases"] = { "b" },
	["Description"] = "Teleports you to where your mouse is hovering.",
	["Group"] = "DefaultDebug",
	["Args"] = {},
	["ClientRun"] = function(p1)
		local v2 = p1.Executor:GetMouse()
		local v3 = p1.Executor.Character
		if not v3 then
			return "You don\'t have a character."
		end
		v3:MoveTo(v2.Hit.p)
		return "Blinked!"
	end
}