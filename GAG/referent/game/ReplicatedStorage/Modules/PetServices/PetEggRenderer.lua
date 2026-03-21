local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
game:GetService("ServerScriptService")
game:GetService("RunService")
local _ = v_u_1.Assets.SFX
local _ = v_u_1.Assets.VFX
require(v_u_1.Modules.TweenModel)
local v2 = require(v_u_1.Modules.CreateTagHandler)
local v3 = v_u_1:WaitForChild("Assets")
local v_u_4 = v3:WaitForChild("Models"):WaitForChild("EggModels")
local v_u_5 = require(v_u_1.Data.PetRegistry)
local v_u_6 = require(v_u_1.Data.PetRegistry.EggSkipProducts)
local v_u_7 = require(v_u_1.Modules.UpdateService)
local _ = v_u_5.PetList
local _ = v3.SFX
local _ = v3.VFX
game:GetService("TweenService")
local v_u_8 = v_u_1.GameEvents.PetEggService
local v9 = v_u_1.GameEvents.PetSkipped
local v10 = v_u_1.GameEvents.EggReadyToHatch_RE
local v_u_11 = {}
local v_u_12 = {}
local v_u_13 = {}
local v_u_14 = {}
for _, v15 in script.EggEffects:GetChildren() do
	v_u_11[v15.Name] = require(v15)
end
local v_u_16 = game.Players.LocalPlayer
local function v_u_24(p17, p18)
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_11
	if p17 then
		local v19 = v_u_13[p17]
		if v19 then
			local v20 = v19.Asset
			if v20 then
				local v21 = p17:GetAttribute("OBJECT_UUID")
				if v21 then
					if v20:GetAttribute("DoingHatch") then
						return
					else
						v20:SetAttribute("DoingHatch", true)
						v20.Parent = workspace.Visuals
						local v22 = v_u_14[v21]
						local v23 = p17:GetAttribute("EggName")
						if v_u_11[v23] then
							v_u_11[v23](v20, v22, p18)
							return
						elseif v23 == "Rare Egg" or (v23 == "Legendary Egg" or v23 == "Mythical Egg") then
							v_u_11.Rare(v20, v22, p18)
						else
							v_u_11.Normal(v20, v22, p18)
						end
					end
				else
					return warn("DoHatchAnim | No egg uuid!")
				end
			else
				warn("DoHatchAnim | No asset!")
				return
			end
		else
			warn("DoHatchAnim | No state data for server egg")
			return
		end
	else
		warn("DoHatchAnim | No server egg!")
		return
	end
end
local function v_u_31(p25, p26)
	-- upvalues: (copy) v_u_13, (copy) v_u_24
	if p25 then
		local v27 = v_u_13[p25]
		if v27 then
			local v28 = v27.Asset
			if v28 then
				local v29 = p25:FindFirstChild("PetEgg")
				local v30
				if v29 then
					v30 = (v29:FindFirstChild("ProximityPromptAtt") or v28):FindFirstChild("ProximityPrompt")
				else
					v30 = nil
				end
				if v30 then
					v30:Destroy()
				end
				v_u_24(p25, p26)
			else
				warn("ActivateEgg | No asset!")
			end
		else
			warn("ActivateEgg | No state data for server egg")
			return
		end
	else
		warn("ActivateEgg | No server egg!")
		return
	end
