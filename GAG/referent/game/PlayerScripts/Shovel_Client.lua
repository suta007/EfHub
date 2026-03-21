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
local v_u_14 = game.Players.LocalPlayer
local v_u_15 = workspace.CurrentCamera
local v_u_16 = script.Highlight
local v_u_17 = {
	["Instance"] = nil,
	["IsPlaceableObject"] = false
}
local v_u_18 = {
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
local v_u_19 = { "Carrot", "Christmas Tree" }
local function v_u_24(p20)
	-- upvalues: (copy) v_u_12, (copy) v_u_18
	local v21 = p20.Name
	local v22 = v_u_12.Return_Data(v21)
	math.randomseed(p20.Item_Seed.Value)
	math.random(700, 1400)
	if math.random(1, v22[4]) == 1 then
		return true
	end
	if p20.Variant.Value ~= "Normal" then
		return true
	end
	for _, v23 in v_u_18 do
		if string.lower(v21) == string.lower(v23) then
			return false
		end
	end
	return true
end
local function v_u_27(p25)
	-- upvalues: (copy) v_u_19
	for _, v26 in v_u_19 do
		if string.lower(p25) == string.lower(v26) then
			return true
		end
	end
	return string.find(string.lower(p25), "sprinkler") and true or false
end
local v_u_28 = nil
local function v_u_32(p29)
	-- upvalues: (copy) v_u_15, (copy) v_u_2
	local v30 = v_u_15:ViewportPointToRay(p29.X, p29.Y)
	local v31 = RaycastParams.new()
	v31.FilterType = Enum.RaycastFilterType.Exclude
	v31.FilterDescendantsInstances = { v_u_2:GetTagged("ShovelIgnore") }
	return workspace:Raycast(v30.Origin, v30.Direction * 500, v31)
end
v5.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_32, (copy) v_u_16, (copy) v_u_9, (copy) v_u_2, (copy) v_u_4
	if v_u_14 and (v_u_14.Character and v_u_14.Character:FindFirstChild("Shovel [Destroy Plants]")) then
		local v33 = v_u_32((v_u_1:GetMouseLocation()))
		if v33 then
			local v34 = v_u_9(v_u_14)
			if v34 and v33.Instance:IsDescendantOf(v34) then
				local v35 = v33.Instance:FindFirstAncestorWhichIsA("Model")
				if v35 and (v_u_2:HasTag(v35, "Growable") or v_u_2:HasTag(v35, "PlaceableObject")) then
					if v_u_16.Adornee ~= v35 then
						v_u_16.FillTransparency = 1
						v_u_4:Create(v_u_16, TweenInfo.new(0.25), {
							["FillTransparency"] = 0.65
						}):Play()
					end
					v_u_16.Adornee = v35
				else
					v_u_16.Adornee = nil
				end
			else
				return
			end
		else
			v_u_16.Adornee = nil
			return
		end
	else
		v_u_16.Adornee = nil
		return
	end
end)
local function v_u_48(p36, p37)
	-- upvalues: (copy) v_u_14, (copy) v_u_32, (copy) v_u_9, (copy) v_u_2, (copy) v_u_27, (copy) v_u_10, (ref) v_u_28, (copy) v_u_17, (copy) v_u_8, (copy) v_u_13, (copy) v_u_24, (copy) v_u_11, (copy) v_u_12, (copy) v_u_7
	if p37 then
		return
	elseif v_u_14.Character and v_u_14.Character:FindFirstChild("Shovel [Destroy Plants]") then
		local v38 = v_u_32(p36)
		if v38 then
			local v39 = v38.Instance:FindFirstAncestorWhichIsA("Model")
			if v39 then
				local v40 = v_u_9(v_u_14)
				if v40 and v38.Instance:IsDescendantOf(v40) then
					if v_u_2:HasTag(v39, "PlaceableObject") then
						local v41 = v39.Name
						print("TargetModel.Name:", v41)
						if v_u_27(v41) then
							v_u_10:CreateNotification((("You cannot shovel %*!"):format(v41)))
						else
							if v_u_28 then
								v_u_28:Disconnect()
								v_u_28 = nil
							end
							v_u_17.Instance = v39
							v_u_17.IsPlaceableObject = true
							v_u_13:Open({
								["Title"] = "Shovelling...",
								["Header"] = "Are you sure you want to shovel that?",
								["Middle"] = ("%*"):format(v41),
								["Footer"] = ""
							}, {
								["ConfirmEvent"] = v_u_8,
								["ConfirmEventData"] = { v_u_17.Instance },
								["ConfirmCallback"] = function()
									-- upvalues: (ref) v_u_17, (ref) v_u_28
									v_u_17.Instance = nil
									v_u_17.IsPlaceableObject = false
									if v_u_28 then
										v_u_28:Disconnect()
										v_u_28 = nil
									end
								end
							})
						end
					elseif v39:FindFirstChild("Grow") then
						if v39:GetAttribute("Favorited") then
							v_u_10:CreateNotification("This plant is favorited!")
							return
						else
							local v42 = v39:FindFirstChild("Fruits")
							if v42 then
								for _, v43 in v42:GetChildren() do
									if v43:GetAttribute("Favorited") then
										v_u_10:CreateNotification("This plant has favorited fruit!")
										return
									end
								end
							end
							local v44 = v39.Name
							if v_u_27(v44) then
								v_u_10:CreateNotification((("You cannot shovel %*!"):format(v44)))
								return
							elseif v_u_24(v39) then
								local v45 = v_u_11[v44]
								local v46 = v45 and v_u_12.Return_Rarity_Data(v45.SeedRarity) or nil
								local _ = v46 and string.format("#%02X%02X%02X", v46[2].R * 255, v46[2].G * 255, v46[2].B * 255)
								v_u_17.Instance = v38.Instance
								v_u_17.IsPlaceableObject = false
								local v47 = {
									["Title"] = "Shovelling...",
									["Header"] = "Are you sure you want to shovel that?",
									["Middle"] = ("%*"):format(v44),
									["Footer"] = "are considered valuable and removing this cannot be undone."
								}
								warn(v39, v39:GetFullName(), v_u_17)
								v_u_13:Open(v47, {
									["ConfirmEvent"] = v_u_7,
									["ConfirmEventData"] = { v39 },
									["ConfirmCallback"] = function()
										-- upvalues: (ref) v_u_17, (ref) v_u_28
										print("Call back")
										v_u_17.Instance = nil
										v_u_17.IsPlaceableObject = false
										if v_u_28 then
											v_u_28:Disconnect()
											v_u_28 = nil
										end
									end
								})
							else
								v_u_7:FireServer(v38.Instance)
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
local v_u_49 = nil
local function v50()
	-- upvalues: (ref) v_u_49, (copy) v_u_1, (copy) v_u_48, (copy) v_u_14
	if v_u_49 then
		v_u_49:Disconnect()
	end
	if v_u_1:GetLastInputType() == Enum.UserInputType.Touch then
		v_u_49 = v_u_1.TouchTapInWorld:Connect(v_u_48)
	else
		v_u_49 = v_u_14:GetMouse().Button1Down:Connect(function()
			-- upvalues: (ref) v_u_48, (ref) v_u_1
			v_u_48(v_u_1:GetMouseLocation(), false)
		end)
	end
end
v_u_1.LastInputTypeChanged:Connect(v50)
task.spawn(v50)