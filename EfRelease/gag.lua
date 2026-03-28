local a={cache={}::any}do do local function __modImpl()local b={}
local c={}

b.Players=game:GetService("Players")
b.LocalPlayer=b.Players.LocalPlayer
b.MyName=b.LocalPlayer.Name
b.Character=b.LocalPlayer.Character or b.LocalPlayer.CharacterAdded:Wait()
b.Humanoid=b.Character:WaitForChild("Humanoid")

b.PlayerGui=b.LocalPlayer:WaitForChild("PlayerGui")
b.TeleportFrame=b.PlayerGui:WaitForChild("Teleport_UI"):WaitForChild("Frame")

b.VirtualUser=game:GetService("VirtualUser")

b.ReplicatedStorage=game:GetService("ReplicatedStorage")
b.GameEvents=b.ReplicatedStorage:WaitForChild("GameEvents")
b.Data=b.ReplicatedStorage:WaitForChild("Data")
b.PetRegistry=b.Data:WaitForChild("PetRegistry")

b.Modules=b.ReplicatedStorage:WaitForChild("Modules")::any
b.DataService=require(b.Modules.DataService)
b.InventoryService=require(b.Modules.InventoryService)

b.CollectEvent=b.GameEvents:WaitForChild("Crops"):WaitForChild("Collect")

b.PetServices=b.Modules:WaitForChild("PetServices")::any
b.ActivePetsService=require(b.PetServices.ActivePetsService)

b.Backpack=b.LocalPlayer:WaitForChild("Backpack")

b.Lighting=game:GetService("Lighting")
b.Terrain=workspace.Terrain

function b.Initialize(d)
c=d
end

local d=require(b.Data:WaitForChild("SeedShopData")::any)
b.SeedShopTable={"ALL"}
for e,f in pairs(d)do
table.insert(b.SeedShopTable,e)
end

local e=require(b.Data:WaitForChild("SeedData")::any)
b.SeedDataTable={"ALL"}
for f,g in pairs(e)do
table.insert(b.SeedDataTable,f)
end
b.SeedDataBlackTable=table.clone(b.SeedDataTable)
b.SeedDataBlackTable[1]="NONE"

local f=b.DataService:GetData().GardenGuide.MutationData
b.MutationDataTable={"ALL"}
for g,h in pairs(f)do
table.insert(b.MutationDataTable,g)
end
b.MutationDataBlackTable=table.clone(b.MutationDataTable)
b.MutationDataBlackTable[1]="NONE"

local g=require(b.PetRegistry:WaitForChild("PetList")::any)
b.PetsDataTable={}
b.HungerDataTable={}
for h,i in pairs(g)do
table.insert(b.PetsDataTable,h)
b.HungerDataTable[h]=i["DefaultHunger"]
end

local h=require(b.PetRegistry:WaitForChild("PetMutationRegistry")::any)
b.PetMutationDataTable={"ALL"}
b.EnumToNameCache={}
for i,j in pairs(h["PetMutationRegistry"])do
if type(j)=="table"and j.EnumId then
table.insert(b.PetMutationDataTable,i)
b.EnumToNameCache[j.EnumId]=i
end
end
b.PetMutationDataBlackTable=table.clone(b.PetMutationDataTable)
b.PetMutationDataBlackTable[1]="NONE"

return b end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()

local b={}

b.isPlanting=false
b.isAgeBreaking=false
b.isHarvesting=false
b.isSelling=false
b.isFruitHidden=false
b.isPlantHidden=false

b.ShopKey={
Seed="ROOT/SeedStocks/Shop/Stocks",
Daily="ROOT/SeedStocks/Daily Deals/Stocks",
Gear="ROOT/GearStock/Stocks",
Egg="ROOT/PetEggStock/Stocks",
Santa="ROOT/EventShopStock/Santa's Stash/Stocks",
NewYear="ROOT/EventShopStock/New Years Shop/Stocks",
Traveling="ROOT/TravelingMerchantShopStock/Stocks",
}