end
local function v_u_52(p32, p33)
	-- upvalues: (copy) v_u_16, (copy) v_u_13, (copy) v_u_6, (copy) v_u_7
	if p32:GetAttribute("OWNER") == v_u_16.Name then
		local v34 = p32:GetAttribute("TimeToHatch")
		local v35 = v_u_13[p32]
		if v35 then
			local v36 = v35.Asset
			if v36 then
				local v37 = p32:FindFirstChild("PetEgg")
				if not v37 and p33 then
					v37 = p32:WaitForChild("PetEgg", 5)
				end
				local v38 = v37 or p32
				local v39 = v38:FindFirstChild("ProximityPromptAtt") or p32:FindFirstChild("ProximityPromptAtt")
				local v40 = v38:FindFirstChild("SkipAllPromptAtt") or p32:FindFirstChild("SkipAllPromptAtt") or p32
				local v41 = v38:FindFirstChild("SkipPromptAtt") or p32:FindFirstChild("SkipPromptAtt")
				local v42 = (v39 or p32):FindFirstChild("ProximityPrompt")
				local v43 = v40:FindFirstChild("SkipAllPrompt")
				local v44 = (v41 or p32):FindFirstChild("SkipPrompt")
				if v42 then
					if v44 then
						if p32 and v39 then
							local v45 = p32:GetExtentsSize().Y
							v39.CFrame = CFrame.new(0, v45, 0)
						end
						if p32 and v41 then
							local v46 = p32:GetExtentsSize().Y
							v41.CFrame = CFrame.new(0, v46, 0)
						end
						local v47 = p32:GetAttribute("ShowTime")
						if not v47 and true or v47 <= workspace:GetServerTimeNow() then
							if v34 <= 0 then
								v42.Enabled = true
								v43.Enabled = false
								v44.Enabled = false
							else
								v42.Enabled = false
								local v48 = 0
								for v49, _ in v_u_13 do
									if v49:GetAttribute("OWNER") == v_u_16.Name and v49:GetAttribute("TimeToHatch") > 0 then
										v48 = v48 + 1
									end
								end
								local v50 = #v_u_6
								v43.ObjectText = ("%* Eggs"):format((math.min(v48, v50)))
								local v51
								if v48 >= 2 then
									v51 = not v_u_7:IsHiddenFromUpdate("Multi Egg Skip")
								else
									v51 = false
								end
								v43.Enabled = v51
								v44.Enabled = true
							end
						else
							v43.Enabled = false
							v42.Enabled = false
							v44.Enabled = false
							return
						end
					else
						return warn((("CheckEggTimer | No Skip Prompt found for %*"):format(v36)))
					end
				else
					return warn((("CheckEggTimer | No Proximity Prompt found for %*"):format(v36)))
				end
			else
				warn("CheckEggTimer | No asset!")
				return
			end
		else
			warn("CheckEggTimer | No state data for server egg")
			return
		end
	else
		return
	end
