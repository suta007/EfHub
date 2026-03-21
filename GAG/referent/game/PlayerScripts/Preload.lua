local v_u_1 = require(game.ReplicatedStorage.Modules.CutsceneService)
local function v2()
	-- upvalues: (copy) v_u_1
	if workspace:GetAttribute("PreloadBeeEvent") then
		v_u_1.attemptDelayedPreload(game.ReplicatedStorage.Assets.Cutscenes.BeeCutscene)
	end
end
if workspace:GetAttribute("PreloadBeeEvent") then
	v_u_1.attemptDelayedPreload(game.ReplicatedStorage.Assets.Cutscenes.BeeCutscene)
end
game:GetService("Workspace"):GetAttributeChangedSignal("PreloadBeeEvent"):Connect(v2)