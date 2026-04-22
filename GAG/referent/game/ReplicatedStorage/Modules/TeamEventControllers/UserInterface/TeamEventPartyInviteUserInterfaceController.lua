local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Debris")
local v_u_5 = game:GetService("SocialService")
local v_u_6 = v_u_1.LocalPlayer
local v7 = v_u_6:WaitForChild("PlayerGui")
local v_u_8 = v7:WaitForChild("TeamEventPartyInvite_UI")
local v_u_9 = v7:WaitForChild("Gift_Notification")
local v_u_10 = v_u_8.TeamInvites
local v_u_11 = v_u_10.Size
local v_u_12 = v_u_10.Header.Close
local v13 = v_u_10.Main.Search
local v_u_14 = v13.Bar.TextBox
local v_u_15 = v13.ScrollingFrame
local v_u_16 = v_u_15.PlayerTemplate
local v_u_17 = require(v2.Modules.GuiController)
local v_u_18 = require(v2.Field_Of_View_Module)
local v_u_19 = require(v2.Blur_Module)
local v_u_20 = require(v2.Modules.SetupButton)
local v_u_21 = require(v2.Modules.Spring)
local v_u_22 = require(v2.Modules.TeamEventControllers.TeamEventController)
local v_u_23 = require(v2.Modules.TeamEventControllers.TeamEventPartyController)
local v_u_24 = require(v2.Modules.ConfirmationPromptController)
local v_u_25 = require(v2.Modules.Notification)
require(v2.Modules.TeamEventHelper)
local v_u_26 = v_u_17:GetStateForGui(v_u_8)
v_u_26.ChangeEnabled:Set(true)
local v_u_27 = Enum.ThumbnailType.HeadShot
local v_u_28 = Enum.ThumbnailSize.Size100x100
local v_u_29 = v_u_10.Main.TeamMembers.Members
local v_u_30 = v_u_29:WaitForChild("MemberTemplate")
v_u_30.Visible = false
local v_u_31 = script:WaitForChild("PartyInvite")
local v_u_32 = {}
local v_u_33 = {
	["State"] = {
		["Visible"] = false,
		["SearchQuery"] = "",
		["PlayerList"] = {},
		["FilteredList"] = {},
		["Pool"] = {},
		["PoolSize"] = 0,
		["ItemHeight"] = 0,
		["ListPadding"] = 0,
		["SpawnedMembers"] = {},
		["InviteQueue"] = {},
		["ActivePopup"] = nil
	}
}
local function v_u_44()
	-- upvalues: (copy) v_u_1, (copy) v_u_6
	local v34 = {}
	local v35 = {}
	for _, v36 in v_u_1:GetPlayers() do
		if v36 ~= v_u_6 then
			local v37 = {
				["UserId"] = v36.UserId,
				["DisplayName"] = v36.DisplayName,
				["Username"] = v36.Name,
				["InServer"] = true
			}
			table.insert(v34, v37)
			v35[v36.UserId] = true
		end
	end
	local v38, v_u_39 = pcall(function()
		-- upvalues: (ref) v_u_1, (ref) v_u_6
		return v_u_1:GetFriendsAsync(v_u_6.UserId)
	end)
	if v38 then
		while true do
			for _, v40 in v_u_39:GetCurrentPage() do
				if not v35[v40.Id] then
					local v41 = {
						["UserId"] = v40.Id,
						["DisplayName"] = v40.DisplayName,
						["Username"] = v40.Username,
						["InServer"] = false
					}
					table.insert(v34, v41)
					v35[v40.Id] = true
				end
			end
			if v_u_39.IsFinished or not pcall(function()
				-- upvalues: (copy) v_u_39
				v_u_39:AdvanceToNextPageAsync()
			end) then
				goto l6
			end
		end
	else
		::l6::
		table.sort(v34, function(p42, p43)
			if p42.InServer == p43.InServer then
				return p42.DisplayName < p43.DisplayName
			else
				return p42.InServer
			end
		end)
		return v34
	end
