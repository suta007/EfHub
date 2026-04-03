--!nocheck
--!native
--!optimize 2

local setclipboard = (getfenv() :: any).setclipboard or (getfenv() :: any).toclipboard
local LogTab = {}
local reg
local LogHistory = ""
local LogCount = 0
function LogTab.Log(message, level)
	level = level or "INFO"
	local timeString = os.date("%H:%M:%S")
	local prefix = "🟢 "
	if level == "WARN" then
		prefix = "🟡 "
	elseif level == "ERROR" then
		prefix = "🔴 "
	end
	local newLog = prefix .. "[" .. timeString .. "] " .. tostring(message) .. "\n"

	LogHistory = newLog .. LogHistory
	LogCount = LogCount + 1

	if LogCount > 100 then
		local cutoff = string.find(LogHistory, "\n", -2)
		if cutoff then
			LogHistory = string.sub(LogHistory, 1, cutoff)
		end
		LogCount = 100
	end

	if reg and reg.fDisplay then
		reg.fDisplay:SetValue(LogHistory)
	end
end

function LogTab.Initialize(Registry)
	reg = Registry
	local Options = Registry.Options
	_ = Options
	local Interface = Registry.Interface
	local Tabs = Registry.Tabs
	local Fluent = Registry.Fluent

	-- Register Log function to registry
	Registry.Log = LogTab.Log

	Tabs.Log = Interface:AddTab({ Title = "Log", Icon = "scroll" })

	Tabs.Log:AddButton({
		Title = "❌ Clear Log",
		Callback = function()
			LogHistory = ""
			LogCount = 0
			if reg and reg.fDisplay then
				reg.fDisplay:SetValue("Waiting for new activity...\n")
			end
		end,
	})

	Tabs.Log:AddButton({
		Title = "📑 Copy Log",
		Callback = function()
			if LogHistory ~= "" then
				if setclipboard then
					setclipboard(LogHistory)
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

return LogTab
