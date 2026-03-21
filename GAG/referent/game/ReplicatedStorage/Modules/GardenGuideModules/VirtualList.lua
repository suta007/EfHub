game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.GardenGuideModules.GridCellHandler)
require(v1.Modules.GardenGuideModules.SortButtonsLogic)
require(v1.Modules.GardenGuideModules.VirtualListGridCellCreator)
local v_u_3 = require(v1.Modules.TradePlaza.TradePlazaIndexUICreator)
local v_u_4 = nil
local v_u_5 = {}
local v_u_6 = {}
local v_u_13 = {
	["GardenGuide"] = function(p7, p8, p9)
		-- upvalues: (copy) v_u_2
		return v_u_2.CreateGridCell(p7, p8, p9.DataType)
	end,
	["TradePlazaIndex"] = function(p10, p11, p12)
		-- upvalues: (copy) v_u_3
		return v_u_3.CreateGridCell(p10, p11, p12.GridType, p12)
	end
}
local v_u_22 = {
	["GardenGuide"] = function(p14, p15, p16, p17)
		-- upvalues: (copy) v_u_2
		return v_u_2.RemakeGridCell(p14, p15, p16, p17.DataType)
	end,
	["TradePlazaIndex"] = function(p18, p19, p20, p21)
		-- upvalues: (copy) v_u_3
		return v_u_3.RemakeGridCell(p18, p19, p20, p21)
	end
}
return function(p_u_23, p_u_24, p25, p26)
	-- upvalues: (ref) v_u_5, (copy) v_u_13, (ref) v_u_6, (copy) v_u_22, (ref) v_u_4
	for _, v27 in p_u_23:GetChildren() do
		if v27:IsA("Frame") or v27:IsA("ImageButton") then
			v27:Destroy()
		end
	end
	v_u_5 = {}
	local v_u_28 = not p26 and 7 or p26.ColumnCount
	local v29 = #p25 / v_u_28
	local v30 = math.ceil(v29) + 1
	local v31 = not p26 and 3 or p26.RowCount
	local v_u_32 = not p26 and 21 or p26.PoolSize
	local v_u_33 = p_u_23.Name:gsub("Menu", "")
	local v_u_34
	if p26 then
		v_u_34 = p26.GridType
	else
		v_u_34 = nil
	end
	local v35 = p_u_23.AbsoluteSize.X
	local v36 = p_u_23.AbsoluteSize.Y
	local v37 = not p26 and 5 or p26.GapSize
	local v38 = (v35 - v37 * (v_u_28 * 2)) / v_u_28
	local v39 = v38 / v35
	local v_u_40 = (v36 - v37 * (v31 * 2)) / v31
	local _ = v_u_40 / v36
	local v41 = 2 * v37 + v38
	local v42 = 2 * v37 + v_u_40
	local v43 = #p25
	local v44 = 1
	local v45 = 0
	local v46 = 0
	for v47 = 1, math.min(v_u_32, v43) do
		local v48 = {
			["DataType"] = v_u_33,
			["GridType"] = v_u_34
		}
		local v49 = v_u_13[v_u_34 or "GardenGuide"]
		if v49 then
			local v50 = v49(p_u_23, p25[v47], v48)
			v50.Size = UDim2.fromScale(v39, v39)
			local v51 = v41 / 2 + v45
			local v52 = v51 / v35
			local v53 = v42 / 2 + v46
			local v54 = v53 / v36
			v50.Position = UDim2.fromScale(v52, v54)
			v45 = v51 + v41 / 2
			v50.Parent = p_u_23
			local v55 = v_u_5
			table.insert(v55, v50)
			v44 = v44 + 1
			if v_u_28 < v44 then
				v46 = v53 + v42 / 2
				v44 = 1
				v45 = 0
			end
		end
	end
	v_u_6 = p25
	p_u_24.CanvasSize = UDim2.new(0, 0, 0, v30 * v_u_40)
	local function v_u_65()
		-- upvalues: (copy) p_u_24, (copy) v_u_40, (copy) v_u_28, (copy) v_u_32, (ref) v_u_6, (ref) v_u_5, (copy) v_u_33, (ref) v_u_22, (copy) v_u_34, (copy) p_u_23
		local v56 = p_u_24.CanvasPosition.Y / v_u_40
		local v57 = (math.floor(v56) + 1 - 1) * v_u_28 + 1
		local v58 = v_u_32
		local v59 = #v_u_6
		for v60 = 1, math.min(v58, v59) do
			local v61 = v_u_5[v60]
			local v62 = v57 + (v60 - 1)
			if v62 <= #v_u_6 then
				local v63 = {
					["DataType"] = v_u_33,
					["ExistingCell"] = v61
				}
				local v64 = v_u_22[v_u_34 or "GardenGuide"]
				if v64 then
					v64(v61, p_u_23, v_u_6[v62], v63)
					v61.Visible = true
				end
			else
				v61.Visible = false
			end
		end
	end
	if v_u_4 then
		v_u_4:Disconnect()
	end
	v_u_4 = p_u_24:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		-- upvalues: (copy) p_u_24, (copy) v_u_65
		if p_u_24:FindFirstAncestorOfClass("ScreenGui").Enabled then
			v_u_65()
		end
	end)
end