end
local function v_u_50(p45, p46)
	if p46 == "" then
		return p45
	end
	local v47 = p46:lower()
	local v48 = {}
	for _, v49 in p45 do
		if v49.DisplayName:lower():find(v47, 1, true) or v49.Username:lower():find(v47, 1, true) then
			table.insert(v48, v49)
		end
	end
	return v48
end
local function v_u_64(p_u_51, p_u_52)
	-- upvalues: (copy) v_u_23, (copy) v_u_3, (copy) v_u_32, (copy) v_u_1, (copy) v_u_27, (copy) v_u_28
	local v53 = p_u_52.UserId
	local v54 = p_u_51:FindFirstChild("Add")
	if v54 then
		v54 = v54:FindFirstChild("ActualAddButton")
	end
	if v54 then
		v54 = v54:FindFirstChild("Text")
	end
	if not (v54 and v54:IsA("TextLabel")) then
		v54 = nil
	end
	if v54 then
		v54.Text = v_u_23:HasOutboundInvite("CandyPackaging", v53) and "\226\156\147" or "+"
	end
	if p_u_51:GetAttribute("CurrentUserId") ~= p_u_52.UserId then
		p_u_51:SetAttribute("CurrentUserId", p_u_52.UserId)
		local v55 = p_u_51.PlayerName
		v55.Text = p_u_52.DisplayName
		v55.TextTransparency = 1
		v_u_3:Create(v55, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["TextTransparency"] = 0
		}):Play()
		local v56 = v55:FindFirstChildWhichIsA("UIStroke")
		if v56 then
			v56.Transparency = 1
			v_u_3:Create(v56, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["Transparency"] = 0
			}):Play()
		end
		local v_u_57 = p_u_51.PlayerImage.ImageLabel
		local v58 = v_u_32[p_u_52.UserId]
		if v58 then
			v_u_57.Image = v58
			v_u_57.ImageTransparency = 1
			v_u_3:Create(v_u_57, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["ImageTransparency"] = 0
			}):Play()
		else
			v_u_57.Image = ""
			v_u_57.ImageTransparency = 1
			local v_u_59 = p_u_52.UserId
			local function v_u_61(p60)
				-- upvalues: (copy) p_u_51, (copy) p_u_52, (copy) v_u_57, (ref) v_u_3
				if p_u_51:GetAttribute("CurrentUserId") == p_u_52.UserId then
					v_u_57.Image = p60
					v_u_3:Create(v_u_57, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						["ImageTransparency"] = 0
					}):Play()
				end
			end
			if v_u_32[v_u_59] then
				v_u_61(v_u_32[v_u_59])
			else
				task.spawn(function()
					-- upvalues: (ref) v_u_1, (copy) v_u_59, (ref) v_u_27, (ref) v_u_28, (ref) v_u_32, (copy) v_u_61
					local v62, v63 = pcall(function()
						-- upvalues: (ref) v_u_1, (ref) v_u_59, (ref) v_u_27, (ref) v_u_28
						return v_u_1:GetUserThumbnailAsync(v_u_59, v_u_27, v_u_28)
					end)
					if v62 and v63 then
						v_u_32[v_u_59] = v63
						v_u_61(v63)
					end
				end)
			end
		end
		p_u_51.NativeInvite.Visible = not p_u_52.InServer
		p_u_51.Add.Visible = p_u_52.InServer
	end
