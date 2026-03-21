local v_u_1 = game:GetService("ProximityPromptService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("Players")
local v_u_5 = require(v2.Data.PetRegistry.PetMutationRegistry)
local v_u_6 = require(v2.Modules.GuiController)
require(v2.Data.PetRegistry)
local v7 = require(v2.Modules.Trove)
local v_u_8 = v4.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PetMutationOdds_UI")
local v_u_9 = v_u_8.Frame.Main.Holder
local v_u_10 = v7.new()
local v_u_43 = {
	["Open"] = function(_, p_u_11)
		-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_5, (copy) v_u_3
		local v12 = v_u_6:GetStateForGui(v_u_8)
		if v_u_8 then
			v_u_6:Close(v_u_8)
			v_u_10:Clean()
		end
		v_u_10:Destroy()
		for _, v13 in v_u_9.ScrollingFrame:GetChildren() do
			if v13:IsA("GuiObject") and v13.Name ~= "UIListLayout" then
				v13:Destroy()
			end
		end
		local v14 = 0
		local v15 = {}
		for v16, v17 in v_u_5.PetMutationRegistry do
			local v18 = v17.Chance
			if v18 and v18 ~= 0 then
				v14 = v14 + v18
				table.insert(v15, {
					["Name"] = v16,
					["Item"] = v17,
					["NormalizedOdd"] = v18
				})
			end
		end
		for _, v19 in v15 do
			v19.NormalizedOdd = v19.NormalizedOdd / v14
			v19.NormalizedOdd = v19.NormalizedOdd * 100
		end
		table.sort(v15, function(p20, p21)
			return p20.NormalizedOdd < p21.NormalizedOdd
		end)
		for v22 = 2, #v15 do
			local v23 = v15[v22].NormalizedOdd - v15[1].NormalizedOdd
			if math.abs(v23) > 1e-6 then
				break
			end
		end
		local _ = v15[1].NormalizedOdd
		local v24 = 0
		for _, v25 in v15 do
			local v26 = v_u_9.ScrollingFrame.UIGridLayout.TEMPLATE
			v24 = v24 + 1
			local v_u_27 = v_u_10:Clone(v26).Frame
			local v28 = v_u_27.Parent
			local v29 = v25.NormalizedOdd * 1000
			v28.LayoutOrder = -math.floor(v29)
			v_u_27.Title.Text = v25.Name
			v_u_27.Title.TextColor3 = v25.Item.Color or Color3.new(1, 1, 1)
			local v30 = string.format
			local v31 = v25.NormalizedOdd
			local v32 = tonumber(v30("%.2f", v31))
			v_u_27.Odds.Text = ("%*%%"):format(v32)
			v_u_27.Vector.Visible = false
			if v25.Name == "Ascended" then
				local v_u_33 = nil
				v_u_10:Add(v12.Visible:Listen(function(p34)
					-- upvalues: (ref) v_u_33, (ref) v_u_10, (ref) v_u_3, (copy) v_u_27
					if p34 and not v_u_33 then
						v_u_33 = v_u_10:Add(v_u_3.PostSimulation:Connect(function()
							-- upvalues: (ref) v_u_27
							local v35 = os.clock() * 3.141592653589793
							local v36 = math.sin(v35)
							local v37 = math.abs(v36)
							local v38 = Color3.fromHSV(0.16, 0.25, (math.lerp(1, 0.75, v37)))
							v_u_27.Odds.TextColor3 = v38
							v_u_27.Title.TextColor3 = v38
						end))
					elseif not p34 and v_u_33 then
						v_u_10:Remove(v_u_33)
						v_u_33 = nil
					end
				end))
			elseif v25.Name == "Rainbow" or v32 <= 1 then
				local v_u_39 = nil
				v_u_10:Add(v12.Visible:Listen(function(p40)
					-- upvalues: (ref) v_u_39, (ref) v_u_10, (ref) v_u_3, (copy) v_u_27
					if p40 and not v_u_39 then
						v_u_39 = v_u_10:Add(v_u_3.PostSimulation:Connect(function()
							-- upvalues: (ref) v_u_27
							local v41 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
							v_u_27.Odds.TextColor3 = v41
							v_u_27.Title.TextColor3 = v41
						end))
					elseif not p40 and v_u_39 then
						v_u_10:Remove(v_u_39)
						v_u_39 = nil
					end
				end))
			end
			v_u_27.Title.TextScaled = true
			v_u_27.Odds.TextScaled = true
			v_u_27.Parent.Parent = v_u_9.ScrollingFrame
		end
		v_u_6:Open(v_u_8)
		if p_u_11 then
			v_u_10:Add(v_u_8.Frame.Exit.EXIT_BUTTON.Activated:Once(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_8, (copy) p_u_11, (ref) v_u_10
				v_u_6:Close(v_u_8)
				v_u_6:Open(p_u_11)
				v_u_10:Clean()
			end))
		else
			v_u_10:Add(v_u_8.Frame.Exit.EXIT_BUTTON.Activated:Once(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_8, (ref) v_u_10
				v_u_6:Close(v_u_8)
				v_u_10:Clean()
			end))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_1, (copy) v_u_43
		v_u_6:UsePopupAnims(v_u_8)
		v_u_1.PromptTriggered:Connect(function(p42)
			-- upvalues: (ref) v_u_43
			if p42:HasTag("PetMutationOddsPrompt") then
				v_u_43:Open()
			end
		end)
	end
}
task.spawn(v_u_43.Start, v_u_43)
return v_u_43