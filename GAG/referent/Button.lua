local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local Frame = PlayerGui:WaitForChild("Teleport_UI"):WaitForChild("Frame")
local SellButton=Frame:WaitForChild("Sell")
local GearButton=Frame:WaitForChild("Gear")
local PetsButton=Frame:WaitForChild("Pets")
local SeedsButton=Frame:WaitForChild("Seeds")
local GardenButton=Frame:WaitForChild("Garden")
PetsButton.Visible = true
GearButton.Visible = true

local function ClickButton(Button)
    if getconnections then
        for _, connection in pairs(getconnections(Button.Activated)) do
            connection:Fire() 
        end
    end
end

ClickButton(SellButton)
ClickButton(GearButton)
ClickButton(PetsButton)
ClickButton(SeedsButton)
ClickButton(GardenButton)


game:GetService("Players").LocalPlayer.PlayerGui.Teleport_UI.Frame.Garden
game:GetService("Players").LocalPlayer.PlayerGui.Teleport_UI.Frame.Gear
game:GetService("Players").LocalPlayer.PlayerGui.Teleport_UI.Frame.Pets
game:GetService("Players").LocalPlayer.PlayerGui.Teleport_UI.Frame.Seeds
game:GetService("Players").LocalPlayer.PlayerGui.Teleport_UI.Frame.Sell


local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local Frame = PlayerGui:WaitForChild("Teleport_UI"):WaitForChild("Frame")
local function ClickButton(Button)
    if getconnections then
        for _, connection in pairs(getconnections(Button.Activated)) do
            connection:Fire() 
        end
    end
end
local PetsButton=Frame:WaitForChild("Pets")
ClickButton(PetsButton)