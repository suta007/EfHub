--!nocheck
--!native
--!optimize 2

local getgenv = (getfenv() :: any).getgenv
local setclipboard = (getfenv() :: any).setclipboard or (getfenv() :: any).toclipboard
local LogTab = {}
local reg
local logHistory = ""
local logCount = 0
function LogTab.Initialize(Registry)
	reg = Registry
	local Options = Registry.Options
	_ = Options
	local Interface = Registry.Interface
	local Tabs = Registry.Tabs
	local Fluent = Registry.Fluent

	Tabs.Log = Interface:AddTab({ Title = "Log", Icon = "scroll" })

	Tabs.Log:AddButton({
		Title = "❌ Clear Log",
		Callback = function()
			logHistory = ""
			logCount = 0
			if reg and reg.fDisplay then
				reg.fDisplay:SetValue("Waiting for new activity...\n")
			end
		end,
	})

	Tabs.Log:AddButton({
		Title = "📑 Copy Log",
		Callback = function()
			if logHistory ~= "" then
				if setclipboard then
					setclipboard(logHistory)
					Fluent:Notify({
						Title = "EfHub System",
						Content = "✅ คัดลอก Log แล้ว",
						Duration = 3,
					})
				else
					Fluent:Notify({
						Title = "EfHub System",
						Content = "❌ ตัวรันของคุณไม่รองรับการคัดลอก (setclipboard)",
						Duration = 3,
					})
				end
			end
		end,
	})

	reg.fDisplay = Tabs.Log:AddParagraph("ActivityLogs", {
		Title = "📃 Activity Logs",
		Content = "Waiting for system to start...\n",
	})
end
getgenv().fLog = function(message)
	local timeString = os.date("%H:%M:%S")
	local newLog = "[" .. timeString .. "] " .. tostring(message) .. "\n"

	logHistory = newLog .. logHistory
	logCount = logCount + 1

	if logCount > 100 then
		local cutoff = string.find(logHistory, "\n", -2)
		if cutoff then
			logHistory = string.sub(logHistory, 1, cutoff)
		end
		logCount = 100
	end

	if reg and reg.fDisplay then
		reg.fDisplay:SetValue(logHistory)
	end
end

return LogTab
