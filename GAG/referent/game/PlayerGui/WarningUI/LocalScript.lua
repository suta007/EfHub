local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(v_u_1.Modules.DataService)
local v_u_3 = script.Parent
local v_u_4 = v_u_3:WaitForChild("WarningTemplate")
local v_u_5 = v_u_3:WaitForChild("InfoTemplate")
local v_u_6 = require(v_u_1.Modules.SetupHoverAnimations)
local v_u_7 = require(v_u_1.Modules.WarningController)
local v_u_8 = {}
local function v_u_20()
	-- upvalues: (copy) v_u_1, (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_3
	local v9 = require(v_u_1.Modules.DataService):GetData().PunnishmentData.Warnings
	for v_u_10, v11 in v9 do
		if not (v_u_8[v_u_10] or v11.Acknowledged) then
			local v12 = v11.Severity or "Severe"
			local v13
			if v12 == "Info" then
				v13 = v_u_5:Clone()
			else
				v13 = v_u_4:Clone()
			end
			local v14 = v13.WARNING.Buttons.Main.ACCEPT_BUTTON.Main
			v_u_6(v14).Activated:Connect(function()
				-- upvalues: (ref) v_u_7, (copy) v_u_10
				v_u_7:Acknowledge(v_u_10)
			end)
			v14.Visible = true
			local v15 = v13.WARNING.Main.Description
			v15.RichText = true
			v15.Text = v11.Message
			if v12 == "Severe" then
				v13.WARNING.Main.DescriptionShadow.Text = v11.Message:gsub("<.->", "")
			end
			local v16 = v13.WARNING.Main.Title
			if v12 == "Info" then
				v14.TextLabel.Text = "Okay"
			end
			v16.RichText = true
			v16.Text = v11.Header
			if v12 == "Severe" then
				v13.WARNING.Main.TitleShadow.Text = v11.Header:gsub("<.->", "")
			end
			v13.Visible = true
			v13.Parent = v_u_3
			print(v13)
			v_u_8[v_u_10] = v13
		end
	end
	for v17, v18 in v_u_8 do
		local v19 = v9[v17]
		if v19.Acknowledged then
			print(v19, "ACKNOWLEDGED")
			v18:Destroy()
			v_u_8[v17] = nil
		end
		if not v19 then
			v18:Destroy()
			v_u_8[v17] = nil
		end
	end
end
v_u_20()
v2:GetPathSignal("PunnishmentData/Warnings/@"):Connect(function(...)
	-- upvalues: (copy) v_u_20
	v_u_20()
end)