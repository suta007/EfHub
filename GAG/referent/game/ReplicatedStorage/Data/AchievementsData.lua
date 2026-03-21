game:GetService("ReplicatedStorage")
require(script.Types)
local v1 = {}
local v2 = {
	["Seasons"] = v1
}
for _, v3 in script.Seasons:GetChildren() do
	if v3:IsA("ModuleScript") then
		local v4 = v3.Name
		local v5 = tonumber(v4)
		if v5 then
			local v6, v7 = pcall(require, v3)
			if v6 and type(v7) == "table" then
				v1[v5] = v7
				local v8 = {}
				for v9, v10 in v7.Sets do
					for v11, v12 in v10.Quests do
						if v8[v12.Id] then
							warn((("%* (index %*) has duplicated id in quest set %* for season %*"):format(v12.Id, v11, v9, v5)))
						else
							v8[v12.Id] = true
						end
					end
				end
			else
				warn((("Failed to require %*: %*"):format(v3:GetFullName(), v7)))
			end
		end
	end
end
return v2