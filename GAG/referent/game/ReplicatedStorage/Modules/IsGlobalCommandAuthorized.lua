local v_u_1 = {
	10916243,
	425901043,
	327423121,
	7627847305,
	339310190,
	14838908,
	3296891394,
	33372493,
	355661302
}
local v_u_2 = game:GetService("RunService")
if require(game:GetService("ReplicatedStorage").Modules.IsDev)() then
	table.insert(v_u_1, 9099919347)
end
return function(p3)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	return v_u_2:IsStudio() and true or table.find(v_u_1, p3.UserId)
end