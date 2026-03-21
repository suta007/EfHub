local v_u_1 = game:GetService("Players")
game:GetService("RunService")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v3 = require(v2.Modules.CreateTagHandler)
local v_u_4 = require(v2.Modules.DataService)
local v_u_5 = v2.GameEvents.PetEggService
local v_u_6 = v_u_1.LocalPlayer
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = {}
local function v_u_17(p10)
	-- upvalues: (copy) v_u_6
	if p10:GetAttribute("OWNER") == v_u_6.Name then
		return
	else
		local v11 = p10:GetAttribute("TimeToHatch")
		local v12 = p10:FindFirstChild("PetEgg"):FindFirstChild("GiftSkipPromptAtt")
		local v13 = (v12 or p10):FindFirstChild("GiftSkipPrompt") or p10:FindFirstChild("GiftSkipPrompt", true)
		if v13 then
			local v14 = p10:GetAttribute("ShowTime")
			if not v14 and true or v14 <= workspace:GetServerTimeNow() then
				if v11 <= 15 then
					v13.Enabled = false
				end
				local v15 = v12 or p10:FindFirstChild("GiftSkipPromptAtt", true)
				if p10 then
					if v15 then
						local v16 = p10:GetExtentsSize().Y
						v15.CFrame = CFrame.new(0, v16, 0)
					end
				else
					return
				end
			else
				v13.Enabled = false
				return
			end
		else
			return warn((("CheckEggTimer | No Proximity Prompt found for %*"):format(p10)))
		end
	end
end
function v_u_7.Initialise(_, p_u_18)
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_4, (copy) v_u_8, (copy) v_u_17, (copy) v_u_9, (copy) v_u_5
	if p_u_18 then
		if p_u_18:GetAttribute("TimeToHatch") <= 10 then
			return
		else
			local v19 = p_u_18:GetAttribute("OWNER")
			if v19 == v_u_6.Name then
				return
			else
				local v_u_20 = v_u_1:FindFirstChild(v19)
				if v_u_20 then
					if v_u_4:GetData() then
						p_u_18:GetAttribute("OBJECT_UUID")
						v_u_8[p_u_18] = p_u_18:GetAttributeChangedSignal("TimeToHatch"):Connect(function()
							-- upvalues: (ref) v_u_17, (copy) p_u_18
							v_u_17(p_u_18)
						end)
						local v21 = p_u_18:WaitForChild("PetEgg", 10) or p_u_18
						local v22 = Instance.new("ProximityPrompt")
						v22.ActionText = "[GIFT] Skip Hatch Time"
						v22.Name = "GiftSkipPrompt"
						v22.HoldDuration = 1
						v22.Enabled = false
						v22.Parent = v21
						v22.RequiresLineOfSight = false
						v22.Style = Enum.ProximityPromptStyle.Custom
						v22:SetAttribute("Theme", "ShadowedPrompt")
						v_u_9[p_u_18] = v22.Triggered:Connect(function()
							-- upvalues: (ref) v_u_5, (copy) p_u_18, (copy) v_u_20
							v_u_5:FireServer("AuthoriseGiftHatchPurchase", p_u_18, v_u_20)
						end)
						local v23 = Instance.new("Attachment")
						v23.Parent = v21
						v23.Name = ("%*Att"):format(v22.Name)
						v23.CFrame = CFrame.new(Vector3.new(0, 0, 0))
						v22.Parent = v23
						if p_u_18:GetAttribute("TimeToHatch") > 10 then
							v22.Enabled = true
						end
						if p_u_18 then
							if v23 then
								local v24 = p_u_18:GetExtentsSize().Y
								v23.CFrame = CFrame.new(0, v24, 0)
							end
						else
							return
						end
					else
						return
					end
				else
					warn((("PetHatchEggGiftService:Initialise() | Couldn\'t find Player Instance for %*"):format(v19)))
					return
				end
			end
		end
	else
		warn("PetHatchEggGiftService:Initialise() | No ServerEgg found!")
		return
	end
end
v3({
	["Tag"] = "PetEggServer",
	["OnInstanceAdded"] = function(p25)
		-- upvalues: (copy) v_u_7
		if p25:IsDescendantOf(workspace) then
			v_u_7:Initialise(p25)
		end
	end,
	["OnInstanceRemoved"] = function(p26)
		-- upvalues: (copy) v_u_9, (copy) v_u_8
		if v_u_9[p26] then
			v_u_9[p26]:Disconnect()
			v_u_9[p26] = nil
		end
		if v_u_8[p26] then
			v_u_8[p26]:Disconnect()
			v_u_8[p26] = nil
		end
	end
})
return v_u_7