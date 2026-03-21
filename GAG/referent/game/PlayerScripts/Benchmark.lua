local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = v1:WaitForChild("BenchmarkTest")
local v_u_3 = require(v2:WaitForChild("OptimizedModule"))
require(v2:WaitForChild("StandardModule"))
local function v8(p4, p5)
	local v6 = os.clock()
	for _ = 1, 100000 do
		p5()
	end
	local v7 = os.clock() - v6
	print(p4 .. " took " .. v7 .. " seconds.")
	return v7
end
local v9 = v8("RawFunction", function()
	local _ = 0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
end)
local v10 = (v8("OptimizedModule", function()
	-- upvalues: (copy) v_u_3
	v_u_3.DoWork()
end) - v9) / v9 * 100
print(string.format("%s is %.2f%% slower than RawFunction", "OptimizedModule", v10))