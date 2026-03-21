local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("MarketplaceService")
local v_u_3 = game:GetService("ServerStorage")
local v_u_4 = game:GetService("RunService")
local v_u_5 = nil
local v_u_6 = nil
return function(p_u_7)
	-- upvalues: (copy) v_u_3, (ref) v_u_5, (copy) v_u_2, (ref) v_u_6, (copy) v_u_1, (copy) v_u_4
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (ref) v_u_2, (ref) v_u_6, (ref) v_u_1, (copy) p_u_7, (ref) v_u_4
		local v8 = require(v_u_3:WaitForChild("Secrets_DO_NOT_EXPOSE_TO_CLIENT"))
		local v9 = ({
			[7500518143] = v8.ANAYLITICS_CMDR_DEV,
			[7835737630] = v8.ANAYLITICS_CMDR_QA,
			[7436755782] = v8.ANAYLITICS_CMDR_PROD
		})[game.GameId]
		if not v_u_5 then
			local v10, v11 = pcall(function()
				-- upvalues: (ref) v_u_2
				return v_u_2:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
			end)
			if not v10 then
				v11 = nil
			end
			v_u_5 = v11
		end
		if not v_u_6 then
			local v_u_12 = game.PlaceId
			local v13, v14 = pcall(function()
				-- upvalues: (copy) v_u_12, (ref) v_u_1
				return v_u_1:JSONDecode((v_u_1:GetAsync("https://thumbnails.roproxy.com/v1/assets?assetIds=" .. v_u_12 .. "&returnPolicy=PlaceHolder&size=512x512&format=Png&isCircular=false"))).data[1].imageUrl
			end)
			if not v13 then
				v14 = nil
			end
			v_u_6 = v14
		end
		local v15
		if game.JobId == "" then
			v15 = "UNKNOWN"
		else
			local v16 = game.JobId
			v15 = tostring(v16)
		end
		local v17 = p_u_7.Executor
		local v18 = {
			["content"] = "",
			["attachments"] = {}
		}
		local v19 = {}
		local v20 = {
			["color"] = 28152
		}
		local v21 = p_u_7.RawText
		local v22 = v_u_5.Name
		local v23 = ("https://www.roblox.com/games/%*/"):format(game.PlaceId)
		local v24 = ("``%s``"):format((tostring(v15)))
		local v25 = v_u_4:IsStudio()
		v20.description = ("```lua\n%s```\n**Execution Context**\nPlace: [%s](%s)\nJobId: %s\nIsStudio: %s\nExecutor: %s\n"):format(v21, v22, v23, v24, ("``%s``"):format((tostring(v25))), (("**[%*](https://www.roblox.com/users/%*/profile)**"):format(v17.Name, v17.UserId)))
		v20.title = "CMDR Command Ran"
		v20.thumbnail = {
			["url"] = v_u_6
		}
		v19[1] = v20
		v18.embeds = v19
		v_u_1:RequestAsync({
			["Url"] = v9,
			["Method"] = "POST",
			["Headers"] = {
				["Content-Type"] = "application/json"
			},
			["Body"] = v_u_1:JSONEncode(v18)
		})
	end)
end