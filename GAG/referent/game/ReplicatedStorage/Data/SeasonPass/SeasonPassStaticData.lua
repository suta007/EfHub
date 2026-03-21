local v1 = {
	["Green"] = {
		["Background"] = Color3.fromRGB(0, 170, 0),
		["ButtonStroke"] = Color3.fromRGB(6, 70, 0),
		["ButtonStrokeAlt"] = Color3.fromRGB(132, 255, 132),
		["TextStroke"] = Color3.fromRGB(14, 99, 0),
		["Text"] = Color3.fromRGB(255, 255, 255),
		["Gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 245, 55)), ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 229, 17)) })
	},
	["Yellow"] = {
		["Background"] = Color3.fromRGB(255, 252, 38),
		["ButtonStroke"] = Color3.fromRGB(70, 70, 0),
		["TextStroke"] = Color3.fromRGB(255, 255, 255),
		["Text"] = Color3.fromRGB(255, 255, 255)
	},
	["Gold"] = {
		["Background"] = Color3.fromRGB(255, 204, 0),
		["ButtonStroke"] = Color3.fromRGB(141, 86, 0),
		["TextStroke"] = Color3.fromRGB(134, 77, 0),
		["Text"] = Color3.fromRGB(255, 227, 126)
	},
	["Gray"] = {
		["Background"] = Color3.fromRGB(95, 95, 95),
		["ButtonStroke"] = Color3.fromRGB(64, 64, 64),
		["TextStroke"] = Color3.fromRGB(52, 52, 52),
		["Text"] = Color3.fromRGB(255, 255, 255)
	},
	["White"] = {
		["Background"] = Color3.fromRGB(255, 255, 255),
		["ButtonStroke"] = Color3.fromRGB(255, 255, 255),
		["TextStroke"] = Color3.fromRGB(255, 255, 255),
		["Text"] = Color3.fromRGB(255, 255, 255)
	},
	["Blue"] = {
		["Background"] = Color3.fromRGB(0, 192, 255),
		["ButtonStroke"] = Color3.fromRGB(0, 99, 132),
		["TextStroke"] = Color3.fromRGB(0, 70, 103),
		["Text"] = Color3.fromRGB(255, 255, 255)
	},
	["Red"] = {
		["Background"] = Color3.fromRGB(255, 255, 255),
		["ButtonStroke"] = Color3.fromRGB(235, 41, 41),
		["ButtonStrokeAlt"] = Color3.fromRGB(235, 41, 41),
		["TextStroke"] = Color3.fromRGB(58, 0, 0),
		["Text"] = Color3.fromRGB(255, 255, 255),
		["Gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(221, 10, 10)), ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 3, 3)) })
	},
	["Brown"] = {
		["Background"] = Color3.fromRGB(133, 82, 51),
		["ButtonStroke"] = Color3.fromRGB(103, 63, 38),
		["TextStroke"] = Color3.fromRGB(61, 41, 0),
		["Text"] = Color3.fromRGB(255, 255, 255)
	}
}
return {
	["Rarity"] = {
		["Common"] = 1,
		["Uncommon"] = 1,
		["Rare"] = 2,
		["Legendary"] = 3,
		["Mythical"] = 5,
		["Divine"] = 8,
		["Prismatic"] = 13,
		["Transcendent"] = 21
	},
	["MutationCount"] = {
		5,
		15,
		35,
		75,
		155
	},
	["XP_CONSTANT"] = 600,
	["MAX_LEVEL"] = 50,
	["INF_REWARD_XP"] = 10000,
	["DAILY_QUEST_XP"] = 400,
	["ButtonColors"] = v1,
	["PST_TIME"] = 10,
	["PST_OFFSET"] = 7,
	["SHIFT"] = 25200,
	["NUM_OF_DAYS"] = 3650,
	["NextPass"] = 315360000,
	["START_TIME"] = os.time({
		["year"] = 2006,
		["month"] = 1,
		["day"] = 5,
		["hour"] = 17,
		["min"] = 0,
		["sec"] = 0
	})
}