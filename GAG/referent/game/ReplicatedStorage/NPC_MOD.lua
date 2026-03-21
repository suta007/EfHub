local v1 = {}
local v_u_2 = require(game.ReplicatedStorage.Field_Of_View_Module)
local v_u_3 = require(game.ReplicatedStorage.Frame_Popup_Module)
function v1.Can_Speak(_)
	-- upvalues: (copy) v_u_2
	return v_u_2.Return_Core_FOV() == 70
end
function v1.Start_Speak(_)
	-- upvalues: (copy) v_u_2
	v_u_2.Change_FOV_CORE(65)
	v_u_2.Change_FOV(65, 2)
end
function v1.End_Speak(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if v_u_3.Can() == true then
		v_u_2.Change_FOV_CORE(70)
		v_u_2.Change_FOV(70, 1)
	end
end
return v1