end
function v_u_33.Render(_)
	-- upvalues: (copy) v_u_33, (copy) v_u_50, (copy) v_u_15, (copy) v_u_64
	local v65 = v_u_33.State
	v65.FilteredList = v_u_50(v65.PlayerList, v65.SearchQuery)
	local v66 = v65.FilteredList
	local v67 = #v66
	local v68 = v65.ItemHeight
	local v69 = v65.ListPadding
	if v68 > 0 then
		local v70 = v68 + v69
		local v71 = v67 <= 0 and 0 or v67 * v68 + (v67 - 1) * v69
		v_u_15.CanvasSize = UDim2.new(0, 0, 0, v71)
		local v72 = v_u_15.CanvasPosition.Y
		local v73 = v_u_15.AbsoluteSize.Y
		local v74 = v72 / v70
		local v75 = math.floor(v74) + 1 - 2
		local v76 = math.max(1, v75)
		local v77 = (v72 + v73) / v70
		local v78 = math.ceil(v77) + 2
		local v79 = math.min(v67, v78)
		for _, v80 in v65.Pool do
			v80.Visible = false
		end
		for v81 = v76, v79 do
			local v82 = v66[v81]
			if v82 then
				local v83 = (v81 - 1) % v65.PoolSize + 1
				local v84 = v65.Pool[v83]
				v84.Visible = true
				v84.Position = UDim2.new(0, 0, 0, (v81 - 1) * v70)
				v_u_64(v84, v82)
			end
		end
	end
end
local function v_u_89(p85)
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if p85:GetAttribute("CurrentUserId") then
		local v86 = p85:GetAttribute("CurrentUserId")
		if v86 then
			local v_u_87 = false
			pcall(function()
				-- upvalues: (ref) v_u_87, (ref) v_u_5, (ref) v_u_6
				v_u_87 = v_u_5:CanSendGameInviteAsync(v_u_6)
			end)
			if v_u_87 then
				local v_u_88 = Instance.new("ExperienceInviteOptions")
				v_u_88.InviteUser = v86
				pcall(function()
					-- upvalues: (ref) v_u_5, (ref) v_u_6, (copy) v_u_88
					v_u_5:PromptGameInvite(v_u_6, v_u_88)
				end)
			end
		end
	else
		return
	end
end
local function v_u_97(p90)
	-- upvalues: (copy) v_u_23, (copy) v_u_25, (copy) v_u_33, (copy) v_u_5, (copy) v_u_6
	local v91 = p90:GetAttribute("CurrentUserId")
	if not v91 then
		return
	end
	if v_u_23:HasOutboundInvite("CandyPackaging", v91) then
		return
	end
	if not v_u_23:CanInvite("CandyPackaging") then
		v_u_25:CreateNotification("Only the party leader can send invites.")
		return
	end
	for _, v93 in v_u_33.State.PlayerList do
		if v93.UserId == v91 then
			goto l10
		end
	end
	local v93 = nil
	::l10::
	if v93 and not v93.InServer then
		local v_u_94 = false
		pcall(function()
			-- upvalues: (ref) v_u_94, (ref) v_u_5, (ref) v_u_6
			v_u_94 = v_u_5:CanSendGameInviteAsync(v_u_6)
		end)
		if v_u_94 then
			local v_u_95 = Instance.new("ExperienceInviteOptions")
			v_u_95.InviteUser = v91
			pcall(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_6, (copy) v_u_95
				v_u_5:PromptGameInvite(v_u_6, v_u_95)
			end)
		end
	else
		local v96 = p90:FindFirstChild("Add")
		if v96 then
			v96 = v96:FindFirstChild("ActualAddButton")
		end
		if v96 then
			v96 = v96:FindFirstChild("Text")
		end
		if not (v96 and v96:IsA("TextLabel")) then
			v96 = nil
		end
		if v96 then
			v96.Text = "\226\156\147"
		end
		v_u_23:Invite("CandyPackaging", v91)
	end
