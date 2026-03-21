local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
require(v1.Data.EnumRegistry.ReversedItemTypeEnums)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_4 = require(v1.Modules.TradeBoothControllers.TradeBoothListingController)
require(v1.Modules.TradeBoothControllers.TradeBoothBuyItemController)
local v_u_5 = require(v1.Modules.TradeControllers.TradeWorldController)
local v_u_6 = require(v1.Modules.GardenGuideModules.DataModules.GGStaticData)
local v_u_7 = require(v1.Modules.TeleportUIController)
local v8 = require(v1.Modules.ReplicationReciever)
local v_u_9 = require(v1.Modules.ItemRarityFinder)
local v_u_10 = require(v1.Modules.ItemImageFinder)
local v_u_11 = require(v1.Modules.ItemNameFinder)
local v_u_12 = require(v1.Data.TradeBoothsData)
local v_u_13 = require(v1.Modules.GuiController)
require(v1.Modules.Notification)
local v_u_14 = require(v1.Modules.NumberUtil)
local v_u_15 = require(v1.Modules.Observers)
require(v1.Data.TradeData)
require(v1.Modules.Signal)
local v_u_16 = require(v1.Modules.Trove)
require(v1.Modules.InventoryService)
require(v1.Data.EnumRegistry.ItemTypeEnums)
require(v1.Modules.MutationHandler)
local v_u_17 = require(v1.Modules.SelectiveAssetReplication)
local v18 = require(v1.Data.PetRegistry)
local v_u_19 = require(v1.Modules.TradeBoothControllers.TradeBoothSkinUIController)
local v_u_20 = require(v1.Data.TradeBoothSkinRegistry)
local v_u_21 = require(v1.Modules.ConfirmationPromptController)
local _ = v18.PetList
local v_u_22 = v2.LocalPlayer
local v_u_23 = v1.GameEvents.TradeEvents
local v_u_24 = v1.GameEvents.TradeEvents.Booths.RemoveBooth
local v_u_25 = {}
local v_u_26 = v8.new("Booths")
local v_u_27 = {}
local v_u_28 = {}
local v_u_29 = {}
local v30 = {}
local v_u_31 = {
	{
		["distanceRatio"] = 0.25,
		["updateRate"] = 60
	},
	{
		["distanceRatio"] = 0.5,
		["updateRate"] = 30
	},
	{
		["distanceRatio"] = 0.8,
		["updateRate"] = 20
	},
	{
		["distanceRatio"] = 1,
		["updateRate"] = 15
	}
}
local v_u_32 = {
	["minGap"] = 0.1,
	["amplitude"] = 0.4,
	["frequency"] = 0.6,
	["rx"] = 0.17453292519943295,
	["ry"] = 0.4363323129985824,
	["rz"] = 0.2617993877991494,
	["maxDistance"] = 55
}
local v_u_33 = {}
local v_u_34 = nil
local function v_u_39(p35)
	local v36 = {}
	for _, v37 in p35:GetDescendants() do
		if v37:HasTag("TradePad") then
			local v38 = v37:GetAttribute("Index")
			if type(v38) == "string" then
				v38 = tonumber(v38)
			end
			if v38 then
				v36[v38] = v37
			end
		end
	end
	return v36