b.BuyList={
[b.ShopKey.Seed]={
Enabled=false,
BuyAll=false,
Items={},
RemoteName="BuySeedStock",
ArgType="SeedMode",
},
[b.ShopKey.Daily]={
Enabled=true,
BuyAll=true,
Items={},
RemoteName="BuyDailySeedShopStock",
ArgType="NormalMode",
},
[b.ShopKey.Gear]={
Enabled=false,
BuyAll=false,
Items={},
RemoteName="BuyGearStock",
ArgType="NormalMode",
},
[b.ShopKey.Egg]={
Enabled=false,
BuyAll=false,
Items={},
RemoteName="BuyPetEgg",
ArgType="NormalMode",
},
[b.ShopKey.Traveling]={
Enabled=false,
BuyAll=false,
Items={},
RemoteName="BuyTravelingMerchantShopStock",
ArgType="NormalMode",
},
[b.ShopKey.Santa]={
Enabled=false,
BuyAll=false,
Items={},
RemoteName="BuyEventShopStock",
ArgType="EventMode",
EventArg="Santa's Stash",
},
[b.ShopKey.NewYear]={
Enabled=false,
BuyAll=false,
Items={},
RemoteName="BuyEventShopStock",
ArgType="EventMode",
EventArg="New Years Shop",
},
}

return b end function a.b():typeof(__modImpl())local b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do local function __modImpl()

local b=(getfenv()::any).getconnections
local c={}
local d:any
local e:any
local f=Random.new()

function c.Initialize(g)
d=g
e=d.sData
c.SellButton=e.TeleportFrame:WaitForChild("Sell")
c.GearButton=e.TeleportFrame:WaitForChild("Gear")
c.PetsButton=e.TeleportFrame:WaitForChild("Pets")
c.SeedsButton=e.TeleportFrame:WaitForChild("Seeds")
c.GardenButton=e.TeleportFrame:WaitForChild("Garden")
end

function c.ViewButton()
c.PetsButton.Visible=true
c.GearButton.Visible=true
end

function c.ClickButton(g)
if b then
for h,i in pairs(b(g.Activated))do
i:Fire()
end
end
end

function c.GetMyFarm()
local g=workspace:FindFirstChild("Farm")
if not g then
return nil
end
for h,i in pairs(g:GetChildren())do
local j,k=pcall(function()
return i.Important.Data.Owner.Value
end)

if j and k==e.MyName then
return i
end
end
return nil
end

function c.GetPlantsFolder()
local g=c.GetMyFarm():FindFirstChild("Important")
return g and g:FindFirstChild("Plants_Physical")
end

function c.getPlot()
local g={}
local h=c.GetMyFarm().Important.Plant_Locations:GetChildren()
for i,j in pairs(h)do
if j.Name=="Can_Plant"or j:IsA("Part")then
table.insert(g,j)
end
end
return g
end

function c.getBoundary(g)
if not g then
return nil
end

local h=g.CFrame
local i=g.Size

local j,k=-i.X/2+1,i.X/2-1
local l,m=-i.Z/2+1,i.Z/2-1
return{
cf=h,
minX=j,
maxX=k,
minZ=l,
maxZ=m,
}
end