end
function v_u_33.RenderMembers(_)
	-- upvalues: (copy) v_u_33, (copy) v_u_23, (copy) v_u_6, (copy) v_u_30, (copy) v_u_29, (copy) v_u_1, (copy) v_u_8
	local v98 = v_u_33.State
	local v99 = v_u_23:GetTeamData("CandyPackaging")
	local v100 = v99 and v99.members or {
		[v_u_6.UserId] = 0
	}
	local v101 = v99 and (v99.metadata and v99.metadata.captain) or v_u_6.UserId
	for v102, v103 in v98.SpawnedMembers do
		if v100[v102] == nil then
			v103:Destroy()
			v98.SpawnedMembers[v102] = nil
		end
	end
	local v104 = 0
	for v_u_105 in v100 do
		v104 = v104 + 1
		local v_u_106 = v98.SpawnedMembers[v_u_105]
		if not v_u_106 then
			v_u_106 = v_u_30:Clone()
			v_u_106.Name = ("Member_%*"):format(v_u_105)
			v_u_106.Visible = true
			v_u_106.Parent = v_u_29
			v98.SpawnedMembers[v_u_105] = v_u_106
			local v107 = v_u_106:FindFirstChild("PlayerHeadshot")
			if v107 then
				v107.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=180&h=180"):format(v_u_105)
			end
			local v_u_108 = v_u_106:FindFirstChild("MemberName")
			if v_u_108 then
				local v109 = v_u_1:GetPlayerByUserId(v_u_105)
				if v109 then
					v_u_108.Text = v109.DisplayName
				else
					v_u_108.Text = "..."
					task.spawn(function()
						-- upvalues: (ref) v_u_1, (copy) v_u_105, (ref) v_u_106, (copy) v_u_108
						local v110, v111 = pcall(function()
							-- upvalues: (ref) v_u_1, (ref) v_u_105
							return v_u_1:GetNameFromUserIdAsync(v_u_105)
						end)
						if v110 and v_u_106.Parent then
							v_u_108.Text = v111
						end
					end)
				end
			end
		end
		local v112 = v_u_105 == v101
		v_u_106.LayoutOrder = v112 and 0 or 1
		local v113 = v_u_106:FindFirstChild("Leader")
		if v113 then
			v113.Visible = v112
		end
	end
	v_u_8.TeamInvites.Main.TeamMembers.LeaveTeam.Visible = v104 > 1
end
local function v_u_116(p114)
	-- upvalues: (copy) v_u_21, (copy) v_u_4
	if p114 and not p114:HasTag("_fadingOut") then
		p114:AddTag("_fadingOut")
		local v115 = p114.Wrapper.Canvas
		v_u_21.target(p114.Wrapper.DropShadow, 1, 3, {
			["ImageTransparency"] = 1
		})
		v_u_21.target(v115.UIStroke, 1, 3, {
			["Transparency"] = 1
		})
		v_u_21.target(v115, 1, 3, {
			["Position"] = UDim2.fromScale(0.65, 0.5),
			["GroupTransparency"] = 1
		})
		v_u_4:AddItem(p114, 1)
	end
end
local v_u_117 = nil
local function v_u_125(p118, p119, p120, p121)
	-- upvalues: (copy) v_u_33, (ref) v_u_117
	local v122 = v_u_33.State
	if not v122.ActivePopup or (v122.ActivePopup.inviterUid ~= p119 or v122.ActivePopup.eventName ~= p118) then
		for _, v123 in v122.InviteQueue do
			if v123.inviterUid == p119 and v123.eventName == p118 then
				return
			end
		end
		local v124 = v122.InviteQueue
		table.insert(v124, {
			["eventName"] = p118,
			["inviterUid"] = p119,
			["displayName"] = p120,
			["expiresAt"] = p121
		})
		v_u_117()
	end
