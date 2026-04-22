local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("CollectionService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
local v5 = game:GetService("RunService")
local v6 = v3:WaitForChild("GameEvents")
local v_u_7 = v6:WaitForChild("Remove_Item")
local v_u_8 = v6:WaitForChild("DeleteObject")
local v_u_9 = require(v3.Modules.GetFarm)
local v_u_10 = require(v3.Modules.Notification)
local v_u_11 = require(v3.Data.SeedData)
local v_u_12 = require(v3.Item_Module)
local v_u_13 = require(v3.Modules.ConfirmationPromptController)
local v_u_14 = require(v3.Modules.StringUtils)
local v_u_15 = game.Players.LocalPlayer
local v_u_16 = workspace.CurrentCamera
local v_u_17 = script.Highlight
local v_u_18 = {
	["Instance"] = nil,
	["IsPlaceableObject"] = false
}
local v_u_19 = {
	"Carrot",
	"Strawberry",
	"Blueberry",
	"Orange Tulip",
	"Buttercup",
	"Tomato",
	"Corn",
	"Daffodil",
	"Apple",
	"Chocolate Carrot",
	"Red Lollipop",
	"Blue Lollipop",
	"Nightshade",
	"Glowshroom",
	"Mint",
	"Rose",
	"Foxglove",
	"Crocus",
	"Delphinium",
	"Manuka Flower",
	"Lavender",
	"Nectarshade",
	"Peace Lily",
	"Wild Carrot",
	"Pear",
	"Horsetail",
	"Monoblooma",
	"Dezen",
	"Artichoke",
	"Spring Onion",
	"Turnip",
	"Parsley",
	"Bloodred Mushroom",
	"Orange Delight",
	"Horned Redrose",
	"Peppermint Pop"
}
local v_u_20 = { "Carrot", "Candy Carrot", "Christmas Tree" }
local function v_u_25(p21)
	-- upvalues: (copy) v_u_12, (copy) v_u_19
	local v22 = p21.Name
	local v23 = v_u_12.Return_Data(v22)
	math.randomseed(p21.Item_Seed.Value)
	math.random(700, 1400)
	if math.random(1, v23[4]) == 1 then
		return true
	end
	if p21.Variant.Value ~= "Normal" then
		return true
	end
	for _, v24 in v_u_19 do
		if string.lower(v22) == string.lower(v24) then
			return false
		end
	end
	return true
end
local function v_u_28(p26)
	-- upvalues: (copy) v_u_20
	for _, v27 in v_u_20 do
		if string.lower(p26) == string.lower(v27) then
			return true
		end
	end
	return string.find(string.lower(p26), "sprinkler") and true or false
end
local function v_u_35(p29)
	-- upvalues: (copy) v_u_14, (copy) v_u_11, (copy) v_u_12
	local v30 = v_u_14:StipFlavourText(p29)
	local v31 = v_u_11[v30]
	if not v31 then
		return v30
	end
	local v32 = v31.SeedRarity
	if v32 == "Prismatic" or v32 == "Transcendent" then
		return v30
	end
	local v33 = v_u_12.Return_Rarity_Data(v32)
	if not (v33 and v33[2]) then
		return v30
	end
	local v34 = v33[2]
	return ("<font color=\"%*\">%*</font>"):format(string.format("#%02X%02X%02X", v34.R * 255, v34.G * 255, v34.B * 255), v30)
end
local v_u_36 = nil
local function v_u_40(p37)
	-- upvalues: (copy) v_u_16, (copy) v_u_2
	local v38 = v_u_16:ViewportPointToRay(p37.X, p37.Y)
	local v39 = RaycastParams.new()
	v39.FilterType = Enum.RaycastFilterType.Exclude
	v39.FilterDescendantsInstances = { v_u_2:GetTagged("ShovelIgnore") }
	return workspace:Raycast(v38.Origin, v38.Direction * 500, v39)
end
v5.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_15, (copy) v_u_13, (copy) v_u_1, (copy) v_u_40, (copy) v_u_17, (copy) v_u_9, (copy) v_u_2, (copy) v_u_4
	if v_u_15 and (v_u_15.Character and v_u_15.Character:FindFirstChild("Shovel [Destroy Plants]")) then
		if v_u_13:IsThisOpen() then
			return
		else
			local v41 = v_u_40((v_u_1:GetMouseLocation()))
			if v41 then
				local v42 = v_u_9(v_u_15)
				local v43 = v41.Instance:FindFirstAncestor("Farm")
				if v43 then
					v43 = v43:GetAttribute("CommunityGarden") == true
				end
				if v43 or v42 and v41.Instance:IsDescendantOf(v42) then
					local v44 = v41.Instance:FindFirstAncestorWhichIsA("Model")
					if v44 and (v_u_2:HasTag(v44, "Growable") or v_u_2:HasTag(v44, "PlaceableObject")) then
						if v_u_17.Adornee ~= v44 then
							v_u_17.FillTransparency = 1
							v_u_4:Create(v_u_17, TweenInfo.new(0.25), {
								["FillTransparency"] = 0.65
							}):Play()
						end
						v_u_17.Adornee = v44
					else
						v_u_17.Adornee = nil
					end
				else
					return
				end
			else
				v_u_17.Adornee = nil
				return
			end
		end
	else
		v_u_17.Adornee = nil
		return
	end
end)
local function v_u_58(p45, p46)
	-- upvalues: (copy) v_u_13, (copy) v_u_15, (copy) v_u_40, (copy) v_u_9, (copy) v_u_2, (copy) v_u_28, (copy) v_u_10, (ref) v_u_36, (copy) v_u_18, (copy) v_u_8, (copy) v_u_25, (copy) v_u_11, (copy) v_u_12, (copy) v_u_35, (copy) v_u_7
	if p46 then
		return
	elseif v_u_13:IsThisOpen() then
		return
	elseif v_u_15.Character and v_u_15.Character:FindFirstChild("Shovel [Destroy Plants]") then
		local v47 = v_u_40(p45)
		if v47 then
			local v48 = v47.Instance:FindFirstAncestorWhichIsA("Model")
			if v48 then
				local v49 = v_u_9(v_u_15)
				local v50 = v47.Instance:FindFirstAncestor("Farm")
				if v50 then
					v50 = v50:GetAttribute("CommunityGarden") == true
				end
				if v50 or v49 and v47.Instance:IsDescendantOf(v49) then
					if v_u_2:HasTag(v48, "PlaceableObject") then
						local v51 = v48.Name
						print("TargetModel.Name:", v51)
						if v_u_28(v51) then
							v_u_10:CreateNotification((("You cannot shovel %*!"):format(v51)))
						else
							if v_u_36 then
								v_u_36:Disconnect()
								v_u_36 = nil
							end
							v_u_18.Instance = v48
							v_u_18.IsPlaceableObject = true
							v_u_13:Open({
								["Title"] = "Shovelling...",
								["Header"] = "Are you sure you want to shovel that?",
								["Middle"] = { v51 }
							}, {
								["ConfirmEvent"] = v_u_8,
								["ConfirmEventData"] = { v_u_18.Instance },
								["ConfirmCallback"] = function()
									-- upvalues: (ref) v_u_18, (ref) v_u_36
									v_u_18.Instance = nil
									v_u_18.IsPlaceableObject = false
									if v_u_36 then
										v_u_36:Disconnect()
										v_u_36 = nil
									end
								end
							})
						end
					elseif v48:FindFirstChild("Grow") then
						if v48:GetAttribute("Favorited") then
							v_u_10:CreateNotification("This plant is favorited!")
							return
						else
							local v52 = v48:FindFirstChild("Fruits")
							if v52 then
								for _, v53 in v52:GetChildren() do
									if v53:GetAttribute("Favorited") then
										v_u_10:CreateNotification("This plant has favorited fruit!")
										return
									end
								end
							end
							local v54 = v48.Name
							if v_u_28(v54) then
								v_u_10:CreateNotification((("You cannot shovel %*!"):format(v54)))
								return
							elseif v_u_25(v48) then
								local v55 = v_u_11[v54]
								local v56 = v_u_12.Return_Rarity_Data(v55.SeedRarity)
								local v57 = v_u_35(v54)
								v_u_18.Instance = v48
								v_u_18.IsPlaceableObject = false
								v_u_13:Open({
									["Title"] = "Shovelling...",
									["Header"] = "Are you sure you want to shovel that?",
									["Middle"] = v57,
									["Footer"] = "are considered valuable and removing this cannot be undone.",
									["AnimatedWords"] = {
										[v54] = v56[1]
									}
								}, {
									["ConfirmEvent"] = v_u_7,
									["ConfirmEventData"] = { v48 },
									["ConfirmCallback"] = function()
										-- upvalues: (ref) v_u_18, (ref) v_u_36
										v_u_18.Instance = nil
										v_u_18.IsPlaceableObject = false
										if v_u_36 then
											v_u_36:Disconnect()
											v_u_36 = nil
										end
									end
								})
							else
								v_u_7:FireServer(v47.Instance)
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
		else
			return
		end
	else
		return
	end
end
local v_u_59 = nil
local function v60()
	-- upvalues: (ref) v_u_59, (copy) v_u_1, (copy) v_u_58, (copy) v_u_15
	if v_u_59 then
		v_u_59:Disconnect()
	end
	if v_u_1:GetLastInputType() == Enum.UserInputType.Touch then
		v_u_59 = v_u_1.TouchTapInWorld:Connect(v_u_58)
	else
		v_u_59 = v_u_15:GetMouse().Button1Down:Connect(function()
			-- upvalues: (ref) v_u_58, (ref) v_u_1
			v_u_58(v_u_1:GetMouseLocation(), false)
		end)
	end
end
v_u_1.LastInputTypeChanged:Connect(v60)
task.spawn(v60)