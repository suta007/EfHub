local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1.GameEvents.GuestEventServices
local v_u_3 = v_u_2.GlobalChatService
local _ = v_u_3.QueueChatMessage
local v4 = require(v1.Modules.Signal)
local v_u_5 = require(v1.Modules.SetupRemotes)
local v_u_12 = {
	["AuthorizerMessageCreated"] = v4.new(),
	["AuthorizerMessageRemoved"] = v4.new(),
	["CreateAuthorizerMessage"] = function(_, p6)
		-- upvalues: (copy) v_u_12
		v_u_12[p6.MessageId] = p6
		v_u_12.AuthorizerMessageCreated:Fire(p6)
	end,
	["RemoveAuthorizerMessage"] = function(_, p7)
		-- upvalues: (copy) v_u_12
		v_u_12[p7.MessageId] = nil
		v_u_12.AuthorizerMessageRemoved:Fire(p7)
	end,
	["GetMessageData"] = function(_, p8)
		-- upvalues: (copy) v_u_12
		return v_u_12[p8]
	end,
	["QueueChatMessage"] = function(_, p9)
		-- upvalues: (copy) v_u_3
		v_u_3.QueueChatMessage:FireServer(p9)
	end,
	["DenyMessage"] = function(_, p10)
		-- upvalues: (copy) v_u_3
		v_u_3.DenyMessage:FireServer(p10)
	end,
	["AuthorizeMessage"] = function(_, p11)
		-- upvalues: (copy) v_u_3
		v_u_3.AuthorizeMessage:FireServer(p11)
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_12
		v_u_5(v_u_2.GlobalChatController, v_u_12)
	end
}
task.spawn(function()
	-- upvalues: (copy) v_u_12
	v_u_12:Start()
end)
return v_u_12