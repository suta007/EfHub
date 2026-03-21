local v1 = game:GetService("RunService")
local v2 = game:GetService("HttpService")
local v3 = game.JobId
if #v3 ~= 0 and v3 ~= "00000000-0000-0000-0000-000000000000" then
	return v3
end
assert(v1:IsStudio())
if not v1:IsServer() then
	while true do
		local v4 = script:GetAttribute("Studio")
		if type(v4) == "string" then
			break
		end
		task.wait()
	end
	return v4
end
local v5 = v2:GenerateGUID(false):lower()
script:SetAttribute("Studio", v5)
return v5