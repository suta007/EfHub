local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local allPlayers = Players:GetPlayers()
local friendTable = {}
for _, player in ipairs(allPlayers) do
	if player.Name ~= LocalPlayer.Name then
		table.insert(friendTable, player.Name)
	end
end

print(tostring(friendTable))