end
function v_u_12.RenderEgg(_, p_u_53)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_52, (copy) v_u_13, (copy) v_u_16, (copy) v_u_1, (copy) v_u_8
	if not p_u_53:GetAttribute("READY") then
		p_u_53:GetAttributeChangedSignal("READY"):Wait()
	end
	local v54 = p_u_53:GetAttribute("ShowTime")
	if v54 then
		local _ = v54 <= workspace:GetServerTimeNow()
	end
	local v55 = p_u_53:GetAttribute("EggName")
	if not v55 then
		local v56 = 0
		repeat
			task.wait(0.5)
			v55 = p_u_53:GetAttribute("EggName")
			v56 = v56 + 1
		until v56 >= 5 or v55
	end
	if v55 then
		local v57 = v_u_4:FindFirstChild(v55)
		if v57 then
			local v_u_58 = v57:Clone()
			v_u_58.PrimaryPart.Anchored = true
			local v_u_59 = v_u_5.PetEggs[v55].HatchTime
			local v60 = 1 - 0.5 * (p_u_53:GetAttribute("TimeToHatch") / v_u_59)
			v_u_58:ScaleTo((math.clamp(v60, 0.2, 1)))
			workspace.Terrain.EggParticle.WorldCFrame = p_u_53:GetPivot()
			for _, v61 in workspace.Terrain.EggParticle:GetDescendants() do
				v61:Emit(v61:GetAttribute("EmitCount"))
			end
			local v_u_62 = Vector3.new(0, 1.5, 0)
			local v_u_63 = 0
			task.spawn(function()
				-- upvalues: (ref) v_u_63, (ref) v_u_62, (copy) v_u_58, (copy) p_u_53
				while v_u_63 < 0.25 do
					v_u_63 = v_u_63 + game:GetService("RunService").Heartbeat:Wait()
					v_u_62 = (Vector3.new(0, 3, 0)):Lerp(Vector3.new(0, 0, 0), (game.TweenService:GetValue(v_u_63 / 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)))
					local v64 = v_u_58:GetExtentsSize().Y
					v_u_58:PivotTo(p_u_53:GetPivot() * CFrame.new(0, v_u_62.Y + v64 * 0.5, 0))
				end
			end)
			p_u_53:GetAttributeChangedSignal("TimeToHatch"):Connect(function()
				-- upvalues: (copy) v_u_58, (copy) p_u_53, (copy) v_u_59, (ref) v_u_62, (ref) v_u_52
				local v65 = v_u_58
				local v66 = 1 - 0.5 * (p_u_53:GetAttribute("TimeToHatch") / v_u_59)
				v65:ScaleTo((math.clamp(v66, 0.2, 1)))
				local v67 = v_u_58:GetExtentsSize().Y
				v_u_58:PivotTo(p_u_53:GetPivot() * CFrame.new(0, v_u_62.Y + v67 * 0.5, 0))
				v_u_52(p_u_53, false)
			end)
			v_u_13[p_u_53] = {
				["Asset"] = v_u_58
			}
			local v68 = v_u_58:GetExtentsSize().Y
			v_u_58:PivotTo(p_u_53:GetPivot() * CFrame.new(0, v_u_62.Y + v68 * 0.4, 0))
			v_u_58.Parent = p_u_53
			if p_u_53:GetAttribute("OWNER") == v_u_16.Name then
				local v69 = p_u_53:WaitForChild("PetEgg", 5) or p_u_53
				local v70 = v_u_1.ProximityPrompt:Clone()
				v70.ActionText = "Hatch!"
				v70.HoldDuration = 1
				v70.Enabled = false
				v70.Parent = v69
				v70.Triggered:Connect(function()
					-- upvalues: (ref) v_u_8, (copy) p_u_53
					v_u_8:FireServer("HatchPet", p_u_53)
				end)
				local v71 = v_u_1.ProximityPrompt:Clone()
				v71.Name = "SkipAllPrompt"
				v71.ActionText = "Skip All Growth"
				v71.HoldDuration = 1
				v71.KeyboardKeyCode = Enum.KeyCode.R
				v71.GamepadKeyCode = Enum.KeyCode.ButtonY
				v71.Enabled = false
				v71.Parent = v69
				v71.Triggered:Connect(function()
					-- upvalues: (ref) v_u_8, (copy) p_u_53
					v_u_8:FireServer("AuthoriseMultiPurchase", p_u_53)
				end)
				local v72 = v_u_1.ProximityPrompt:Clone()
				v72.ActionText = "Skip Growth"
				v72.Name = "SkipPrompt"
				v72.HoldDuration = 1
				v72.Enabled = false
				v72.Parent = v69
				v72.Triggered:Connect(function()
					-- upvalues: (ref) v_u_8, (copy) p_u_53
					v_u_8:FireServer("AuthorisePurchase", p_u_53)
				end)
				local v73 = Instance.new("Attachment")
				v73.Parent = v69
				v73.Name = ("%*Att"):format(v70.Name)
				v73.CFrame = CFrame.new(Vector3.new(0, 0, 0))
				v70.Parent = v73
				local v74 = Instance.new("Attachment")
				v74.Parent = v69
				v74.Name = ("%*Att"):format(v71.Name)
				v74.CFrame = CFrame.new(Vector3.new(0, -1, 0))
				v71.Parent = v74
				local v75 = Instance.new("Attachment")
				v75.Parent = v69
				v75.Name = ("%*Att"):format(v72.Name)
				v75.CFrame = CFrame.new(Vector3.new(0, 0, 0))
				v72.Parent = v75
				v_u_52(p_u_53, true)
				if p_u_53 and v73 then
					local v76 = p_u_53:GetExtentsSize().Y
					v73.CFrame = CFrame.new(0, v76, 0)
				end
				if p_u_53 and v75 then
					local v77 = p_u_53:GetExtentsSize().Y
					v75.CFrame = CFrame.new(0, v77, 0)
				end
			end
		else
			return warn((("Could not find egg model associated with %*"):format(v55)))
		end
	else
		return
	end
end
function v_u_12.DerenderEgg(_, p78)
	-- upvalues: (copy) v_u_13
	if p78 then
		local v79 = v_u_13[p78]
		if v79 then
			local v80 = v79.Asset
			if v80 then
				if not v80:GetAttribute("DoingHatch") then
					v80:Destroy()
				end
			else
				warn("PetEggRender:DerenderEgg | No asset to derender")
			end
		else
			warn("PetEggRender:DerenderEgg | No state data for server egg")
			return
		end
	else
		warn("PetEggRender:DerenderEgg | No server egg to derender")
		return
	end
end
v2({
	["Tag"] = "PetEggServer",
	["OnInstanceAdded"] = function(p81)
		-- upvalues: (copy) v_u_12
		if p81:IsDescendantOf(workspace) then
			v_u_12:RenderEgg(p81)
		end
	end,
	["OnInstanceRemoved"] = function(p82)
		-- upvalues: (copy) v_u_12
		v_u_12:DerenderEgg(p82)
	end
})
v10.OnClientEvent:Connect(function(p83, p84)
	-- upvalues: (copy) v_u_14
	v_u_14[p84] = p83
end)
v_u_8.OnClientEvent:Connect(function(p85, p86)
	-- upvalues: (copy) v_u_31
	v_u_31(p85, p86)
end)
local v_u_87 = require(script.SkipEgg)
v9.OnClientEvent:Connect(function(p88)
	-- upvalues: (copy) v_u_87
	v_u_87(p88)
end)
return v_u_12