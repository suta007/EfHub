local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v1.Modules.TradeControllers.TradeFindSellerController)
local v_u_3 = require(v1.Modules.GuiController)
local v_u_4 = require(v1.Comma_Module)
local v_u_5 = require(v1.Modules.DataService)
require(v1.Modules.NumberUtil)
local v6 = require(v1.Data.SeasonPass.SeasonPassStaticData)
local v_u_7 = require(v1.Modules.TradePlaza.TradePlazaUtils)
local v_u_8 = require(v1.Modules.GardenGuideModules.VirtualList)
require(v1.Modules.TradeTokens.TokenRAPUtil)
local v9 = require(v1.Modules.ReplicationReciever)
local v_u_10 = require(v1.Modules.PlayClickSound)
local v11 = require(v1.Modules.TradeControllers.TradeWorldController)
local v_u_12 = v9.new("TokenRAPs")
local v13 = v2.LocalPlayer.PlayerGui
local v_u_14 = v6.ButtonColors
local v_u_15 = v13:WaitForChild("TradePlazaIndex")
local v_u_16 = v13:WaitForChild("BuyTokens")
local v_u_17 = v13:WaitForChild("TokensInfo")
local v_u_18 = v_u_15.Frame
local v_u_19 = v_u_18.Sections.ItemsList
local v_u_20 = v_u_19.GridSFrame
local v_u_21 = v_u_19.ItemsVirtualList
local v_u_22 = v_u_18.Sections.RAPHistory
local v_u_23 = {
	"Seeds",
	"Plants",
	"Pets",
	"Crates",
	"TradeBoothSkins"
}
local v_u_24 = "Plants"
local v_u_25 = {
	["GridType"] = "TradePlazaIndex",
	["ColumnCount"] = 7,
	["RowCount"] = 3,
	["PoolSize"] = 21,
	["GapSize"] = 5
}
local v_u_26 = 1
local v_u_27 = { "Rarity Asc", "Rarity Desc" }
local v_u_28 = {}
local function v_u_43()
	-- upvalues: (copy) v_u_18, (copy) v_u_14, (copy) v_u_10, (copy) v_u_19, (copy) v_u_22, (copy) v_u_23, (ref) v_u_24, (copy) v_u_20, (copy) v_u_7, (copy) v_u_27, (ref) v_u_26, (copy) v_u_8, (copy) v_u_21, (copy) v_u_25
	local v_u_29 = v_u_18.SideBtns
	local function v_u_39(p30)
		-- upvalues: (copy) v_u_29, (ref) v_u_14
		for _, v31 in v_u_29:GetChildren() do
			if v31:IsA("ImageButton") then
				local v32 = v31 == p30
				local v33
				if v32 then
					v33 = v_u_14.Green.Background
				else
					v33 = v_u_14.Brown.Background
				end
				v31.BackgroundColor3 = v33
				local v34 = v31:FindFirstChild("UIStroke")
				if v34 then
					local v35
					if v32 then
						v35 = v_u_14.Green.ButtonStroke
					else
						v35 = v_u_14.Brown.ButtonStroke
					end
					v34.Color = v35
				end
				local v36 = v31:FindFirstChild("Label")
				if v36 then
					local v37 = v36:FindFirstChild("UIStroke")
					if v37 then
						local v38
						if v32 then
							v38 = v_u_14.Green.TextStroke
						else
							v38 = v_u_14.Brown.TextStroke
						end
						v37.Color = v38
					end
				end
			end
		end
	end
	for _, v_u_40 in v_u_29:GetChildren() do
		if v_u_40:IsA("ImageButton") then
			v_u_40.Activated:Connect(function()
				-- upvalues: (ref) v_u_10, (copy) v_u_39, (copy) v_u_40, (ref) v_u_19, (ref) v_u_22, (ref) v_u_23, (ref) v_u_24, (ref) v_u_20, (ref) v_u_7, (ref) v_u_27, (ref) v_u_26, (ref) v_u_8, (ref) v_u_21, (ref) v_u_25
				v_u_10()
				v_u_39(v_u_40)
				v_u_19.Visible = true
				v_u_22.Visible = false
				if table.find(v_u_23, v_u_40.Name) then
					v_u_24 = v_u_40.Name
					local v41 = v_u_24
					v_u_20.CanvasPosition = Vector2.zero
					local v42 = v_u_7.GetItemsForCategory(v41, nil)
					v_u_7.SortItems(v42, v_u_27[v_u_26])
					v_u_8(v_u_21, v_u_20, v42, v_u_25)
				else
					warn((("No valid category found for %*"):format(v_u_40.Name)))
				end
			end)
		end
	end
