local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v_u_2 = game:GetService("RunService")
local _ = v_u_1.Assets.SFX
local _ = v_u_1.Assets.VFX
local v_u_3 = {}
require(v_u_1.Modules.TweenModel)
local v4 = require(v_u_1.Modules.CreateTagHandler)
require(v_u_1.Modules.Notification)
require(v_u_1.Modules.UpdateService)
local v_u_5 = require(v_u_1.Modules.SoundPlayer)
local v_u_6 = require(v_u_1.Data.SoundData)
local v7 = v_u_1:WaitForChild("Assets")
local v_u_8 = require(v_u_1.Data.CosmeticRegistry).CosmeticList
local v_u_9 = require(v_u_1.Data.CosmeticCrateRegistry).CosmeticCrates
local v_u_10 = require(v_u_1.Modules.SelectiveAssetReplication)
local _ = v7.SFX
local _ = v7.VFX
game:GetService("TweenService")
local v_u_11 = v_u_1.GameEvents.CosmeticCrateService
local _ = v_u_1.GameEvents.CosmeticCrateSkipped
local v12 = v_u_1.GameEvents.CrateReadyToOpen_RE
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = game.Players.LocalPlayer
function easeOutBack(p16)
	local v17 = p16 - 1
	local v18 = math.pow(v17, 3) * 2.70158 + 1
	local v19 = p16 - 1
	return v18 + math.pow(v19, 2) * 1.70158
end
function easeInBack(p20)
	return 1.70158 * p20 * p20 * (2.70158 * p20 - 1.70158)
end
local function v_u_61(p_u_21, p_u_22)
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_2, (copy) v_u_3
	if p_u_21 then
		local v23 = v_u_13[p_u_21]
		if v23 then
			local v_u_24 = v23.Asset
			if v_u_24 then
				local v25 = p_u_21:GetAttribute("OBJECT_UUID")
				if v25 then
					if not v_u_24:GetAttribute("DoingOpen") then
						v_u_24:SetAttribute("DoingOpen", true)
						v_u_24.Parent = workspace.Visuals
						local v26 = v_u_14[v25]
						p_u_21:GetAttribute("CrateType")
						for _, v27 in v_u_24:GetDescendants() do
							if v27:IsA("Weld") then
								v27.Enabled = false
							end
						end
						local v_u_28 = p_u_21:GetPivot()
						local v_u_29 = p_u_21:GetExtentsSize()
						local v_u_30 = v_u_5:PlaySound(v_u_6.General.CosmeticCrateRenderer.CrateOpen)
						v_u_30.Ended:Once(function()
							-- upvalues: (copy) v_u_30
							v_u_30:Destroy()
						end)
						if v26 and v26 ~= "" then
							local _ = v_u_8[v26]
							local v_u_31 = v_u_10:GetAssetAsync("Cosmetics", v26):Clone()
							if v_u_31.PrimaryPart then
								v_u_31.PrimaryPart.Anchored = true
							end
							v_u_31.Parent = workspace.Visuals
							for _, v32 in v_u_31:GetDescendants() do
								if v32:IsA("BasePart") then
									v32.CanCollide = false
									v32.CanQuery = false
								end
							end
							task.spawn(function()
								-- upvalues: (copy) v_u_31, (copy) v_u_28, (copy) v_u_29, (ref) v_u_2, (copy) p_u_22, (ref) v_u_5, (ref) v_u_6
								local v33 = v_u_31:GetExtentsSize()
								local v_u_34 = v_u_28 * CFrame.new(0, -v_u_29.Y / 2, 0) * CFrame.new(0, v33.Y / 2, 0)
								local v35 = tick()
								v_u_31:ScaleTo(0.01)
								v_u_31:PivotTo(v_u_34)
								local v_u_36 = 0
								local v_u_37 = true
								task.spawn(function()
									-- upvalues: (ref) v_u_37, (ref) v_u_31, (ref) v_u_2, (ref) v_u_36, (copy) v_u_34
									while v_u_37 and v_u_31:IsDescendantOf(workspace) do
										v_u_36 = v_u_36 + v_u_2.Heartbeat:Wait()
										local v38 = v_u_36 * 3.141592653589793 * 2 / 1.5
										local v39 = math.sin(v38) * 0.5
										local v40 = v_u_36 * 65
										local v41 = math.rad(v40)
										v_u_31:PivotTo(v_u_34 * CFrame.new(0, v39, 0) * CFrame.Angles(0, v41, 0))
									end
								end)
								local v42 = 0
								while v42 < 0.8 and v_u_31:IsDescendantOf(workspace) do
									v42 = v42 + v_u_2.Heartbeat:Wait()
									local v43 = v42 / 0.8
									local v44 = math.clamp(v43, 0, 1)
									v_u_31:ScaleTo(0.01 + (p_u_22 - 0.01) * easeOutBack(v44))
								end
								while tick() - v35 < 3 and v_u_31:IsDescendantOf(workspace) do
									v_u_2.Heartbeat:Wait()
								end
								local v45 = p_u_22
								local v46 = 0
								while v46 < 0.8 and v_u_31:IsDescendantOf(workspace) do
									v46 = v46 + v_u_2.Heartbeat:Wait()
									local v47 = v46 / 0.8
									local v48 = math.clamp(v47, 0, 1)
									local v49 = easeInBack(v48)
									local v50 = v45 * (1 - math.clamp(v49, 0, 1.2))
									v_u_31:ScaleTo((math.max(v50, 0.01)))
								end
								v_u_37 = false
								local v_u_51 = v_u_5:PlaySound(v_u_6.General.PopSound, {
									["PlaybackSpeed"] = 0.5,
									["Volume"] = 1.5
								}, nil, workspace)
								v_u_51.Ended:Once(function()
									-- upvalues: (copy) v_u_51
									v_u_51:Destroy()
								end)
								v_u_31:Destroy()
							end)
						end
						local v52 = v_u_24:GetBoundingBox().Position
						local v53 = Random.new()
						for _, v54 in v_u_24:GetDescendants() do
							if v54:IsA("BasePart") then
								v54.Anchored = false
								v54.CanCollide = false
								v54.CanQuery = false
								v54.CanTouch = false
								local v55 = (v54.Position - v52).Unit * 15
								local v56 = NumberRange.new(20, 40)
								local v57 = v53:NextNumber(-10, 10)
								local v58 = v53:NextNumber(v56.Min, v56.Max)
								v54.AssemblyLinearVelocity = v55 + Vector3.new(v57, v58, v53:NextNumber(-10, 10))
								local v59 = v53:NextNumber(-3, 3)
								local v60 = v53:NextNumber(-3, 3)
								v54.AssemblyAngularVelocity = Vector3.new(v59, v60, v53:NextNumber(-3, 3))
							end
						end
						task.delay(5, function()
							-- upvalues: (copy) v_u_24, (ref) v_u_3, (copy) p_u_21
							v_u_24:SetAttribute("DoingOpen", false)
							v_u_3:DerenderCrate(p_u_21)
						end)
					end
				else
					return warn("DoOpenAnim | No Crate uuid!")
				end
			else
				warn("DoOpenAnim | No asset!")
				return
			end
		else
			warn("DoOpenAnim | No state data for server Crate")
			return
		end
	else
		warn("DoOpenAnim | No server Crate!")
		return
	end