end
v_u_117 = function()
	-- upvalues: (copy) v_u_33, (ref) v_u_117, (copy) v_u_31, (copy) v_u_3, (copy) v_u_21, (copy) v_u_24, (copy) v_u_116, (copy) v_u_20, (copy) v_u_6, (copy) v_u_23, (copy) v_u_9
	local v_u_126 = v_u_33.State
	if v_u_126.ActivePopup then
		return
	else
		local v_u_127 = table.remove(v_u_126.InviteQueue, 1)
		if v_u_127 then
			local v128 = v_u_127.expiresAt - os.time()
			if v128 <= 0 then
				v_u_117()
			else
				local v_u_129 = v_u_31:Clone()
				local v130 = v_u_129.Wrapper.Canvas
				local v131 = v130.Segment.Main
				local v132 = v_u_129.Wrapper.DropShadow
				local v133 = v131.Profile.Holder.PLAYER_IMAGE
				local v134 = v131.Timeout
				v134.Size = UDim2.fromScale(0, 1)
				v133.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=180&h=180"):format(v_u_127.inviterUid)
				v131.SENDER_NAME.Text = v_u_127.displayName
				v131.SENDER_NAME_SHADOW.Text = v_u_127.displayName
				if v131:FindFirstChild("PromptText") then
					v131.PromptText.Text = "has invited you to join their Candy Packaging Event team!"
				end
				if v131:FindFirstChild("PromptTextShadow") then
					v131.PromptTextShadow.Text = "has invited you to join their Candy Packaging Event team!"
				end
				v130.GroupTransparency = 1
				v_u_129.Wrapper.Position = UDim2.fromScale(0.65, 0.5)
				v130.UIStroke.Transparency = 1
				v132.ImageTransparency = 1
				v134.Size = UDim2.fromScale(1, 0.05)
				local v135 = v134.BackgroundColor3
				v_u_3:Create(v134, TweenInfo.new(v128, Enum.EasingStyle.Exponential), {
					["BackgroundColor3"] = v135:Lerp(Color3.new(1, 0, 0), 0.75),
					["Size"] = UDim2.fromScale(0, 0.05)
				}):Play()
				v_u_21.target(v132, 1, 3, {
					["ImageTransparency"] = 0.6
				})
				v_u_21.target(v130.UIStroke, 1, 3, {
					["Transparency"] = 0
				})
				v_u_21.target(v130, 1, 3, {
					["GroupTransparency"] = 0
				})
				v_u_21.target(v_u_129.Wrapper, 1, 3, {
					["Position"] = UDim2.fromScale(0.5, 0.5)
				})
				local v_u_136 = {
					["popup"] = v_u_129,
					["eventName"] = v_u_127.eventName,
					["inviterUid"] = v_u_127.inviterUid
				}
				v_u_126.ActivePopup = v_u_136
				local v_u_137 = nil
				local function v_u_138()
					-- upvalues: (copy) v_u_126, (copy) v_u_136, (ref) v_u_137, (ref) v_u_24, (ref) v_u_116, (copy) v_u_129, (ref) v_u_117
					if v_u_126.ActivePopup == v_u_136 then
						v_u_126.ActivePopup = nil
						if v_u_137 then
							pcall(task.cancel, v_u_137)
							v_u_137 = nil
						end
						v_u_24:Close("Join Party")
						v_u_116(v_u_129)
						task.delay(0.5, v_u_117)
					end
				end
				v_u_137 = task.delay(v128, v_u_138)
				v_u_20({
					["instance"] = v130.Segment.Buttons.ACCEPT_BUTTON.Main.SENSOR,
					["onclick"] = function()
						-- upvalues: (ref) v_u_6, (ref) v_u_24, (copy) v_u_127, (ref) v_u_23, (copy) v_u_138
						local v139 = v_u_6.PlayerGui:FindFirstChild("GenericConfirmationPrompt")
						if v139 then
							v139 = v139:FindFirstChild("Main")
						end
						if v139 then
							v139 = v139:FindFirstChild("MiddleText")
						end
						if not (v139 and v139:IsA("TextLabel")) then
							v139 = nil
						end
						if v139 then
							v139.RichText = true
						end
						v_u_24:Open({
							["Title"] = "Join Party",
							["Header"] = ("Join %*\'s party?"):format(v_u_127.displayName),
							["Middle"] = "<font color=\"#ffff00\">Once you join, you can leave the party by talking to the NPC or from the team menu.</font>",
							["Footer"] = "",
							["ConfirmText"] = "Join",
							["RejectText"] = "Wait"
						}, {
							["ConfirmCallback"] = function()
								-- upvalues: (ref) v_u_23, (ref) v_u_127, (ref) v_u_138
								v_u_23:Accept(v_u_127.eventName, v_u_127.inviterUid)
								v_u_138()
							end
						})
					end
				})
				v_u_20({
					["instance"] = v130.Segment.Buttons.DECLINE_BUTTON.Main.SENSOR,
					["onclick"] = function()
						-- upvalues: (ref) v_u_24, (ref) v_u_23, (copy) v_u_127, (copy) v_u_138
						v_u_24:Close("Join Party")
						v_u_23:Decline(v_u_127.eventName, v_u_127.inviterUid)
						v_u_138()
					end
				})
				v_u_129.Parent = v_u_9.Frame
			end
		else
			return
		end
	end