end
local function v_u_82(p_u_40, p41, p42, p43)
	-- upvalues: (copy) v_u_32, (copy) v_u_33, (ref) v_u_34, (copy) v_u_3, (copy) v_u_29, (copy) v_u_39, (copy) v_u_31
	local v_u_44 = nil
	local v_u_45 = nil
	if not pcall(function()
		-- upvalues: (ref) v_u_44, (ref) v_u_45, (copy) p_u_40
		local v46, v47 = p_u_40:GetBoundingBox()
		v_u_44 = v46
		v_u_45 = v47
	end) then
		warn("SetupFloatingDisplay: Failed to get bounding box for", p_u_40:GetFullName())
		v_u_44 = CFrame.new()
		v_u_45 = Vector3.new(2, 2, 2)
	end
	local v48 = p41:GetPivot().Position
	local v49 = v48.Y + p41.Size.Y / 2
	local v50 = v_u_44 - v_u_44.Position
	local v51 = v48.X
	local v52 = v49 + v_u_32.minGap + v_u_45.Y / 2
	local v53 = v48.Z
	local v54 = Vector3.new(v51, v52, v53)
	p_u_40:PivotTo(CFrame.new(v54) * v50)
	local v55 = tick()
	local v56 = v_u_33
	table.insert(v56, {
		["ItemModel"] = p_u_40,
		["PadIndex"] = p42,
		["BaseCenterPos"] = v54,
		["RotationOnly"] = v50,
		["Phase"] = 0,
		["SpinX"] = 0,
		["SpinY"] = 0,
		["SpinZ"] = 0,
		["LastDistanceCheckTime"] = v55,
		["LastUpdateTime"] = v55,
		["IsNear"] = false,
		["BoothInstance"] = p43,
		["DistanceTier"] = 0
	})
	if not v_u_34 then
		v_u_34 = v_u_3.Heartbeat:Connect(function(_)
			-- upvalues: (ref) v_u_33, (ref) v_u_29, (ref) v_u_39, (ref) v_u_32, (ref) v_u_31, (ref) v_u_34
			local v57 = tick()
			for v58 = #v_u_33, 1, -1 do
				local v59 = v_u_33[v58]
				if v59.ItemModel and v59.ItemModel.Parent ~= nil then
					if v57 - v59.LastDistanceCheckTime > 0.25 then
						v59.LastDistanceCheckTime = v57
						local v60 = workspace.CurrentCamera
						local v61 = false
						local v62 = 0
						if v60 then
							local v63 = v59.BoothInstance
							local v64 = v59.PadIndex
							local v65 = v_u_29[v63]
							if not v65 then
								v65 = v_u_39(v63)
								v_u_29[v63] = v65
							end
							local v66 = v65[v64]
							if v66 then
								local v67 = v66:GetPivot().Position
								local v68 = (v60.CFrame.Position - v67).Magnitude
								v61 = v68 <= v_u_32.maxDistance
								local v69 = v68 / v_u_32.maxDistance
								for v70, v71 in ipairs(v_u_31) do
									if v69 <= v71.distanceRatio then
										v62 = v70 - 1
										break
									end
								end
							end
						end
						v59.IsNear = v61
						v59.DistanceTier = v62
					end
					if v59.IsNear then
						local v72 = (v59.DistanceTier <= 0 or v59.DistanceTier > #v_u_31) and 0 or 1 / v_u_31[v59.DistanceTier + 1].updateRate
						local v73 = v57 - v59.LastUpdateTime
						local v74 = math.min(v73, 0.1)
						if v72 <= 0 or v74 >= v72 then
							v59.LastUpdateTime = v57
							v59.Phase = v59.Phase + v_u_32.frequency * v74
							v59.Phase = v59.Phase % 1
							local v75
							if v59.Phase < 0.5 then
								v75 = v59.Phase * 2
							else
								v75 = (1 - v59.Phase) * 2
							end
							local v76
							if v75 < 0.5 then
								v76 = v75 * 2 * v75
							else
								local v77 = 1 - v75
								v76 = 1 - v77 * 2 * v77
							end
							local v78 = v76 * v_u_32.amplitude
							local v79 = v59.BaseCenterPos + Vector3.new(0, v78, 0)
							v59.SpinX = v59.SpinX + v_u_32.rx * v74
							v59.SpinY = v59.SpinY + v_u_32.ry * v74
							v59.SpinZ = v59.SpinZ + v_u_32.rz * v74
							local v80 = CFrame.Angles(v59.SpinX, v59.SpinY, v59.SpinZ)
							local v81 = CFrame.new(v79) * v59.RotationOnly * v80
							v59.ItemModel:PivotTo(v81)
						end
					end
				else
					table.remove(v_u_33, v58)
				end
			end
			if #v_u_33 == 0 and v_u_34 then
				v_u_34:Disconnect()
				v_u_34 = nil
			end
		end)
	end
end
local function v_u_85(p83)
	-- upvalues: (copy) v_u_33
	for v84 = #v_u_33, 1, -1 do
		if v_u_33[v84].ItemModel == p83 then
			table.remove(v_u_33, v84)
			return
		end
	end
end
local function v_u_89(p86)
	-- upvalues: (copy) v_u_33
	for v87 = #v_u_33, 1, -1 do
		local v88 = v_u_33[v87]
		if v88.ItemModel and v88.ItemModel:IsDescendantOf(p86) then
			table.remove(v_u_33, v87)
		end
	end
end
function v30.TeleportToBooth(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_26, (copy) v_u_12, (copy) v_u_22, (copy) v_u_7, (copy) v_u_27
	if v_u_5:IsInWorld() then
		local v90 = v_u_26:GetData()
		if v90 then
			local v91 = v90.Players[v_u_12.getPlayerId(v_u_22)]
			if v91 then
				if v91.Booth then
					local v92 = v_u_7
					local v93 = v_u_27[v91.Booth]
					v92:Move(CFrame.new((v93:GetPivot() * CFrame.new(0, 12, 5)).Position), "Booth")
				else
					for v94, v95 in v_u_27 do
						local v96 = v90.Booths[v94]
						if v96 and not v96.Owner then
							v_u_7:Move(CFrame.new((v95:GetPivot() * CFrame.new(0, 12, 5)).Position), "Booth")
							return
						end
					end
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
local function v_u_109(p_u_97, p98, p99, p100)
	-- upvalues: (copy) v_u_82
	if p_u_97 and p_u_97.Parent then
		local v101, v102 = pcall(function()
			-- upvalues: (copy) p_u_97
			return p_u_97:GetExtentsSize()
		end)
		if not v101 then
			warn("setupItemDisplay: Failed to get extents size for", p_u_97:GetFullName())
			local v103, _, v104 = pcall(function()
				-- upvalues: (copy) p_u_97
				if p_u_97:IsA("Model") then
					return p_u_97:GetBoundingBox()
				end
				if p_u_97:IsA("Tool") and p_u_97.Handle then
					return p_u_97.Handle.CFrame, p_u_97.Handle.Size
				end
			end)
			v102 = v103 and v104 and v104 or Vector3.new(2, 2, 2)
		end
		local v105 = 2.5 / v102.X
		local v106 = 2.5 / v102.Y
		local v107 = 2.5 / v102.Z
		local v_u_108 = math.min(v105, v106, v107)
		pcall(function()
			-- upvalues: (copy) p_u_97, (copy) v_u_108
			if p_u_97.GetScale and (v_u_108 < p_u_97:GetScale() and p_u_97.ScaleTo) then
				p_u_97:ScaleTo(v_u_108)
			end
		end)
		if p_u_97.Parent then
			v_u_82(p_u_97, p98, p99, p100)
		else
			warn("setupItemDisplay: Item was destroyed before floating could be set up")
		end
	else
		warn("setupItemDisplay: Invalid item instance or no parent")
		return
	end
end
function v30.GetPlayerBoothData(_, p110)
	-- upvalues: (copy) v_u_5, (copy) v_u_26, (copy) v_u_12
	if v_u_5:IsInWorld() then
		local v111 = v_u_26:GetData()
		if v111 then
			return v111.Players[v_u_12.getPlayerId(p110)] or nil
		else
			return nil
		end
	else
		return nil
	end
end
function v30.Start(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_26, (copy) v_u_15, (copy) v_u_16, (copy) v_u_27, (copy) v_u_29, (copy) v_u_39, (copy) v_u_20, (copy) v_u_12, (copy) v_u_22, (copy) v_u_19, (copy) v_u_24, (copy) v_u_23, (copy) v_u_21, (copy) v_u_4, (copy) v_u_13, (copy) v_u_85, (copy) v_u_28, (copy) v_u_10, (copy) v_u_9, (copy) v_u_6, (copy) v_u_11, (copy) v_u_14, (copy) v_u_109, (copy) v_u_25, (copy) v_u_17, (copy) v_u_89
	if v_u_5:IsInWorld() then
		local v_u_112 = v_u_26:GetDataAsync()
		v_u_15.observeTag("TradeBooth", function(p_u_113)
			-- upvalues: (ref) v_u_16, (ref) v_u_27, (ref) v_u_29, (copy) v_u_112, (ref) v_u_39, (ref) v_u_20, (ref) v_u_12, (ref) v_u_22, (ref) v_u_19, (ref) v_u_24, (ref) v_u_23, (ref) v_u_21, (ref) v_u_4, (ref) v_u_13, (ref) v_u_85, (ref) v_u_28, (ref) v_u_10, (ref) v_u_9, (ref) v_u_6, (ref) v_u_11, (ref) v_u_14, (ref) v_u_109, (ref) v_u_25, (ref) v_u_26, (ref) v_u_17, (ref) v_u_89
			local v_u_114 = p_u_113.Name
			local v_u_115 = v_u_16.new()
			v_u_27[v_u_114] = p_u_113
			v_u_115:Add(function()
				-- upvalues: (ref) v_u_27, (copy) v_u_114, (copy) p_u_113, (ref) v_u_29
				v_u_27[v_u_114] = nil
				v_u_29[p_u_113] = nil
			end)
			local v_u_116 = nil
			local v_u_117 = nil
			local v_u_118 = v_u_115:Extend()
			local v_u_119 = v_u_115:Extend()
			local v_u_120 = v_u_115:Extend()
			local v_u_121 = "-1"
			local v_u_122 = nil
			local v_u_123 = nil
			local v_u_124 = {}
			local v_u_125 = nil
			local function v_u_133()
				-- upvalues: (copy) v_u_118, (copy) p_u_113, (ref) v_u_116, (ref) v_u_112, (copy) v_u_114, (ref) v_u_20, (ref) v_u_117, (ref) v_u_12, (ref) v_u_22, (ref) v_u_19, (ref) v_u_24, (ref) v_u_23, (ref) v_u_21, (ref) v_u_4, (ref) v_u_13
				v_u_118:Clean()
				for _, v126 in p_u_113:GetDescendants() do
					if v126:HasTag("TradeBoothSign") then
						v_u_116 = v126
						break
					end
				end
				if v_u_116 then
					local v127 = v_u_112.Booths[v_u_114]
					if v127 then
						v127 = v127.Skin
					end
					local v128 = v_u_20[v127 or "Default"]
					local v129 = v128 and v128.ProxPromptOffset or Vector3.new(0, 0, 0)
					local v130 = v_u_118:Add(Instance.new("Attachment"))
					v130.Position = Vector3.new(-5, -6, 0) + v129
					v130.Parent = v_u_116
					v_u_117 = v_u_118:Add(Instance.new("ProximityPrompt"))
					v_u_117.Name = "ProximityPrompt"
					v_u_117.ActionText = "Claim"
					v_u_117.MaxActivationDistance = 8
					v_u_117.ObjectText = "Booth"
					v_u_117.RequiresLineOfSight = false
					v_u_117.Style = Enum.ProximityPromptStyle.Custom
					v_u_117.Parent = v130
					v_u_117:SetAttribute("Theme", "ShadowedPrompt")
					v_u_118:Add(v_u_117.Triggered:Connect(function(_)
						-- upvalues: (ref) v_u_112, (ref) v_u_114, (ref) v_u_12, (ref) v_u_22, (ref) v_u_19, (ref) v_u_24, (ref) v_u_23, (ref) p_u_113, (ref) v_u_21, (ref) v_u_4, (ref) v_u_13
						local v131 = v_u_112.Booths[v_u_114]
						if v131 then
							v131 = v131.Owner
						end
						local _ = v131 == v_u_12.getPlayerId(v_u_22)
						if v131 == nil then
							local v132 = v_u_112.Players[v_u_12.getPlayerId(v_u_22)]
							if v132 and v132.Booth then
								v_u_21:Open({
									["Title"] = "Claim Booth",
									["Header"] = "Do you want to claim this booth?",
									["Middle"] = "This will remove your claim on your current booth.",
									["Footer"] = ""
								}, {
									["ConfirmCallback"] = function()
										-- upvalues: (ref) v_u_19, (ref) v_u_24, (ref) v_u_23, (ref) p_u_113
										if v_u_19:Prompt():Wait() then
											v_u_24:FireServer()
											task.wait(0.2)
											v_u_23.Booths.ClaimBooth:FireServer(p_u_113)
										end
									end
								})
								return
							end
							if v_u_19:Prompt():Wait() then
								v_u_23.Booths.ClaimBooth:FireServer(p_u_113)
								return
							end
						else
							v_u_4:SetBooth(v_u_114)
							v_u_13:Open(v_u_22.PlayerGui.TradeBooth)
						end
					end))
				else
					warn("No TradeBoothSign found on booth")
				end
			end
			local function v_u_179()
				-- upvalues: (ref) v_u_112, (copy) v_u_114, (ref) v_u_124, (ref) v_u_85, (copy) v_u_120, (ref) v_u_29, (copy) p_u_113, (ref) v_u_39, (ref) v_u_28, (ref) v_u_123, (ref) v_u_10, (ref) v_u_9, (ref) v_u_6, (ref) v_u_11, (ref) v_u_14, (ref) v_u_109
				local v134 = v_u_112.Booths[v_u_114]
				if v134 then
					v134 = v134.Owner
				end
				if not v134 then
					for _, v135 in v_u_124 do
						v_u_85(v135.instance)
						if v135.instance:IsA("BasePart") and v135.instance.Name == "SkinGUI" then
							v_u_120:Remove(v135.instance)
							v135.instance:Destroy()
						end
					end
					v_u_124 = {}
					local v136 = v_u_29[p_u_113]
					if not v136 then
						v136 = v_u_39(p_u_113)
						v_u_29[p_u_113] = v136
					end
					for _, v137 in v136 do
						local v138 = v_u_28[v137]
						if v138 then
							v138.Enabled = false
						end
					end
					return
				end
				local v_u_139 = v_u_112.Players[v134]
				if not (v_u_139 and v_u_139.Listings) then
					for _, v140 in v_u_124 do
						v_u_85(v140.instance)
						if v140.instance:IsA("BasePart") and v140.instance.Name == "SkinGUI" then
							v_u_120:Remove(v140.instance)
							v140.instance:Destroy()
						end
					end
					v_u_124 = {}
					local v141 = v_u_29[p_u_113]
					if not v141 then
						v141 = v_u_39(p_u_113)
						v_u_29[p_u_113] = v141
					end
					for _, v142 in v141 do
						local v143 = v_u_28[v142]
						if v143 then
							v143.Enabled = false
						end
					end
					return
				end
				v_u_123 = p_u_113:FindFirstChild("DynamicInstances")
				if not v_u_123 then
					return
				end
				for _, v144 in v_u_124 do
					v_u_85(v144.instance)
				end
				local v145 = {}
				for v146 in v_u_139.Listings do
					table.insert(v145, v146)
				end
				table.sort(v145, function(p147, p148)
					-- upvalues: (copy) v_u_139
					local v149 = v_u_139.Listings[p147].Price
					local v150 = v_u_139.Listings[p148].Price
					if v149 == v150 then
						return p147 < p148
					else
						return v150 < v149
					end
				end)
				local v151 = v_u_29[p_u_113]
				if not v151 then
					v151 = v_u_39(p_u_113)
					v_u_29[p_u_113] = v151
				end
				local v152 = {}
				for v153 = 1, 4 do
					local v154 = v145[v153]
					if not v154 then
						break
					end
					local v155 = v_u_139.Listings[v154]
					local v156 = v_u_139.Items[v155.ItemId]
					if v156 then
						local v157 = v151[v153]
						if v157 then
							local v158 = v156.Name or (v156.ItemName or v156.PetType or (v156.SkinID or ""))
							local v159 = v156.PetType and "Pet" or (v156.ItemName and "Holdable" or "TradeBoothSkin")
							local v160 = v_u_123:FindFirstChild(v155.ItemId)
							if v159 == "TradeBoothSkin" then
								local v161 = v_u_124[v155.ItemId]
								if v161 and (v161.instance and v161.instance.Parent) then
									local v162 = v157:GetPivot() * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(-(v161.instance.Size.Y + 0.5) / 2, 0, 0)
									v161.instance:PivotTo(v162)
									v152[v155.ItemId] = {
										["padIndex"] = v153,
										["instance"] = v161.instance
									}
								else
									local v163 = v_u_120:Clone(script.SkinGUI)
									local v164 = v163.SurfaceGui
									v164.Frame.ImageButton.Image = v_u_10(v158, v155.ItemType)
									local v165 = v_u_9(v158, v155.ItemType)
									if v165 then
										v165 = v_u_6.RarityColorMap[v165]
									end
									v164.Frame.TextLabel.Text = v_u_11(v158, v155.ItemType)
									v164.Frame.TextLabel.TextColor3 = v165 or Color3.new(1, 1, 1)
									v164.Frame.Rotation = -90
									v164.Frame.Price.Amount.Text = v_u_14.Comma(v155.Price)
									v164.Face = Enum.NormalId.Back
									v163.Parent = v157
									v163:PivotTo(v157:GetPivot() * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(-(v163.Size.Y + 0.3) / 2, 0, 0))
									v152[v155.ItemId] = {
										["padIndex"] = v153,
										["instance"] = v163
									}
								end
								local v166 = v155.Price
								local v167 = v_u_28[v157]
								if not v167 then
									v167 = script.PriceGUI:Clone()
									v167.Parent = v157
									v_u_28[v157] = v167
								end
								v167.Enabled = true
								if v166 then
									v167.Frame.Price.Amount.Text = v_u_14.Comma(v166)
								end
							elseif v160 then
								if not v160:IsDescendantOf(workspace) then
									task.wait(0.1)
								end
								if v160.Parent then
									v_u_109(v160, v157, v153, p_u_113)
									v152[v155.ItemId] = {
										["padIndex"] = v153,
										["instance"] = v160
									}
									local v168 = v155.Price
									local v169 = v_u_28[v157]
									if not v169 then
										v169 = script.PriceGUI:Clone()
										v169.Parent = v157
										v_u_28[v157] = v169
									end
									v169.Enabled = true
									if v168 then
										v169.Frame.Price.Amount.Text = v_u_14.Comma(v168)
									end
								end
							end
						else
							warn("No TradePad found for index", v153)
						end
					end
				end
				for v170, v171 in v_u_124 do
					if not v152[v170] then
						if v171.instance:IsA("BasePart") and v171.instance.Name == "SkinGUI" then
							v_u_120:Remove(v171.instance)
							v171.instance:Destroy()
						end
						local v172 = v151[v171.padIndex]
						if v172 then
							local v173 = v_u_28[v172]
							if v173 then
								v173.Enabled = false
							end
						end
					end
				end
				for v174 = 1, 4 do
					local v175 = v151[v174]
					if v175 then
						local v176 = false
						for _, v177 in v152 do
							if v177.padIndex == v174 then
								v176 = true
								break
							end
						end
						if not v176 then
							local v178 = v_u_28[v175]
							if v178 then
								v178.Enabled = false
							end
						end
					end
				end
				v_u_124 = v152
			end
			local function v_u_182()
				-- upvalues: (ref) v_u_125, (copy) p_u_113, (copy) v_u_179, (copy) v_u_115
				if v_u_125 then
					v_u_125:Disconnect()
					v_u_125 = nil
				end
				local v180 = p_u_113:FindFirstChild("DynamicInstances")
				if v180 then
					v_u_125 = v180.ChildAdded:Connect(function(p181)
						-- upvalues: (ref) v_u_179
						if p181.Parent then
							task.wait(0.1)
							v_u_179()
						end
					end)
					v_u_115:Add(v_u_125)
					v_u_115:Add(v180.ChildRemoved:Connect(function(_)
						-- upvalues: (ref) v_u_179
						task.wait(0.1)
						v_u_179()
					end))
					v_u_179()
				end
			end
			local function v_u_185()
				-- upvalues: (ref) v_u_112, (copy) v_u_114, (ref) v_u_25, (copy) v_u_119, (ref) v_u_121, (ref) v_u_117, (ref) v_u_12, (ref) v_u_22, (ref) v_u_26, (copy) v_u_179, (copy) v_u_182, (ref) v_u_116
				local v183 = v_u_112.Booths[v_u_114]
				if v183 then
					v183 = v183.Owner
				end
				v_u_25[v_u_114] = v183
				v_u_119:Clean()
				v_u_121 = v183
				if v_u_117 then
					if v183 == nil then
						v_u_117.ActionText = "Claim"
					elseif v183 == v_u_12.getPlayerId(v_u_22) then
						v_u_117.ActionText = "Edit"
					else
						v_u_117.ActionText = "View"
					end
				end
				local v184 = v183 and v_u_26:GetPathSignal((("Players/%*/@"):format(v183)))
				if v184 then
					v_u_119:Add(v184:Connect(v_u_179))
				end
				v_u_182()
				task.delay(0.3, v_u_179)
				if v183 then
					v183 = v_u_12.getPlayerById(v183)
				end
				if v_u_116 then
					if v183 then
						v_u_116.SurfaceGui.TextLabel.Text = ("@%*\'s Booth"):format(v183.Name)
						return
					end
					v_u_116.SurfaceGui.TextLabel.Text = "Unclaimed Booth"
				end
			end
			local function v194()
				-- upvalues: (ref) v_u_112, (copy) v_u_114, (ref) v_u_122, (ref) v_u_17, (ref) v_u_124, (copy) v_u_120, (ref) v_u_89, (copy) p_u_113, (ref) v_u_29, (copy) v_u_133, (copy) v_u_185
				local v186 = v_u_112.Booths[v_u_114]
				if v186 then
					v186 = v186.Skin
				end
				local v187 = v_u_112.Booths[v_u_114]
				if v187 then
					v187 = v187.Owner
				end
				local v188 = v187 == nil and "Default" or v186
				if v188 ~= v_u_122 then
					v_u_122 = v188
					local v189 = v_u_17:GetAssetAsync("TradeBoothSkins", v188 or "Default")
					if not v189 then
						error("INVALID SKIN")
					end
					for _, v190 in v_u_124 do
						if v190.instance:IsA("BasePart") and v190.instance.Name == "SkinGUI" then
							v_u_120:Remove(v190.instance)
							v190.instance:Destroy()
						end
					end
					v_u_124 = {}
					v_u_89(p_u_113)
					v_u_29[p_u_113] = nil
					local v191 = p_u_113:FindFirstChild("DynamicInstances")
					for _, v192 in p_u_113:GetChildren() do
						if v192.Name ~= "DynamicInstances" then
							v192:Destroy()
						end
					end
					local v193 = v189:Clone()
					v193:PivotTo(p_u_113:GetPivot())
					v193.Parent = p_u_113
					if v191 and v191.Parent == nil then
						v191.Parent = p_u_113
					end
					v_u_133()
					v_u_185()
				end
			end
			local v195 = v_u_26:GetPathSignal((("Booths/%*/Owner"):format(v_u_114)))
			if v195 then
				v_u_115:Add(v195:Connect(v_u_185))
			end
			local v196 = v_u_26:GetPathSignal((("Booths/%*/Skin"):format(v_u_114)))
			if v196 then
				v_u_115:Add(v196:Connect(v194))
			end
			v194()
			return v_u_115:WrapClean()
		end)
	end
end
task.spawn(v30.Start, v30)
return v30