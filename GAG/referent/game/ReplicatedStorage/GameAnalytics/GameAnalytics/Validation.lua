local v_u_1 = {}
local v_u_2 = require(script.Parent.Logger)
local v_u_3 = require(script.Parent.Utilities)
function v_u_1.validateCustomDimensions(_, p4)
	-- upvalues: (copy) v_u_1
	return v_u_1:validateArrayOfStrings(20, 32, false, "custom dimensions", p4)
end
function v_u_1.validateDimension(_, p5, p6)
	-- upvalues: (copy) v_u_3
	return v_u_3:isStringNullOrEmpty(p6) and true or (v_u_3:stringArrayContainsString(p5, p6) and true or false)
end
function v_u_1.validateResourceCurrencies(_, p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if not v_u_1:validateArrayOfStrings(20, 64, false, "resource currencies", p7) then
		return false
	end
	for _, v8 in pairs(p7) do
		if not string.find(v8, "^[A-Za-z]+$") then
			v_u_2:w("resource currencies validation failed: a resource currency can only be A-Z, a-z. String was: " .. v8)
			return false
		end
	end
	return true
end
function v_u_1.validateResourceItemTypes(_, p9)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if not v_u_1:validateArrayOfStrings(20, 32, false, "resource item types", p9) then
		return false
	end
	for _, v10 in pairs(p9) do
		if not v_u_1:validateEventPartCharacters(v10) then
			v_u_2:w("resource item types validation failed: a resource item type cannot contain other characters than A-z, 0-9, -_., ()!?. String was: " .. v10)
			return false
		end
	end
	return true
end
function v_u_1.validateEventPartCharacters(_, p11)
	return string.find(p11, "^[A-Za-z0-9%s%-_%.%(%)!%?]+$") and true or false
end
function v_u_1.validateArrayOfStrings(_, p12, p13, p14, p15, p16)
	-- upvalues: (copy) v_u_2
	local v17 = p15 or "Array"
	if p16 then
		if p14 or #p16 ~= 0 then
			if p12 > 0 and p12 < #p16 then
				v_u_2:w(v17 .. " validation failed: array cannot exceed " .. tostring(p12) .. " values. It has " .. #p16 .. " values.")
				return false
			else
				for _, v18 in ipairs(p16) do
					local v19 = v18 and #v18 or 0
					if v19 == 0 then
						v_u_2:w(v17 .. " validation failed: contained an empty string.")
						return false
					end
					if p13 > 0 and p13 < v19 then
						v_u_2:w(v17 .. " validation failed: a string exceeded max allowed length (which is: " .. tostring(p13) .. "). String was: " .. v18)
						return false
					end
				end
				return true
			end
		else
			v_u_2:w(v17 .. " validation failed: array cannot be empty.")
			return false
		end
	else
		v_u_2:w(v17 .. " validation failed: array cannot be nil.")
		return false
	end
end
function v_u_1.validateBuild(_, p20)
	-- upvalues: (copy) v_u_1
	return v_u_1:validateShortString(p20, false) and true or false
end
function v_u_1.validateShortString(_, p21, p22)
	-- upvalues: (copy) v_u_3
	return p22 and v_u_3:isStringNullOrEmpty(p21) and true or (not v_u_3:isStringNullOrEmpty(p21) and #p21 <= 32 and true or false)
end
function v_u_1.validateKeys(_, p23, p24)
	return string.find(p23, "^[A-Za-z0-9]+$") and (#p23 == 32 and (string.find(p24, "^[A-Za-z0-9]+$") and #p24 == 40)) and true or false
end
function v_u_1.validateAndCleanInitRequestResponse(_, p25, p26)
	-- upvalues: (copy) v_u_2
	if not p25 then
		v_u_2:w("validateInitRequestResponse failed - no response dictionary.")
		return nil
	end
	local v27 = {}
	local v28 = p25.server_ts or -1
	if v28 > 0 then
		v27.server_ts = v28
	end
	if p26 then
		v27.configs = p25.configs or {}
		v27.ab_id = p25.ab_id or ""
		v27.ab_variant_id = p25.ab_variant_id or ""
	end
	return v27
end
function v_u_1.validateClientTs(_, p29)
	return p29 >= 1000000000 and p29 <= 9999999999
end
function v_u_1.validateCurrency(_, p30)
	-- upvalues: (copy) v_u_3
	if v_u_3:isStringNullOrEmpty(p30) then
		return false
	else
		return string.find(p30, "^[A-Z]+$") and #p30 == 3 and true or false
	end
end
function v_u_1.validateEventPartLength(_, p31, p32)
	-- upvalues: (copy) v_u_3
	if p32 and v_u_3:isStringNullOrEmpty(p31) then
		return true
	elseif v_u_3:isStringNullOrEmpty(p31) then
		return false
	else
		return #p31 ~= 0 and #p31 <= 64
	end
end
function v_u_1.validateBusinessEvent(_, p33, p34, p35, p36, p37)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if not v_u_1:validateCurrency(p33) then
		v_u_2:w("Validation fail - business event - currency: Cannot be (null) and need to be A-Z, 3 characters and in the standard at openexchangerates.org. Failed currency: " .. p33)
		return false
	end
	if p34 < 0 then
		v_u_2:w("Validation fail - business event - amount: Cannot be less then 0. Failed amount: " .. p34)
		return false
	end
	if not v_u_1:validateShortString(p35, true) then
		v_u_2:w("Validation fail - business event - cartType. Cannot be above 32 length. String: " .. p35)
		return false
	end
	if not v_u_1:validateEventPartLength(p36, false) then
		v_u_2:w("Validation fail - business event - itemType: Cannot be (null), empty or above 64 characters. String: " .. p36)
		return false
	end
	if not v_u_1:validateEventPartCharacters(p36) then
		v_u_2:w("Validation fail - business event - itemType: Cannot contain other characters than A-z, 0-9, -_., ()!?. String: " .. p36)
		return false
	end
	if not v_u_1:validateEventPartLength(p37, false) then
		v_u_2:w("Validation fail - business event - itemId. Cannot be (null), empty or above 64 characters. String: " .. p37)
		return false
	end
	if v_u_1:validateEventPartCharacters(p37) then
		return true
	end
	v_u_2:w("Validation fail - business event - itemId: Cannot contain other characters than A-z, 0-9, -_., ()!?. String: " .. p37)
	return false
end
function v_u_1.validateResourceEvent(_, p38, p39, p40, p41, p42, p43, p44, p45)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_1
	if p39 ~= p38.Source and p39 ~= p38.Sink then
		v_u_2:w("Validation fail - resource event - flowType: Invalid flow type " .. tostring(p39))
		return false
	end
	if v_u_3:isStringNullOrEmpty(p40) then
		v_u_2:w("Validation fail - resource event - currency: Cannot be (null)")
		return false
	end
	if not v_u_3:stringArrayContainsString(p44, p40) then
		v_u_2:w("Validation fail - resource event - currency: Not found in list of pre-defined available resource currencies. String: " .. p40)
		return false
	end
	if p41 <= 0 then
		v_u_2:w("Validation fail - resource event - amount: Float amount cannot be 0 or negative. Value: " .. tostring(p41))
		return false
	end
	if v_u_3:isStringNullOrEmpty(p42) then
		v_u_2:w("Validation fail - resource event - itemType: Cannot be (null)")
		return false
	end
	if not v_u_1:validateEventPartLength(p42, false) then
		v_u_2:w("Validation fail - resource event - itemType: Cannot be (null), empty or above 64 characters. String: " .. p42)
		return false
	end
	if not v_u_1:validateEventPartCharacters(p42) then
		v_u_2:w("Validation fail - resource event - itemType: Cannot contain other characters than A-z, 0-9, -_., ()!?. String: " .. p42)
		return false
	end
	if not v_u_3:stringArrayContainsString(p45, p42) then
		v_u_2:w("Validation fail - resource event - itemType: Not found in list of pre-defined available resource itemTypes. String: " .. p42)
		return false
	end
	if not v_u_1:validateEventPartLength(p43, false) then
		v_u_2:w("Validation fail - resource event - itemId: Cannot be (null), empty or above 64 characters. String: " .. p43)
		return false
	end
	if v_u_1:validateEventPartCharacters(p43) then
		return true
	end
	v_u_2:w("Validation fail - resource event - itemId: Cannot contain other characters than A-z, 0-9, -_., ()!?. String: " .. p43)
	return false
end
function v_u_1.validateProgressionEvent(_, p46, p47, p48, p49, p50)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_1
	if p47 ~= p46.Start and (p47 ~= p46.Complete and p47 ~= p46.Fail) then
		v_u_2:w("Validation fail - progression event: Invalid progression status " .. tostring(p47))
		return false
	end
	if not v_u_3:isStringNullOrEmpty(p50) and (v_u_3:isStringNullOrEmpty(p49) and not v_u_3:isStringNullOrEmpty(p48)) then
		v_u_2:w("Validation fail - progression event: 03 found but 01+02 are invalid. Progression must be set as either 01, 01+02 or 01+02+03.")
		return false
	end
	if not v_u_3:isStringNullOrEmpty(p49) and v_u_3:isStringNullOrEmpty(p48) then
		v_u_2:w("Validation fail - progression event: 02 found but not 01. Progression must be set as either 01, 01+02 or 01+02+03")
		return false
	end
	if v_u_3:isStringNullOrEmpty(p48) then
		v_u_2:w("Validation fail - progression event: progression01 not valid. Progressions must be set as either 01, 01+02 or 01+02+03")
		return false
	end
	if not v_u_1:validateEventPartLength(p48, false) then
		v_u_2:w("Validation fail - progression event - progression01: Cannot be (null), empty or above 64 characters. String: " .. p48)
		return false
	end
	if not v_u_1:validateEventPartCharacters(p48) then
		v_u_2:w("Validation fail - progression event - progression01: Cannot contain other characters than A-z, 0-9, -_., ()!?. String: " .. p48)
		return false
	end
	if not v_u_3:isStringNullOrEmpty(p49) then
		if not v_u_1:validateEventPartLength(p49, false) then
			v_u_2:w("Validation fail - progression event - progression02: Cannot be empty or above 64 characters. String: " .. p49)
			return false
		end
		if not v_u_1:validateEventPartCharacters(p49) then
			v_u_2:w("Validation fail - progression event - progression02: Cannot contain other characters than A-z, 0-9, -_., ()!?. String: " .. p49)
			return false
		end
	end
	if not v_u_3:isStringNullOrEmpty(p50) then
		if not v_u_1:validateEventPartLength(p50, false) then
			v_u_2:w("Validation fail - progression event - progression03: Cannot be empty or above 64 characters. String: " .. p50)
			return false
		end
		if not v_u_1:validateEventPartCharacters(p50) then
			v_u_2:w("Validation fail - progression event - progression03: Cannot contain other characters than A-z, 0-9, -_., ()!?. String: " .. p50)
			return false
		end
	end
	return true
end
function v_u_1.validateEventIdLength(_, p51)
	-- upvalues: (copy) v_u_3
	if v_u_3:isStringNullOrEmpty(p51) then
		return false
	end
	local v52 = 0
	for v53 in string.gmatch(p51, "([^:]+)") do
		v52 = v52 + 1
		if v52 > 5 or #v53 > 64 then
			return false
		end
	end
	return true
end
function v_u_1.validateEventIdCharacters(_, p54)
	-- upvalues: (copy) v_u_3
	if v_u_3:isStringNullOrEmpty(p54) then
		return false
	end
	local v55 = 0
	for v56 in string.gmatch(p54, "([^:]+)") do
		v55 = v55 + 1
		if v55 > 5 or not string.find(v56, "^[A-Za-z0-9%s%-_%.%(%)!%?]+$") then
			return false
		end
	end
	return true
end
function v_u_1.validateDesignEvent(_, p57)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if not v_u_1:validateEventIdLength(p57) then
		v_u_2:w("Validation fail - design event - eventId: Cannot be (null) or empty. Only 5 event parts allowed seperated by :. Each part need to be 32 characters or less. String: " .. p57)
		return false
	end
	if v_u_1:validateEventIdCharacters(p57) then
		return true
	end
	v_u_2:w("Validation fail - design event - eventId: Non valid characters. Only allowed A-z, 0-9, -_., ()!?. String: " .. p57)
	return false
end
function v_u_1.validateLongString(_, p58, p59)
	-- upvalues: (copy) v_u_3
	return p59 and v_u_3:isStringNullOrEmpty(p58) and true or (not v_u_3:isStringNullOrEmpty(p58) and #p58 <= 8192 and true or false)
end
function v_u_1.validateErrorEvent(_, p60, p61, p62)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if p61 ~= p60.debug and (p61 ~= p60.info and (p61 ~= p60.warning and (p61 ~= p60.error and p61 ~= p60.critical))) then
		v_u_2:w("Validation fail - error event - severity: Severity was unsupported value " .. tostring(p61))
		return false
	end
	if v_u_1:validateLongString(p62, true) then
		return true
	end
	v_u_2:w("Validation fail - error event - message: Message cannot be above 8192 characters.")
	return false
end
return v_u_1