function c.GetRandomPlotPos()
local g=c.getPlot()
if#g==0 then
return nil
end
local h=g[math.random(1,#g)]
local i=h.Size
local j=h.CFrame

local k=f:NextNumber(-i.X/2,i.X/2)

local l=f:NextNumber(-i.Z/2,i.Z/2)

local m=1

local n=CFrame.new(k,m,l)
local o=j*n

local p=o.Position.X
local q=j.Position.Y
local r=o.Position.Z

return CFrame.new(p,q,r)
end

function c.GetPosition()
local g=d.sData.Character
local h=g:WaitForChild("HumanoidRootPart")
if h then
local i=g:GetPivot()
return i.Position
end
return nil
end

function c.GetSelectedItems(g)
local h={}
if type(g)=="table"then
for i,j in pairs(g)do
if j then
table.insert(h,i)
end
end
end
return h
end

function c.isTableEmpty(g)
return type(g)~="table"or next(g)==nil
end

function c.UnequipTool()
pcall(function()
e.Humanoid:UnequipTool()
task.wait()
end)
end

function c.EquipTool(g)
local h,i=pcall(function()
e.Humanoid:EquipTool(g)
task.wait()
end)
return h
end

return c end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()

local b=(getfenv()::any).getgenv
local c={}
local d={}







function c.ToggleTask(e,f,g)
if f then
if d[e]then
return
end
d[e]=task.spawn(function()
task.wait()
while true do
local h,i=pcall(g)
if not h then
b().fLog("🔴 Task '"..e.."' error: "..tostring(i))
task.wait(1)
end
task.wait(0.1)
end
end)
else
if d[e]then
task.cancel(d[e])
d[e]=nil
end
end
end

return c end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()

local b={}
local c=game:GetService("CollectionService")
local d
local e
local f
local g
local h={}

function b.Initialize(i)
d=i
e=d.sData
f=d.Utils
g=d.fVar
end

function b.GetHarvestVar()
local i=d.Options
local j=f.GetSelectedItems
return{
mode="Harvest",
wl={
crops=j(i.ddHarvestCrops.Value),
mutants=j(i.ddHarvestMutants.Value),
variant=j(i.ddVariant.Value),
weightCondition=i.ddWeight.Value,
weightValue=tonumber(i.ipWeight.Value)or 0,
},
bl={
crops=j(i.ddHarvestBlackCrops.Value),
variant=j(i.ddBlackVariant.Value),
mutants=j(i.ddHarvestBlackMutants.Value),
},
}
end

function b.AutoPlant()
local i=d.Options
if not i.tgPlantsEnable.Value or g.isPlanting then
return
end
g.isPlanting=true
local j=f.GetSelectedItems(i.ddPlantsSeeds.Value)
local k=e.LocalPlayer.Backpack

for l,m in pairs(k:GetChildren())do
local n=m:GetAttribute("Seed")
if n and(table.find(j,"ALL")or table.find(j,n))then
local o=m:GetAttribute("Quantity")
for p=1,o do
f.UnequipTool()
task.wait(0.1)
f.EquipTool(m)
task.wait(0.1)
local q
if i.ddPlantsPos.Value=="Player"then
q=f.GetPosition()
else
q=f.GetRandomPlotPos().Position
end
local r={vector.create(q.X,q.Y,q.Z),n}
e.GameEvents:WaitForChild("Plant_RE"):FireServer(unpack(r))
end
end
end
g.isPlanting=false
end

function b.ClearReadyCrops()
table.clear(h)
end

function b.GetAllReadyCrops()
table.clear(h)
local i=c:GetTagged("CollectPrompt")

for j,k in ipairs(i)do
if k:IsA("ProximityPrompt")and k.Enabled and not k:GetAttribute("Collected")then
local l=k.Parent and k.Parent.Parent
if l then
table.insert(h,l)
end
end
end
end

function b.GetAllReadyCrops2()
table.clear(h)
local i=f.GetPlantsFolder()
if not i then
return
end
local j=0
for k,l in ipairs(i:GetChildren())do
local m=l:FindFirstChild("Fruits")
local n=m and m:GetChildren()or{l}

for o,p in ipairs(n)do
if p:IsA("Model")then
table.insert(h,p)
end
j=j+1
if j%100==0 then
task.wait()
end
end
end
end

function b.CheckCrops(i,j,k)
if not i or not i:IsA("Model")then
return false
end
local l=k or true

local m=i.Name
local n=i:FindFirstChild("Variant")and i:FindFirstChild("Variant").Value
local o=i:FindFirstChild("Weight")and i:FindFirstChild("Weight").Value

if l then
local p=i:FindFirstChild("ProximityPrompt",true)
if not p or not p.Enabled then
return false
end
end
if i:GetAttribute("Favorited")==true then
return false
end
if not table.find(j.wl.crops,"ALL")and not table.find(j.wl.crops,m)then
return false
end

if not table.find(j.wl.variant,"ALL")and not table.find(j.wl.variant,n)then
return false
end

if not table.find(j.wl.mutants,"ALL")then
local p=false

for q,r in pairs(j.wl.mutants)do
if i:GetAttribute(r)==true then
p=true
break
end
end
if not p then
return false
end
end

if j.wl.weightValue~=0 then
local p=tonumber(o)
if p then
if j.wl.weightCondition=="Below"and p>=j.wl.weightValue then
return false
end
if j.wl.weightCondition=="Above"and p<=j.wl.weightValue then
return false
end
else
return false
end
end

if not table.find(j.bl.crops,"NONE")and table.find(j.bl.crops,m)then
return false
end
if not table.find(j.bl.variant,"NONE")and table.find(j.bl.variant,n)then
return false
end

if not table.find(j.bl.mutants,"NONE")then
local p=false
for q,r in pairs(j.bl.mutants)do
if i:GetAttribute(r)==true then
p=true
break
end
end
if p then
return false
end
end

return true
end

function b.HarvestCrops()
local i=d.Options
if not i.tgHarvestEnable.Value or g.isHarvesting then
return
end
if e.InventoryService.IsMaxInventory(e.LocalPlayer)then
return
end
g.isHarvesting=true
if#h==0 then
b.GetAllReadyCrops2()

if#h==0 then
g.isHarvesting=false
return
end
end

if#h>0 then
local j=b.GetHarvestVar()
local k=table.remove(h,1)
if b.CheckCrops(k,j)then
e.CollectEvent:FireServer({k})
end
end
g.isHarvesting=false
end

function b.GetSellVar()
local i=d.Options
local j=f.GetSelectedItems
return{
mode="Sell",
wl={
crops=j(i.ddSellCrops.Value),
mutants=j(i.ddSellMutants.Value),
variant=j(i.ddSellVariant.Value),
weightCondition=i.ddSellWeight.Value,
weightValue=tonumber(i.ipSellWeight.Value)or 0,
},
bl={
crops=j(i.ddSellBlackCrops.Value),
variant=j(i.ddSellBlackVariant.Value),
mutants=j(i.ddSellBlackMutants.Value),
},
}
end
function b.CheckItem(i,j)
local k=i:FindFirstChild("Item_String")and i:FindFirstChild("Item_String").Value
local l=i:FindFirstChild("Variant")and i:FindFirstChild("Variant").Value
local m=i:FindFirstChild("Weight")and i:FindFirstChild("Weight").Value

if not k or not l or m==nil then
return false
end

if not table.find(j.wl.crops,"ALL")and not table.find(j.wl.crops,k)then
return false
end

if not table.find(j.wl.variant,"ALL")and not table.find(j.wl.variant,l)then
return false
end

if not table.find(j.wl.mutants,"ALL")then
local n=false

for o,p in pairs(j.wl.mutants)do
if i:GetAttribute(p)==true then
n=true
break
end
end
if not n then
return false
end
end

if j.wl.weightValue~=0 then
local n=tonumber(m)
if j.wl.weightCondition=="Below"and n>=j.wl.weightValue then
return false
end
if j.wl.weightCondition=="Above"and n<=j.wl.weightValue then
return false
end
end

if not table.find(j.bl.crops,"NONE")and table.find(j.bl.crops,k)then
return false
end
if not table.find(j.bl.variant,"NONE")and table.find(j.bl.variant,l)then
return false
end

if not table.find(j.bl.mutants,"NONE")then
local n=false
for o,p in pairs(j.bl.mutants)do
if i:GetAttribute(p)==true then
n=true
break
end
end
if n then
return false
end
end

return true
end

function b.SellCrops()
local i=d.Options

g.isSelling=true

f.ClickButton(f.SellButton)
task.wait(0.5)

if i.tgSellAll.Value then
e.GameEvents.Sell_Inventory:FireServer()
task.wait(1)
else
local j=b.GetSellVar()
local k=e.LocalPlayer.Backpack
for l,m in pairs(k:GetChildren())do
if b.CheckItem(m,j)then
f.EquipTool(m)
task.wait(0.1)
e.GameEvents.Sell_Item:FireServer()
task.wait(0.5)
end
end
end
f.ClickButton(f.GardenButton)
task.wait(1)
g.isSelling=false
end

function b.SellIfFull()
local i=d.Options
if i.tgSellIfFull.Value then
if not e.InventoryService.IsMaxInventory(e.LocalPlayer)then
return
end
end
b.SellCrops()
end

return b end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()

local b={}
local c
local d
local e
local f
local g=nil

function b.Initialize(h)
c=h
d=c.sData
e=c.Utils
f=c.fVar
end

function b.AntiLag()

d.Lighting.GlobalShadows=false
d.Lighting.FogEnd=9e9
d.Lighting.Brightness=1
d.Lighting.EnvironmentDiffuseScale=0
d.Lighting.EnvironmentSpecularScale=0
d.Lighting.OutdoorAmbient=Color3.new(0,0,0)


d.Terrain.WaterWaveSize=0
d.Terrain.WaterWaveSpeed=0
d.Terrain.WaterReflectance=0
d.Terrain.WaterTransparency=1


for h,i in ipairs(workspace:GetDescendants())do
if h%200==0 then
task.wait()
end

if i:IsA("BasePart")then
i.Material=Enum.Material.SmoothPlastic
i.Reflectance=0
elseif i:IsA("ParticleEmitter")then
i.Enabled=false
elseif i:IsA("Decal")or i:IsA("Texture")then
i.Transparency=1
end
end


pcall(function()
settings().Rendering.QualityLevel=Enum.QualityLevel.Level01
end)
end

local function IsFruit(h)
local i=h
while i and i~=workspace do
if i.Name=="Fruits"then
return true
end
i=i.Parent
end
return false
end

local function SetVisibility(h,i)
if h:IsA("BasePart")or h:IsA("MeshPart")or h:IsA("Decal")or h:IsA("Texture")then
if i then

if not h:GetAttribute("OriginalTrans")then
h:SetAttribute("OriginalTrans",h.Transparency)
end
h.Transparency=1
else
local j=h:GetAttribute("OriginalTrans")
if j then
h.Transparency=j
end
end
elseif h:IsA("ParticleEmitter")or h:IsA("Sparkles")or h:IsA("Fire")or h:IsA("Trail")then
if i then

if h:GetAttribute("OriginalEnabled")==nil then
h:SetAttribute("OriginalEnabled",h.Enabled)
end
h.Enabled=false
else
local j=h:GetAttribute("OriginalEnabled")
if j~=nil then
h.Enabled=j
end
end
end
end

function b.HidePlant(h)
f.isPlantHidden=h
local i=e.GetPlantsFolder()
if not i then
return
end

for j,k in ipairs(i:GetDescendants())do
if not IsFruit(k)then
SetVisibility(k,h)
end
end
end

function b.HideFruit(h)
f.isFruitHidden=h
local i=e.GetPlantsFolder()
if not i then
return
end

for j,k in ipairs(i:GetDescendants())do
if IsFruit(k)then
SetVisibility(k,h)
end
end
end

function b.HideTracker()
local h=c.Options
local i=h.tgHideFruits
local j=h.tgHidePlants
if not i or not j then
return
end

local k=(i.Value or j.Value)
if k then
local l=e.GetPlantsFolder()
if l then
if g then
g:Disconnect()
g=nil
end
g=l.DescendantAdded:Connect(function(m)
task.wait()
if IsFruit(m)then
if f.isFruitHidden then
SetVisibility(m,true)
end
else
if f.isPlantHidden then
SetVisibility(m,true)
end
end
end)
end
else
if g then
g:Disconnect()
g=nil
end
end
end

return b end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()


local b={}
local c=nil

local d=loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

local e=loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local f=loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local g=loadstring(game:HttpGet("https://raw.githubusercontent.com/suta007/Lua_EfHub/refs/heads/master/Core/CollapsibleSection.lua"))()

g(d)

function b.Initialize(h)
c=h
h.IsLoading=true


h.Interface=d:CreateWindow({
Title="Grow a Garden",
SubTitle="2569.03.23-23.00",
TabWidth=100,
Size=UDim2.fromOffset(600,340),
Resize=false,
MinSize=Vector2.new(580,400),
Acrylic=true,
Theme="Darker",
MinimizeKey=Enum.KeyCode.RightControl,
})

e:SetLibrary(d)
f:SetLibrary(d)
f:SetFolder("EfHub")
e:SetFolder("EfHub/GAG")

h.Tabs={}
h.Fluent=d
h.SaveManager=e
h.InterfaceManager=f
h.Options=d.Options




local i=Instance.new("ScreenGui")
local j=Instance.new("TextButton")
local k=Instance.new("UICorner")

i.Name="Ef_Toggle"
i.Parent=game:GetService("CoreGui")
i.ResetOnSpawn=false

j.Name="ToggleButton"
j.Parent=i
j.BackgroundColor3=Color3.fromRGB(100,20,20)
j.Position=UDim2.new(0,10,0.5,0)
j.Size=UDim2.new(0,50,0,50)
j.Text="GAG"
j.TextColor3=Color3.fromRGB(255,255,255)
j.Draggable=true
j.Active=true

k.CornerRadius=UDim.new(0,25)
k.Parent=j


j.MouseButton1Click:Connect(function()
local l=h.Interface
if l then

if l.Instance then
l.Instance.Enabled=not l.Instance.Enabled

elseif l.Root then
l.Root.Visible=not l.Root.Visible
end
end
end)
end

function b.Finalize()
c.Tabs.Settings=c.Interface:AddTab({Title="Settings",Icon="settings"})
c.InterfaceManager:BuildInterfaceSection(c.Tabs.Settings)
c.SaveManager:BuildConfigSection(c.Tabs.Settings)

c.Interface:SelectTab(1)

task.spawn(function()
while not c.SaveManager.Options.SaveManager_ConfigList do
task.wait()
end
c.SaveManager.Options.SaveManager_ConfigList:SetValue("GrowAGarden")
c.SaveManager:Load("GrowAGarden")
c.IsLoading=false
c.Fluent:Notify({
Title="EfHub",
Content="Settings loaded automatically",
Duration=3,
})
end)
end

function b.QuickSave()
if not c.IsLoading then
c.SaveManager:Save("GrowAGarden")
end
end

return b end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()

local b={}

local c
local d
local e
local f
local g
local h
local i
local j

function b.Initialize(k)
c=k.Interface
d=k.Tabs
e=k.Options
f=k.Window.QuickSave
g=k.fVar
h=k.EfTasks
i=k.Main
j=k.sData

d.Main=c:AddTab({Title="Main",Icon="dices"})
local l=d.Main:AddCollapsibleSection("Plants",false)

l:AddToggle("tgPlantsEnable",{
Title="Auto Plants",
Default=false,
Callback=function(m)
if not m then
g.isPlanting=false
end
h.ToggleTask("AutoPlant",m,function()
i.AutoPlant()
task.wait(2)
end)
f()
end,
})
l:AddButton({
Title="Clear Selected Seeds",
Callback=function()
e.ddPlantsSeeds:SetValue({})
end,
})
l:AddDropdown("ddPlantsSeeds",{
Title="Select Seeds",
Values=j.SeedDataTable,
Multi=true,
Default={},
Searchable=true,
Callback=function(m)
f()
end,
})

l:AddDropdown("ddPlantsPos",{
Title="Select Plants Position",
Values={"Player","Random"},
Default="Player",
Callback=function(m)
f()
end,
})

local m=d.Main:AddCollapsibleSection("Harvest",false)
m:AddToggle("tgHarvestEnable",{
Title="Auto Harvest",
Default=false,
Callback=function(n)
if not n then
g.isHarvesting=false
i.ClearReadyCrops()
end
h.ToggleTask("AutoHarvest",n,function()
i.HarvestCrops()
task.wait(0.1)
end)
f()
end,
})

m:AddDivider()

m:AddButton({
Title="Clear Selected Crops",
Callback=function()
e.ddHarvestCrops:SetValue({ALL=true})
end,
})
m:AddDropdown("ddHarvestCrops",{
Title="Select Crops",
Values=j.SeedDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(n)
f()
end,
})
m:AddButton({
Title="Clear Backlist Crops",
Callback=function()
e.ddHarvestBlackCrops:SetValue({NONE=true})
end,
})
m:AddDropdown("ddHarvestBlackCrops",{
Title="Blacklist Crops",
Values=j.SeedDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(n)
f()
end,
})

m:AddDivider()
m:AddButton({
Title="Clear Selected Mutant",
Callback=function()
e.ddHarvestMutants:SetValue({ALL=true})
end,
})

m:AddDropdown("ddHarvestMutants",{
Title="Select Mutants",
Values=j.MutationDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(n)
f()
end,
})

m:AddButton({
Title="Clear Backlist Mutant",
Callback=function()
e.ddHarvestBlackMutants:SetValue({NONE=true})
end,
})

m:AddDropdown("ddHarvestBlackMutants",{
Title="Backlist Mutants",
Values=j.MutationDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(n)
f()
end,
})

m:AddDivider()
m:AddDropdown("ddVariant",{
Title="Variant",
Values={"ALL","Normal","Rainbow","Gold","Silver","Diamond"},
Default={"ALL"},
Multi=true,
Callback=function(n)
f()
end,
})
m:AddDropdown("ddBlackVariant",{
Title="Backlist Variant",
Values={"NONE","Normal","Rainbow","Gold","Silver","Diamond"},
Default={"NONE"},
Multi=true,
Callback=function(n)
f()
end,
})
m:AddDivider()
m:AddDropdown("ddWeight",{
Title="Weight",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function(n)
f()
end,
})
m:AddInput("ipWeight",{
Title="Weight",
Default=0,
Numeric=true,
Finished=true,
Callback=function(n)
f()
end,
})













local n=d.Main:AddCollapsibleSection("Sell",false)
n:AddInput("ipSellDelay",{
Title="Delay",
Default=30,
Numeric=true,
Finished=true,
Callback=function(o)
f()
end,
})
n:AddToggle("tgSellEnable",{
Title="Auto Sell",
Default=false,
Callback=function(o)
if not o then
g.isSelling=false
end
h.ToggleTask("AutoSell",o,function()
local p=tonumber(e.ipSellDelay.Value)or 0.1
task.wait(p)
if g.isSelling then
return
end
i.SellIfFull()
end)

f()
end,
})

n:AddToggle("tgSellAll",{
Title="Sell All",
Default=false,
Callback=function(o)
f()
end,
})

n:AddToggle("tgSellIfFull",{
Title="Sell If Full",
Default=false,
Callback=function(o)
f()
end,
})

local o=nil
n:AddButton({
Title="Sell Now",
Callback=function()
if o then
task.cancel(o)
o=nil
else
o=task.spawn(function()
i.SellCrops()
o=nil
end)
end
end,
})
n:AddDivider()
n:AddButton({
Title="Clear Selected Crops",
Callback=function()
e.ddSellCrops:SetValue({ALL=true})
end,
})
n:AddDropdown("ddSellCrops",{
Title="Select Crops",
Values=j.SeedDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(p)
f()
end,
})
n:AddButton({
Title="Clear Backlist Crops",
Callback=function()
e.ddSellBlackCrops:SetValue({NONE=true})
end,
})
n:AddDropdown("ddSellBlackCrops",{
Title="Backlist Crops",
Values=j.SeedDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(p)
f()
end,
})
n:AddDivider()
n:AddButton({
Title="Clear Selected Mutant",
Callback=function()
e.ddSellMutants:SetValue({ALL=true})
end,
})
n:AddDropdown("ddSellMutants",{
Title="Select Mutants",
Values=j.MutationDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(p)
f()
end,
})
n:AddButton({
Title="Clear Backlist Mutant",
Callback=function()
e.ddSellBlackMutants:SetValue({NONE=true})
end,
})
n:AddDropdown("ddSellBlackMutants",{
Title="Backlist Mutants",
Values=j.MutationDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(p)
f()
end,
})
n:AddDivider()
n:AddDropdown("ddSellVariant",{
Title="Variant",
Values={"ALL","Normal","Rainbow","Gold","Silver","Diamond"},
Default={"ALL"},
Multi=true,
Callback=function(p)
f()
end,
})
n:AddDropdown("ddSellBlackVariant",{
Title="Backlist Variant",
Values={"NONE","Normal","Rainbow","Gold","Silver","Diamond"},
Default={"NONE"},
Multi=true,
Callback=function(p)
f()
end,
})
n:AddDivider()
n:AddDropdown("ddSellWeight",{
Title="Weight",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function(p)
f()
end,
})
n:AddInput("ipSellWeight",{
Title="Weight",
Default=0,
Numeric=true,
Finished=true,
Callback=function(p)
f()
end,
})
end
return b end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()

local b={}
local c

function b.Initialize(d)
c=d
local e=d.Options
_=e
local f=d.Interface
local g=d.Tabs
local h=d.Window.QuickSave
local i=d.Misc
local j=d.sData

g.MiscTab=f:AddTab({Title="Misc",Icon="flower"})
local k=g.MiscTab:AddCollapsibleSection("Misc",false)
k:AddButton({
Title="Reset Control Var",
Callback=function()

end,
})

local l=g.MiscTab:AddCollapsibleSection("AntiLag",false)
l:AddToggle("tgAntiLag",{
Title="AntiLag",
Default=false,
Callback=function(m)
if m then
i.AntiLag()
end
h()
end,
})

l:AddToggle("tgHideFruits",{
Title="Hide Fruits",
Default=false,
Callback=function(m)
i.HideFruit(m)
i.HideTracker()
h()
end,
})

l:AddToggle("tgHidePlants",{
Title="Hide Plants",
Default=false,
Callback=function(m)
i.HidePlant(m)
i.HideTracker()
h()
end,
})



















































end

return b end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()





local b=(getfenv()::any).getgenv
local c=(getfenv()::any).setclipboard or(getfenv()::any).toclipboard
local d={}
local e
local f=""
local g=0
function d.Initialize(h)
e=h
local i=h.Options
_=i
local j=h.Interface
local k=h.Tabs
local l=h.Fluent

k.Log=j:AddTab({Title="Log",Icon="scroll"})

k.Log:AddButton({
Title="❌ Clear Log",
Callback=function()
f=""
g=0
if e and e.fDisplay then
e.fDisplay:SetValue("Waiting for new activity...\n")
end
end,
})

k.Log:AddButton({
Title="📑 Copy Log",
Callback=function()
if f~=""then
if c then
c(f)
l:Notify({
Title="EfHub System",
Content="✅ คัดลอก Log แล้ว",
Duration=3,
})
else
l:Notify({
Title="EfHub System",
Content="❌ ตัวรันของคุณไม่รองรับการคัดลอก (setclipboard)",
Duration=3,
})
end
end
end,
})

e.fDisplay=k.Log:AddParagraph("ActivityLogs",{
Title="📃 Activity Logs",
Content="Waiting for system to start...\n",
})
end
b().fLog=function(h)
local i=os.date("%H:%M:%S")
local j="["..i.."] "..tostring(h).."\n"

f=j..f
g=g+1

if g>100 then
local k=string.find(f,"\n",-2)
if k then
f=string.sub(f,1,k)
end
g=100
end

if e and e.fDisplay then
e.fDisplay:SetValue(f)
end
end

return d end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()





local b=(getfenv()::any).getgenv
local c=b().EF_REMOTE
local d={}

local function LoadModules()
local e={}
local f=b().DEV_MODE
if f then

e.sData=c("Core/sData")
e.fVar=c("Core/fVar")


e.Utils=c("Modules/Utils")
e.EfTasks=c("Modules/EfTasks")
e.Main=c("Modules/Main")



e.Misc=c("Modules/Misc")







e.Window=c("UI/Window")
e.MainTab=c("UI/Tabs/MainTab")

e.MiscTab=c("UI/Tabs/MiscTab")
e.LogTab=c("UI/Tabs/LogTab")





else

e.sData=a.a()
e.fVar=a.b()


e.Utils=a.c()
e.EfTasks=a.d()
e.Main=a.e()

e.Misc=a.f()








e.Window=a.g()
e.MainTab=a.h()

e.MiscTab=a.i()
e.LogTab=a.j()





end

return e
end

function d.Initialize()
local e=LoadModules()

e.Window.Initialize(e)




e.Utils.Initialize(e)
e.Misc.Initialize(e)
e.Main.Initialize(e)





e.MainTab.Initialize(e)



e.MiscTab.Initialize(e)

e.LogTab.Initialize(e)

e.Window.Finalize()
e.Utils.ViewButton()
return e
end

return d end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end end


local b=(getfenv()::any).getgenv
b().DEV_MODE=false

local c

if b().DEV_MODE then
local d="https://raw.githubusercontent.com/suta007/EfHub/refs/heads/master/GAG/src/"

local function GetRemote(e)
local f=d..e..".luau"
local g,h=pcall(function()
return game:HttpGet(f)
end)
if not g or not h then
error("Remote Error: Could not fetch "..e)
end
local i,j=loadstring(h)
if not i then
error("Compile Error in "..e..": "..tostring(j))
end
return i()
end

b().EF_REMOTE=GetRemote

c=GetRemote("EfHub")
else
c=a.k()
end


c.Initialize()
task.wait(1)



local d=game:GetService("Players").LocalPlayer
local e=game:GetService("VirtualUser")
d.Idled:Connect(function()
e:CaptureController()
e:ClickButton2(Vector2.new())
end)