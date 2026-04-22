game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.IsDev)
script.Parent.Text = ("v%*"):format(game.PlaceVersion)
script.Parent.Visible = true