end
local function v_u_67(p62, p63)
	-- upvalues: (copy) v_u_13, (copy) v_u_61
	if p62 then
		local v64 = v_u_13[p62]
		if v64 then
			local v65 = v64.Asset
			if v65 then
				local v66 = v65:FindFirstChild("ProximityPrompt")
				if not v66 then
					return warn((("CosmeticCrateRenderer:RenderCrate | No Proximity Prompt found for %*"):format(v65)))
				end
				v66:Destroy()
				v_u_61(p62, p63)
			else
				warn("ActivateCrate | No asset!")
			end
		else
			warn("ActivateCrate | No state data for server Crate")
			return
		end
	else
		warn("ActivateCrate | No server Crate!")
		return
	end
end
local function v_u_76(p68)
	-- upvalues: (copy) v_u_15, (copy) v_u_13, (copy) v_u_9
	if p68:GetAttribute("OWNER") == v_u_15.Name then
		local v69 = p68:GetAttribute("TimeToOpen")
		local v70 = v_u_13[p68]
		if v70 then
			local v71 = v70.Asset
			if v71 then
				local v72 = v71:FindFirstChild("ProximityPrompt")
				if not v72 then
					return warn((("CheckCrateTimer | No Proximity Prompt found for %*"):format(v71)))
				end
				local v73 = p68:GetAttribute("CrateType")
				if not v73 then
					return warn((("CheckCrateTimer | No CrateType for %*"):format(p68)))
				end
				local v74 = v_u_9[v73].TimeIsTimestamp ~= true
				v72.Enabled = v69 <= 0
				if v74 then
					local v75 = v71:FindFirstChild("SkipPrompt")
					if not v75 then
						return warn((("CheckCrateTimer | No Skip Prompt found for %*"):format(v71)))
					end
					v75.Enabled = v69 > 0
				end
			else
				warn("CheckCrateTimer | No asset!")
			end
		else
			warn("CheckCrateTimer | No state data for server Crate")
			return
		end
	else
		return
	end
