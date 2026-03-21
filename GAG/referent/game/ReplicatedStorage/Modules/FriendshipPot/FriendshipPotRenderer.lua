local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v_u_2 = game:GetService("Players")
game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("ReplicatedFirst")
local v_u_6 = game:GetService("StarterGui")
local v_u_7 = game:GetService("SocialService")
local v8 = v1:WaitForChild("Assets")
local v_u_9 = v8:WaitForChild("Models"):WaitForChild("FriendshipPots")
local _ = v8.SFX
local _ = v8.VFX
require(v1.Modules.TweenModel)
local v10 = require(v1.Modules.CreateTagHandler)
require(v1.Modules.Notification)
require(v1.Modules.UpdateService)
require(v1.Data.FriendshipPots)
local v_u_11 = require(v1.Modules.FriendInvitePrompterService)
local v_u_12 = require(v1.Modules.FriendsAPI)
local v_u_13 = v1.GameEvents.FriendshipPotService_RE
local v_u_14 = {}
local v_u_15 = game.Players.LocalPlayer
local v_u_16 = {}
local v_u_17 = v5.DayInSeconds.Value
function v_u_14.UpdatePot(_, p18)
	-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_2, (copy) v_u_12, (copy) v_u_15, (copy) v_u_11
	debug.traceback("Trace")
	if p18 then
		local v19 = v_u_16[p18]
		if v19 then
			local v20 = v19.Asset
			if v20 then
				local v21 = v20:FindFirstChild("Grow")
				if v21 then
					local v22 = v21:FindFirstChild("Age")
					if v22 then
						local v23 = p18:GetAttribute("CurrentStreak")
						if v23 then
							local v24 = p18:GetAttribute("LastTendTime")
							if v24 then
								local v25 = p18:GetAttribute("LastStreakTime")
								if v25 then
									local v26 = p18:GetAttribute("LinkedPlayerID")
									if v26 then
										local v27 = p18:GetAttribute("OWNER")
										if v27 then
											local v28 = p18:GetAttribute("StreakFailTime") or 0
											local v29 = workspace:GetServerTimeNow() / v_u_17
											local v30 = math.floor(v29)
											local v31 = v24 / v_u_17
											local v32 = math.floor(v31)
											local v33 = v25 / v_u_17
											local v34 = math.floor(v33)
											local v35 = v30 <= v32
											local _ = v30 <= v34
											if v35 then
												v35 = v34 < v30
											end
											local v36 = v23 + (v35 and 1 or 0)
											local v37 = v_u_16[p18].RestorePrompt
											local v38 = v28 / v_u_17
											local v39 = math.floor(v38)
											local v40
											if v34 > 0 then
												v40 = v34 + 1 < v30
											else
												v40 = false
											end
											local v41
											if v39 > 0 then
												v41 = v30 <= v39 + 1
											else
												v41 = false
											end
											if v37 then
												v37.Enabled = v40 and v41
											end
											local v42 = v_u_16[p18].TendPrompt
											if v42 then
												local v43 = v_u_2:FindFirstChild(v27)
												if v32 == v30 then
													v43 = false
												elseif v43 then
													v43 = v_u_12:IsFriendsWithImmediate(v_u_15, v43)
												end
												v42.Enabled = v43
											end
											local v44 = v_u_16[p18].InteractionPrompt
											if v44 then
												local v45 = nil
												local v46 = v_u_2:GetPlayerByUserId(v26)
												local v47
												if v46 or (not v_u_12:IsFriendsWithImmediate(v_u_15, v26) or (not v_u_11.CanSendGameInvite or v30 == v32)) then
													v47 = v46 and not v_u_12:IsFriendsWithImmediate(v_u_15, v26) and "Friend" or v45
												else
													local v48 = p18:GetAttribute("LinkedPlayerID_NAME")
													v47 = (not v48 or v48 == "UNKNOWN") and "Invite" or "Invite " .. v48
												end
												if v47 then
													v44.ActionText = v47
													v44.Enabled = true
												else
													v44.Enabled = false
												end
											end
											v22.Value = v36
										end
									else
										return
									end
								else
									return
								end
							else
								return
							end
						else
							return
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end
function v_u_14.UpdateAllPots(_)
	-- upvalues: (copy) v_u_16, (copy) v_u_14
	for v49, _ in v_u_16 do
		v_u_14:UpdatePot(v49)
	end
end
function v_u_14.PotMoved(_, p50)
	-- upvalues: (copy) v_u_16
	if p50 then
		local v51 = v_u_16[p50]
		if v51 then
			local v52 = v51.Asset
			if v52 then
				local v53 = p50:GetPivot()
				local v54 = v52:GetPivot()
				v52:PivotTo(CFrame.new(v53.X, v54.Y, v53.Z) * v53.Rotation)
			end
		else
			return
		end
	else
		return
	end
