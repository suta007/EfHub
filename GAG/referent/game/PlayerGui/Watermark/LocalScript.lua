if game.GameId ~= 7500518143 then
	return script.Parent:Destroy()
end
local v1 = table.create(200)
for v2 = 1, 200 do
	v1[v2] = (" %*"):format(game.Players.LocalPlayer.UserId)
end
script.Parent.TextLabel.Text = table.concat(v1)
script.Parent.TextLabel.TextTransparency = 0.95
script.Parent.SessionID.Text = game:GetService("HttpService"):GenerateGUID(false)
script.Parent.AccountID.Text = game.Players.LocalPlayer.UserId
game:GetService("RunService").Heartbeat:Connect(function()
	script.Parent.Enabled = true
end)