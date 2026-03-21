local v1 = game:GetService("ReplicatedStorage")
local v2 = {}
for v3, v4 in require(v1.Data.EnumRegistry.VariantsEnums) do
	v2[v4] = v3
end
return v2