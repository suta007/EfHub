local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v_u_1.Modules.RebirthUnlocksSharedService)
local v_u_4 = require(v_u_1.Modules.MarketController)
local v_u_5 = require(v_u_1.Modules.UseDynamicPrices)
local v_u_6 = require(v_u_1.Modules.UpdateService)
local v_u_7 = require(v_u_1.Modules.GetFarmAsync)
local v_u_8 = require(v_u_1.Modules.DataService)
local v_u_9 = require(v_u_1.Modules.NumberUtil)
require(v_u_1.Modules.Observers)
local v_u_10 = require(v_u_1.Data.Expansions)
local v_u_11 = require(v_u_1.Comma_Module)
local v_u_12 = require(v_u_1.Modules.Trove)
local v_u_48 = {
	["GetNextExpansions"] = function(_)
		-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_10
		local v13 = v_u_8:GetData()
		if not v13 then
			return {}
		end
		if v_u_6:IsHiddenFromUpdate("Expansions") then
			return {}
		end
		local v14 = v13.ExpansionsData.Unlocked
		local v15 = {}
		for v16, v17 in v_u_10 do
			if not table.find(v14, v16) then
				local v18 = v17.Requires
				local v19 = true
				if v18 then
					for _, v20 in v18 do
						if not table.find(v14, v20) then
							v19 = false
							break
						end
					end
				end
				if v19 then
					table.insert(v15, v16)
				end
			end
		end
		return v15
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_8, (copy) v_u_6, (copy) v_u_48, (copy) v_u_10, (copy) v_u_1, (copy) v_u_12, (copy) v_u_4, (copy) v_u_9, (copy) v_u_5, (copy) v_u_11, (copy) v_u_3
		local v_u_21 = v_u_7(v_u_2)
		if v_u_21 then
			local v_u_22 = v_u_8:GetData()
			if v_u_22 then
				local v_u_23 = {}
				local function v_u_46()
					-- upvalues: (copy) v_u_22, (ref) v_u_6, (copy) v_u_21, (ref) v_u_48, (copy) v_u_23, (ref) v_u_10, (ref) v_u_1, (ref) v_u_12, (ref) v_u_4, (ref) v_u_9, (ref) v_u_5, (ref) v_u_11, (ref) v_u_3, (ref) v_u_2
					if v_u_22.ExpansionsData.CanSeeExpansions then
						if not v_u_6:IsHiddenFromUpdate("Expansions") then
							local v24 = v_u_21.Center_Point:GetPivot()
							local v25 = v_u_48:GetNextExpansions()
							for v26, v27 in table.clone(v_u_23) do
								if not table.find(v25, v26) then
									v27.Trove:Destroy()
									v_u_23[v26] = nil
								end
							end
							for _, v_u_28 in v25 do
								if not v_u_23[v_u_28] then
									local v_u_29 = v_u_10[v_u_28]
									local v30 = v_u_1.Assets.Expansions.Models:FindFirstChild((tostring(v_u_28)))
									local v31
									if v30 then
										v31 = v30:FindFirstChild("Expand")
									else
										v31 = v30
									end
									if v31 then
										local v32 = v30:GetPivot():ToObjectSpace(v31:GetPivot())
										local v33 = v_u_12.new()
										local v_u_34 = v33:Clone(v_u_1.Assets.Expansions.ExpandSign)
										v_u_23[v_u_28] = {
											["Model"] = v_u_34,
											["Trove"] = v33
										}
										v_u_34.Name = "ExpansionSign"
										v_u_34:PivotTo(v24:ToWorldSpace(v32))
										v_u_34.Parent = v_u_21
										v33:Add(v_u_34.ProximityPrompt.Triggered:Connect(function(_)
											-- upvalues: (copy) v_u_29, (ref) v_u_22, (copy) v_u_28, (ref) v_u_1
											if v_u_29.Timer then
												local v35 = nil
												for _, v36 in v_u_22.ExpansionsData.ExpansionTimers do
													if v36.Expansion == v_u_28 then
														v35 = v36
													end
												end
												if v35 and workspace:GetServerTimeNow() < v35.Timer then
													v_u_1.GameEvents.Expansions.SkipTimer:FireServer(v_u_28)
													return
												end
											end
											v_u_1.GameEvents.Expansions.Expand:FireServer(v_u_28)
										end))
										local v_u_37 = true
										v33:Add(function()
											-- upvalues: (ref) v_u_37
											v_u_37 = false
										end)
										local v_u_38 = nil
										local v_u_39 = v_u_34.SurfaceGui.TextLabel
										v33:Add(task.spawn(function()
											-- upvalues: (ref) v_u_37, (ref) v_u_22, (copy) v_u_28, (ref) v_u_38, (copy) v_u_39, (copy) v_u_34, (ref) v_u_4, (copy) v_u_29, (ref) v_u_9, (ref) v_u_5, (ref) v_u_11, (ref) v_u_3, (ref) v_u_2
											while v_u_37 do
												local v40 = nil
												for _, v41 in v_u_22.ExpansionsData.ExpansionTimers do
													if v41.Expansion == v_u_28 then
														v40 = v41
													end
												end
												local v42 = (v40 and v40.Timer or 0) - workspace:GetServerTimeNow()
												if v42 <= 0 then
													if v_u_38 ~= true then
														v_u_38 = true
														v_u_39.Text = "Expand Garden"
														v_u_34.ProximityPrompt.ActionText = "Expand"
														v_u_4:RemovePriceLabel(v_u_34.ProximityPrompt)
														if v_u_29.Price then
															v_u_34.ProximityPrompt.ObjectText = v_u_9.DisplaySheckles(v_u_29.Price)
														elseif v_u_29.ProductId then
															if v_u_5 or v_u_29.ProductFallbackPrice == nil then
																if not v_u_5 then
																	warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_34.ProximityPrompt:GetFullName()))))
																end
																v_u_4:SetPriceLabel(v_u_34.ProximityPrompt, v_u_29.ProductId, ":robux::value:")
															else
																v_u_34.ProximityPrompt.ObjectText = ("%*%*"):format(utf8.char(57346), (v_u_11.Comma(v_u_29.ProductFallbackPrice)))
															end
														end
													end
												elseif v42 > 0 then
													if v_u_38 ~= false then
														v_u_38 = false
														v_u_34.ProximityPrompt.ActionText = "Skip Timer"
														v_u_4:RemovePriceLabel(v_u_34.ProximityPrompt)
														if v_u_29.TimerProductId then
															if v_u_5 or v_u_29.TimerFallbackPrice == nil then
																if not v_u_5 then
																	warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_34.ProximityPrompt:GetFullName()))))
																end
																v_u_4:SetPriceLabel(v_u_34.ProximityPrompt, v_u_29.TimerProductId, ":robux::value:")
															else
																v_u_34.ProximityPrompt.ObjectText = ("%*%*"):format(utf8.char(57346), (v_u_11.Comma(v_u_29.TimerFallbackPrice)))
															end
														elseif v_u_29.Price then
															v_u_34.ProximityPrompt.ObjectText = ""
														end
													end
													v_u_39.Text = ("Expand in\n%*"):format((v_u_9.compactFormat(v42)))
												end
												local v43 = v_u_34.SurfaceGui.LockedFrame
												local v44 = v43.UnlockInfo
												local v45 = ("GARDEN_SIZE_EXPANSION_%*"):format(v_u_28)
												if v_u_3:HasUnlockedFeature(v_u_2, v45) then
													v_u_34.ProximityPrompt.Enabled = true
													v43.Visible = false
												else
													v_u_34.ProximityPrompt.Enabled = false
													v43.Visible = true
													v44.Text = ("Ascensions Required: %*"):format((v_u_3:GetRemainingRebirthsNeededForFeature(v_u_2, v45)))
												end
												task.wait(1)
											end
										end))
									end
								end
							end
						end
					else
						return
					end
				end
				xpcall(v_u_46, warn)
				local v47 = v_u_8
				assert(v47:GetPathSignal("ExpansionsData/@")):Connect(v_u_46)
				task.spawn(function()
					-- upvalues: (ref) v_u_6, (copy) v_u_46
					while v_u_6:IsHiddenFromUpdate("Expansions") do
						task.wait(1)
					end
					v_u_46()
				end)
			end
		else
			return
		end
	end
}
task.spawn(v_u_48.Start, v_u_48)
return v_u_48