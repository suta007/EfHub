local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
game:GetService("HttpService")
local v_u_2 = game:GetService("RunService")
game:GetService("MarketplaceService")
local v_u_3 = game:GetService("ServerScriptService")
local v_u_4 = require(v1.Data.NeedCommandAuthorization)
local v_u_5 = require(v1.Modules.IsCommandAuthorized)
local v_u_6 = require(script.LogCommand)
return function(p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	p7:RegisterHook("BeforeRun", function(p8)
		-- upvalues: (ref) v_u_5, (ref) v_u_2, (ref) v_u_6, (ref) v_u_4, (ref) v_u_3
		local v9 = p8.Executor
		if not v_u_5(v9) then
			return "You don\'t have permission to run this command please verify that your UserId is in \"ReplicatedStorage.Data.AuthorizedUsers\""
		end
		local v10 = p8.RawText
		if p8.Executor and (v10 and v_u_2:IsServer()) then
			v_u_6(p8)
			local v11 = (p8.Data or {}).Data or {}
			if v_u_4[v9.UserId] and not v11.AuthorizedToRunBy then
				require(v_u_3.Modules.GuestEventServices.CommandRequestService):RequestCommand(v9, p8)
				return "QUEUED COMMAND!"
			end
		end
	end)
end