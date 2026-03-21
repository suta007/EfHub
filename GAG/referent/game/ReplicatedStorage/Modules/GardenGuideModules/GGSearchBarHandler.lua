game:GetService("Players")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.PlantTraitsData)
local v3 = v1.Modules.GardenGuideModules
local v_u_4 = require(v3.GGUI)
local v_u_5 = require(v3.DataModules.GGData)
local v_u_6 = require(v3.SortButtonsLogic)
local v_u_7 = require(v3.VirtualList)
local v_u_8 = v1.GameEvents.GardenGuide.GetGGBlacklist:InvokeServer()
local v_u_9 = v_u_4.SearchBar
local v_u_10 = nil
return {
	["ConnectSearchBar"] = function()
		-- upvalues: (ref) v_u_10, (copy) v_u_9, (copy) v_u_4, (copy) v_u_5, (copy) v_u_8, (copy) v_u_2, (copy) v_u_6, (copy) v_u_7
		if v_u_10 then
			v_u_10:Disconnect()
		end
		local v_u_11 = v_u_9.Main.TextBox
		v_u_10 = v_u_11:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (copy) v_u_11, (ref) v_u_4, (ref) v_u_5, (ref) v_u_8, (ref) v_u_2, (ref) v_u_6, (ref) v_u_7
			local v12 = v_u_11.Text
			if v_u_4.CurrentPage then
				local v13 = v_u_4.CurrentPage.Name:gsub("Menu", "")
				if v_u_5[v13] then
					local v14 = {}
					for _, v15 in v_u_5[v13].Data do
						table.insert(v14, v15)
					end
					v_u_4.FilterAlgo = "Searchbar"
					v_u_4.FilterType = v12
					local v16 = ("%*%*"):format(string.upper((string.sub(v12, 1, 1))), (string.lower((string.sub(v12, 2)))))
					local v17 = v_u_8.PlantTraitsBlacklist[v16]
					if v_u_2.TraitNames[v16] and not v17 then
						v_u_4.FilterAlgo = "Trait"
					end
					v_u_6.FilterAndSort(v14)
					v_u_7(v_u_4.CurrentPage, v_u_4.GridSFrame, v14)
				end
			else
				warn("GGSearchBarHandler | No current menu")
				return
			end
		end)
	end
}