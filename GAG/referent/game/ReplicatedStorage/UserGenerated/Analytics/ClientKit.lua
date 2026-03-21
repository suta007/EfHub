local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.UserGenerated.Lang.Asserts)
local v3 = v2.Table({
	["JoinSource"] = v2.Enum(Enum.JoinSource),
	["ItemType"] = v2.Optional(v2.Enum(Enum.AvatarItemType)),
	["AssetId"] = v2.Optional(v2.Pattern("^rbxassetid://%d+$")),
	["OutfitId"] = v2.Optional(v2.Pattern("^rbxassetid://%d+$")),
	["AssetType"] = v2.Optional(v2.Enum(Enum.AssetType))
})
local v4 = v2.Table({
	["SourceGameId"] = v2.Optional(v2.Integer),
	["SourcePlaceId"] = v2.Optional(v2.Integer),
	["ReferredByPlayerId"] = v2.Optional(v2.Integer),
	["Members"] = v2.Optional(v2.UniqueArray(v2.Integer)),
	["TeleportData"] = v2.Optional(v2.Storable),
	["LaunchData"] = v2.Optional(v2.Storable),
	["GameJoinContext"] = v2.Optional(v3)
})
local v5 = {}
for _, v6 in ipairs(Enum.DeveloperMemoryTag:GetEnumItems()) do
	local v7 = v6.Name
	v5[v7 == "PhysicsParts" and "BaseParts" or v7] = v2.FiniteNonNegative
end
local v8 = v2.Table({
	["ContactsCount"] = v2.IntegerNonNegative,
	["DataReceiveKbps"] = v2.FiniteNonNegative,
	["DataSendKbps"] = v2.FiniteNonNegative,
	["FrameTime"] = v2.FiniteNonNegative,
	["HeartbeatTime"] = v2.FiniteNonNegative,
	["InstanceCount"] = v2.IntegerNonNegative,
	["MovingPrimitivesCount"] = v2.IntegerNonNegative,
	["PhysicsReceiveKbps"] = v2.FiniteNonNegative,
	["PhysicsSendKbps"] = v2.FiniteNonNegative,
	["PhysicsStepTime"] = v2.FiniteNonNegative,
	["PrimitivesCount"] = v2.IntegerNonNegative,
	["RenderCPUFrameTime"] = v2.FiniteNonNegative,
	["RenderGPUFrameTime"] = v2.Number,
	["SceneDrawcallCount"] = v2.IntegerNonNegative,
	["SceneTriangleCount"] = v2.IntegerNonNegative,
	["ShadowsDrawcallCount"] = v2.IntegerNonNegative,
	["ShadowsTriangleCount"] = v2.IntegerNonNegative,
	["UI2DDrawcallCount"] = v2.IntegerNonNegative,
	["UI2DTriangleCount"] = v2.IntegerNonNegative,
	["UI3DDrawcallCount"] = v2.IntegerNonNegative,
	["UI3DTriangleCount"] = v2.IntegerNonNegative,
	["MemoryUsageMbForTag"] = v2.Table(v5),
	["TotalMemoryUsageMb"] = v2.FiniteNonNegative
})
local v9 = {
	["AssertGameJoinContext"] = v3,
	["AssertJoinData"] = v4,
	["AssertData"] = v2.Table({
		["System"] = v2.Table({
			["UWP"] = v2.Optional(v2.Boolean),
			["Windows"] = v2.Boolean,
			["Time"] = v2.Finite,
			["Clock"] = v2.Finite,
			["ElapsedTime"] = v2.Finite,
			["TimezoneOffset"] = v2.String,
			["Timezone"] = v2.String,
			["TimezoneDST"] = v2.Boolean,
			["HeapSize"] = v2.FiniteNonNegative
		}),
		["Game"] = v2.Table({
			["LoadingDuration"] = v2.Optional(v2.FiniteNonNegative)
		}),
		["LocalPlayer"] = v2.Table({
			["JoinData"] = v4,
			["NetworkPing"] = v2.Optional(v2.FinitePositive)
		}),
		["TeleportService"] = v2.Table({
			["TeleportData"] = v2.Optional(v2.Storable)
		}),
		["Workspace"] = v2.Table({
			["ServerTimeNow"] = v2.Finite,
			["RealPhysicsFPS"] = v2.FiniteNonNegative,
			["DistributedGameTime"] = v2.FiniteNonNegative,
			["NumAwakeParts"] = v2.FiniteNonNegative,
			["PhysicsThrottling"] = v2.IntegerRange(0, 100)
		}),
		["Stats"] = v2.Optional(v8),
		["UserInputService"] = v2.Table({
			["DeviceForm"] = v2.Optional(v2.Enum(Enum.DeviceForm))
		}),
		["GuiService"] = v2.Table({
			["IsTenFootInterface"] = v2.Boolean,
			["TouchControlsEnabled"] = v2.Boolean,
			["GuiInsetTopLeft"] = v2.Vector2Finite,
			["GuiInsetBotRight"] = v2.Vector2Finite,
			["IsModalDialog"] = v2.Boolean,
			["MenuIsOpen"] = v2.Boolean,
			["PreferredTransparency"] = v2.Range(0, 1),
			["ReducedMotionEnabled"] = v2.Boolean,
			["CoreGuiNavigationEnabled"] = v2.Boolean,
			["GuiNavigationEnabled"] = v2.Boolean,
			["AutoSelectGuiEnabled"] = v2.Boolean
		}),
		["CurrentCamera"] = v2.Table({
			["ViewportSize"] = v2.Vector2Finite
		}),
		["LocalizationService"] = v2.Table({
			["RobloxLocaleId"] = v2.StringRange(0, 1000),
			["SystemLocaleId"] = v2.StringRange(0, 5000)
		}),
		["VoiceChatService"] = v2.Table({
			["VoiceEnabled"] = v2.Optional(v2.Boolean)
		}),
		["UserSettings"] = v2.Table({
			["GameSettings"] = v2.Table({
				["ControlMode"] = v2.Enum(Enum.ControlMode),
				["VignetteEnabled"] = v2.Boolean,
				["ComputerCameraMovementMode"] = v2.Enum(Enum.ComputerCameraMovementMode),
				["ComputerMovementMode"] = v2.Enum(Enum.ComputerMovementMode),
				["GamepadCameraSensitivity"] = v2.FiniteNonNegative,
				["MouseSensitivity"] = v2.Range(0, 10),
				["RotationType"] = v2.Enum(Enum.RotationType),
				["SavedQualityLevel"] = v2.Enum(Enum.SavedQualitySetting),
				["TouchCameraMovementMode"] = v2.Enum(Enum.TouchCameraMovementMode),
				["TouchMovementMode"] = v2.Enum(Enum.TouchMovementMode),
				["InFullScreen"] = v2.Boolean,
				["InStudioMode"] = v2.Boolean
			})
		})
	}),
	["AcceptRemote"] = script:WaitForChild("Accept"),
	["PingRemote"] = script:WaitForChild("Ping"),
	["MenuStateRemote"] = script:WaitForChild("MenuState"),
	["FocusStateRemote"] = script:WaitForChild("FocusState")
}
return table.freeze(v9)