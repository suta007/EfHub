local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("LocalizationService")
local v3 = game:GetService("Players")
require(v_u_1.Modules.GuiController)
require(v_u_1.Modules.TradeTokens.TokenRAPUtil)
local v_u_4 = require(v_u_1.Comma_Module)
local v_u_5 = require(v_u_1.Modules.TradeTokens.TokenRAPController)
local v_u_6 = require(v_u_1.Modules.Notification)
local v_u_7 = v3.LocalPlayer.PlayerGui:WaitForChild("TradePlazaIndex").Frame.Sections.RAPHistory.Dots.DotTemplate:Clone()
local v68 = {
	["Show"] = function(_, p8, p9, p10)
		-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
		if not p10 then
			return false
		end
		for _, v11 in p10.Dots:GetChildren() do
			if v11:IsA("GuiObject") or v11:IsA("Path2D") then
				v11:Destroy()
			end
		end
		local v12 = v_u_2.RobloxLocaleId
		local v13 = DateTime.now()
		for v14 = 5, 1, -1 do
			local v15 = DateTime.fromUnixTimestamp(v13.UnixTimestamp - (v14 - 1) * 86400)
			local v16 = p10.Dates:FindFirstChild((("Option%*"):format(5 - v14 + 1)))
			if v16 then
				v16.Text = v15:FormatLocalTime("MMM D", v12)
			end
		end
		local v17, v18 = v_u_1.GameEvents.TradeEvents.TokenRAPs.GetItemRAPHistory:InvokeServer(p8, p9)
		if not (v17 and v18) then
			v_u_6:CreateNotification((("RAP History failed to load: %*"):format(p9)))
			return false
		end
		local v19 = {}
		local v20 = {}
		for _, v21 in v18 do
			local v22 = v21.Date:ToUniversalTime()
			local v23 = DateTime.fromUniversalTime(v22.Year, v22.Month, v22.Day).UnixTimestampMillis
			if not v19[v23] then
				v19[v23] = {}
			end
			local v24 = v19[v23]
			table.insert(v24, v21)
		end
		local v25 = 0
		for v26, v27 in v19 do
			local v28 = 0
			local v29 = 0
			for _, v30 in v27 do
				v28 = v28 + v30.DailyRAP
				v29 = v29 + v30.DailySaleCount
			end
			local v31 = v28 / #v27
			if v25 < v31 then
				v25 = v31
			end
			local v32 = {
				["Date"] = DateTime.fromUnixTimestampMillis(v26),
				["DailyRAP"] = v31,
				["DailySaleCount"] = v29
			}
			table.insert(v20, v32)
		end
		local v33 = v_u_5:GetRAPById(p8, p9) or 0
		local v34 = math.max(v25, v33)
		p10.Price.Amount.Text = v33
		local v35 = v34 <= 0 and 100 or v34
		table.sort(v20, function(p36, p37)
			return p36.Date.UnixTimestamp > p37.Date.UnixTimestamp
		end)
		local v38 = v13:ToUniversalTime()
		local v39 = DateTime.fromUnixTimestamp(v13.UnixTimestamp + 86400)
		local v40 = DateTime.fromUnixTimestamp(v39.UnixTimestamp - 432000)
		local v41 = DateTime.fromUnixTimestamp(v40.UnixTimestamp):ToUniversalTime()
		local v42 = DateTime.fromUniversalTime(v38.Year, v38.Month, v38.Day)
		local v43 = DateTime.fromUniversalTime(v41.Year, v41.Month, v41.Day).UnixTimestamp
		local _ = v42.UnixTimestamp
		local v44 = v35 * 0.85
		local v45 = v44 / 5
		local v46 = math.log10(v45)
		local v47 = math.round(v46)
		local v48 = math.pow(10, v47)
		while v48 * 4 < v44 do
			local v49 = v48 * 2
			v48 = math.ceil(v49)
		end
		for v50 = 5, 1, -1 do
			local v51 = p10.Amounts:FindFirstChild((("Option%*"):format(v50)))
			if v51 then
				local v52 = v_u_4.Comma
				local v53 = (v50 - 1) * v48
				v51.Text = v52((math.round(v53)))
			end
		end
		local v54 = {}
		for _, v55 in v20 do
			if v55.Date.UnixTimestamp >= v43 then
				local v56 = (v55.Date.UnixTimestamp - v43) / (v42.UnixTimestamp - v43)
				local v57 = v56 ~= v56 and 1 or v56
				local v58 = v55.DailyRAP / (v48 * 4)
				local v59 = v_u_7:Clone()
				local v60 = math.clamp(v57, 0, 1)
				local v61 = 1 - v58
				local v62 = math.clamp(v61, 0, 1)
				v59.Position = UDim2.fromScale(v60, v62 - 0.025)
				local v63 = v59.Label
				local v64 = v_u_4.Comma
				local v65 = v55.DailyRAP
				v63.Text = v64((math.round(v65)))
				v59.Parent = p10.Dots
				local v66 = Path2DControlPoint.new(v59.Position)
				table.insert(v54, v66)
			end
		end
		if #v54 > 1 then
			local v67 = Instance.new("Path2D")
			v67.Color3 = Color3.fromRGB(38, 238, 38)
			v67.Thickness = 4
			v67.Visible = true
			v67:SetControlPoints(v54)
			v67.Parent = p10.Dots
		end
		return true
	end,
	["Start"] = function(_) end
}
task.spawn(v68.Start, v68)
return v68