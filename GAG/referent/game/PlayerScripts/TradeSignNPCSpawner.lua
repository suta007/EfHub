local v1 = game:GetService("CollectionService")
local v2 = require(game.ReplicatedStorage.Data.TradeWorldData)
local v_u_3 = require(game.ReplicatedStorage.Modules.TradeControllers.TradeUIUtils)
local v_u_4 = script:WaitForChild("You")
local v_u_5 = v1:GetTagged("TradeSignNPCSpawner")[1]
if game.PlaceId == v2.PlaceId and true or v2.ForceInWorld == true then
	local v_u_6 = {
		{
			["ItemType"] = "Pet",
			["ItemData"] = {
				["PetType"] = "Kitsune"
			},
			["Price"] = "???"
		},
		{
			["ItemType"] = "Pet",
			["ItemData"] = {
				["PetType"] = "Raccoon"
			},
			["Price"] = "???"
		},
		{
			["ItemType"] = "Holdable",
			["ItemData"] = {
				["ItemName"] = "Bone Blossom"
			},
			["Price"] = "???"
		},
		{
			["ItemType"] = "Holdable",
			["ItemData"] = {
				["ItemName"] = "Candy Blossom"
			},
			["Price"] = "???"
		}
	}
	local function v_u_13(p7)
		-- upvalues: (copy) v_u_6, (copy) v_u_3
		local v8 = p7:FindFirstChild("BoothSignPurchase"):FindFirstChild("Core_Part"):FindFirstChild("SurfaceGui"):FindFirstChild("Container")
		local v9 = v8:FindFirstChild("ItemTemplate")
		for v10 = 1, #v_u_6 do
			local v11 = v9:Clone()
			v11.Parent = v8
			v11.Name = tostring(v10)
			v11.Visible = true
			local v12 = {
				["id"] = "",
				["type"] = v_u_6[v10].ItemType,
				["data"] = v_u_6[v10].ItemData,
				["listingOwner"] = "",
				["listingUUID"] = "",
				["listingPrice"] = v_u_6[v10].Price
			}
			v_u_3.PopulateItemFrame(v11, v12)
		end
	end
	task.defer(function()
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_13
		if v_u_5:IsDescendantOf(workspace) then
			local v14 = v_u_4:Clone()
			v14.Parent = workspace:FindFirstChild("TradeWorld") or workspace
			v14:PivotTo(v_u_5:GetPivot())
			v14:FindFirstChild("TradeSignNPCHandler").Enabled = true
			v_u_13(v14)
			v14:FindFirstChild("BoothSignPurchase"):FindFirstChild("Core_Part"):FindFirstChild("ProximityPrompt"):FindFirstChild("BoothSignProximityPrompt").Enabled = true
		end
	end)
end