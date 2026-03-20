local Utils = {}
local reg

function Utils.Initialize(registry)
	reg = registry
end

function Utils.HeldItemUUID(UUID)
	local sData = reg.sData
	local Backpack = sData.Backpack
	for _, item in pairs(Backpack:GetChildren()) do
		--[[ 		if item.UUID == UUID then
			return item
		end ]]
	end
	return nil
end

return Utils
