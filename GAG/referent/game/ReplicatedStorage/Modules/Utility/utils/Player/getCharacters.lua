return function()
	local v1 = {}
	for _, v2 in pairs(game.Players:GetPlayers()) do
		local v3 = v2.Character
		table.insert(v1, v3)
	end
	return v1
end