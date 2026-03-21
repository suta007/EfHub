local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("GamepadService")
game:GetService("SoundService")
local v4 = game:GetService("Players")
local v_u_5 = require(v2.Modules.Signal)
require(v2.Modules.FastTween)
local v_u_6 = require(v2.Frame_Popup_Module)
local v_u_7 = require(v2.Modules.ClickOffClose)
local _ = v4.LocalPlayer.PlayerGui
local v_u_8 = {}
local v_u_9 = {}
local function v_u_19(p10)
	-- upvalues: (copy) v_u_5
	local v_u_11 = v_u_5.new()
	local v_u_18 = {
		["_value"] = p10,
		["_signal"] = v_u_11,
		["Get"] = function(_)
			-- upvalues: (copy) v_u_18
			return v_u_18._value
		end,
		["Set"] = function(_, p12)
			-- upvalues: (copy) v_u_18, (copy) v_u_11
			local v13 = v_u_18._value
			v_u_18._value = p12
			v_u_11:Fire(p12, v13)
		end,
		["Listen"] = function(_, p14)
			-- upvalues: (copy) v_u_11
			return v_u_11:Connect(p14)
		end,
		["Observe"] = function(p15, p16)
			-- upvalues: (copy) v_u_18
			local v_u_17 = v_u_18:Listen(p16)
			task.spawn(p16, p15:Get(), nil)
			return function()
				-- upvalues: (copy) v_u_17
				v_u_17:Disconnect()
			end
		end
	}
	return v_u_18
end
local v_u_44 = {
	["GetStateForGui"] = function(_, p20)
		-- upvalues: (copy) v_u_8, (copy) v_u_19
		local v21 = v_u_8[p20]
		if not v21 then
			v21 = {
				["Visible"] = v_u_19(false),
				["ChangeEnabled"] = v_u_19(true),
				["CloseKeybinds"] = v_u_19({ Enum.KeyCode.ButtonB })
			}
			v_u_8[p20] = v21
		end
		return v21
	end,
	["GetStateForGroup"] = function(_, p22)
		-- upvalues: (copy) v_u_9, (copy) v_u_19
		local v23 = v_u_9[p22]
		if not v23 then
			v23 = {
				["Gui"] = v_u_19(nil)
			}
			v_u_9[p22] = v23
		end
		return v23
	end,
	["GetGroupForGui"] = function(_, p24)
		return p24:GetAttribute("Group") or "Menu"
	end,
	["Close"] = function(_, p25)
		-- upvalues: (copy) v_u_44, (copy) v_u_3, (copy) v_u_7
		local v26 = v_u_44:GetStateForGroup((v_u_44:GetGroupForGui(p25)))
		if v26.Gui:Get() == p25 then
			local v27 = v_u_44:GetStateForGui(p25)
			v27.Visible:Set(false)
			v26.Gui:Set(nil)
			if v27.ChangeEnabled:Get() then
				p25.Enabled = false
				v_u_3:DisableGamepadCursor()
			end
			v_u_7.RemoveGui(p25)
		end
	end,
	["Open"] = function(_, p28)
		-- upvalues: (copy) v_u_44, (copy) v_u_3, (copy) v_u_7
		local v29 = v_u_44:GetStateForGroup((v_u_44:GetGroupForGui(p28)))
		local v30 = v29.Gui:Get()
		if v30 ~= p28 then
			if v30 then
				v_u_44:Close(v30)
			end
			local v31 = v_u_44:GetStateForGui(p28)
			v31.Visible:Set(true)
			v29.Gui:Set(p28)
			if v31.ChangeEnabled:Get() then
				p28.Enabled = true
				v_u_3:EnableGamepadCursor(p28:FindFirstChildWhichIsA("GuiObject", true))
			end
			v_u_7.AddGui(p28)
		end
	end,
	["Toggle"] = function(_, p32)
		-- upvalues: (copy) v_u_44
		local v33 = v_u_44:GetStateForGui(p32)
		if v33.Visible:Get() then
			v_u_44:Close(p32)
		else
			v_u_44:Open(p32)
		end
		return v33.Visible:Get()
	end,
	["UsePopupAnims"] = function(_, p_u_34)
		-- upvalues: (copy) v_u_44, (copy) v_u_6
		if p_u_34:FindFirstChild("Main") or (p_u_34:FindFirstChild("Frame") or p_u_34:FindFirstChild("MainFrame") or (p_u_34:FindFirstChildWhichIsA("Frame") or p_u_34:FindFirstChildWhichIsA("ImageLabel"))) then
			p_u_34.Enabled = false
			local v35 = v_u_44:GetStateForGui(p_u_34)
			v35.ChangeEnabled:Set(true)
			v35.Visible:Observe(function(p36)
				-- upvalues: (ref) v_u_6, (copy) p_u_34
				if p36 then
					v_u_6.Show(p_u_34)
				else
					v_u_6.Hide(p_u_34)
				end
			end)
		else
			error((("No root frame found for %*"):format((p_u_34:GetFullName()))))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_44, (copy) v_u_1
		local v37 = v_u_44:GetStateForGroup("Menu")
		local v_u_38 = nil
		v37.Gui:Observe(function(p_u_39)
			-- upvalues: (ref) v_u_38, (ref) v_u_44, (ref) v_u_1
			local v40 = v_u_38
			if type(v40) == "function" then
				task.spawn(v_u_38)
			end
			if p_u_39 then
				local v_u_43 = v_u_44:GetStateForGui(p_u_39).CloseKeybinds:Observe(function(p41)
					-- upvalues: (ref) v_u_1, (ref) v_u_44, (copy) p_u_39
					v_u_1:UnbindAction("UICloseButton")
					v_u_1:BindAction("UICloseButton", function(_, p42, _)
						-- upvalues: (ref) v_u_44, (ref) p_u_39
						if p42 ~= Enum.UserInputState.End then
							return Enum.ContextActionResult.Pass
						end
						v_u_44:Close(p_u_39)
						return Enum.ContextActionResult.Sink
					end, false, table.unpack(p41))
				end)
				v_u_38 = function()
					-- upvalues: (copy) v_u_43, (ref) v_u_1
					v_u_43()
					v_u_1:UnbindAction("UICloseButton")
				end
			end
		end)
	end
}
task.spawn(v_u_44.Start, v_u_44)
return v_u_44