local v_u_1 = {
	Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157),
	Color3.new(0.00392156862745098, 0.6352941176470588, 1),
	Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353),
	BrickColor.new("Bright violet").Color,
	BrickColor.new("Bright orange").Color,
	BrickColor.new("Bright yellow").Color,
	BrickColor.new("Light reddish violet").Color,
	BrickColor.new("Brick yellow").Color
}
local function v_u_8(p2)
	local v3 = 0
	for v4 = 1, #p2 do
		local v5 = string.sub(p2, v4, v4)
		local v6 = string.byte(v5)
		local v7 = #p2 - v4 + 1
		if #p2 % 2 == 1 then
			v7 = v7 - 1
		end
		if v7 % 4 >= 2 then
			v6 = -v6
		end
		v3 = v3 + v6
	end
	return v3
end
return function(p9)
	-- upvalues: (copy) v_u_1, (copy) v_u_8
	return v_u_1[(v_u_8(p9) + 0) % #v_u_1 + 1]
end