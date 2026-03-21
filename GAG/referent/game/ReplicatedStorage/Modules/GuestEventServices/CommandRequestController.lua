local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1.GameEvents.GuestEventServices
local v_u_3 = v_u_2.CommandRequestService
local v4 = require(v1.Modules.Signal)
local v_u_5 = require(v1.Modules.SetupRemotes)
local v_u_6 = {
	["CommandRequestMessageCreated"] = v4.new(),
	["CommandRequestMessageRemoved"] = v4.new()
}
local v_u_7 = {}
function v_u_6.CreateCommandRequest(_, p8)
	-- upvalues: (copy) v_u_7, (copy) v_u_6
	v_u_7[p8.MessageId] = p8
	v_u_6.CommandRequestMessageCreated:Fire(p8)
end
function v_u_6.RemoveCommandRequest(_, p9)
	-- upvalues: (copy) v_u_7, (copy) v_u_6
	v_u_7[p9.MessageId] = nil
	v_u_6.CommandRequestMessageRemoved:Fire(p9)
end
function v_u_6.GetCommandData(_, p10)
	-- upvalues: (copy) v_u_7
	return v_u_7[p10]
end
function v_u_6.RequestCommand(_, p11)
	-- upvalues: (copy) v_u_3
	v_u_3.RequestCommand:FireServer(p11)
end
function v_u_6.DenyCommand(_, p12)
	-- upvalues: (copy) v_u_3
	v_u_3.DenyCommand:FireServer(p12)
end
function v_u_6.AuthorizeCommand(_, p13)
	-- upvalues: (copy) v_u_3
	v_u_3.AuthorizeCommand:FireServer(p13)
end
function v_u_6.Start(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_6
	v_u_5(v_u_2.CommandRequestController, v_u_6)
end
task.spawn(function()
	-- upvalues: (copy) v_u_6
	v_u_6:Start()
end)
return v_u_6