return {
	["SetSkin"] = function(_, p1, p2)
		warn((("[%*]: Attempt to set %*\'s skin to %* -- This service has been disabled."):format(script.Name, p1.Name, p2)))
	end
}