end
function v_u_33.Toggle(_, p140)
	-- upvalues: (copy) v_u_33, (copy) v_u_17, (copy) v_u_8
	local v141 = v_u_33.State
	if p140 == nil then
		p140 = not v_u_33.State.Visible
	end
	v141.Visible = p140
	if v_u_33.State.Visible then
		v_u_17:Open(v_u_8)
	else
		v_u_17:Close(v_u_8)
	end
end
function v_u_33.Start(_)
	-- upvalues: (copy) v_u_33, (copy) v_u_20, (copy) v_u_12, (copy) v_u_8, (copy) v_u_10, (copy) v_u_26, (copy) v_u_18, (copy) v_u_19, (copy) v_u_3, (copy) v_u_11, (copy) v_u_16, (copy) v_u_15, (copy) v_u_21, (copy) v_u_97, (copy) v_u_89, (copy) v_u_23, (copy) v_u_22, (copy) v_u_125, (copy) v_u_14, (copy) v_u_44, (copy) v_u_1
	local v_u_142 = v_u_33.State
	v_u_20({
		["instance"] = v_u_12,
		["legacy"] = true,
		["onclick"] = function()
			-- upvalues: (ref) v_u_33
			v_u_33:Toggle(false)
		end
	})
	v_u_8.Enabled = true
	v_u_10.Visible = false
	v_u_26.Visible:Observe(function(p143)
		-- upvalues: (ref) v_u_18, (ref) v_u_19, (ref) v_u_10, (ref) v_u_3, (ref) v_u_11
		v_u_18.Change_FOV(p143 and 60 or 70)
		v_u_19.Blur(p143 and 15 or 0, 0.1)
		if p143 then
			v_u_10.Size = UDim2.fromScale(0, 0)
			local v144 = {
				["Size"] = v_u_11
			}
			v_u_3:Create(v_u_10, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), v144):Play()
		end
		v_u_10.Visible = p143
	end)
	task.wait()
	v_u_142.ItemHeight = v_u_16.AbsoluteSize.Y
	local v145 = v_u_15:FindFirstChildWhichIsA("UIListLayout")
	if v145 then
		v_u_142.ListPadding = v145.Padding.Scale * v_u_15.AbsoluteSize.Y + v145.Padding.Offset
		v145:Destroy()
	end
	local v146 = v_u_15:FindFirstChildWhichIsA("UIPadding")
	if v146 then
		v146:Destroy()
	end
	for _, v147 in v_u_15:GetChildren() do
		if v147:IsA("Frame") then
			v147.Visible = false
		end
	end
	v_u_15.ScrollingDirection = Enum.ScrollingDirection.Y
	local v148 = v_u_142.ItemHeight + v_u_142.ListPadding
	local v149 = v_u_15.AbsoluteSize.Y / v148
	v_u_142.PoolSize = math.ceil(v149) + 4
	for v150 = 1, v_u_142.PoolSize do
		local v_u_151 = v_u_16:Clone()
		v_u_151.Name = ("PoolFrame_%*"):format(v150)
		v_u_151.Size = UDim2.new(v_u_16.Size.X.Scale, v_u_16.Size.X.Offset, 0, v_u_142.ItemHeight)
		v_u_151.Visible = false
		v_u_151.Parent = v_u_15
		v_u_142.Pool[v150] = v_u_151
		local v152 = v_u_151.Add.ActualAddButton
		local v_u_153 = v152:FindFirstChildWhichIsA("UIScale")
		local v154 = v152:FindFirstChild("SENSOR")
		v154.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_153
			v_u_21.target(v_u_153, 1, 10, {
				["Scale"] = 1.065
			})
		end)
		v154.MouseLeave:Connect(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_153
			v_u_21.target(v_u_153, 1, 10, {
				["Scale"] = 1
			})
		end)
		v154.MouseButton1Down:Connect(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_153
			v_u_21.target(v_u_153, 1, 10, {
				["Scale"] = 0.935
			})
		end)
		v154.MouseButton1Up:Connect(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_153
			v_u_21.target(v_u_153, 1, 10, {
				["Scale"] = 1.065
			})
		end)
		v154.Activated:Connect(function()
			-- upvalues: (ref) v_u_97, (copy) v_u_151
			v_u_97(v_u_151)
		end)
		local v155 = v_u_151.NativeInvite.ActualInviteButton
		local v_u_156 = v155:FindFirstChildWhichIsA("UIScale")
		local v157 = v155:FindFirstChild("SENSOR")
		v157.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_156
			v_u_21.target(v_u_156, 1, 10, {
				["Scale"] = 1.065
			})
		end)
		v157.MouseLeave:Connect(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_156
			v_u_21.target(v_u_156, 1, 10, {
				["Scale"] = 1
			})
		end)
		v157.MouseButton1Down:Connect(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_156
			v_u_21.target(v_u_156, 1, 10, {
				["Scale"] = 0.935
			})
		end)
		v157.MouseButton1Up:Connect(function()
			-- upvalues: (ref) v_u_21, (copy) v_u_156
			v_u_21.target(v_u_156, 1, 10, {
				["Scale"] = 1.065
			})
		end)
		v157.Activated:Connect(function()
			-- upvalues: (ref) v_u_89, (copy) v_u_151
			v_u_89(v_u_151)
		end)
	end
	v_u_8.TeamInvites.Main.TeamMembers.LeaveTeam.ImageButton.Activated:Connect(function()
		-- upvalues: (ref) v_u_23
		v_u_23:LeaveParty("CandyPackaging")
	end)
	v_u_23.OutboundChanged:Connect(function()
		-- upvalues: (ref) v_u_33
		v_u_33:Render()
	end)
	v_u_22.DataUpdated:Connect(function()
		-- upvalues: (ref) v_u_33
		v_u_33:RenderMembers()
		v_u_33:Render()
	end)
	v_u_23.InboundReceived:Connect(v_u_125)
	v_u_33:RenderMembers()
	v_u_15:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		-- upvalues: (ref) v_u_33
		v_u_33:Render()
	end)
	v_u_14:GetPropertyChangedSignal("Text"):Connect(function()
		-- upvalues: (copy) v_u_142, (ref) v_u_14, (ref) v_u_15, (ref) v_u_33
		v_u_142.SearchQuery = v_u_14.Text
		v_u_15.CanvasPosition = Vector2.new(0, 0)
		v_u_33:Render()
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_142, (ref) v_u_44, (ref) v_u_33
		v_u_142.PlayerList = v_u_44()
		v_u_33:Render()
	end)
	v_u_1.PlayerAdded:Connect(function()
		-- upvalues: (copy) v_u_142, (ref) v_u_44, (ref) v_u_33
		task.spawn(function()
			-- upvalues: (ref) v_u_142, (ref) v_u_44, (ref) v_u_33
			v_u_142.PlayerList = v_u_44()
			v_u_33:Render()
		end)
	end)
	v_u_1.PlayerRemoving:Connect(function()
		-- upvalues: (copy) v_u_142, (ref) v_u_44, (ref) v_u_33
		task.spawn(function()
			-- upvalues: (ref) v_u_142, (ref) v_u_44, (ref) v_u_33
			v_u_142.PlayerList = v_u_44()
			v_u_33:Render()
		end)
	end)
end
task.spawn(function()
	-- upvalues: (copy) v_u_33
	v_u_33:Start()
end)
return v_u_33