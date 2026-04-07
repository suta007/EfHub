--!strict
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

PlayerGui.ChildAdded:Connect(function(child)
	if child.Name == "RollCrate_UI" or child.Name == "SeedPackUI" or string.find(child.Name, "Pack") then
		if child:IsA("ScreenGui") then
			child.Enabled = false
		elseif child:IsA("Frame") then
			child.Visible = false
		end

		task.spawn(function()
			task.wait(0.2)
			local skipBtn = child:FindFirstChild("SkipButton", true) or child:FindFirstChild("Skip", true)

			if skipBtn and skipBtn:IsA("GuiButton") then
				if firesignal then
					firesignal(skipBtn.MouseButton1Click)
					firesignal(skipBtn.Activated)
					print("[SutaHub] ⏩ จำลองกด Skip ด้วย firesignal สำเร็จ!")
				elseif getconnections then
					for _, conn in ipairs(getconnections(skipBtn.MouseButton1Click)) do
						conn.Function()
					end
					print("[SutaHub] ⏩ จำลองกด Skip ด้วย getconnections สำเร็จ!")
				end
			else
				warn("[SutaHub] 🔴 หาปุ่ม Skip ไม่เจอค่ะพี่เอฟ ลองเช็คชื่อปุ่มใน Dex ดูนะคะ")
			end
		end)
	end
end)
