local v_u_1 = game:GetService("AvatarEditorService")
local v_u_2 = game:GetService("MarketplaceService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("Players")
local v_u_5 = v3.GameEvents.Greenbean
local v_u_6 = require(v3.Data.GreenbeanAvatarItems)
local v_u_7 = v3.Assets.GreenbeanHumanoidDescription
local v8 = {}
local v_u_9 = v4.LocalPlayer
local v_u_10 = false
v_u_1.PromptSaveAvatarCompleted:Connect(function(p11, p12)
	-- upvalues: (ref) v_u_10, (copy) v_u_7, (copy) v_u_5
	v_u_10 = false
	if p11 == Enum.AvatarPromptResult.Success and p12.Name == v_u_7.Name then
		v_u_5:FireServer("LoadAvatar")
	end
end)
v_u_5.OnClientEvent:Connect(function(p13)
	-- upvalues: (copy) v_u_2, (ref) v_u_10, (copy) v_u_1, (copy) v_u_7
	if p13 == "PromptBulkPurchase" then
		v_u_2.PromptBulkPurchaseFinished:Once(function(_, p14, _)
			-- upvalues: (ref) v_u_10, (ref) v_u_1, (ref) v_u_7
			if p14 == Enum.MarketplaceBulkPurchasePromptStatus.Completed and not v_u_10 then
				v_u_10 = true
				pcall(function()
					-- upvalues: (ref) v_u_1, (ref) v_u_7
					v_u_1:PromptSaveAvatar(v_u_7, Enum.HumanoidRigType.R6)
				end)
			end
		end)
	elseif p13 == "PromptSaveAvatar" then
		if v_u_10 then
			return
		end
		v_u_10 = true
		pcall(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7
			v_u_1:PromptSaveAvatar(v_u_7, Enum.HumanoidRigType.R6)
		end)
	end
end)
local v_u_15 = nil
local function v_u_27(p16)
	-- upvalues: (ref) v_u_15, (copy) v_u_2, (copy) v_u_9
	if v_u_15 then
		return v_u_15
	end
	local v17 = {}
	for _, v_u_18 in p16 do
		local v19 = false
		local v20 = false
		if v_u_18.Type == Enum.MarketplaceProductType.AvatarAsset then
			v19, v20 = pcall(function()
				-- upvalues: (ref) v_u_2, (ref) v_u_9, (copy) v_u_18
				local v21 = v_u_2
				local v22 = v_u_9
				local v23 = v_u_18.Id
				return v21:PlayerOwnsAsset(v22, (tonumber(v23)))
			end)
		elseif v_u_18.Type == Enum.MarketplaceProductType.AvatarBundle then
			v19, v20 = pcall(function()
				-- upvalues: (ref) v_u_2, (ref) v_u_9, (copy) v_u_18
				local v24 = v_u_2
				local v25 = v_u_9
				local v26 = v_u_18.Id
				return v24:PlayerOwnsBundle(v25, (tonumber(v26)))
			end)
		end
		if not (v19 and v20) then
			table.insert(v17, v_u_18)
		end
	end
	v_u_15 = v17
	task.delay(20, function()
		-- upvalues: (ref) v_u_15
		v_u_15 = nil
	end)
	return v17
end
function v8.Prompt(_)
	-- upvalues: (ref) v_u_10, (copy) v_u_27, (copy) v_u_6, (copy) v_u_5
	if v_u_10 then
		return
	elseif #v_u_27(v_u_6) == 0 then
		v_u_5:FireServer("PromptSaveAvatar")
	else
		v_u_5:FireServer("PromptBulkPurchase")
	end
end
return v8