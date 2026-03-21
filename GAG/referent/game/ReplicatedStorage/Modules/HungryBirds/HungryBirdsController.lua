local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
require(v1.Modules.GuiController)
require(v1.Modules.Trove)
require(v1.Modules.ItemImageFinder)
require(v1.Modules.NumberUtil)
require(v1.Modules.CommaFormatNumber)
local v_u_3 = require(v1.Modules.GiveServiceCommon)
require(v1.Modules.UpdateService)
require(v1.Modules.Signal)
local v_u_4 = require(v1.Modules.DataService)
local v5 = require(v1.Modules.EventService)
require(v1.Modules.QuestsController)
require(v1.Modules.CreateTagHandler)
local v_u_6 = require(v1.Modules.Notification)
local v_u_7 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
require(v1.Code.Spr)
require(v1.Modules.MarketController)
local v_u_8 = require(script.DecorativeBirds)
local v_u_9 = require(script.RewardPopup)
require(v1.Data.SharedCycleHandlerData)
local v_u_10 = v2.LocalPlayer
local _ = workspace.CurrentCamera
local v11 = v5.new("HungryBirdsController", "Hungry Birds Event")
local v_u_12 = v1.GameEvents.HungryBirds.FeedBirds
local v_u_13 = Instance.new("ProximityPrompt")
v_u_13.Name = "ForceHatchPrompt"
v_u_13.Style = Enum.ProximityPromptStyle.Custom
v_u_13.HoldDuration = 0.5
v_u_13.MaxActivationDistance = 15
v_u_13.RequiresLineOfSight = false
v_u_13.KeyboardKeyCode = Enum.KeyCode.F
v_u_13.ActionText = "Feed"
v_u_13.ObjectText = "FEED"
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = nil
local v17 = RaycastParams.new()
v17.FilterDescendantsInstances = { game.Workspace.Interaction, game.Workspace.BasePlate }
v17.FilterType = Enum.RaycastFilterType.Include
function v11.OnStarted(p_u_18)
	-- upvalues: (ref) v_u_14, (ref) v_u_15, (copy) v_u_13, (copy) v_u_10, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (ref) v_u_16, (copy) v_u_12, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3
	v_u_14 = game.Workspace.Interaction:WaitForChild("Bird_Nest")
	v_u_15 = v_u_14.PrimaryPart:WaitForChild("BillboardGui")
	v_u_13.Parent = v_u_14.PrimaryPart
	local function v_u_27(p19, p20, p21, p22)
		local v23 = math.random() * 3.141592653589793 * 2
		local v24 = p20 + math.random() * (p21 - p20)
		local v25 = math.cos(v23) * v24
		local v26 = math.sin(v23) * v24
		return CFrame.new(p19.X + v25, p19.Y + p22, p19.Z + v26)
	end
	p_u_18:Bind(v_u_13.Triggered:Connect(function(p28)
		-- upvalues: (ref) v_u_10, (ref) v_u_4, (ref) v_u_6, (ref) v_u_7, (ref) v_u_16, (ref) v_u_12
		if p28 == v_u_10 then
			local v29 = v_u_4:GetData()
			if v29 and v29.HungryBirdsEvent then
				local v30 = p28.Character
				if v30 then
					local v31 = v30:FindFirstChildWhichIsA("Tool")
					if v31 then
						if v31:HasTag("FruitTool") or v31:HasTag("FoodTool") then
							if v31:GetAttribute(v_u_7.Favorite) then
								return v_u_6:CreateNotification("You cannot feed pets Favorited fruit.")
							elseif not v31:HasTag("Fed") then
								if (v29.HungryBirdsEvent.CooldownTime or 0) - game.Workspace:GetServerTimeNow() > 0 then
									return v_u_6:CreateNotification("You can only place down one food at a time!")
								end
								if v_u_16 then
									v_u_16 = v_u_16:Destroy()
								end
								v_u_16 = v31:Clone()
								v_u_12:FireServer("Feed")
							end
						else
							return v_u_6:CreateNotification("No food equipped!")
						end
					else
						return v_u_6:CreateNotification("No food equipped!")
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
	end))
	p_u_18:Bind(task.spawn(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_13, (ref) v_u_6
		while true do
			repeat
				task.wait(1)
				local v32 = v_u_4:GetData()
			until v32 and v32.HungryBirdsEvent
			local v33 = (v32.HungryBirdsEvent.CooldownTime or 0) - game.Workspace:GetServerTimeNow()
			if (v33 <= 0 or v33 > 5) and (v33 <= 0 and not v_u_13.Enabled) then
				v_u_6:CreateNotification("The birds are hungry!")
			end
		end
	end))
	local v_u_34 = v_u_8.new(v_u_14.PrimaryPart.Position, {
		["PetTypes"] = {
			"Cuckoo",
			"Gold Finch",
			"Brown Owl",
			"Black Bird",
			"Birb"
		}
	})
	v_u_34:Start()
	p_u_18:Bind(function()
		-- upvalues: (copy) v_u_34
		if v_u_34 then
			v_u_34:Stop()
		end
	end)
	p_u_18:Bind(v_u_12.OnClientEvent:Connect(function(_, p_u_35, p36)
		-- upvalues: (ref) v_u_16, (ref) v_u_14, (copy) v_u_27, (copy) p_u_18, (copy) v_u_34, (ref) v_u_9, (ref) v_u_3, (ref) v_u_6
		if v_u_16 then
			local v37 = v_u_16:Clone()
			v_u_16 = v_u_16:Destroy()
			local v_u_38 = Instance.new("Model")
			for _, v39 in pairs(v37:GetDescendants()) do
				if v39:IsA("BasePart") then
					v39.Anchored = true
					v39.Parent = v_u_38
					if v39.Name == "Handle" then
						v_u_38.PrimaryPart = v39
					end
				end
			end
			v37:Destroy()
			local _, v40 = v_u_38:GetBoundingBox()
			v_u_38:ScaleTo(2 / v40.Y)
			v_u_38.Parent = v_u_14
			local _, v41 = v_u_38:GetBoundingBox()
			local v_u_42 = v_u_27(v_u_14.PrimaryPart.Position, 0, 0, v41.Y / 2)
			v_u_38:PivotTo(v_u_42)
			p_u_18:Bind(task.delay(p36, function()
				-- upvalues: (ref) v_u_34, (copy) v_u_38, (ref) v_u_9, (copy) v_u_42, (ref) v_u_3, (copy) p_u_35, (ref) v_u_6
				v_u_34:AddFood(v_u_38.PrimaryPart, function()
					-- upvalues: (ref) v_u_9, (ref) v_u_42, (ref) v_u_3, (ref) p_u_35, (ref) v_u_6
					v_u_9.Create(v_u_42.Position, v_u_3:GetImage(p_u_35), {
						["PopHeight"] = 5,
						["HoverDuration"] = 2,
						["CurveHeight"] = 25,
						["FollowDuration"] = 1.35
					}, function()
						-- upvalues: (ref) v_u_6, (ref) v_u_3, (ref) p_u_35
						v_u_6:CreateNotification((("The birds rewarded you with %*!"):format((v_u_3:Format(p_u_35)))))
					end)
				end)
			end))
		end
	end))
end
function v11.OnEnded(_) end
return v11