end
function v_u_3.RenderCrate(_, p_u_77)
	-- upvalues: (copy) v_u_10, (copy) v_u_76, (copy) v_u_13, (copy) v_u_15, (copy) v_u_1, (copy) v_u_11, (copy) v_u_9
	if not p_u_77:GetAttribute("READY") then
		p_u_77:GetAttributeChangedSignal("READY"):Wait()
	end
	local v78 = p_u_77:GetAttribute("CrateType")
	if not v78 then
		local v79 = 0
		repeat
			task.wait(0.5)
			v78 = p_u_77:GetAttribute("CrateType")
			print("tryting to CrateType for", p_u_77:GetFullName(), v78)
			v79 = v79 + 1
		until v79 >= 5 or v78
	end
	if v78 then
		local v80 = v_u_10:GetAssetAsync("CrateModels", v78, 5)
		if v80 then
			local v_u_81 = v80:Clone()
			v_u_81.PrimaryPart.Anchored = true
			local v_u_82 = Vector3.new(0, 1.5, 0)
			local v_u_83 = 0
			task.spawn(function()
				-- upvalues: (ref) v_u_83, (ref) v_u_82, (copy) v_u_81, (copy) p_u_77
				while v_u_83 < 0.25 do
					v_u_83 = v_u_83 + game:GetService("RunService").Heartbeat:Wait()
					v_u_82 = (Vector3.new(0, 3, 0)):Lerp(Vector3.new(0, 0, 0), (game.TweenService:GetValue(v_u_83 / 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)))
					local v84 = v_u_81:GetExtentsSize().Y
					v_u_81:PivotTo(p_u_77:GetPivot() * CFrame.new(0, v_u_82.Y + v84 * 0.5, 0))
				end
			end)
			p_u_77:GetAttributeChangedSignal("TimeToOpen"):Connect(function()
				-- upvalues: (ref) v_u_76, (copy) p_u_77
				v_u_76(p_u_77)
			end)
			v_u_13[p_u_77] = {
				["Asset"] = v_u_81
			}
			local v85 = v_u_81:GetExtentsSize().Y
			v_u_81:PivotTo(p_u_77:GetPivot() * CFrame.new(0, v_u_82.Y + v85 * 0.4, 0))
			v_u_81.Parent = p_u_77
			if p_u_77:GetAttribute("OWNER") == v_u_15.Name then
				local v86 = v_u_1.ProximityPrompt:Clone()
				if not v86 then
					return warn("CosmeticCrateRenderer:RenderCrate | No Proximity Prompt found in ReplicatedStorage!")
				end
				v86.Parent = v_u_81
				v86.ActionText = "Open!"
				v86.HoldDuration = 1
				v86.Enabled = false
				v86.Triggered:Connect(function()
					-- upvalues: (ref) v_u_11, (copy) p_u_77
					v_u_11:FireServer("OpenCrate", p_u_77)
				end)
				if v_u_9[v78].TimeIsTimestamp ~= true then
					local v87 = v_u_1.ProximityPrompt:Clone()
					if not v87 then
						return warn("CosmeticCrateRenderer:RenderCrate | No Proximity Prompt found in ReplicatedStorage!")
					end
					v87.Parent = v_u_81
					v87.ActionText = "Skip Open Time"
					v87.Name = "SkipPrompt"
					v87.HoldDuration = 1
					v87.Enabled = false
					v87.Triggered:Connect(function()
						-- upvalues: (ref) v_u_11, (copy) p_u_77
						v_u_11:FireServer("AuthorisePurchase", p_u_77)
					end)
				end
				v_u_76(p_u_77)
			end
		else
			return warn((("Could not find Crate model associated with %*"):format(v78)))
		end
	else
		return
	end
end
function v_u_3.DerenderCrate(_, p88)
	-- upvalues: (copy) v_u_13
	if p88 then
		local v89 = v_u_13[p88]
		if v89 then
			local v90 = v89.Asset
			if v90 then
				if not v90:GetAttribute("DoingOpen") then
					v90:Destroy()
					v_u_13[p88] = nil
				end
			else
				warn("CosmeticCrateRenderer:DerenderCrate | No asset to derender")
			end
		else
			warn("CosmeticCrateRenderer:DerenderCrate | No state data for server Crate")
			return
		end
	else
		warn("CosmeticCrateRenderer:DerenderCrate | No server Crate to derender")
		return
	end
end
v4({
	["Tag"] = "CosmeticCrateServer",
	["OnInstanceAdded"] = function(p91)
		-- upvalues: (copy) v_u_3
		if p91:IsDescendantOf(workspace) then
			v_u_3:RenderCrate(p91)
		end
	end,
	["OnInstanceRemoved"] = function(p92)
		-- upvalues: (copy) v_u_3
		v_u_3:DerenderCrate(p92)
	end
})
v12.OnClientEvent:Connect(function(p93, p94)
	-- upvalues: (copy) v_u_14
	v_u_14[p94] = p93
end)
v_u_11.OnClientEvent:Connect(function(p95, p96)
	-- upvalues: (copy) v_u_67
	v_u_67(p95, p96)
end)
return v_u_3