end
function v_u_14.RenderPot(_, p_u_55)
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_3, (copy) v_u_16, (copy) v_u_15, (copy) v_u_13, (copy) v_u_17, (copy) v_u_2, (copy) v_u_12, (copy) v_u_11, (copy) v_u_7, (copy) v_u_6, (copy) v_u_14
	if not p_u_55:GetAttribute("READY") then
		p_u_55:GetAttributeChangedSignal("READY"):Wait()
	end
	local v56 = p_u_55:GetAttribute("PotType")
	if not v56 then
		local v57 = 0
		repeat
			task.wait(0.5)
			v56 = p_u_55:GetAttribute("PotType")
			v57 = v57 + 1
		until v57 >= 5 or v56
	end
	if v56 then
		local v58 = v_u_9:FindFirstChild(v56)
		if not v58 then
			return warn((("Could not find Pot model associated with %*"):format(v56)))
		end
		local v_u_59 = v58:Clone()
		v_u_59.PrimaryPart.Anchored = true
		local v_u_60 = Vector3.new(0, 0, 0)
		task.spawn(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_3, (ref) v_u_60, (copy) v_u_59, (copy) p_u_55
			local v61 = 0
			while v61 < 0.25 do
				v61 = v61 + v_u_4.RenderStepped:Wait()
				v_u_60 = (Vector3.new(0, 3, 0)):Lerp(Vector3.new(0, 0, 0), (v_u_3:GetValue(v61 / 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)))
				local v62 = v_u_59:GetExtentsSize().Y
				v_u_59:PivotTo(p_u_55:GetPivot() * CFrame.new(0, v_u_60.Y + v62 * 0.5, 0))
			end
			local v63 = v_u_59:FindFirstChild("Generate")
			if v63 then
				v63.Enabled = true
			end
		end)
		v_u_16[p_u_55] = {
			["Asset"] = v_u_59
		}
		local v64 = v_u_59:GetExtentsSize().Y
		v_u_59:PivotTo(p_u_55:GetPivot() * CFrame.new(0, v_u_60.Y + v64 * 0.4, 0))
		v_u_59.Parent = p_u_55
		if p_u_55:GetAttribute("LinkedPlayerID") == v_u_15.UserId then
			local v65 = Instance.new("ProximityPrompt")
			v65.Name = "TendPrompt"
			v65.Parent = v_u_59.PrimaryPart
			v65.ActionText = "Tend!"
			v65.HoldDuration = 1
			v65.Enabled = true
			v65.RequiresLineOfSight = false
			v65.Style = Enum.ProximityPromptStyle.Custom
			v65:SetAttribute("Theme", "ShadowedPrompt")
			v65.Triggered:Connect(function()
				-- upvalues: (ref) v_u_13, (copy) p_u_55
				v_u_13:FireServer("TendPot", p_u_55)
			end)
			v_u_16[p_u_55].TendPrompt = v65
		end
		if p_u_55:GetAttribute("OWNER") == v_u_15.Name then
			local v66 = Instance.new("ProximityPrompt")
			v66.Name = "InteractionPrompt"
			v66.ActionText = "???"
			v66.HoldDuration = 1
			v66.Enabled = false
			v66.RequiresLineOfSight = false
			v66.Style = Enum.ProximityPromptStyle.Custom
			v66:SetAttribute("Theme", "ShadowedPrompt")
			local v67 = Instance.new("Attachment")
			v67.Position = Vector3.new(0, 2.6, 0)
			v67.Parent = v_u_59.PrimaryPart
			v66.Parent = v67
			v66.Triggered:Connect(function()
				-- upvalues: (copy) p_u_55, (ref) v_u_17, (ref) v_u_2, (ref) v_u_12, (ref) v_u_15, (ref) v_u_11, (ref) v_u_7, (ref) v_u_6
				local v68 = p_u_55:GetAttribute("LinkedPlayerID")
				if v68 then
					local v69 = p_u_55:GetAttribute("LastTendTime")
					if v69 then
						local v70 = workspace:GetServerTimeNow() / v_u_17
						local v71 = math.floor(v70)
						local v72 = v69 / v_u_17
						local v73 = math.floor(v72)
						local v_u_74 = v_u_2:GetPlayerByUserId(v68)
						if v_u_74 or (not v_u_12:IsFriendsWithImmediate(v_u_15, v68) or (not v_u_11.CanSendGameInvite or v71 == v73)) then
							if v_u_74 and not v_u_12:IsFriendsWithImmediate(v_u_15, v68) then
								pcall(function()
									-- upvalues: (ref) v_u_6, (copy) v_u_74
									v_u_6:SetCore("PromptSendFriendRequest", v_u_74)
								end)
							end
						else
							local v75 = p_u_55:GetAttribute("LinkedPlayerID_NAME")
							local v_u_76 = Instance.new("ExperienceInviteOptions")
							v_u_76.InviteUser = v68
							v_u_76.PromptMessage = (not v75 or v75 == "UNKNOWN") and "Invite your friend to Tend your pot" or ("Invite %* to Tend your pot"):format(v75)
							pcall(function()
								-- upvalues: (ref) v_u_7, (ref) v_u_15, (copy) v_u_76
								v_u_7:PromptGameInvite(v_u_15, v_u_76)
							end)
						end
					else
						return
					end
				else
					return
				end
			end)
			v_u_16[p_u_55].InteractionPrompt = v66
		end
		if p_u_55:GetAttribute("OWNER") == v_u_15.Name then
			local v77 = Instance.new("ProximityPrompt")
			v77.Name = "RestorePrompt"
			v77.ActionText = "Restore Streak!"
			v77.HoldDuration = 1
			v77.Enabled = false
			v77.RequiresLineOfSight = false
			v77.Style = Enum.ProximityPromptStyle.Custom
			v77.Parent = v_u_59.PrimaryPart
			v77:SetAttribute("Theme", "ShadowedPrompt")
			v77.Triggered:Connect(function()
				-- upvalues: (ref) v_u_13, (copy) p_u_55
				v_u_13:FireServer("TryRestoreStreak", p_u_55)
			end)
			v_u_16[p_u_55].RestorePrompt = v77
		end
		v_u_16[p_u_55].AttribConnection = p_u_55.AttributeChanged:Connect(function(p78)
			-- upvalues: (ref) v_u_14, (copy) p_u_55
			if p78 == "CurrentStreak" or (p78 == "LastTendTime" or (p78 == "LastStreakTime" or (p78 == "StreakFailTime" or (p78 == "LinkedPlayerID" or p78 == "LinkedPlayerID_NAME")))) then
				v_u_14:UpdatePot(p_u_55)
			end
		end)
		v_u_16[p_u_55].PlayerAddedConnection = v_u_2.PlayerAdded:Connect(function()
			-- upvalues: (ref) v_u_14, (copy) p_u_55
			v_u_14:UpdatePot(p_u_55)
		end)
		v_u_16[p_u_55].PlayerRemovingConnection = v_u_2.PlayerRemoving:Connect(function(p79)
			-- upvalues: (ref) v_u_2, (ref) v_u_14, (copy) p_u_55
			while p79:IsDescendantOf(v_u_2) do
				task.wait()
			end
			v_u_14:UpdatePot(p_u_55)
		end)
		v_u_16[p_u_55].FriendUpdatedConnection = v_u_12:OnFriendshipUpdate(v_u_15, function()
			-- upvalues: (ref) v_u_14, (copy) p_u_55
			v_u_14:UpdatePot(p_u_55)
		end)
		v_u_14:UpdatePot(p_u_55)
	end
