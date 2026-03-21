local v1 = game:GetService("RunService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.FFlags.Packages.Freeze)
require(script.Parent.Types)
return table.freeze({
	["SerializedNone"] = "\0",
	["ShouldMock"] = v1:IsStudio() and not v1:IsRunning() or _G.NOCOLOR,
	["getValue"] = function(p4)
		-- upvalues: (copy) v_u_3
		if p4 == v_u_3.None or p4 == "\0" then
			return nil
		else
			return p4
		end
	end,
	["getPathTable"] = function(p5)
		if type(p5) == "table" then
			return table.clone(p5)
		else
			return type(p5) ~= "string" and { p5 } or string.split(p5, ".")
		end
	end,
	["getPathString"] = function(p6)
		if type(p6) == "string" then
			return p6
		elseif type(p6) == "table" then
			return table.concat(p6, ".")
		else
			return tostring(p6)
		end
	end,
	["safeCancelThread"] = function(p7)
		if coroutine.status(p7) ~= "dead" then
			pcall(task.cancel, p7)
		end
	end,
	["trimString"] = function(p8)
		return string.gsub(p8, "^%s*(.-)%s*$", "%1")
	end,
	["checkForTrimmedString"] = function(p9)
		return p9 ~= string.gsub(p9, "^%s*(.-)%s*$", "%1")
	end
})