local Loader = {}
local getgenv = (getfenv() :: any).getgenv

local BASE_URL = "https://raw.githubusercontent.com/suta007/EfHub/refs/heads/master/GAG/src/"

function Loader.Require(path)
	if getgenv().DEV_MODE then
		local url = BASE_URL .. path .. ".luau"
		local success, content = pcall(function()
			return game:GetService("HttpService"):GetAsync(url)
		end)
		if not success or not content then
			error("Remote Error: Could not fetch " .. path)
		end
		local func, err = loadstring(content)
		if not func then
			error("Compile Error in " .. path .. ": " .. tostring(err))
		end
		return func()
	else
		-- Note: Relative path require depends on caller location
		return nil -- Placeholder for local require
	end
end

return Loader