end
function v_u_14.DerenderPot(_, p80)
	-- upvalues: (copy) v_u_16
	if p80 then
		local v81 = v_u_16[p80]
		if v81 then
			if v81.Asset then
				v81.Asset:Destroy()
			end
			if v81.AttribConnection then
				v81.AttribConnection:Disconnect()
			end
			if v81.PlayerAddedConnection then
				v81.PlayerAddedConnection:Disconnect()
			end
			if v81.PlayerRemovingConnection then
				v81.PlayerRemovingConnection:Disconnect()
			end
			if v81.FriendUpdatedConnection then
				v81.FriendUpdatedConnection:Disconnect()
			end
			v_u_16[p80] = nil
		else
			warn("FriendshipPotRenderer:DerenderPot | No state data for server Pot")
		end
	else
		warn("FriendshipPotRenderer:DerenderPot | No server Pot to derender")
		return
	end
end
v10({
	["Tag"] = "FriendshipPotServer",
	["OnInstanceAdded"] = function(p82)
		-- upvalues: (copy) v_u_14
		if p82:IsDescendantOf(workspace) then
			v_u_14:RenderPot(p82)
		end
	end,
	["OnInstanceRemoved"] = function(p83)
		-- upvalues: (copy) v_u_14
		v_u_14:DerenderPot(p83)
	end
})
local v_u_84 = { "UpdateAllPots", "PotMoved" }
v_u_13.OnClientEvent:Connect(function(p85, ...)
	-- upvalues: (copy) v_u_84, (copy) v_u_14
	if table.find(v_u_84, p85) then
		local v86 = v_u_14[p85]
		if v86 then
			v86(v_u_14, ...)
		end
	else
		return
	end
end)
return v_u_14