end
local function v_u_51()
	-- upvalues: (copy) v_u_19, (copy) v_u_27, (ref) v_u_26, (copy) v_u_10, (ref) v_u_24, (copy) v_u_20, (copy) v_u_7, (copy) v_u_8, (copy) v_u_21, (copy) v_u_25
	local v_u_44 = v_u_19.Sort
	v_u_44.Label.Text = ("%*"):format((v_u_27[v_u_26]:gsub(" Asc", ""):gsub(" Desc", "")))
	local v45 = string.find(v_u_27[v_u_26], "Asc")
	local v_u_46 = v_u_44.Vector
	v_u_46.Rotation = v45 and 180 or 0
	v_u_44.Activated:Connect(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_26, (ref) v_u_27, (copy) v_u_44, (copy) v_u_46, (ref) v_u_24, (ref) v_u_20, (ref) v_u_7, (ref) v_u_8, (ref) v_u_21, (ref) v_u_25
		v_u_10()
		local v47 = (v_u_26 + 1) % (#v_u_27 + 1)
		v_u_26 = math.max(v47, 1)
		local v48 = v_u_27[v_u_26]:gsub(" Asc", ""):gsub(" Desc", "")
		v_u_44.Label.Text = ("%*"):format(v48)
		v_u_46.Rotation = string.find(v_u_27[v_u_26], "Asc") and 180 or 0
		local v49 = v_u_24
		v_u_20.CanvasPosition = Vector2.zero
		local v50 = v_u_7.GetItemsForCategory(v49, nil)
		v_u_7.SortItems(v50, v_u_27[v_u_26])
		v_u_8(v_u_21, v_u_20, v50, v_u_25)
	end)
end
function v_u_28.Initialize()
	-- upvalues: (ref) v_u_24, (copy) v_u_20, (copy) v_u_7, (copy) v_u_27, (ref) v_u_26, (copy) v_u_8, (copy) v_u_21, (copy) v_u_25, (copy) v_u_19, (copy) v_u_22
	local v52 = v_u_24
	v_u_20.CanvasPosition = Vector2.zero
	local v53 = v_u_7.GetItemsForCategory(v52, nil)
	v_u_7.SortItems(v53, v_u_27[v_u_26])
	v_u_8(v_u_21, v_u_20, v53, v_u_25)
	v_u_19.Visible = true
	v_u_22.Visible = false
end
function v_u_28.Start(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_15, (copy) v_u_5, (copy) v_u_18, (copy) v_u_21, (ref) v_u_24, (copy) v_u_20, (copy) v_u_7, (copy) v_u_27, (ref) v_u_26, (copy) v_u_8, (copy) v_u_25, (copy) v_u_10, (copy) v_u_4, (copy) v_u_16, (copy) v_u_17, (copy) v_u_43, (copy) v_u_51, (copy) v_u_28, (copy) v_u_12
	v_u_3:UsePopupAnims(v_u_15)
	local v_u_54 = v_u_5:GetData()
	if v_u_54 then
		v_u_18.Close.Activated:Connect(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_15
			v_u_3:Close(v_u_15)
		end)
		v_u_21:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: (ref) v_u_24, (ref) v_u_20, (ref) v_u_7, (ref) v_u_27, (ref) v_u_26, (ref) v_u_8, (ref) v_u_21, (ref) v_u_25
			local v55 = v_u_24
			v_u_20.CanvasPosition = Vector2.zero
			local v56 = v_u_7.GetItemsForCategory(v55, nil)
			v_u_7.SortItems(v56, v_u_27[v_u_26])
			v_u_8(v_u_21, v_u_20, v56, v_u_25)
		end)
		local v_u_57 = v_u_15.Frame.TokenCounter
		v_u_57.Label.Text = ("Tokens: %*"):format((v_u_4.Comma(v_u_54.TradeData.Tokens)))
		v_u_5:GetPathSignal("TradeData/Tokens"):Connect(function()
			-- upvalues: (copy) v_u_57, (ref) v_u_4, (copy) v_u_54
			v_u_57.Label.Text = ("Tokens: %*"):format((v_u_4.Comma(v_u_54.TradeData.Tokens)))
		end)
		local v_u_58 = v_u_16
		local v_u_59 = v_u_15
		v_u_57.Buy.Activated:Connect(function()
			-- upvalues: (ref) v_u_10, (copy) v_u_58, (ref) v_u_3, (copy) v_u_59
			v_u_10()
			local v60 = v_u_58:FindFirstChild("Close", true)
			if v60 then
				v60.Activated:Once(function()
					-- upvalues: (ref) v_u_3, (ref) v_u_58, (ref) v_u_59
					v_u_3:Close(v_u_58)
					v_u_3:Open(v_u_59)
				end)
			end
			v_u_3:Open(v_u_58)
		end)
		local v_u_61 = v_u_17
		local v_u_62 = v_u_15
		v_u_57.Info.Activated:Connect(function()
			-- upvalues: (ref) v_u_10, (copy) v_u_61, (ref) v_u_3, (copy) v_u_62
			v_u_10()
			local v63 = v_u_61:FindFirstChild("Close", true)
			if v63 then
				v63.Activated:Once(function()
					-- upvalues: (ref) v_u_3, (ref) v_u_61, (ref) v_u_62
					v_u_3:Close(v_u_61)
					v_u_3:Open(v_u_62)
				end)
			end
			v_u_3:Open(v_u_61)
		end)
		v_u_43()
		local v_u_64 = v_u_18.Sections.ItemsList.SearchBox
		v_u_64:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (ref) v_u_24, (copy) v_u_64, (ref) v_u_20, (ref) v_u_7, (ref) v_u_27, (ref) v_u_26, (ref) v_u_8, (ref) v_u_21, (ref) v_u_25
			local v65 = v_u_24
			local v66 = v_u_64.Text
			v_u_20.CanvasPosition = Vector2.zero
			local v67 = v_u_7.GetItemsForCategory(v65, v66)
			v_u_7.SortItems(v67, v_u_27[v_u_26])
			v_u_8(v_u_21, v_u_20, v67, v_u_25)
		end)
		v_u_51()
		v_u_28.Initialize()
		local v68 = v_u_12:GetPathSignal("RAPs/@")
		if v68 then
			v68:Connect(function(p69, p70, p71)
				-- upvalues: (ref) v_u_28
				print(p69, p70, p71)
				v_u_28.Initialize()
			end)
		end
		v_u_12:GetDataAsync(20)
	else
		warn("TradeMenuController | No player data found")
	end
end
if v11:IsInWorld() then
	task.spawn(v_u_28.Start, v_u_28)
end
return v_u_28