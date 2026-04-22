local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
require(v2.Modules.TeamEventHelper)
local v3 = require(v2.Modules.Signal)
local v_u_4 = require(v2.Modules.TeamEventControllers.TeamEventController)
local v_u_5 = require(v2.Modules.ConfirmationPromptController)
local v_u_6 = v1.LocalPlayer
assert(v_u_6, "LocalPlayer not found")
local v7 = v2:WaitForChild("GameEvents"):WaitForChild("TeamEvents"):WaitForChild("TeamEventParty")
local v_u_8 = v7:WaitForChild("InvitePlayer")
local v_u_9 = v7:WaitForChild("AcceptInvite")
local v10 = v7:WaitForChild("OnInviteReceived")
local v11 = v7:WaitForChild("OnInviteResult")
local v_u_12 = v7:WaitForChild("RequestLeaveParty")
local v_u_13 = {
	["InboundReceived"] = v3.new(),
	["InboundResolved"] = v3.new(),
	["OutboundChanged"] = v3.new()
}
local v_u_14 = {}
function v_u_13.HasOutboundInvite(_, p15, p16)
	-- upvalues: (copy) v_u_14
	local v17 = v_u_14[p15]
	if not v17 then
		return false, nil
	end
	local v18 = v17[p16]
	if not v18 then
		return false, nil
	end
	if v18 > os.time() then
		return true, v18
	end
	v17[p16] = nil
	return false, nil
end
function v_u_13.GetOutbound(_, p19)
	-- upvalues: (copy) v_u_14
	return v_u_14[p19] or {}
end
function v_u_13.GetTeamId(_, p20)
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	return v_u_4:GetTeamId(p20, v_u_6)
end
function v_u_13.GetTeamData(p21, p22)
	-- upvalues: (copy) v_u_4
	local v23 = p21:GetTeamId(p22)
	if v23 then
		return v_u_4:GetTeamData(p22, v23)
	else
		return nil
	end
end
function v_u_13.IsLocalCaptain(p24, p25)
	-- upvalues: (copy) v_u_6
	local v26 = p24:GetTeamData(p25)
	if not v26 then
		return false
	end
	local v27 = 0
	for _ in v26.members do
		v27 = v27 + 1
	end
	if v27 == 1 and v26.members[v_u_6.UserId] ~= nil then
		return true
	end
	local v28
	if v26.metadata == nil then
		v28 = false
	else
		v28 = v26.metadata.captain == v_u_6.UserId
	end
	return v28
end
function v_u_13.CanInvite(p29, p30)
	return not p29:GetTeamId(p30) and true or p29:IsLocalCaptain(p30)
end
function v_u_13.Invite(p31, p32, p33)
	-- upvalues: (copy) v_u_8
	if not p31:HasOutboundInvite(p32, p33) then
		v_u_8:FireServer(p32, p33)
	end
end
function v_u_13.Accept(_, p34, p35)
	-- upvalues: (copy) v_u_9
	v_u_9:FireServer(p34, p35, false)
end
function v_u_13.Decline(_, p36, p37)
	-- upvalues: (copy) v_u_9
	v_u_9:FireServer(p36, p37, true)
end
function v_u_13.LeaveParty(_, p_u_38)
	-- upvalues: (copy) v_u_5, (copy) v_u_12
	v_u_5:Open({
		["Title"] = "Leave Event Party",
		["Header"] = "Leaving your event party",
		["Middle"] = "You will lose your group rewards progress.",
		["Footer"] = "Are you sure?",
		["ConfirmText"] = "Leave",
		["RejectText"] = "Cancel"
	}, {
		["ConfirmCallback"] = function()
			-- upvalues: (ref) v_u_12, (copy) p_u_38
			v_u_12:FireServer(p_u_38)
		end
	})
end
v10.OnClientEvent:Connect(function(p39, p40, p41, p42)
	-- upvalues: (copy) v_u_13
	v_u_13.InboundReceived:Fire(p39, p40, p41, p42)
end)
v11.OnClientEvent:Connect(function(p43, p_u_44, p45, p_u_46)
	-- upvalues: (copy) v_u_14, (copy) v_u_13
	local v_u_47 = v_u_14[p43]
	if not v_u_47 then
		v_u_47 = {}
		v_u_14[p43] = v_u_47
	end
	if p45 == "sent" and p_u_46 then
		v_u_47[p_u_44] = p_u_46
		v_u_13.OutboundChanged:Fire()
		local v48 = task.delay
		local v49 = p_u_46 - os.time()
		v48(math.max(0, v49), function()
			-- upvalues: (copy) v_u_47, (copy) p_u_44, (copy) p_u_46, (ref) v_u_13
			if v_u_47[p_u_44] == p_u_46 then
				v_u_47[p_u_44] = nil
				v_u_13.OutboundChanged:Fire()
			end
		end)
	else
		v_u_47[p_u_44] = nil
		v_u_13.OutboundChanged:Fire()
	end
end)
return v_u_13