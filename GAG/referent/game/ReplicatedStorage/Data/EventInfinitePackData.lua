local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.WeightRandom)
require(v1.Modules.UpdateService)
require(v1.Data.InfinitePackData.InfinitePackTypes)
local _ = script.EventPacks
local v_u_3 = require(script.EventInfinitePackProductIds)
local v20 = {
	["ReplaceNormalPack"] = false,
	["CurrentPack"] = nil,
	["Rewards"] = nil,
	["GetRewards"] = function(p4, p5, p6)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v7 = Random.new
		local v8 = p4.UserId
		local v9 = v7((bit32.bxor(p5, v8)))
		local v10 = nil
		if not v10 then
			error((("EventInfinitePackData:GetCurrentPackRewardData() | Event Infinite Pack \"%*\" not found"):format(nil)))
			return {}
		end
		local v11 = {}
		for v12 = 1, p6 do
			local v13 = {}
			local v14
			if v12 == 1 then
				v14 = nil
			else
				if v12 == 2 then
					::l9::
					for _, v15 in v_u_3 do
						if v12 < v15[2] then
							v14 = v15[1]
							goto l7
						end
					end
					v14 = nil
					goto l7
				end
				local v16 = v12 - 2
				if math.max(v16, 0) % 5 == 0 then
					goto l9
				end
				v14 = nil
			end
			::l7::
			local v17 = v_u_2.array
			local v18
			if v14 then
				v18 = v10.Paid
			else
				v18 = v10.Free
			end
			local v19 = v17(v18, v9)
			table.insert(v13, v19)
			v11[v12] = {
				["Rewards"] = v13,
				["ProductId"] = v14
			}
		end
		return v11
	end,
	["FallbackPrices"] = {
		[3425555547] = 37,
		[3425556327] = 99,
		[3425557211] = 175,
		[3425557487] = 375,
		[3425557881] = 495
	}
}
return v20