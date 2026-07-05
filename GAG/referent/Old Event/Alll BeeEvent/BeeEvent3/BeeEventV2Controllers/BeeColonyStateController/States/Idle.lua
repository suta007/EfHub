return function(_)
	return function(_, _, p1)
		for _, v2 in p1 do
			v2.Client.PredictedCFrame = nil
			v2.Client.LockFacing = false
		end
	end
end