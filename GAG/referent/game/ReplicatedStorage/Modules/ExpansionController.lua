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
local v_u_52 = {
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
		-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_8, (copy) v_u_6, (copy) v_u_52, (copy) v_u_10, (copy) v_u_1, (copy) v_u_12, (copy) v_u_4, (copy) v_u_9, (copy) v_u_5, (copy) v_u_11, (copy) v_u_3
		local v_u_21 = v_u_7(v_u_2)
		if v_u_21 then
			local v_u_22 = v_u_8:GetData()
			if v_u_22 then
				local v_u_23 = {}
				local function v_u_49()
					-- upvalues: (copy) v_u_22, (ref) v_u_6, (copy) v_u_21, (ref) v_u_52, (copy) v_u_23, (ref) v_u_10, (ref) v_u_1, (ref) v_u_12, (ref) v_u_4, (ref) v_u_9, (ref) v_u_5, (ref) v_u_11, (ref) v_u_3, (ref) v_u_2
					if v_u_22.ExpansionsData.CanSeeExpansions then
						if v_u_6:IsHiddenFromUpdate("Expansions") then
							return
						else
							local v24 = v_u_21.Center_Point:GetPivot()
							local v25 = v_u_52:GetNextExpansions()
							local v26 = v_u_22.SaveSlots
							if v26 then
								v26 = v_u_22.SaveSlots.SelectedSlot
							end
							if v26 == "EASTER_2026" then
								for v27, v28 in v_u_23 do
									v28.Trove:Destroy()
									v_u_23[v27] = nil
								end
							else
								for v29, v30 in table.clone(v_u_23) do
									if not table.find(v25, v29) then
										v30.Trove:Destroy()
										v_u_23[v29] = nil
									end
								end
								for _, v_u_31 in v25 do
									if not v_u_23[v_u_31] then
										local v_u_32 = v_u_10[v_u_31]
										local v33 = v_u_1.Assets.Expansions.Models:FindFirstChild((tostring(v_u_31)))
										local v34
										if v33 then
											v34 = v33:FindFirstChild("Expand")
										else
											v34 = v33
										end
										if v34 then
											local v35 = v33:GetPivot():ToObjectSpace(v34:GetPivot())
											local v36 = v_u_12.new()
											local v_u_37 = v36:Clone(v_u_1.Assets.Expansions.ExpandSign)
											v_u_23[v_u_31] = {
												["Model"] = v_u_37,
												["Trove"] = v36
											}
											v_u_37.Name = "ExpansionSign"
											v_u_37:PivotTo(v24:ToWorldSpace(v35))
											v_u_37.Parent = v_u_21
											v36:Add(v_u_37.ProximityPrompt.Triggered:Connect(function(_)
												-- upvalues: (copy) v_u_32, (ref) v_u_22, (copy) v_u_31, (ref) v_u_1
												if v_u_32.Timer then
													local v38 = nil
													for _, v39 in v_u_22.ExpansionsData.ExpansionTimers do
														if v39.Expansion == v_u_31 then
															v38 = v39
														end
													end
													if v38 and workspace:GetServerTimeNow() < v38.Timer then
														v_u_1.GameEvents.Expansions.SkipTimer:FireServer(v_u_31)
														return
													end
												end
												v_u_1.GameEvents.Expansions.Expand:FireServer(v_u_31)
											end))
											local v_u_40 = true
											v36:Add(function()
												-- upvalues: (ref) v_u_40
												v_u_40 = false
											end)
											local v_u_41 = nil
											local v_u_42 = v_u_37.SurfaceGui.TextLabel
											v36:Add(task.spawn(function()
												-- upvalues: (ref) v_u_40, (ref) v_u_22, (copy) v_u_31, (ref) v_u_41, (copy) v_u_42, (copy) v_u_37, (ref) v_u_4, (copy) v_u_32, (ref) v_u_9, (ref) v_u_5, (ref) v_u_11, (ref) v_u_3, (ref) v_u_2
												while v_u_40 do
													local v43 = nil
													for _, v44 in v_u_22.ExpansionsData.ExpansionTimers do
														if v44.Expansion == v_u_31 then
															v43 = v44
														end
													end
													local v45 = (v43 and v43.Timer or 0) - workspace:GetServerTimeNow()
													if v45 <= 0 then
														if v_u_41 ~= true then
															v_u_41 = true
															v_u_42.Text = "Expand Garden"
															v_u_37.ProximityPrompt.ActionText = "Expand"
															v_u_4:RemovePriceLabel(v_u_37.ProximityPrompt)
															if v_u_32.Price then
																v_u_37.ProximityPrompt.ObjectText = v_u_9.DisplaySheckles(v_u_32.Price)
															elseif v_u_32.ProductId then
																if v_u_5 or v_u_32.ProductFallbackPrice == nil then
																	if not v_u_5 then
																		warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_37.ProximityPrompt:GetFullName()))))
																	end
																	v_u_4:SetPriceLabel(v_u_37.ProximityPrompt, v_u_32.ProductId, ":robux::value:")
																else
																	v_u_37.ProximityPrompt.ObjectText = ("%*%*"):format(utf8.char(57346), (v_u_11.Comma(v_u_32.ProductFallbackPrice)))
																end
															end
														end
													elseif v45 > 0 then
														if v_u_41 ~= false then
															v_u_41 = false
															v_u_37.ProximityPrompt.ActionText = "Skip Timer"
															v_u_4:RemovePriceLabel(v_u_37.ProximityPrompt)
															if v_u_32.TimerProductId then
																if v_u_5 or v_u_32.TimerFallbackPrice == nil then
																	if not v_u_5 then
																		warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v_u_37.ProximityPrompt:GetFullName()))))
																	end
																	v_u_4:SetPriceLabel(v_u_37.ProximityPrompt, v_u_32.TimerProductId, ":robux::value:")
																else
																	v_u_37.ProximityPrompt.ObjectText = ("%*%*"):format(utf8.char(57346), (v_u_11.Comma(v_u_32.TimerFallbackPrice)))
																end
															elseif v_u_32.Price then
																v_u_37.ProximityPrompt.ObjectText = ""
															end
														end
														v_u_42.Text = ("Expand in\n%*"):format((v_u_9.compactFormat(v45)))
													end
													local v46 = v_u_37.SurfaceGui.LockedFrame
													local v47 = v46.UnlockInfo
													local v48 = ("GARDEN_SIZE_EXPANSION_%*"):format(v_u_31)
													if v_u_3:HasUnlockedFeature(v_u_2, v48) then
														v_u_37.ProximityPrompt.Enabled = true
														v46.Visible = false
													else
														v_u_37.ProximityPrompt.Enabled = false
														v46.Visible = true
														v47.Text = ("Ascensions Required: %*"):format((v_u_3:GetRemainingRebirthsNeededForFeature(v_u_2, v48)))
													end
													task.wait(1)
												end
											end))
										end
									end
								end
							end
						end
					else
						return
					end
				end
				xpcall(v_u_49, warn)
				local v50 = v_u_8
				assert(v50:GetPathSignal("ExpansionsData/@")):Connect(v_u_49)
				local v51 = v_u_8
				assert(v51:GetPathSignal("SaveSlots/SelectedSlot")):Connect(v_u_49)
				task.spawn(function()
					-- upvalues: (ref) v_u_6, (copy) v_u_49
					while v_u_6:IsHiddenFromUpdate("Expansions") do
						task.wait(1)
					end
					v_u_49()
				end)
			end
		else
			return
		end
	end
}
task.spawn(v_u_52.Start, v_u_52)
return v_u_52