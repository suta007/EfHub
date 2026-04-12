local a={cache={}::any}do do local function __modImpl()local b={}


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
b.RemoveItemEvent=b.GameEvents:WaitForChild("Remove_Item")
b.TrowelEvent=b.GameEvents:WaitForChild("TrowelRemote")
b.ReclaimerEvent=b.GameEvents:WaitForChild("ReclaimerService_RE")
b.SprinklerEvent=b.GameEvents:WaitForChild("SprinklerService")
b.RefreshActivePetsUI=b.GameEvents:WaitForChild("RefreshActivePetsUI")
b.PetsServiceEvent=b.GameEvents:WaitForChild("PetsService")
b.SeedPackEvent=b.GameEvents:WaitForChild("SeedPack")
b.PetEggService=b.GameEvents:WaitForChild("PetEggService")
b.CraftingEvent=b.GameEvents:WaitForChild("CraftingGlobalObjectService")

b.ClaimSeasonPassRewardRemote=b.GameEvents:WaitForChild("SeasonPass"):WaitForChild("ClaimSeasonPassReward")
b.ClaimSeasonPassInfRewardRemote=b.GameEvents:WaitForChild("SeasonPass"):WaitForChild("ClaimSeasonPassInfReward")

b.ClaimSeasonPassQuestRemote=b.GameEvents:WaitForChild("SeasonPass"):WaitForChild("ClaimSeasonPassQuest")
b.BuySeasonPassStockRemote=b.GameEvents:WaitForChild("SeasonPass"):WaitForChild("BuySeasonPassStock")

b.SeasonPassData=require(b.Data:WaitForChild("SeasonPass"):WaitForChild("SeasonPassData")::any)
b.SeasonPassUtils=require(b.Modules:WaitForChild("SeasonPass"):WaitForChild("SeasonPassUtils")::any)
b.SeasonPassStaticData=require(b.Data:WaitForChild("SeasonPass"):WaitForChild("SeasonPassStaticData")::any)

b.PetServices=b.Modules:WaitForChild("PetServices")::any
b.ActivePetsService=require(b.PetServices.ActivePetsService)
b.PetUtils=require(b.PetServices.PetUtilities)

b.Backpack=b.LocalPlayer:WaitForChild("Backpack")

b.Lighting=game:GetService("Lighting")
b.Terrain=workspace.Terrain

b.CoreGui=game:GetService("CoreGui")

b.PetShardService_RE=b.GameEvents:WaitForChild("PetShardService_RE")
b.Workspace=game:GetService("Workspace")






local c=require(b.Data:WaitForChild("SeedShopData")::any)
b.SeedShopTable={"ALL"}
for d,e in pairs(c)do
table.insert(b.SeedShopTable,d)
end

local d=require(b.Data:WaitForChild("DailySeedShopData")::any)
b.DailySeedShopTable={"ALL"}
for e,f in pairs(d)do
table.insert(b.DailySeedShopTable,e)
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
b.PetsDataBlackTable=table.clone(b.PetsDataTable)
b.PetsDataBlackTable[1]="NONE"

local h=require(b.PetRegistry:WaitForChild("PetMutationRegistry")::any)
b.PetMutationDataTable={"NONE"}
b.EnumToNameCache={}
for i,j in pairs(h["PetMutationRegistry"])do
if type(j)=="table"and j.EnumId then
table.insert(b.PetMutationDataTable,i)
b.EnumToNameCache[j.EnumId]=i
end
end
b.PetMutationDataBlackTable=table.clone(b.PetMutationDataTable)
b.PetMutationDataBlackTable[1]="NONE"

local i=require(b.Data:WaitForChild("GearShopData")::any)
b.GearShopTable={"ALL"}
for j,k in pairs(i["Gear"])do
table.insert(b.GearShopTable,j)
end

local j=require(b.Data:WaitForChild("PetEggData")::any)
b.EggShopTable={"ALL"}
for k,l in pairs(j)do
table.insert(b.EggShopTable,k)
end

local k=require(b.Data:WaitForChild("TravelingMerchant"):WaitForChild("TravelingMerchantData")::any)
b.TravelingMerchantTable={}
for l,m in pairs(k)do
if type(m.ShopData)=="table"then
b.TravelingMerchantTable[l]={}
for n,o in pairs(m.ShopData)do
table.insert(b.TravelingMerchantTable[l],n)
end
end
end

b.SprinklerData=require(b.Data:WaitForChild("SprinklerData")::any)
b.SprinklerDataTable={"NONE"}
for l,m in pairs(b.SprinklerData["SprinklerBoxSizes"])do
table.insert(b.SprinklerDataTable,l)
end

local l=require(b.Data:WaitForChild("EventShopData")::any)










b.EasterShopTable={"ALL"}
for m,n in pairs(l["Easter Seed Shop"])do
table.insert(b.EasterShopTable,m)
end

local m=require(b.Data:WaitForChild("SeedPackData")::any)
b.SeedPackTable={"ALL"}
for n,o in pairs(m.Packs)do
if o.DisplayName then
table.insert(b.SeedPackTable,o.DisplayName)
end
end



local n=b.SeasonPassData.ShopItems
b.SeasonPassShopTable={"ALL"}
b.SeasonPassPriceTable={}
for o,p in pairs(n)do
table.insert(b.SeasonPassShopTable,o)
b.SeasonPassPriceTable[o]=p.Price
end

local o=require(b.Data:WaitForChild("PetRegistry"):WaitForChild("PetEggs"))
b.EggDataTable={"ALL"}
for p,q in pairs(o)do
table.insert(b.EggDataTable,p)
end

local p=require(b.Data:WaitForChild("CraftingData"):WaitForChild("CraftingRecipeRegistry")::any)
b.GearEventData=p.RecipiesSortedByMachineType.GearEventWorkbench
b.GearEventDataTable={}
for q,r in pairs(b.GearEventData)do
table.insert(b.GearEventDataTable,q)
end

return b end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()

local b={}

b.IsPlanting=false
b.IsAgeBreaking=false
b.IsHarvesting=false
b.IsSelling=false
b.IsFruitHidden=false
b.IsPlantHidden=false
b.IsRemovingPlants=false
b.IsRemovingCrops=false
b.IsTroweling=false
b.IsReclaiming=false
b.IsSprinkling=false
b.IsCatLeading=false
b.IsFarmingLevel=false

b.IsMutating=false
b.IsFeeding=false

b.UIShopLoaded=false

b.IsOpeningSeedPack=false

b.CraftGearRunning=false

b.CheckLevelConnection=nil
b.CheckLevelConnection2=nil

b.Pos={
Trowel=nil,
Sprinkler=nil,
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

c.SellButton=e.TeleportFrame:WaitForChild("Easter_Sell")or e.TeleportFrame:WaitForChild("Sell")
c.GardenButton=e.TeleportFrame:WaitForChild("Easter_Garden")or e.TeleportFrame:WaitForChild("Garden")
c.SeedsButton=e.TeleportFrame:WaitForChild("Easter_Seeds")or e.TeleportFrame:WaitForChild("Seeds")
c.PetsButton=e.TeleportFrame:WaitForChild("Pets")
c.GearButton=e.TeleportFrame:WaitForChild("Gear")
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

function c.GetObjectsFolder()
local g=c.GetMyFarm():FindFirstChild("Important")
return g and g:FindFirstChild("Objects_Physical")
end

function c.GetPlot()
local g={}
local h=c.GetMyFarm().Important.Plant_Locations:GetChildren()
for i,j in pairs(h)do
if j.Name=="Can_Plant"or j:IsA("Part")then
table.insert(g,j)
end
end
return g
end

function c.GetBoundary(g)
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

function c.GetRandomPlotPos(g)
local h=g or nil
local i
local j=c.GetPlot()
if#j==0 then
return nil
end
if not h then
i=j[math.random(1,#j)]
else
i=j[h]
end
local k=i.Size
local l=i.CFrame

local m=f:NextNumber(-k.X/2,k.X/2)

local n=f:NextNumber(-k.Z/2,k.Z/2)

local o=1

local p=CFrame.new(m,o,n)
local q=l*p

local r=q.Position.X
local s=l.Position.Y
local t=q.Position.Z

return CFrame.new(r,s,t)
end

function c.GetSetPlotPos(g,h,i)
local j=g or 1
local k=h or 0
local l=c.GetPlot()
if#l==0 then
return nil
end
local m=l[j]
local n=c.GetBoundary(m)
local o=n.cf
local p=i or n.maxX
local q=0.15
local r=n.minZ+(k*4)
k=k+1
if r>n.maxZ then
p=p-4
r=n.minZ
k=0
end
if p<n.minX then
if j==1 then
j=2
else
j=1
end
return c.GetSetPlotPos(j,0)
end

local s=CFrame.new(p,q,r)
local t=o*s

local u=t.Position.X
local v=o.Position.Y
local w=t.Position.Z
return{CFrame.new(u,v,w),j,k,p}
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

function c.GetPlayerCFrame()
return e.Character:GetPivot()
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

function c.HandleRuntimeError(g,h)
d.Log(string.format("❌ %s error: %s",g,tostring(h)))
end

function c.RunWithFlag(g,h,i)
local j=d and d.fVar
if not j then
return false
end
j[g]=true
local k,l=xpcall(i,debug.traceback)
j[g]=false
if not k then
c.HandleRuntimeError(h,l)
end
return k
end

function c.FindToolByName(g,h)
if not g then
return nil
end
return g:FindFirstChild(h)
end

function c.FindToolByPattern(g,h)
if not g then
return nil
end
for i,j in ipairs(g:GetChildren())do
if j:IsA("Tool")and j.Name:match(h)then
return j
end
end
return nil
end

function c.MatchesWeight(g,h,i)
if i<=0 then
return true
end
if h=="Below"then
return g<i
end
if h=="Above"then
return g>i
end
return false
end

function c.IsTableEmpty(g)
return type(g)~="table"or next(g)==nil
end

function c.UnequipTool()
pcall(function()
e.Humanoid:UnequipTools()
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

function c.ParseVector3(g)

if type(g)~="string"then
return nil
end


local h,i,j=string.match(g,"^%s*(-?[0-9.]+),%s*(-?[0-9.]+),%s*(-?[0-9.]+)%s*$")


if h and i and j then
return Vector3.new(tonumber(h),tonumber(i),tonumber(j))
end

return nil
end

return c end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()

local b={}
local c={}
local d

function b.Initialize(e)
d=e

end

function b.ToggleTask(e,f,g)
if f then
if c[e]then
return
end
c[e]=task.spawn(function()
task.wait()
while true do
local h,i=pcall(g)
if not h then
d.Log("🔴 Task "..e.." error: "..tostring(i))
task.wait(1)
end
task.wait(0.1)
end
end)
else
if c[e]then
task.cancel(c[e])
c[e]=nil
end
end
end

return b end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()

local b={}
local c=game:GetService("CollectionService")
local d
local e
local f
local g
local h={}

local function ShouldMatchMutants(i,j)
if table.find(j,"ALL")then
return true
end
for k,l in ipairs(j)do
if i:GetAttribute(l)==true then
return true
end
end
return false
end

local function IsBlockedByBlackMutants(i,j)
if table.find(j,"NONE")then
return false
end
for k,l in ipairs(j)do
if i:GetAttribute(l)==true then
return true
end
end
return false
end

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
if not i.tgPlantsEnable.Value or g.IsPlanting then
return
end
f.RunWithFlag("IsPlanting","AutoPlant",function()
local j=f.GetSelectedItems(i.ddPlantsSeeds.Value)
local k=tonumber(i.ipPlantsAmount.Value)or 0
local l=e.LocalPlayer.Backpack
for m,n in ipairs(l:GetChildren())do
if not i.tgPlantsEnable.Value then
g.IsPlanting=false
return
end
local o=n:GetAttribute("Seed")
if o and(table.find(j,"ALL")or table.find(j,o))then
local p=0
local q=tonumber(n:GetAttribute("Quantity"))or 0
if k==0 then
p=q
else
p=math.min(k,q)
end
for r=1,p do
if not i.tgPlantsEnable.Value then
return
end
f.UnequipTool()
task.wait(0.1)
f.EquipTool(n)
task.wait(0.1)
local s
if i.ddPlantsPos.Value=="Player"then
s=f.GetPosition()
elseif i.ddPlantsPos.Value=="Set"then
s=f.ParseVector3(i.ipPlantsPos.Value)
if not s then
s=f.GetPosition()
end
else
local t=f.GetRandomPlotPos()
s=t and t.Position
end
if s then
local t={vector.create(s.X,s.Y,s.Z),o}
e.GameEvents:WaitForChild("Plant_RE"):FireServer(unpack(t))
task.wait(0.2)
end
end
end
end
end)
end

function b.ClearReadyCrops()
table.clear(h)
end

function b.GetAllReadyCrops()
table.clear(h)
local i=c:GetTagged("CollectPrompt")
local j={}

for k,l in ipairs(i)do
if l:IsA("ProximityPrompt")and l.Enabled and not l:GetAttribute("Collected")then
local m=l.Parent and l.Parent.Parent
if m and not j[m]then
j[m]=true
table.insert(h,m)
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
if p:IsA("Model")and p:FindFirstChild("Weight")and p:FindFirstChild("Variant")then
table.insert(h,p)
end
j=j+1
if j%250==0 then
task.wait()
end
end
end
end

function b.CheckCrops(i,j,k)
if not i or not i:IsA("Model")then
return false
end
local l=k~=false

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
if not ShouldMatchMutants(i,j.wl.mutants)then
return false
end
end

if j.wl.weightValue~=0 then
local p=tonumber(o)
if not p or not f.MatchesWeight(p,j.wl.weightCondition,j.wl.weightValue)then
return false
end
end

if not table.find(j.bl.crops,"NONE")and table.find(j.bl.crops,m)then
return false
end
if not table.find(j.bl.variant,"NONE")and table.find(j.bl.variant,n)then
return false
end

if IsBlockedByBlackMutants(i,j.bl.mutants)then
return false
end

return true
end

function b.HarvestCrops()
local i=d.Options
if not i.tgHarvestEnable.Value or g.IsHarvesting then
return
end
if e.InventoryService.IsMaxInventory(e.LocalPlayer)then
return
end
f.RunWithFlag("IsHarvesting","HarvestCrops",function()
if f.IsTableEmpty(h)then
b.GetAllReadyCrops2()
if f.IsTableEmpty(h)then
return
end
end

local j=b.GetHarvestVar()
local k=table.remove(h,1)
if k and b.CheckCrops(k,j)then
e.CollectEvent:FireServer({k})
end
end)
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
if not ShouldMatchMutants(i,j.wl.mutants)then
return false
end
end

if j.wl.weightValue~=0 then
local n=tonumber(m)
if not n or not f.MatchesWeight(n,j.wl.weightCondition,j.wl.weightValue)then
return false
end
end

if not table.find(j.bl.crops,"NONE")and table.find(j.bl.crops,k)then
return false
end
if not table.find(j.bl.variant,"NONE")and table.find(j.bl.variant,l)then
return false
end

if IsBlockedByBlackMutants(i,j.bl.mutants)then
return false
end

return true
end

function b.SellCrops()
local i=d.Options
if g.IsSelling then
return
end
f.RunWithFlag("IsSelling","SellCrops",function()
f.ClickButton(f.SellButton)
task.wait(0.5)
if i.tgSellAll.Value then
e.GameEvents.Sell_Inventory:FireServer()
task.wait(1)
else
local j=b.GetSellVar()
local k=e.LocalPlayer.Backpack
for l,m in ipairs(k:GetChildren())do
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
end)
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
local d={}
local e
local f
b.ShopKey={}

function b.Initialize(g)
c=g
e=c.sData
f=c.Utils.GetSelectedItems

local h=e.SeasonPassData.CurrentSeason or"Season 4"
b.ShopKey={
Seed="SeedStocks/Shop/Stocks",
Daily="SeedStocks/Daily Deals/Stocks",
Gear="GearStock/Stocks",
Egg="PetEggStock/Stocks",
Traveling="TravelingMerchantShopStock/Stocks",


Easter="EventShopStock/Easter Seed Shop/Stocks",
SeasonPass="SeasonPass/"..h.."/Stocks",
}


for i,j in pairs(b.ShopKey)do
local k=e.DataService:GetPathSignal(j.."/@")

k:Connect(function(l,m)
if type(m)=="table"then
task.spawn(function()
task.wait(0.5)
b.BuyItem(j,m)
end)
end
end)

end
end

function b.UpdateBuyList()
if not c.fVar.UIShopLoaded then
return
end
local g=c.Options
local h={}
if g.tgBuyTravelingAll.Value then
h={"ALL"}
else
for i,j in pairs(e.TravelingMerchantTable)do
local k="ddTraveling_"..i
for l,m in pairs(g[k].Value)do
if m then
table.insert(h,l)
end
end
end
end
d={
[b.ShopKey.Seed]={
Enabled=g.tgBuySeedEnable.Value,
Items=f(g.ddBuySeeds.Value),
RemoteName="BuySeedStock",
ArgType="SeedMode",
},
[b.ShopKey.Daily]={
Enabled=g.tgBuyDailyEnable.Value,
Items=f(g.ddBuyDaily.Value),
RemoteName="BuyDailySeedShopStock",
ArgType="NormalMode",
},
[b.ShopKey.Gear]={
Enabled=g.tgBuyGearEnable.Value,
Items=f(g.ddBuyGear.Value),
RemoteName="BuyGearStock",
ArgType="NormalMode",
},
[b.ShopKey.Egg]={
Enabled=g.tgBuyEggEnable.Value,
Items=f(g.ddBuyEggs.Value),
RemoteName="BuyPetEgg",
ArgType="NormalMode",
},
[b.ShopKey.Traveling]={
Enabled=g.tgBuyTravelingEnable.Value,
BuyAll=g.tgBuyTravelingAll.Value,
Items=h,
RemoteName="BuyTravelingMerchantShopStock",
ArgType="NormalMode",
},














[b.ShopKey.Easter]={
Enabled=g.tgBuyEasterEnable.Value,
Items=f(g.ddBuyEaster.Value),
RemoteName="BuyEventShopStock",
ArgType="EventMode",
EventArg="Easter Seed Shop",
},
[b.ShopKey.SeasonPass]={
Enabled=g.tgBuySeasonPassEnable.Value,
Items=f(g.ddBuySeasonPass.Value),
RemoteName="SeasonPass.BuySeasonPassStock",
ArgType="NormalMode",
},
}
end

local function FindObjectFromPath(g,h)
local i=g

for j,k in ipairs(string.split(h,"."))do
if i then
i=i:FindFirstChild(k)
else
return nil
end
end
return i
end

local g={}

function b.BuyItem(h,i)
local j=d[h]
if not j or not j.Enabled then
return
end
local k=g[j.RemoteName]
if not k then

k=FindObjectFromPath(e.GameEvents,j.RemoteName)
if k then
g[j.RemoteName]=k
end
end

for l,m in pairs(i)do
local n=if m.EggName then m.EggName else l
local o=tonumber(m.Stock)or 0

if not table.find(j.Items,"ALL")and not table.find(j.Items,n)then
continue
end

if o>0 then
for p=1,o do
local q={}
if j.ArgType=="SeedMode"then
q={"Shop",n}
elseif j.ArgType=="EventMode"then
q={n,j.EventArg}
else
q={n}
end
k:FireServer(unpack(q))
task.wait(0.25)
end
end
end
end

return b end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()

local b={}
local c
local d
local e
local f

local function MatchesPlantFilter(g,h,i,j)
if not g or not table.find(h,g.Name)then
return false
end
local k=g:FindFirstChild("Weight")
if not k or type(k.Value)~="number"then
return false
end
return f.MatchesWeight(k.Value,i,j)
end

function b.Initialize(g)
c=g
d=c.fVar
e=c.sData
f=c.Utils
end

function b.RemovePlants()
local g=c.Options
if not g.tgRemovePlantsEnable.Value or d.IsRemovingPlants then
return
end
f.RunWithFlag("IsRemovingPlants","RemovePlants",function()
local h=f.GetSelectedItems
local i=h(g.ddRemovePlants.Value)
local j=g.ddRemovePlantsWeight.Value
local k=tonumber(g.ipRemovePlantsWeight.Value)or 0
local l=f.GetPlantsFolder()
local m=e.Backpack
local n=f.FindToolByName(m,"Shovel [Destroy Plants]")
if not l or not n then
return
end

f.UnequipTool()
for o,p in ipairs(l:GetChildren())do
if not g.tgRemovePlantsEnable.Value then
return
end
if MatchesPlantFilter(p,i,j,k)then
f.EquipTool(n)
e.RemoveItemEvent:FireServer(p)
task.wait(0.1)
f.UnequipTool()
task.wait(0.1)
end
end
end)
end

function b.GetRemovePlantsVar()
local g=c.Options
local h=f.GetSelectedItems
return{
mode="RemovePlants",
wl={
crops=h(g.ddRemoveCrops.Value),
mutants=h(g.ddRemoveMutants.Value),
variant=h(g.ddRemoveVariant.Value),
weightCondition=g.ddRemoveWeight.Value,
weightValue=tonumber(g.ipRemoveWeight.Value)or 0,
},
bl={
crops=h(g.ddRemoveBlackCrops.Value),
variant=h(g.ddRemoveBlackVariant.Value),
mutants=h(g.ddRemoveBlackMutants.Value),
},
}
end

function b.RemoveCrops()
local g=c.Options
local h=c.Main
if not g.tgRemoveFruitEnable.Value or d.IsRemovingCrops then
return
end
f.RunWithFlag("IsRemovingCrops","RemoveCrops",function()
local i=f.GetPlantsFolder()
if not i then
return
end
local j=e.Backpack
local k=f.FindToolByName(j,"Shovel [Destroy Plants]")
if not k then
return
end

f.UnequipTool()
for l,m in ipairs(i:GetChildren())do
local n=m:FindFirstChild("Fruits")
local o=n and n:GetChildren()or{m}
for p,q in ipairs(o)do
if not g.tgRemoveFruitEnable.Value then
return
end
if q:IsA("Model")then
local r=b.GetRemovePlantsVar()
if h.CheckCrops(q,r,false)then
f.EquipTool(k)
e.RemoveItemEvent:FireServer(q)
task.wait(0.1)
f.UnequipTool()
task.wait(0.1)
end
end
end
end
if g.tgRemoveFruitEnable.Value then
task.wait(0.5)
end
end)
end

function b.Trowel()
local g=c.Options
if not g.tgTrowelEnable.Value or d.IsTroweling then
return
end
local h=g.ipTrowelPosition.Value
local i=f.ParseVector3(h)
if not i then
c.Log("❌ Invalid position format. Use 'X, Y, Z'","ERROR")
if g.tgTrowelEnable.Value then
g.tgTrowelEnable:SetValue(false)
task.wait(0.5)
end
return
end
local j=CFrame.new(i)
f.RunWithFlag("IsTroweling","Trowel",function()
local k=f.GetSelectedItems
local l=k(g.ddTrowelPlants.Value)
local m=g.ddTrowelPlantsWeight.Value
local n=tonumber(g.ipTrowelPlantsWeight.Value)or 0
local o=f.GetPlantsFolder()
local p=e.Backpack
local q=f.FindToolByPattern(p,"Trowel")
if not q then
c.Log("🟡 No Trowel","WARN")
if g.tgTrowelEnable.Value then
g.tgTrowelEnable:SetValue(false)
task.wait(0.5)
end
return
end

f.UnequipTool()
if o then
for r,s in ipairs(o:GetChildren())do
if not g.tgTrowelEnable.Value then
return
end
if MatchesPlantFilter(s,l,m,n)then
f.EquipTool(q)
local t,u=pcall(function()
return e.TrowelEvent:InvokeServer("Pickup",q,s)
end)
if t then
e.TrowelEvent:InvokeServer("Place",q,s,j)
task.wait(0.5)
else
c.Log("❌ Place failed: "..tostring(u))
end
task.wait(0.1)
f.UnequipTool()
task.wait(0.1)
end
end
end
if g.tgTrowelEnable.Value then
g.tgTrowelEnable:SetValue(false)
task.wait(0.5)
end
task.wait(0.5)
end)
end

function b.Reclaim()
local g=c.Options
if not g.tgReclaimEnable.Value or d.IsReclaiming then
return
end
local h=f.GetSelectedItems
f.RunWithFlag("IsReclaiming","Reclaim",function()
local i=h(g.ddReclaimPlants.Value)
local j=g.ddReclaimPlantsWeight.Value
local k=tonumber(g.ipReclaimPlantsWeight.Value)or 0
local l=f.GetPlantsFolder()
local m=e.Backpack
local n=f.FindToolByPattern(m,"Reclaimer")
if not n then
c.Log("🟡 No Reclaimer")
return
end

f.UnequipTool()
if l then
for o,p in ipairs(l:GetChildren())do
if not g.tgReclaimEnable.Value then
return
end
if MatchesPlantFilter(p,i,j,k)then
f.EquipTool(n)
e.ReclaimerEvent:FireServer("TryReclaim",p)
f.UnequipTool()
end
task.wait(0.1)
end
end

if g.tgReclaimEnable.Value then
g.tgReclaimEnable:SetValue(false)
task.wait(0.5)
end
f.UnequipTool()
task.wait(0.5)
end)
end

function b.Sprinkler()
local g=c.Options
if not g.tgSprinklerEnable.Value or d.IsSprinkling then
return
end
local h=g.ipSprinklerPosition.Value
local i=f.ParseVector3(h)
if not i then
c.Log("❌ Invalid position format. Use 'X, Y, Z'","ERROR")
if g.tgSprinklerEnable.Value then
g.tgSprinklerEnable:SetValue(false)
task.wait(0.5)
end
return
end
local j=CFrame.new(i)
f.RunWithFlag("IsSprinkling","Sprinkler",function()
local k=e.Backpack
local l={
{matchName="Basic Sprinkler",optionKey="ipBasicSPK"},
{matchName="Advanced Sprinkler",optionKey="ipAdvancedSPK"},
{matchName="Godly Sprinkler",optionKey="ipGodlySPK"},
{matchName="Master Sprinkler",optionKey="ipMasterSPK"},
{matchName="Grandmaster Sprinkler",optionKey="ipGrandmasterSPK"},
{matchName=g.ddOtherSPK.Value,optionKey="ipOtherSPK"},
}

for m,n in ipairs(k:GetChildren())do
if not g.tgSprinklerEnable.Value then
return
end
if n:IsA("Tool")then
for o,p in ipairs(l)do
if p.matchName and p.matchName~=""and n.Name:match(p.matchName)then
p.tool=n
end
end
end
end
f.UnequipTool()

for m,n in ipairs(l)do
if not g.tgSprinklerEnable.Value then
return
end
if n.tool then
local o=tonumber(g[n.optionKey].Value)or 0
local p=tonumber(n.tool:GetAttribute("e"))or 0
local q=math.min(o,p)
for r=1,q do
f.EquipTool(n.tool)
e.SprinklerEvent:FireServer("Create",j)
task.wait(0.1)
f.UnequipTool()
task.wait(0.1)
end
end
end

f.UnequipTool()
if g.tgSprinklerEnable.Value then
g.tgSprinklerEnable:SetValue(false)
task.wait(0.5)
end
task.wait(0.5)
end)
end

function b.CatLead()
local g=c.Options
if not g.tgCatLead.Value or d.IsCatLeading then
return
end
d.IsCatLeading=true
local h=d.Pos.Sprinkler
if typeof(h)~="CFrame"then
c.Log("🟡 Cat Lead Position Must Set Spinkle Position")
d.IsCatLeading=false
return
end

f.RunWithFlag("IsCatLeading","CatLead",function()
local i={"Orange Tabby","Cat","Moon Cat","Glass Cat","Calico"}
local j=e.Backpack
local k=f.FindToolByPattern(j,"Pet Lead")
if not k then
c.Log("🟡 No Pet Lead")
d.IsCatLeading=false
return
end

local l=c.Pets
local m=game:GetService("Workspace"):WaitForChild("PetsPhysical")
if not m then
c.Log("🟡 No PetsPhysical")
d.IsCatLeading=false
return
end

for n,o in ipairs(m:GetChildren())do
if not g.tgCatLead.Value then
d.IsCatLeading=false
return
end
local p=o:GetAttribute("UUID")
if p then
local q=l.GetPetType(p)
if table.find(i,q)then
local r=o:FindFirstChild(p)
if r then
local s=(r:GetPivot().Position-h.Position).Magnitude
if s>15 then
e.Character:PivotTo(h)
f.EquipTool(k)
e.GameEvents:WaitForChild("PetLeadService_RE"):FireServer(r)
task.wait(0.1)
f.UnequipTool()
task.wait(0.1)
end
end
end
end
end
d.IsCatLeading=false
f.UnequipTool()
if g.tgCatLead.Value then
g.tgCatLead:SetValue(false)
task.wait(0.5)
end
task.wait(0.5)
end)
end

function b.OpenSeedPack()
local g=c.Options
if not g.tgOpenPackEnable.Value or d.IsOpeningSeedPack then
return
end
local h=f.GetSelectedItems
local i=h(g.ddOpenPack.Value)
if#i==0 then
c.Log("🟡 No Seed Pack Selected")
return
end
local j={}
if table.find(i,"ALL")then
j=e.SeedPackTable
else
j=i
end
f.RunWithFlag("IsOpeningSeedPack","OpenSeedPack",function()
local k=e.Backpack

for l,m in ipairs(k:GetChildren())do
if not g.tgOpenPackEnable.Value then
return
end
local n=tonumber(g.ipOpenPackDelay.Value)or 0
local o=m:GetAttribute("n")
if m:IsA("Tool")and table.find(j,o)then
local p=tonumber(m:GetAttribute("e"))or 0
for q=1,p do
if not g.tgOpenPackEnable.Value then
return
end
e.SeedPackEvent.Open:FireServer(o)
task.wait(n)
end
end
end

if g.tgOpenPackEnable.Value then
g.tgOpenPackEnable:SetValue(false)
task.wait(0.5)
end
task.wait(0.5)
end)
end

local function GetRequiredItemsCount(g:string):number
for h,i in pairs(e.GearEventData)do
if h==g then
local j=i.Inputs
if type(j)=="table"then
return#j
else
return 0
end
end
end
return 0
end

function b.CraftGear()
local g=c.Options
if not g.tgCraftGearEnable or not g.tgCraftGearEnable.Value or d.CraftGearRunning then
return
end

local h=game:GetService("Workspace"):WaitForChild("CraftingTables"):WaitForChild("EventCraftingWorkBench")
local i="GearEventWorkbench"
local j="Workbench-1"
local k=1
local l=require(e.Modules.CraftingStationHandler)

f.RunWithFlag("CraftGearRunning","CraftGear",function()
local m=g.ddCraftGear.Value
if not m or m==""then
c.Log("🟡 No Gear Selected")
return
end
local n=e.DataService:GetData()
local o=n.CraftingData.GlobalCraftingObjectData
local p=o[j].MachineData[i]

if not p then
c.Log("🟡 No Bench Data")
return
end
local q=p.CraftingItems

if q and q[k]then
if q[k].IsDone==false then
return
elseif q[k].IsDone==true then
pcall(function()
e.CraftingEvent:FireServer("Claim",h,i,k)
c.Log("Claim "..tostring(q[k].RecipeId))
end)
task.wait(1.5)

end
end

local r=GetRequiredItemsCount(m)
if r==0 then
c.Log("🟡 No Recipe Found")
return
end

local s=false

pcall(function()
e.CraftingEvent:FireServer("SetRecipe",h,i,m)
end)
task.wait(0.5)

for t=1,3 do
if not g.tgCraftGearEnable.Value then
return
end

pcall(function()
l:SubmitAllRequiredItems(h)
end)
task.wait(0.5)


local u=e.DataService:GetData()
local v=u.CraftingData.GlobalCraftingObjectData[j].MachineData[i]
local w=v.InputItems
local x=w and#w or 0

if x==r then
s=true
break
else
c.Log(string.format("ของไม่ครบ (มี %d / ต้องการ %d) ลองใหม่รอบที่ %d/3",x,r,t))
task.wait(1)
end
end


if not s then
c.Log("แจ้งเตือน! ของไม่พอ ปิดการทำงาน Auto Craft")
if g.tgCraftGearEnable then
g.tgCraftGearEnable:SetValue(false)
end
return
end




pcall(function()
e.CraftingEvent:FireServer("Craft",h,i)
c.Log("ของครบถ้วน สั่ง Craft -> "..m)
end)

task.wait(1.5)
end)
end

return b end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()

local b={}
local c
local d
local e
local f
local g
local h=nil
local i=nil
local j=nil

function b.Initialize(k)
c=k
d=c.fVar
e=c.sData
f=c.Utils

g=f.GetSelectedItems






end

local function GetPetInventory()
local k=e.DataService:GetData()
local l=k and k.PetsData and k.PetsData.PetInventory
return l
end

local function FindDupePet(k,l)
local m=c.Options
local n=m.ddAgeBreakAgeCond.Value
local o=tonumber(m.inpAgeBreakAgeVal.Value)or 50
local p=m.ddAgeBreakWeightCond.Value
local q=tonumber(m.inpAgeBreakWeightVal.Value)or 38

local r=GetPetInventory()
if not r then
return
end

for s,t in pairs(r)do
if type(t)~="table"then
continue
end
for u,v in pairs(t)do
if type(v)~="table"then
continue
end
local w=v.PetType
if not w then
continue
end
local x=v.UUID
local y=tonumber(v.PetData.Level)
local z=tonumber(v.PetData.BaseWeight)
if x==k then
continue
end
if w~=l then
continue
end
if o~=0 and n=="Below"and y>=o then
continue
end
if o~=0 and n=="Above"and y<=o then
continue
end
if q~=0 and p=="Below"and z>=q then
continue
end
if q~=0 and p=="Above"and z<=q then
continue
end
return x
end
end
return nil
end

local function FindMainPet()
local k=c.Options
local l=k.ddAgeBreakPetType.Value
local m=tonumber(k.inpAgeBreakTargetAge.Value)or 115
local n=GetPetInventory()
if not n then
return
end

for o,p in pairs(n)do
if type(p)~="table"then
continue
end
for q,r in pairs(p)do
if type(r)~="table"then
continue
end
local s=r.PetType
if not s then
continue
end
local t=r.UUID
local u=tonumber(r.PetData.Level)
if s==l and(u>=100 and u<m)and r.PetData.IsFavorite~=true then
return t
end
end
end
return nil
end

function b.RawData(k)
return e.PetUtils:GetPetByUUID(e.LocalPlayer,k)
end

function b.GetPetType(k)
local l=b.RawData(k)
if l then
return l.PetType or"Unknown"
end
return"Unknown"
end

function b.Level(k)
local l=b.RawData(k)

if l and l.PetData then
return l.PetData.Level or 1
end
return 1
end

function b.Favorited(k)
local l=b.RawData(k)

if l and l.PetData then
return l.PetData.IsFavorite or false
end
return false
end

function b.MakePetFavorite(k)
local l=e.GameEvents:WaitForChild("Favorite_Item")
if not b.Favorited(k)then
local m=5
local n=tick()
task.spawn(function()
while tick()-n<m do
local o=nil

for p,q in ipairs(e.Backpack:GetChildren())do
if q:GetAttribute("ItemType")=="Pet"and q:GetAttribute("PET_UUID")==k then
o=q
break
end
end

if not o and e.LocalPlayer.Character then
for p,q in ipairs(e.LocalPlayer.Character:GetChildren())do
if q:GetAttribute("ItemType")=="Pet"and q:GetAttribute("PET_UUID")==k then
o=q
break
end
end
end

if o then
l:FireServer(o)
task.wait(0.3)
return true
end
task.wait(0.3)
end
return false
end)
end
return false
end

function b.Weight(k)
local l=b.RawData(k)

if l and l.PetData then
return tonumber(l.PetData.BaseWeight)or 1
end
return 1
end

function b.HeldPet(k)

local l=e.Backpack
pcall(function()
e.Humanoid:UnequipTool()
task.wait(0.1)
end)
for m,n in pairs(l:GetChildren())do
if n:GetAttribute("ItemType")=="Pet"and n:GetAttribute("PET_UUID")==k then
local o,p=pcall(function()
e.Humanoid:EquipTool(n)
task.wait(0.3)
return true
end)
if o and p then
return true
end
end
end
return false
end

function b.AgeBreak()
local k=c.Options

if not k.tgAgeBreakEnabled.Value or d.IsAgeBreaking then
return
end
local l=e.DataService:GetData()
if not l then
return
end
local m=l.PetAgeBreakMachine
if not m then
return
end
d.IsAgeBreaking=true

local n=k.ddAgeBreakPetType.Value
local o=tonumber(k.inpAgeBreakTargetAge.Value)or 115

if m.PetReady then
h=m.SubmittedPet.UUID
e.GameEvents.PetAgeLimitBreak_Claim:FireServer()
task.wait(1.5)
d.IsAgeBreaking=false
return
end

if m.IsRunning then
h=m.SubmittedPet.UUID
d.IsAgeBreaking=false
return
end

local p=m.SubmittedPet
local q=p and type(p)=="table"and p.UUID~=nil

if not q then
if h then
local r=b.Level(h)
if r and r>=o then
h=nil
end
end

if not h then
h=FindMainPet()
end

if h then
if b.HeldPet(h)then
task.wait(0.1)
e.GameEvents.PetAgeLimitBreak_SubmitHeld:FireServer()
task.wait(2)
end
end
elseif q and not m.IsRunning then
local r=p.PetType
local s=p.PetData.Level
h=p.UUID

if r~=n or s>=o then
c.Log("Cancel Pet: "..tostring(r).." Level: "..tostring(s))
e.GameEvents.PetAgeLimitBreak_Cancel:FireServer()
h=nil
task.wait(1.5)
d.IsAgeBreaking=false
return
end
local t=FindDupePet(h,n)
if t then
e.GameEvents.PetAgeLimitBreak_Submit:FireServer({t})
task.wait(2)
end
end
end
function b.EquipPet(k)
e.PetsServiceEvent:FireServer("EquipPet",k)
end

function b.UnequipPet(k)
e.PetsServiceEvent:FireServer("UnequipPet",k)
end

function b.SwapPetLoadout(k)
if k==2 then
k=3
elseif k==3 then
k=2
end
local l=e.DataService:GetData().PetsData.SelectedPetLoadout
if l==k then
return
end
e.PetsServiceEvent:FireServer("SwapPetLoadout",k)
task.wait(9)
end

function b.FarmLevel()
local k=c.Options
if not k.tgMutantEnabled.Value or d.IsMutating then
return
end

f.ClickButton(f.GardenButton)
task.wait(0.5)
local l=tonumber(k.ddLevelLoadout.Value)
b.SwapPetLoadout(l)

d.IsMutating=true
local m,n

local o=k.ddMutantMethod.Value::string

if o=="Mutation"then
local p=e.DataService:GetData()
local q=p.PetMutationMachine
c.Log("machineData")
if q then
c.Log("เจอ machineData")

if q.PetReady then
c.Log("เจอ PetReady")
i=q.SubmittedPet.UUID
d.IsMutating=false
b.ClaimMutationPet()
return
end

if q.IsRunning then
c.Log("เจอ IsRunning")
i=q.SubmittedPet.UUID

if type(j)=="thread"then
task.cancel(j)
j=nil
end
j=task.spawn(function()
while task.wait(60)do
b.CheckMutantReady()
end
end)
d.IsMutating=false
return
end

if q.SubmittedPet and not q.IsRunning then
c.Log("เจอ SubmittedPet")
i=q.SubmittedPet.UUID
e.GameEvents.PetMutationMachineService_RE:FireServer("CancelMachine")
task.wait(1)
d.IsMutating=false
b.MutatePet()
return
end
end
end

if i then
local p=b.RawData(i)
m=p.PetType
n=false
local q=e.PetUtils:GetPetsSortedByAge(e.LocalPlayer,0,true,true)
if q then
for r,s in ipairs(q)do
if s.UUID==i then
n=true
break
end
end
end
else
i,m,n=b.FindFarmPet()
end
if not i then
c.Log("🔴 FarmLevel: No Pet Found")
d.IsMutating=false
return
end

if n then
c.Log("🔵 FarmLevel: "..tostring(m).." is already equipped")
d.IsMutating=false
return
end

task.wait(tonumber(k.LoadOutDelay.Value)or 8)
local p=e.PetUtils:GetPetsSortedByAge(e.LocalPlayer,0,true,true)
if p and#p>=8 then
c.Log("🔴 FarmLevel: Equip pet full")
d.IsMutating=false

return
end

b.EquipPet(i)
task.wait(0.1)
c.Log("🔵 FarmLevel: Found Pet "..tostring(i).." Type: "..tostring(m))
d.IsMutating=false
end

function b.FindFarmPet()
local k=c.Options
local l=k.ddMutantMethod.Value::string
local m=k.tgFavoritePet.Value::boolean
local n=g(k.ddMutantPetType.Value)
local o=g(k.ddTargetMutant.Value)
local p=tonumber(k.ddLevelLoadout.Value)
b.SwapPetLoadout(p)
local q={}
if l=="Nightmare"then
q={"Nightmare"}
elseif l=="Mutation"then
q=o
elseif l=="Level"then
q={"NONE"}
elseif l=="Venom"then
q={"Venom"}
end

local function checkPet(r)
for s,t in ipairs(r)do
if not table.find(n,t.PetType)then
continue
end
local u=t.PetData.IsFavorite or false
if m~=u then
continue
end
local v=e.EnumToNameCache[t.PetData.MutationType]or"Normal"
if table.find(q,v)then
continue
end
if l=="Elephant"and tonumber(t.PetData.BaseWeight)>=3.5 and tonumber(t.PetData.Level)>=100 then
continue
end
if l=="Level"and tonumber(t.PetData.Level)>=100 then
continue
end
return t.UUID,t.PetType
end
return nil,nil
end
task.wait(tonumber(k.LoadOutDelay.Value)or 8)
local r=e.PetUtils:GetPetsSortedByAge(e.LocalPlayer,0,true,true)
if r then
local s,t=checkPet(r)
if s then
return s,t,true
end
end
local s=e.PetUtils:GetPetsSortedByAge(e.LocalPlayer,0,true,false)
if s then
local t,u=checkPet(s)
if t then
return t,u,false
end
end
return nil,nil,nil
end

function b.TargetPetLevelCheck()
local k=c.Options
if not k.tgMutantEnabled.Value or d.IsMutating then
return
end
d.IsMutating=true
if not i then
c.Log("🟠 CheckLevel: No UUID Run FarmLevel()")
d.IsMutating=false
b.FarmLevel()
return
end

local l=tonumber(k.inpMutantTargetAge.Value)or 100
local m=b.RawData(i)
if not m or not m.PetData then

i=nil
d.IsMutating=false
b.FarmLevel()
return
end
c.Log("🔵 CheckLevel: "..tostring(m.PetType).." Level: "..tostring(m.PetData.Level))
local n=k.ddMutantMethod.Value::string
local o=e.EnumToNameCache[m.PetData.MutationType]or"Normal"

if n=="Nightmare"then
if o=="Nightmare"then
b.UnequipPet(i)
task.wait(0.5)
c.Log("🟢 CheckLevel: "..tostring(i).." finished Nightmare")
c.Log("🟣 CheckLevel: Run FarmLevel() to get new Pet")
b.MakePetFavorite(i)
i=nil
d.IsMutating=false
b.FarmLevel()
return
elseif o~="Normal"and o~="Nightmare"then
b.PetShard("Cleansing Pet Shard")
d.IsMutating=false
return
end
elseif n=="Venom"then
if o=="Venom"then
b.UnequipPet(i)
task.wait(0.5)
c.Log("🟢 CheckLevel: "..tostring(i).." finished Venom")
c.Log("🟣 CheckLevel: Run FarmLevel() to get new Pet")
b.MakePetFavorite(i)
i=nil
d.IsMutating=false
b.FarmLevel()
return
end
elseif n=="Level"or n=="Elephant"then
if m.PetData.Level>=l then
b.UnequipPet(i)
task.wait(0.5)
c.Log("🟢 CheckLevel: "..tostring(i).." finished Level")
c.Log("🟣 CheckLevel: Run FarmLevel() to get new Pet")
b.MakePetFavorite(i)
i=nil
d.IsMutating=false
b.FarmLevel()
return
end
elseif n=="Mutation"then
local p=e.DataService:GetData()
local q=p.PetMutationMachine
if q and(q.SubmittedPet or q.IsRunning or q.PetReady)then
d.IsMutating=false
return
end
if m.PetData.Level>=l then
b.UnequipPet(i)
task.wait(0.5)
c.Log("🟢 CheckLevel: "..tostring(i).." go to mutation machine")
b.MakePetFavorite(i)
d.IsMutating=false
b.MutatePet()
return
end
d.IsMutating=false
end
d.IsMutating=false
end

function b.MutatePet()
local k=c.Options
if not k.tgMutantEnabled.Value or d.IsMutating then
return
end
d.IsMutating=true
local l=k.ddMutantMethod.Value::string
if l~="Mutation"then
c.Log("🟠 MutatePet: Method is not Mutation")
d.IsMutating=false
b.FarmLevel()
return
end
if not i then
c.Log("🟠 MutatePet: No UUID Run FarmLevel()")
d.IsMutating=false
b.FarmLevel()
return
end
local m=tonumber(k.ddTimeLoadout.Value)
b.SwapPetLoadout(m)
task.wait(tonumber(k.LoadOutDelay.Value)or 8)
pcall(b.UnequipPet,i)
e.Character:PivotTo(CFrame.new(-236.17,4.50,14.36))
task.wait(0.2)

if b.HeldPet(i)then
task.wait(0.5)
e.GameEvents.PetMutationMachineService_RE:FireServer("SubmitHeldPet")
task.wait(0.5)
e.GameEvents.ReplicationChannel:FireServer("PetAssets",b.GetPetType(i))
task.wait(1)
e.GameEvents.PetMutationMachineService_RE:FireServer("StartMachine")

if type(j)=="thread"then
task.cancel(j)
j=nil
end
j=task.spawn(function()
while task.wait(60)do
local n,o=pcall(function()
b.CheckMutantReady()
end)
if not n then
c.Log("CheckMutantReady failed: "..tostring(o))
end
end
end)
d.IsMutating=false
return
end
d.IsMutating=false
end

function b.ClaimMutationPet()
local k=c.Options
if not k.tgMutantEnabled.Value or d.IsMutating then
return
end
d.IsMutating=true
pcall(function()
if type(j)=="thread"then
task.cancel(j)
j=nil
end
end)
c.Log("🟢 ClaimMutationPet: Run ClaimMutationPet")

local l=tonumber(k.ddClaimLoadout.Value)
b.SwapPetLoadout(l)
if not i then
local m=e.DataService:GetData()
local n=m.PetMutationMachine
local o=n.SubmittedPet
if o then
i=o.UUID
else
c.Log("🟠 ClaimMutationPet: No UUID Run FarmLevel() and MutatePet() first")
i=nil
d.IsMutating=false
b.FarmLevel()
return
end
end
task.wait(tonumber(k.LoadOutDelay.Value)or 8)
e.GameEvents.PetMutationMachineService_RE:FireServer("ClaimMutatedPet")
task.wait(1.5)
local m=b.RawData(i)
if not m or not m.PetData then
c.Log("🟠 ClaimMutationPet: รอข้อมูล Pet จาก Server...")
task.wait(1)
m=b.RawData(i)
if not m or not m.PetData then
c.Log("🔴 ClaimMutationPet: โหลดข้อมูลล้มเหลว รัน FarmLevel ใหม่")
d.IsMutating=false
b.FarmLevel()
return
end
end
local n=g(k.ddTargetMutant.Value)
local o=e.EnumToNameCache[m.PetData.MutationType]
if table.find(n,o)then
c.Log("🟢 ClaimMutationPet: "..tostring(i).." finished Mutation : "..tostring(o))
c.Log("🟣 ClaimMutationPet: Run FarmLevel() to get new Pet")
i=nil
d.IsMutating=false
b.FarmLevel()
return
else
c.Log("🔴 ClaimMutationPet: "..tostring(i).." finished Mutation : "..tostring(o))
c.Log("🟣 ClaimMutationPet: Rerun FarmLevel() UUID : "..tostring(i))
d.IsMutating=false
b.FarmLevel()
return
end
end

function b.CheckMutantReady()
local k=e.DataService:GetData()
local l=k.PetMutationMachine
c.Log("🔵 CheckMutantReady: "..tostring(l.PetReady))
if l.PetReady then
i=l.SubmittedPet.UUID
d.IsMutating=false
c.Log("🟢 CheckMutantReady: Run ClaimMutationPet")
task.spawn(function()
local m,n=pcall(function()
b.ClaimMutationPet()
end)
if not m then
c.Log("ClaimMutationPet failed: "..tostring(n))
end
end)
return
end
end

function b.PetShard(k)
local l=e.Backpack
local m=f.FindToolByPattern(l,k)
if m then
local n=e.Workspace:WaitForChild("PetsPhysical")
for o,p in ipairs(n:GetChildren())do
local q=p:FindFirstChild(i)
if q then
f.EquipTool(m)
task.wait(0.5)
local r,s=pcall(function()
e.PetShardService_RE:FireServer("ApplyShard",q)
end)
if not r then
c.Log("ApplyShard failed: "..tostring(s))
end
task.wait(1)
f.UnequipTool()
return
end
end
end
end

function b.FeedPets()
local k=c.Options
if not k.tgFeedPetsEnabled.Value or d.IsFeeding then
return
end
d.IsFeeding=true
local l=tonumber(k.inpFeedPetsHunger.Value)or 50
local m=e.PetUtils:GetPetsSortedByAge(e.LocalPlayer,0,true,true)
local n=e.Backpack
local o=g(k.ddFeedCropsType.Value)
if m and#m>0 then
for p,q in ipairs(m)do
local r=q.PetType
local s=q.UUID
local t=e.HungerDataTable[r]or 10000
local u=100*(q.PetData.Hunger/t)
if u<=l then
for v,w in ipairs(n:GetChildren())do
local x=w:GetAttribute("b")
if x=="j"or x=="u"then
local y=w:GetAttribute("f")
local z=w:GetAttribute("d")
if y and(table.find(o,"ALL")or table.find(o,y))and not z then
f.EquipTool(w)
task.wait(0.5)
local A,B=pcall(function()
e.GameEvents:WaitForChild("ActivePetService"):FireServer("Feed",s)
end)
if not A then
c.Log("FeedPet failed: "..tostring(B))
end
task.wait(1)
break
end
end
end
end
end
end
d.IsFeeding=false
end

function b.EggInFarm()
local k=f.GetObjectsFolder()
if not k then
return
end
local l={}
for m,n in ipairs(k:GetChildren())do
if n and n:GetAttribute("OBJECT_TYPE")=="PetEgg"then
table.insert(l,n)
end
end
return l
end

function b.PlaceEggs()
local k=c.Options
if not k.tgPlaceEggsEn or not k.tgPlaceEggsEn.Value then
return
end

local l=g(k.ddPlaceEgg.Value)
if#l==0 then
c.Log("🟠 PlaceEggs: No Egg Selected")
return
end
local m=tonumber(k.ipMaxEggs.Value)
if m==0 then
c.Log("🟠 PlaceEggs: Max Egg must be greater than 0")
return
end
local n=tonumber(k.ddSpeedLoadout.Value)or 1
pcall(b.SwapPetLoadout,n)
local o=tonumber(k.ddPlaceSlot.Value)or 1
local p=k.ddPlaceMethod.Value
local q
local r

if p=="Set"then
q=f.GetSetPlotPos(o)
r=q[1]
else
r=f.GetRandomPlotPos()
end
local s=Random.new()
while k.tgPlaceEggsEn.Value do
local t=b.EggInFarm()
if t and type(t)=="table"and#t<m then
local u=l[s:NextInteger(1,#l)]
local v=f.FindToolByPattern(e.Backpack,u)
f.EquipTool(v)
task.wait(0.3)

local w=vector.create(r.Position.X,0.1355266571044922,r.Position.Z)
c.Log("PlaceEgg: "..tostring(w))

e.PetEggService:FireServer("CreateEgg",w)
task.wait(0.3)
if p=="Set"then
q=f.GetSetPlotPos(q[2],q[3],q[4])
r=q[1]
else
r=f.GetRandomPlotPos()
end
f.UnequipTool()
task.wait(0.1)
else
break
end
task.wait(0.1)
end
end

local function ValidEggs(k,l)
local m=c.Options
local n=g(m.ddSpecialHatchPet.Value)or{}
local o=tonumber(m.inpSpecialHatchWeight.Value)or 3.5

local p={}
local q={}
if not k or not l then
return nil,nil
end

for r,s in l do
local t=k[s:GetAttribute("OBJECT_UUID")]
if t then
local u=t.Data.BaseWeight*1.1
local v=t.Data.Type
if o~=0 and u>=o then
table.insert(p,s)
elseif#n>0 and table.find(n,v)then
table.insert(p,s)
else
table.insert(q,s)
end
end
end
return q,p
end

function b.HatchEgg()
local k=c.Options
if not k.tgAutoHatchEn or not k.tgAutoHatchEn.Value then
return
end

while k.tgAutoHatchEn.Value do
local l=e.DataService:GetData()
local m={}
local n={}
local o=b.EggInFarm()
local p=l.SaveSlots.SelectedSlot
local q=l.SaveSlots.AllSlots[p].SavedObjects
if not q or type(q)~="table"then
task.wait(5)
continue
end
local r=0
for s,t in pairs(q)do
if t.ObjectType=="PetEgg"then
n[s]=t
r=r+1
end
end

for s,t in pairs(o)do
if t:GetAttribute("READY")==true then
table.insert(m,t)
end
end

if r~=#m then
task.wait(5)
continue
end
local s,t=ValidEggs(n,m)

if#t>0 then
pcall(b.SwapPetLoadout,tonumber(k.ddSpecialHatchLoadout.Value)or 4)
for u,v in pairs(t)do
e.PetEggService:FireServer("HatchPet",v)
task.wait(0.2)
end
end
task.wait(2)
if#s>0 then
pcall(b.SwapPetLoadout,tonumber(k.ddHatchLoadout.Value)or 2)
for u,v in pairs(s)do
e.PetEggService:FireServer("HatchPet",v)
task.wait(0.2)
end
end
task.wait(1)
break
end
end

local function IsValidSellPet(k)
if not k or type(k)~="table"then
return false
end
local l=c.Options
local m=g(l.ddSellPet.Value)
local n=l.ddSellPetThreshold.Value
local o=tonumber(l.inpSellPetWeight.Value)

local p=k.PetType
local q=k.PetData.BaseWeight
local r=k.PetData.MutationType or"m"
local s=k.PetData.IsFavorite
if s then
return false
end
if r~="m"then
return false
end
if not table.find(m,p)then
return false
end
if o>0 then
if n=="Below"and q>=o then
return false
end
if n=="Above"and q<=o then
return false
end
end
return true
end
local function scanSellPetList()
local k={}
local l=e.DataService:GetData()
local m=l.PetsData.PetInventory
if m then
for n,o in pairs(m)do
if type(o)=="table"then
for p,q in pairs(o)do
if type(q)=="table"and IsValidSellPet(q)then
table.insert(k,q.UUID)
end
end
end
end
end
return k
end
function b.SellPet()
local k=c.Options
if not k.tgSellPetEn or not k.tgSellPetEn.Value then
return
end

local l=scanSellPetList()
if#l>0 then
pcall(b.SwapPetLoadout,tonumber(k.ddSellLoadout.Value)or 3)
for m,n in pairs(l)do
if b.HeldPet(n)then
task.wait()
e.GameEvents:WaitForChild("SellPet_RE"):FireServer()
end
task.wait(0.2)
end
end
end
local k=nil
function b.RunHatchSet()
local l=c.Options

if not k then
k=task.spawn(function()
while true do
pcall(function()
local m=l.inpDelayPlaceEgg and tonumber(l.inpDelayPlaceEgg.Value)or 2
local n=l.inpDelayHatchEgg and tonumber(l.inpDelayHatchEgg.Value)or 2
local o=l.inpDelaySellPet and tonumber(l.inpDelaySellPet.Value)or 2
task.wait(m)
b.PlaceEggs()

task.wait(n)
b.HatchEgg()

task.wait(o)
b.SellPet()
end)
task.wait(1)
end
end)
end
local m=l.tgPlaceEggsEn and l.tgPlaceEggsEn.Value
local n=l.tgAutoHatchEn and l.tgAutoHatchEn.Value
local o=l.tgSellPetEn and l.tgSellPetEn.Value

if not(m or n or o)then
pcall(function()
if k then
task.cancel(k)
k=nil
end
end)
end
end

return b end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()

local b=game:GetService("ReplicatedStorage")
local c=require(b:WaitForChild("Item_Module")::any)
local d=require(b.Modules:WaitForChild("MutationHandler")::any)
local e=require(b.Data.EnumRegistry:WaitForChild("InventoryServiceEnums")::any)
local f=require(b.Data:WaitForChild("VariantColors")::any)

local g=d:GetMutations()

local h={}
local i
local j
local k
local l
local m=nil
local n="PlantsESP"
local o="FruitESP"
local p="EggsESP"
local q="CratesESP"
local r={}
local s=game:GetService("CoreGui")
local t=(getfenv()::any).getgenv
local u=if t then t().GetHUI else nil
if not u then
u=function()
return s
end
end

local v




local function FormatComma(w)
local x=tostring(w)
repeat
local y
x,y=string.gsub(x,"^(-?%d+)(%d%d%d)","%1,%2")
until y==0
return x
end

local w={"CENT","VIG","NOV","OCT","SEP","SXD","QUI","QUA","TR","DU","UN","DE","NO","OC","SP","SX","QI","QA","T","B","M","K"}
local x={}
local y=#w-1

for z,A in ipairs(w)do
table.insert(x,{
Number=math.pow(1000,y)*1000,
Symbol=A,
})
y=y-1
end

local function FormatCompactPrice(z,A)
z=tonumber(z)or 0
if z<1000 then
return FormatComma(math.floor(z))
end
for B,C in ipairs(x)do
if C.Number<=z then
local D=z/C.Number
local E=string.format("%."..(A or"3").."f",D)
E=string.gsub(E,"0+$","")
E=string.gsub(E,"%.$","")
return E..C.Symbol
end
end
return FormatComma(math.floor(z))
end

local z={
{X=0,Y=0},
{X=1e12,Y=1e12},
{X=20e12,Y=10e12},
{X=50e12,Y=25e12},
{X=100e12,Y=40e12},
{X=750e12,Y=280e12},
}

local function ApplyMarketTax(A)
for B=2,#z do
local C=z[B-1]
local D=z[B]
if C.X<=A and A<=D.X then
return(D.Y-C.Y)/(D.X-C.X)*(A-C.X)+C.Y
end
end
local B=z[#z-1]
local C=z[#z]
return(C.Y-B.Y)/(C.X-B.X)*(A-C.X)+C.Y
end

local function GetFormattedFruitPrice(A)
if not A or typeof(A)~="Instance"then
return"0"
end
local B=A:FindFirstChild("Item_String")
local C=B and B.Value or A.Name
local D=A:FindFirstChild("Variant")
local E=A:FindFirstChild("Weight")
if not D or not E then
return"0"
end

local F=E.Value
local G=A:GetAttribute("FruitVersion")or A:GetAttribute(e.FruitVersion)or 0
local H=d:CalcValueMulti(A)
local I=c.Return_Variant_Multiplier(D.Value)
local J=c.Return_Data(C)

if not J or#J<3 then
return"0"
end
local K=J[2]
local L=J[3]

local M=L*H*I
local N=F/K
local O=math.clamp(N,0.95,100000000)
local P=M*(O*O)

if G>=1 then
local Q=ApplyMarketTax(P)
P=math.max(Q,0)
end

return FormatCompactPrice(math.round(P),"3")
end

local function GetFormattedMutations(A)
if not A or typeof(A)~="Instance"then
return""
end
local B={}

local C=A:FindFirstChild("Variant")
if C and C:IsA("StringValue")then
local D=C.Value
if D~=""and D~="Normal"then
if D=="Rainbow"then
table.insert(B,"🌈 Rainbow")
else
local E=f:GetHex(D)
local F=string.sub(E,1,1)=="#"and""or"#"
table.insert(B,string.format('<font color="%s%s">%s</font>',F,E,D))
end
end
end

for D,E in pairs(g)do
if A:GetAttribute(D)then
local F=E.Color and E.Color:ToHex()or"FFFFFF"
table.insert(B,string.format('<font color="#%s">%s</font>',F,D))
end
end

if#B>0 then
return table.concat(B,", ")
else
return""
end
end




local function IsFruit(A)
if typeof(A)~="Instance"then
return false
end
if A:HasTag("Harvestable")or A:HasTag("FruitTool")then
return true
end
local B=A:FindFirstAncestorWhichIsA("Model")or A:FindFirstAncestorWhichIsA("Tool")
if B and(B:HasTag("Harvestable")or B:HasTag("FruitTool"))then
return true
end
local C=A
while C and C~=workspace do
if C.Name=="Fruits"then
return true
end
C=C.Parent
end
return false
end

local function SetVisibility(A,B)
if A:IsA("BasePart")then
A.LocalTransparencyModifier=B and 1 or 0
if B then
if A:GetAttribute("OriginalCanCollide")==nil then
A:SetAttribute("OriginalCanCollide",A.CanCollide)
A:SetAttribute("OriginalCanTouch",A.CanTouch)
A:SetAttribute("OriginalCanQuery",A.CanQuery)
end
A.CanCollide=false
A.CanTouch=false
A.CanQuery=false
else
local C=A:GetAttribute("OriginalCanCollide")
local D=A:GetAttribute("OriginalCanTouch")
local E=A:GetAttribute("OriginalCanQuery")
if C~=nil then
A.CanCollide=C
end
if D~=nil then
A.CanTouch=D
end
if E~=nil then
A.CanQuery=E
end
end
elseif A:IsA("Decal")or A:IsA("Texture")then
if B then
if not A:GetAttribute("OriginalTrans")then
A:SetAttribute("OriginalTrans",A.Transparency)
end
A.Transparency=1
else
local C=A:GetAttribute("OriginalTrans")
if C then
A.Transparency=C
end
end
elseif A:IsA("ParticleEmitter")or A:IsA("Sparkles")or A:IsA("Fire")or A:IsA("Trail")then
if B then
if A:GetAttribute("OriginalEnabled")==nil then
A:SetAttribute("OriginalEnabled",A.Enabled)
end
A.Enabled=false
else
local C=A:GetAttribute("OriginalEnabled")
if C~=nil then
A.Enabled=C
end
end
end
end




function h.Initialize(A)
i=A
j=i.sData
k=i.Utils
l=i.fVar
v=i.Utils.GetSelectedItems
end

function h.AntiLag()
j.Lighting.GlobalShadows=false
j.Lighting.FogEnd=9e9
j.Lighting.Brightness=1
j.Lighting.EnvironmentDiffuseScale=0
j.Lighting.EnvironmentSpecularScale=0
j.Lighting.OutdoorAmbient=Color3.new(0,0,0)

j.Terrain.WaterWaveSize=0
j.Terrain.WaterWaveSpeed=0
j.Terrain.WaterReflectance=0
j.Terrain.WaterTransparency=1

for A,B in ipairs(workspace:GetDescendants())do
if A%200==0 then
task.wait()
end
if B:IsA("BasePart")then
B.Material=Enum.Material.SmoothPlastic
B.Reflectance=0
elseif B:IsA("ParticleEmitter")then
B.Enabled=false
elseif B:IsA("Decal")or B:IsA("Texture")then
B.Transparency=1
end
end
pcall(function()
settings().Rendering.QualityLevel=Enum.QualityLevel.Level01
end)
end

function h.HidePlant(A)
l.IsPlantHidden=A
local B=k.GetPlantsFolder()
if not B then
return
end

for C,D in ipairs(B:GetDescendants())do
if not IsFruit(D)then
SetVisibility(D,A)
end
end
h.UpdatePlantTracker()
end

function h.HideFruit(A)
l.IsFruitHidden=A
local B=k.GetPlantsFolder()
if not B then
return
end

for C,D in ipairs(B:GetDescendants())do
if IsFruit(D)then
SetVisibility(D,A)
end
end
h.UpdatePlantTracker()
end

function h.UpdatePlantTracker()
local A=i.Options
local B=(A.tgHideFruits and A.tgHideFruits.Value)or(A.tgHidePlants and A.tgHidePlants.Value)
local C=A.ddEspCrops and v(A.ddEspCrops.Value)or{}
local D=A.tgEspCrops and A.tgEspCrops.Value and not table.find(C,"NONE")
local E=A.ddEspPlants and v(A.ddEspPlants.Value)or{}
local F=A.tgEspPlants and A.tgEspPlants.Value and not table.find(E,"NONE")

if B or D or F then
local G=k.GetPlantsFolder()
if G and not m then
m=G.DescendantAdded:Connect(function(H)
task.wait(0.1)
if not H or not H.Parent then
return
end
if not(H:IsA("BasePart")or H:IsA("Model")or H:IsA("Decal")or H:IsA("Texture")or H:IsA("MeshPart"))then
return
end

local I=IsFruit(H)
if B then
if I then
if l.IsFruitHidden then
SetVisibility(H,true)
end
else
if l.IsPlantHidden then
SetVisibility(H,true)
end
end
end

if H:IsA("Model")then
if I and D and table.find(C,H.Name)then
h.SetEspCrop(H)
elseif not I and F and table.find(E,H.Name)then
h.SetEspPlant(H)
end
end
end)
end
else
if m then
m:Disconnect()
m=nil
end
end
end

function h.CreatESP(A,B,C,D,E,F)
if not(A and B and D)then
return
end
local G=F or 0
if r[C]then
r[C]:Destroy()
r[C]=nil
end

local H=E~=nil and E~=""
local I=Instance.new("BillboardGui")
I.Name="ESP_"..C
I.Adornee=B
I.Size=UDim2.fromOffset(600,H and 120 or 65)
I.StudsOffset=Vector3.new(0,1,0)
I.AlwaysOnTop=true
I.LightInfluence=0
I.Active=false
I.Parent=A

local J=Instance.new("UIListLayout")
J.Parent=I
J.SortOrder=Enum.SortOrder.LayoutOrder
J.Padding=UDim.new(0,2)
J.HorizontalAlignment=Enum.HorizontalAlignment.Center
J.VerticalAlignment=Enum.VerticalAlignment.Top

local K=Instance.new("TextLabel")
K.Name="InfoLabel"
K.Parent=I
K.LayoutOrder=1
K.Size=UDim2.fromScale(1,0)
K.AutomaticSize=Enum.AutomaticSize.XY
K.BackgroundTransparency=1
K.TextWrapped=false
K.Active=false
K.RichText=true
K.TextSize=16
K.Font=Enum.Font.FredokaOne
K.Text=D

if H then
local L=Instance.new("TextLabel")
L.Name="MutationLabel"
L.Parent=I
L.LayoutOrder=2
L.Size=UDim2.fromScale(1,0)
L.AutomaticSize=Enum.AutomaticSize.Y
L.BackgroundTransparency=1
L.TextWrapped=true
L.Active=false
L.RichText=true
L.TextSize=14
L.Text=E
L.Font=Enum.Font.FredokaOne
L.TextColor3=Color3.fromRGB(200,200,200)
end

if G==3 then
K.TextColor3=Color3.fromRGB(200,200,10)
elseif G==2 then
K.TextColor3=Color3.fromRGB(200,50,10)
elseif G==1 then
K.TextColor3=Color3.fromRGB(10,200,10)
else
K.TextColor3=Color3.fromRGB(200,200,200)
end

r[C]=I
end

function h.SetEspCrop(A)
local B=i.Options
if not B.tgEspCrops.Value then
return
end

local C=u and u()or s
local D=C:FindFirstChild(o)
if not D then
return
end

local E=A.Name
local F=A:FindFirstChild("Weight")and A:FindFirstChild("Weight").Value or 0
local G=A:FindFirstChild("Item_Seed")and A:FindFirstChild("Item_Seed").Value or E
local H=G

local I=GetFormattedFruitPrice(A)
local J=string.format('<b>%s</b> (%.2fkg, <font color="#FFD700">$%s</font>)',E,F,I)
local K=GetFormattedMutations(A)

local L=A:GetAttribute("WeightMulti")or 0
local M=0
if L>=30 then
M=3
elseif L>=20 then
M=2
elseif L>=10 then
M=1
end

h.CreatESP(D,A,H,J,K,M)
end

function h.SetEspPlant(A)
local B=i.Options
if not(B and B.tgEspPlants and B.tgEspPlants.Value)then
return
end
if not(A and A:IsA("Model"))then
return
end

local C=v(B.ddEspPlants.Value)
if not table.find(C,A.Name)then
return
end

local D=u and u()or s
local E=D:FindFirstChild(n)
if not E then
return
end

local F=A.Name
local G=A:FindFirstChild("Weight")and A:FindFirstChild("Weight").Value or 0
local H=tostring(A:GetAttribute("UUID")or A:GetDebugId())

local I=string.format("<b>%s</b> (%.2fkg)",F,tonumber(G)or 0)
h.CreatESP(E,A,H,I,"",0)
end

function h.EspCrops(A)
local B=i.Options
local C=u and u()or s
local D=C:FindFirstChild(o)
if D then
D:Destroy()
end
if A~=true then
h.UpdatePlantTracker()
return
end

local E=v(B.ddEspCrops.Value)
if table.find(E,"NONE")then
return
end

local F=Instance.new("Folder")
F.Name=o
F.Parent=C

local G=k.GetPlantsFolder()
if G then
for H,I in ipairs(G:GetChildren())do
local J=I:FindFirstChild("Fruits")
local K=J and J:GetChildren()or{I}
for L,M in ipairs(K)do
if M:IsA("Model")and table.find(E,M.Name)then
h.SetEspCrop(M)
end
end
end
end
h.UpdatePlantTracker()
end

function h.EspPlants(A)
local B=i.Options
local C=u and u()or s
local D=C:FindFirstChild(n)
if D then
D:Destroy()
end
if A~=true then
h.UpdatePlantTracker()
return
end

local E=v(B.ddEspPlants.Value)
if table.find(E,"NONE")then
h.UpdatePlantTracker()
return
end

local F=Instance.new("Folder")
F.Name=n
F.Parent=C

local G=k.GetPlantsFolder()
if G then
for H,I in ipairs(G:GetChildren())do
if I:IsA("Model")and table.find(E,I.Name)then
h.SetEspPlant(I)
end
end
end
h.UpdatePlantTracker()
end

function h.EspEggs(A)

local B=u and u()or s
local C=B:FindFirstChild(p)
if C then
C:Destroy()
end
if A~=true then

return
end

local D=Instance.new("Folder")
D.Name=p
D.Parent=B

local E=j.DataService:GetData()
local F={}
local G={}
local H=i.Pets.EggInFarm()
local I=E.SaveSlots.SelectedSlot
local J=E.SaveSlots.AllSlots[I].SavedObjects
if not J or type(J)~="table"then

return
end
local K=0
for L,M in pairs(J)do
if M.ObjectType=="PetEgg"then
G[L]=M
K=K+1
end
end

for L,M in pairs(H)do
if M:GetAttribute("READY")==true then
table.insert(F,M)
end
end

if#F==0 then
return
end

for L,M in F do
local N=M:GetAttribute("OBJECT_UUID")
local O=G[N]
if O then
local P=O.Data.BaseWeight*1.1
local Q=O.Data.Type
local R=string.format("<b>%s</b>",Q)
local S=string.format("<b>(%.2f kg)</b>",tonumber(P)or 0)
local T=0
if P>=10 then
T=3
elseif P>=8 then
T=2
elseif P>=6 then
T=1
end
h.CreatESP(D,M,N,R,S,T)
end
end
end

function h.CratesInFarm()
local A=k.GetObjectsFolder()
if not A then
return
end
local B={}
for C,D in ipairs(A:GetChildren())do
if D and D:GetAttribute("OBJECT_TYPE")=="CosmeticCrate"then
table.insert(B,D)
end
end
return B
end

function h.EspCrates(A)

local B=u and u()or s
local C=B:FindFirstChild(q)
if C then
C:Destroy()
end
if A~=true then

return
end

local D=Instance.new("Folder")
D.Name=q
D.Parent=B

local E=j.DataService:GetData()
local F={}
local G={}
local H=h.CratesInFarm()
local I=E.SaveSlots.SelectedSlot
local J=E.SaveSlots.AllSlots[I].SavedObjects
if not J or type(J)~="table"then

return
end

for K,L in pairs(J)do
if L.ObjectType=="CosmeticCrate"then
G[K]=L
end
end

for K,L in pairs(H)do
if L:GetAttribute("READY")==true then
table.insert(F,L)
end
end

if#F==0 then
return
end

for K,L in F do
local M=L:GetAttribute("OBJECT_UUID")
local N=G[M]
if N then
local O=N.Data.CosmeticType
local P=string.format("<b>%s</b>",O)
h.CreatESP(D,L,M,P,"",1)
end
end
end

function h.HideTracker()
h.UpdatePlantTracker()
end

function h.SeasonPassShop()
local A=i.Options
if not A.tgSeasonPassShop or not A.tgSeasonPassShop.Value then
return
end
end

function h.SeasonPassQuests()
local A=i.Options
if not A.tgSeasonPassQuests or not A.tgSeasonPassQuests.Value then
return
end
local B=j.DataService:GetData()

local C=j.SeasonPassData.CurrentSeason
local D=B.SeasonPass[C]


local E=B.DailyQuests and B.DailyQuests.ContainerId
if E then
local F=B.QuestContainers[E]

if F then
local G=true

for H,I in pairs(F.Quests)do

if I.Completed then
local J=table.find(D.QuestsClaimed,I.Id)
if not J then
i.Log("Claiming Season Pass Quest: "..tostring(I.Id))
j.ClaimSeasonPassQuestRemote:FireServer(I.Id)
task.wait(0.5)
end
else
G=false
end
end


if G and not D.QuestRewardClaimed then
j.SeedPackEvent.Open:FireServer("Season Pass Quests")
end
end
end
end

function h.SeasonPassRewards()
local A=i.Options
if not A.tgSeasonPassRewards or not A.tgSeasonPassRewards.Value then
return
end
local B=j.DataService:GetData()
task.wait(0.3)
local C=j.SeasonPassData.CurrentSeason
local D=B.SeasonPass[C]
local E=j.SeasonPassUtils.CalculateLevel(D.TotalExperience)
local F=j.SeasonPassStaticData.MAX_LEVEL or 50

local G=math.min(E,F)
for H=1,G do

local I=table.find(D.ClaimedLevelFreeRewards,H)
if not I then
i.Log("Claiming Season Pass Reward: "..tostring(H))
j.ClaimSeasonPassRewardRemote:FireServer(H,false)
task.wait(0.3)
end


local J=table.find(D.ClaimedLevelPremiumRewards,H)
if D.IsPremium and not J then
i.Log("Claiming Premium Season Pass Reward: "..tostring(H))
j.ClaimSeasonPassRewardRemote:FireServer(H,true)
task.wait(0.3)
end
end

if E>=F then
local H=j.SeasonPassUtils.CalculateXPForLevel(F)
local I=D.TotalExperience-H

local J=j.SeasonPassStaticData.INF_REWARD_XP or 10000

local K=math.floor(I/J)
local L=D.InfiniteRewardsClaimed or 0

if K>L then
local M=K-L
for N=1,M do
i.Log("Claiming Season Pass Point : "..tostring(N))
j.ClaimSeasonPassInfRewardRemote:FireServer()
task.wait(1)
end
end
end
end
return h end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()


local b={}
local c=nil

local d=game::any
local e=loadstring(d:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

local f=loadstring(d:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local g=loadstring(d:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local h=loadstring(d:HttpGet("https://raw.githubusercontent.com/suta007/Lua_EfHub/refs/heads/master/Core/CollapsibleSection.lua"))()

h(e)

function b.Initialize(i)
c=i
i.IsLoading=true


i.Interface=e:CreateWindow({
Title="Grow a Garden",
SubTitle="2569.04.12-11.16",
TabWidth=100,
Size=UDim2.fromOffset(600,400),
Resize=false,
MinSize=Vector2.new(580,400),
Acrylic=true,
Theme="Darker",
MinimizeKey=Enum.KeyCode.RightControl,
})

f:SetLibrary(e)
g:SetLibrary(e)
g:SetFolder("EfHub")
f:SetFolder("EfHub/GAG")

i.Tabs={}
i.Fluent=e
i.SaveManager=f
i.InterfaceManager=g
i.Options=e.Options




local j=Instance.new("ScreenGui")
local k=Instance.new("TextButton")
local l=Instance.new("UICorner")

j.Name="Ef_Toggle"
j.Parent=d:GetService("CoreGui")
j.ResetOnSpawn=false

k.Name="ToggleButton"
k.Parent=j
k.BackgroundColor3=Color3.fromRGB(100,20,20)
k.Position=UDim2.new(0,10,0.10,0)
k.Size=UDim2.fromOffset(50,50)
k.Text="GAG"
k.TextColor3=Color3.fromRGB(255,255,255)
k.Draggable=true
k.Active=true

l.CornerRadius=UDim.new(0,25)
l.Parent=k


k.MouseButton1Click:Connect(function()
local m=i.Interface
if m then

if m.Instance then
m.Instance.Enabled=not m.Instance.Enabled

elseif m.Root then
m.Root.Visible=not m.Root.Visible
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

return b end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()

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
g.IsPlanting=false
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
l:AddInput("ipPlantsAmount",{
Title="Amount",
Default=0,
Numeric=true,
Finished=true,
Callback=function(m)
f()
end,
})

l:AddDropdown("ddPlantsPos",{
Title="Select Plants Position",
Values={"Player","Random","Set"},
Default="Player",
Callback=function(m)
f()
end,
})
l:AddButton({
Title="Set Position",
Callback=function()
local m=j.Character:GetPivot().Position
local n=string.format("%.3f, %.3f, %.3f",m.X,m.Y,m.Z)
e.ipPlantsPos:SetValue(n)
f()
end,
})
l:AddInput("ipPlantsPos",{
Title="Position",
Default="",
Placeholder="X, Y, Z",
Numeric=false,
Finished=false,
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
g.IsHarvesting=false
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
g.IsSelling=false
end
h.ToggleTask("AutoSell",o,function()
local p=tonumber(e.ipSellDelay.Value)or 0.1
task.wait(p)
if g.IsSelling then
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
return b end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()

local b={}
local c

function b.Initialize(d)
c=d
local e=c.Interface
local f=c.Tabs
local g=c.Options
_=g
local h=c.Window.QuickSave
local i=c.sData
local j=c.Shop
local k=c.fVar
local l=c.Utils
k.UIShopLoaded=false

f.Shop=e:AddTab({Title="Shop",Icon="shopping-cart"})





















local m=f.Shop:AddCollapsibleSection("Seed Shop",false)
m:AddToggle("tgBuySeedEnable",{
Title="Buy Seeds",
Default=false,
Callback=function(n)
j.UpdateBuyList()
h()
if n then
local o=i.DataService:GetData()
local p=o.SeedStocks.Shop.Stocks
if not l.IsTableEmpty(p)then
j.BuyItem(j.ShopKey.Seed,p)
end
end
end,
})
m:AddDropdown("ddBuySeeds",{
Title="Seeds",
Description="Select seeds to buy",
Values=i.SeedShopTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
j.UpdateBuyList()
h()
end,
})


local n=f.Shop:AddCollapsibleSection("Daily Seed Shop",false)
n:AddToggle("tgBuyDailyEnable",{
Title="Buy Daily Seed",
Default=false,
Callback=function(o)
j.UpdateBuyList()
h()
if o then
local p=i.DataService:GetData()
local q=p.SeedStocks["Daily Deals"].Stocks
if not l.IsTableEmpty(q)then
j.BuyItem(j.ShopKey.Daily,q)
end
end
end,
})

n:AddDropdown("ddBuyDaily",{
Title="Daily Seeds",
Description="Select daily seeds to buy",
Values=i.DailySeedShopTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
j.UpdateBuyList()
h()
end,
})


local o=f.Shop:AddCollapsibleSection("Gear Shop",false)
o:AddToggle("tgBuyGearEnable",{
Title="Buy Gear",
Default=false,
Callback=function(p)
j.UpdateBuyList()
h()
if p then
local q=i.DataService:GetData()
local r=q.GearStock.Stocks
if not l.IsTableEmpty(r)then
j.BuyItem(j.ShopKey.Gear,r)
end
end
end,
})
o:AddDropdown("ddBuyGear",{
Title="Gear",
Description="Select gear to buy",
Values=i.GearShopTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
j.UpdateBuyList()
h()
end,
})


local p=f.Shop:AddCollapsibleSection("Pet Eggs Shop",false)
p:AddToggle("tgBuyEggEnable",{
Title="Buy Pet Eggs",
Default=false,
Callback=function(q)
j.UpdateBuyList()
h()
if q then
local r=i.DataService:GetData()
local s=r.PetEggStock.Stocks
if not l.IsTableEmpty(s)then
j.BuyItem(j.ShopKey.Egg,s)
end
end
end,
})

p:AddDropdown("ddBuyEggs",{
Title="Pet Eggs",
Description="Select pet eggs to buy",
Values=i.EggShopTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
j.UpdateBuyList()
h()
end,
})


local q=f.Shop:AddCollapsibleSection("Traveling Merchant Shop",false)
q:AddToggle("tgBuyTravelingEnable",{
Title="Buy Traveling Merchant Items",
Default=false,
Callback=function(r)
j.UpdateBuyList()
h()
if r then
local s=i.DataService:GetData()
local t=s.TravelingMerchantShopStock.Stocks
if not l.IsTableEmpty(t)then
j.BuyItem(j.ShopKey.Traveling,t)
end
end
end,
})
q:AddToggle("tgBuyTravelingAll",{
Title="Buy All",
Default=false,
Callback=function()
j.UpdateBuyList()
h()
end,
})

for r,s in pairs(i.TravelingMerchantTable)do
q:AddDropdown("ddTraveling_"..r,{
Title=r.." Items",
Description="Select items to buy",
Values=s,
Multi=true,
Default={},
Searchable=true,
Callback=function()
j.UpdateBuyList()
h()
end,
})
end


local r=f.Shop:AddCollapsibleSection("Events Shop",false)




























































r:AddToggle("tgBuyEasterEnable",{
Title="Buy Easter Shop Items",
Default=false,
Callback=function(s)
j.UpdateBuyList()
h()
if s then
local t=i.DataService:GetData()
local u=t.EventShopStock["Easter Seed Shop"].Stocks
if not l.IsTableEmpty(u)then
j.BuyItem(j.ShopKey.Easter,u)
end
end
end,
})
r:AddDropdown("ddBuyEaster",{
Title="Easter Shop Items",
Description="Select items to buy",
Values=i.EasterShopTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
j.UpdateBuyList()
h()
end,
})

local s=f.Shop:AddCollapsibleSection("Season Pass",false)
s:AddToggle("tgBuySeasonPassEnable",{
Title="Buy Season Pass",
Default=false,
Callback=function(t)
j.UpdateBuyList()
h()
if t then
local u=i.DataService:GetData()
local v=u.SeasonPass[i.SeasonPassData.CurrentSeason].Stocks
if not l.IsTableEmpty(v)then
j.BuyItem(j.ShopKey.SeasonPass,v)
end
end
end,
})
s:AddDropdown("ddBuySeasonPass",{
Title="Season Pass",
Description="Select items to buy",
Values=i.SeasonPassShopTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
j.UpdateBuyList()
h()
end,
})

k.UIShopLoaded=true
end

return b end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()

local b={}

local c
local d=nil

function b.Initialize(e)
c=e
local f=c.Interface
local g=c.Tabs
local h=c.Options
_=h
local i=c.Window.QuickSave
local j=c.sData
local k=c.EfTasks
local l=c.Pets
local m=c.fVar

g.Pets=f:AddTab({Title="Pets",Icon="paw-print"})


local n=g.Pets:AddCollapsibleSection("Age Break",false)

n:AddToggle("tgAgeBreakEnabled",{
Title="Enable Auto Age Break",
Default=false,
Callback=function(o)
if not o then
m.IsAgeBreaking=false
end
k.ToggleTask("AgeBreak",o,function()
l.AgeBreak()
task.wait(2)
end)
i()
end,
})

n:AddDropdown("ddAgeBreakPetType",{
Title="Select Pet Type",
Values=j.PetsDataTable or{},
Default="",
Multi=false,
Searchable=true,
Callback=function(o)
i()
end,
})

n:AddInput("inpAgeBreakTargetAge",{
Title="Target Break Age",
Description="Min: 101, Max: 125",
Default=125,
Numeric=true,
Finished=true,
Callback=function(o)
i()
end,
})

n:AddDivider()

n:AddDropdown("ddAgeBreakAgeCond",{
Title="Age Condition",
Values={"Below","Above"},
Default="Below",
Callback=function(o)
i()
end,
})

n:AddInput("inpAgeBreakAgeVal",{
Title="Dupe Age Value",
Default=0,
Numeric=true,
Finished=true,
Callback=function(o)
i()
end,
})

n:AddDivider()

n:AddDropdown("ddAgeBreakWeightCond",{
Title="Weight Condition",
Values={"Below","Above"},
Default="Below",
Callback=function(o)
i()
end,
})

n:AddInput("inpAgeBreakWeightVal",{
Title="Dupe Weight Value",
Default=0,
Numeric=true,
Finished=true,
Callback=function(o)
i()
end,
})




local o=g.Pets:AddCollapsibleSection("Mutation",false)

o:AddToggle("tgMutantEnabled",{
Title="Enable Auto Mutation",
Default=false,
Callback=function(p)
if p then
l.FarmLevel()
task.wait(2)
local q,r=pcall(function()
l.TargetPetLevelCheck()
end)
if not q then
c.Log("TargetPetLevelCheck failed: "..tostring(r))
end

task.wait(2)
d=task.spawn(function()
while task.wait(60)do
local s,t=pcall(function()
l.TargetPetLevelCheck()
end)
if not s then
c.Log("TargetPetLevelCheck failed: "..tostring(t))
else
c.Log("Loop TargetPetLevelCheck Success!")
end
end
end)
else
m.IsMutating=false
if d then
task.cancel(d)
d=nil
end
end
i()
end,
})
o:AddDropdown("ddMutantMethod",{
Title="Select Mutant Method",
Values={"None","Nightmare","Mutation","Level","Elephant","Venom"},
Default="None",
Callback=function()
i()
end,
})
o:AddToggle("tgFavoritePet",{
Title="Favorite Pet",
Default=false,
Callback=function()
i()
end,
})
o:AddButton({
Title="Clear Selected Mutant Pet Type",
Callback=function()
h.ddMutantPetType:SetValue({})
end,
})

o:AddDropdown("ddMutantPetType",{
Title="Select Mutant Pet Type",
Values=j.PetsDataTable or{},
Default={},
Multi=true,
Searchable=true,
Callback=function()
i()
end,
})

o:AddInput("inpMutantTargetAge",{
Title="Target Mutant Age",
Default=50,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})

o:AddDivider()

o:AddButton({
Title="Clear Selected Mutant",
Callback=function()
h.ddTargetMutant:SetValue({NONE=true})
end,
})

o:AddDropdown("ddTargetMutant",{
Title="Target Mutant",
Values=j.PetMutationDataTable or{},
Default={"NONE"},
Multi=true,
Searchable=true,
Callback=function()
i()
end,
})

o:AddInput("LoadOutDelay",{
Title="Delay",
Default=10,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})

o:AddDropdown("ddLevelLoadout",{
Title="Farm Level Loadout",
Values={"0","1","2","3","4","5","6"},
Default="1",
Callback=function()
i()
end,
})

o:AddDropdown("ddTimeLoadout",{
Title="Reduce Time Loadout",
Values={"0","1","2","3","4","5","6"},
Default="2",
Callback=function()
i()
end,
})

o:AddDropdown("ddClaimLoadout",{
Title="Claim Loadout",
Values={"0","1","2","3","4","5","6"},
Default="3",
Callback=function()
i()
end,
})



local p=g.Pets:AddCollapsibleSection("Feed Pets",false)

p:AddToggle("tgFeedPetsEnabled",{
Title="Enable Auto Feed Pets",
Default=false,
Callback=function(q)
k.ToggleTask("FeedPets",q,function()
l.FeedPets()
task.wait(30)
end)
i()
end,
})

p:AddButton({
Title="Clear Selected Feed Crops Type",
Callback=function()
h.ddFeedCropsType:SetValue({ALL=true})
end,
})

p:AddDropdown("ddFeedCropsType",{
Title="Select Crops Type",
Values=j.SeedDataTable,
Default={"ALL"},
Multi=true,
Searchable=true,
Callback=function()
i()
end,
})
p:AddInput("inpFeedPetsHunger",{
Title="Hunger",
Default=50,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})



local q=g.Pets:AddCollapsibleSection("Hatch Eggs",false)

q:AddToggle("tgPlaceEggsEn",{
Title="Enable Auto Place Eggs",
Default=false,
Callback=function(r)
l.RunHatchSet()
i()
end,
})
q:AddButton({
Title="Clear Selected Egg Type",
Callback=function()
h.ddPlaceEgg:SetValue({ALL=true})
end,
})
q:AddDropdown("ddPlaceEgg",{
Title="Select Egg Type",
Values=j.EggDataTable,
Default={"ALL"},
Multi=true,
Searchable=true,
Callback=function()
i()
end,
})
q:AddInput("ipMaxEggs",{
Title="Max Egg",
Default=3,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})
q:AddDropdown("ddPlaceMethod",{
Title="Select Place Method",
Values={"Set","Random"},
Default="Set",
Callback=function()
i()
end,
})
q:AddDropdown("ddPlaceSlot",{
Title="Select Place Slot",
Values={"1","2"},
Default="1",
Callback=function()
i()
end,
})
q:AddDropdown("ddSpeedLoadout",{
Title="Speed Loadout",
Values={"0","1","2","3","4","5","6"},
Default="1",
Callback=function()
i()
end,
})
q:AddInput("inpDelayPlaceEgg",{
Title="Delay",
Default=2,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})
q:AddDivider()
q:AddToggle("tgAutoHatchEn",{
Title="Enable Auto Hatch",
Default=false,
Callback=function(r)
l.RunHatchSet()
i()
end,
})
q:AddDropdown("ddHatchLoadout",{
Title="Select Hatch Loadout",
Values={"1","2","3","4","5","6"},
Default="2",
Callback=function()
i()
end,
})
q:AddButton({
Title="Clear Selected Special Pet Type",
Callback=function()
h.ddSpecialHatchPet:SetValue({NONE=true})
end,
})
q:AddDropdown("ddSpecialHatchPet",{
Title="Select Special Pet Type",
Values=j.PetsDataBlackTable,
Default={"NONE"},
Multi=true,
Searchable=true,
Callback=function()
i()
end,
})
q:AddInput("inpSpecialHatchWeight",{
Title="Base Weight",
Default=3.5,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})
q:AddDropdown("ddSpecialHatchLoadout",{
Title="Select Special Hatch Loadout",
Values={"1","2","3","4","5","6"},
Default="4",
Callback=function()
i()
end,
})
q:AddInput("inpDelayHatchEgg",{
Title="Delay",
Default=2,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})
q:AddDivider()
q:AddToggle("tgSellPetEn",{
Title="Enable Auto Sell Pet",
Default=false,
Callback=function()
l.RunHatchSet()
i()
end,
})
q:AddButton({
Title="Clear Selected Sell Pet Type",
Callback=function()
h.ddSellPet:SetValue({NONE=true})
end,
})
q:AddDropdown("ddSellPet",{
Title="Select Sell Pet Type",
Values=j.PetsDataBlackTable,
Default={"NONE"},
Multi=true,
Searchable=true,
Callback=function()
i()
end,
})
q:AddDropdown("ddSellPetThreshold",{
Title="Select Weight Threshold",
Values={"Below","Above"},
Default="Below",
Callback=function()
i()
end,
})
q:AddInput("inpSellPetWeight",{
Title="Base Weight",
Default=3.5,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})
q:AddDropdown("ddSellLoadout",{
Title="Select Sell Loadout",
Values={"1","2","3","4","5","6"},
Default="3",
Callback=function()
i()
end,
})
q:AddInput("inpDelaySellPet",{
Title="Delay",
Default=2,
Numeric=true,
Finished=true,
Callback=function()
i()
end,
})


end

return b end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end do local function __modImpl()

local b={}
local c
function b.Initialize(d)
c=d
local e=c.Interface
local f=c.Tabs
local g=c.Options
local h=c.Window.QuickSave
local i=c.sData
local j=c.Auto
local k=c.fVar
local l=c.EfTasks



f.Auto=e:AddTab({Title="Automatic",Icon="bot"})

local m=f.Auto:AddCollapsibleSection("Remove Plants",false)
m:AddToggle("tgRemovePlantsEnable",{
Title="Auto Remove Plants",
Default=false,
Callback=function(n)
if not n then
k.IsRemovingPlants=false
end
l.ToggleTask("AutoRemovePlants",n,function()
j.RemovePlants()
task.wait(0.1)
end)
h()
end,
})
m:AddButton({
Title="Clear Selected Plants",
Callback=function()
g.ddRemovePlants:SetValue({})
end,
})
m:AddDropdown("ddRemovePlants",{
Title="Select Remove Plants",
Values=i.SeedDataTable,
Default={},
Multi=true,
Searchable=true,
Callback=function()
h()
end,
})
m:AddDropdown("ddRemovePlantsWeight",{
Title="Plants Weight Threshold",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function()
h()
end,
})
m:AddInput("ipRemovePlantsWeight",{
Title="Plants Weight",
Default=0,
Numeric=true,
Finished=false,
Callback=function()
h()
end,
})

local n=f.Auto:AddCollapsibleSection("Remove Fruit",false)
n:AddToggle("tgRemoveFruitEnable",{
Title="Auto Remove Fruit",
Default=false,
Callback=function(o)
if not o then
k.IsRemovingCrops=false
end
l.ToggleTask("AutoRemoveCrops",o,function()
j.RemoveCrops()
task.wait(0.1)
end)
h()
end,
})
n:AddDivider()
n:AddButton({
Title="Clear Selected Remove Crops",
Callback=function()
g.ddRemoveCrops:SetValue({ALL=true})
end,
})
n:AddDropdown("ddRemoveCrops",{
Title="Select Remove Crops",
Values=i.SeedDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
h()
end,
})
n:AddButton({
Title="Clear Backlist Remove Crops",
Callback=function()
g.ddRemoveBlackCrops:SetValue({NONE=true})
end,
})
n:AddDropdown("ddRemoveBlackCrops",{
Title="Blacklist Remove Crops",
Values=i.SeedDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function()
h()
end,
})
n:AddDivider()
n:AddButton({
Title="Clear Selected Mutant",
Callback=function()
g.ddRemoveMutants:SetValue({ALL=true})
end,
})
n:AddDropdown("ddRemoveMutants",{
Title="Select Mutants",
Values=i.MutationDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
h()
end,
})
n:AddButton({
Title="Clear Backlist Mutant",
Callback=function()
g.ddRemoveBlackMutants:SetValue({NONE=true})
end,
})
n:AddDropdown("ddRemoveBlackMutants",{
Title="Backlist Mutants",
Values=i.MutationDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function()
h()
end,
})
n:AddDivider()
n:AddDropdown("ddRemoveVariant",{
Title="Variant",
Values={"ALL","Silver","Gold"},
Default={"ALL"},
Multi=true,
Callback=function()
h()
end,
})
n:AddDropdown("ddRemoveBlackVariant",{
Title="Backlist Variant",
Values={"NONE","Silver","Gold"},
Default={"NONE"},
Multi=true,
Callback=function()
h()
end,
})
n:AddDivider()
n:AddDropdown("ddRemoveWeight",{
Title="Weight",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function()
h()
end,
})
n:AddInput("ipRemoveWeight",{
Title="Weight",
Default=0,
Numeric=true,
Finished=true,
Callback=function()
h()
end,
})

local o=f.Auto:AddCollapsibleSection("Trowel",false)
o:AddButton({
Title="Set Position",
Callback=function()


local p=i.Character:GetPivot().Position
local q=string.format("%.3f, %.3f, %.3f",p.X,p.Y,p.Z)
g.ipTrowelPosition:SetValue(q)
h()
end,
})
o:AddInput("ipTrowelPosition",{
Title="Trowel Position",
Default="",
Placeholder="X, Y, Z",
Numeric=false,
Finished=false,
Callback=function()
h()
end,
})
o:AddDivider()
o:AddToggle("tgTrowelEnable",{
Title="Trowel",
Default=false,
Callback=function(p)
if p then
task.spawn(j.Trowel)
else
k.IsTroweling=false
end
end,
})
o:AddButton({
Title="Clear Selected Trowel",
Callback=function()
g.ddTrowelPlants:SetValue({})
end,
})
o:AddDropdown("ddTrowelPlants",{
Title="Trowel Type",
Values=i.SeedDataTable,
Multi=true,
Default={},
Searchable=true,
Callback=function()
h()
end,
})
o:AddDropdown("ddTrowelPlantsWeight",{
Title="Plants Weight Threshold",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function()
h()
end,
})
o:AddInput("ipTrowelPlantsWeight",{
Title="Plants Weight",
Default=0,
Numeric=true,
Finished=false,
Callback=function()
h()
end,
})

local p=f.Auto:AddCollapsibleSection("Reclaim",false)
p:AddToggle("tgReclaimEnable",{
Title="Reclaim",
Default=false,
Callback=function(q)
if q then
task.spawn(j.Reclaim)
else
k.IsReclaiming=false
end
end,
})

p:AddButton({
Title="Clear Selected Reclaim",
Callback=function()
g.ddReclaimPlants:SetValue({})
end,
})

p:AddDropdown("ddReclaimPlants",{
Title="Reclaim Type",
Values=i.SeedDataTable,
Multi=true,
Default={},
Searchable=true,
Callback=function()
h()
end,
})

p:AddDropdown("ddReclaimPlantsWeight",{
Title="Plants Weight Threshold",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function()
h()
end,
})
p:AddInput("ipReclaimPlantsWeight",{
Title="Plants Weight",
Default=0,
Numeric=true,
Finished=true,
Callback=function()
h()
end,
})

local q=f.Auto:AddCollapsibleSection("Sprinkler",false)
q:AddButton({
Title="Set Position",
Callback=function()
local r=i.Character:GetPivot().Position
local s=string.format("%.3f, %.3f, %.3f",r.X,r.Y,r.Z)
g.ipSprinklerPosition:SetValue(s)
h()
end,
})

q:AddInput("ipSprinklerPosition",{
Title="Sprinkler Position",
Default="",
Placeholder="X, Y, Z",
Numeric=false,
Finished=false,
Callback=function()
h()
end,
})
q:AddDivider()
q:AddToggle("tgSprinklerEnable",{
Title="Sprinkler",
Default=false,
Callback=function(r)
if r then
task.spawn(j.Sprinkler)
else
k.IsSprinkling=false
end
end,
})
q:AddInput("ipBasicSPK",{
Title="Number of Basic Sprinkler",
Default=5,
Numeric=true,
Finished=true,
Callback=function()
h()
end,
})
q:AddInput("ipAdvancedSPK",{
Title="Number of Advanced Sprinkler",
Default=3,
Numeric=true,
Finished=true,
Callback=function()
h()
end,
})
q:AddInput("ipGodlySPK",{
Title="Number of Godly Sprinkler",
Default=2,
Numeric=true,
Finished=false,
Callback=function()
h()
end,
})
q:AddInput("ipMasterSPK",{
Title="Number of Master Sprinkler",
Default=1,
Numeric=true,
Finished=false,
Callback=function()
h()
end,
})
q:AddInput("ipGrandmasterSPK",{
Title="Number of Grandmaster Sprinkler",
Default=1,
Numeric=true,
Finished=false,
Callback=function()
h()
end,
})
q:AddDropdown("ddOtherSPK",{
Title="Select Other Sprinkler",
Values=i.SprinklerDataTable,
Default={"NONE"},
Multi=false,
Searchable=true,
Callback=function()
h()
end,
})
q:AddInput("ipOtherSPK",{
Title="Number of Other Sprinkler",
Default=0,
Numeric=true,
Finished=true,
Callback=function()
h()
end,
})
q:AddDivider()
q:AddToggle("tgCatLead",{
Title="Cat Lead",
Default=false,
Callback=function(r)
if r then
task.spawn(j.CatLead)
else
k.IsCatLeading=false
end
end,
})

local r=f.Auto:AddCollapsibleSection("Open Pack",false)
r:AddToggle("tgOpenPackEnable",{
Title="Auto Open Pack",
Default=false,
Callback=function(s)
if s then
task.spawn(function()
pcall(j.OpenSeedPack)
end)
else
k.IsOpeningPack=false
end
h()
end,
})
r:AddDropdown("ddOpenPack",{
Title="Select Seed Pack",
Values=i.SeedPackTable,
Default={"ALL"},
Multi=true,
Searchable=true,
Callback=function()
h()
end,
})
r:AddInput("ipOpenPackDelay",{
Title="Delay",
Default=10,
Numeric=true,
Finished=true,
Callback=function()
h()
end,
})

local s=f.Auto:AddCollapsibleSection("Craft",false)
s:AddToggle("tgCraftGearEnable",{
Title="Auto Craft",
Default=false,
Callback=function(t)
l.ToggleTask("AutoCraftGear",t,function()
j.CraftGear()
task.wait(30)
end)
h()
if not t then
k.CraftGearRunning=false
end
end,
})
s:AddDropdown("ddCraftGear",{
Title="Select Craft",
Values=i.GearEventDataTable,
Default="",
Multi=false,
Searchable=true,
Callback=function()
h()
end,
})

end

return b end function a.n():typeof(__modImpl())local b=a.cache.n if not b then b={c=__modImpl()}a.cache.n=b end return b.c end end do local function __modImpl()

local b={}
local c

function b.Initialize(d)
c=d
local e=d.Options
local f=d.Interface
local g=d.Tabs
local h=d.Window.QuickSave
local i=d.Misc
local j=d.sData
local k=c.EfTasks

g.MiscTab=f:AddTab({Title="Misc",Icon="flower"})
local l=g.MiscTab:AddCollapsibleSection("Misc",false)
l:AddButton({
Title="Reset Control Var",
Callback=function()

end,
})

local m=g.MiscTab:AddCollapsibleSection("AntiLag",false)
m:AddToggle("tgAntiLag",{
Title="AntiLag",
Default=false,
Callback=function(n)
if n then
i.AntiLag()
end
h()
end,
})

m:AddToggle("tgHideFruits",{
Title="Hide Fruits",
Default=false,
Callback=function(n)
i.HideFruit(n)
h()
end,
})

m:AddToggle("tgHidePlants",{
Title="Hide Plants",
Default=false,
Callback=function(n)
i.HidePlant(n)
h()
end,
})

local n=g.MiscTab:AddCollapsibleSection("Esp",false)
n:AddToggle("tgEspCrops",{
Title="Esp Crops",
Default=false,
Callback=function(o)
i.EspCrops(o)
h()
end,
})
n:AddButton({
Title="Clear Selected Crops",
Callback=function()
e.ddEspCrops:SetValue({NONE=true})
end,
})
n:AddDropdown("ddEspCrops",{
Title="Select Crops",
Values=j.SeedDataBlackTable,
Default={"NONE"},
Multi=true,
Searchable=true,
Callback=function()
h()
end,
})
n:AddDivider()

n:AddToggle("tgEspPlants",{
Title="Esp Plants",
Default=false,
Callback=function(o)
i.EspPlants(o)
h()
end,
})
n:AddButton({
Title="Clear Selected Plants",
Callback=function()
e.ddEspPlants:SetValue({NONE=true})
if e.tgEspPlants.Value then
i.EspPlants(true)
end
h()
end,
})
n:AddDropdown("ddEspPlants",{
Title="Select Plants",
Values=j.SeedDataBlackTable,
Default={"NONE"},
Multi=true,
Searchable=true,
Callback=function()
if e.tgEspPlants.Value then
i.EspPlants(true)
end
h()
end,
})
n:AddDivider()
n:AddToggle("tgEspEggs",{
Title="Esp Eggs",
Default=false,
Callback=function(o)
i.EspEggs(o)
h()
end,
})
n:AddToggle("tgEspCrates",{
Title="Esp Crates",
Default=false,
Callback=function(o)
i.EspCrates(o)
h()
end,
})

local o=g.MiscTab:AddCollapsibleSection("Season Pass",false)
o:AddToggle("tgSeasonPassQuests",{
Title="Season Pass Quests",
Default=false,
Callback=function(p)
k.ToggleTask("AutoSeasonPassQuests",p,function()
i.SeasonPassQuests()
task.wait(60)
end)
h()
end,
})
o:AddToggle("tgSeasonPassRewards",{
Title="Season Pass Rewards",
Default=false,
Callback=function(p)
k.ToggleTask("AutoSeasonPassRewards",p,function()
i.SeasonPassRewards()
task.wait(60)
end)
h()
end,
})
end

return b end function a.o():typeof(__modImpl())local b=a.cache.o if not b then b={c=__modImpl()}a.cache.o=b end return b.c end end do local function __modImpl()

local b=game:GetService("ReplicatedStorage")

local c={}
local d
local e
local f
local g

local h=game:GetService("Players")
local i=h.LocalPlayer
local j=i.Character or i.CharacterAdded:Wait()

local k=b:WaitForChild("GameEvents"):WaitForChild("Easter2026")

function c.Initialize(l,m)
d=l
local n=d.Options
_=n
f=d.Window.QuickSave
e=d.EfTasks
g=m

local o=g:AddCollapsibleSection("Egghunt",false)
o:AddToggle("tgEgghuntEnable",{
Title="Egghunt Event Enable",
Default=false,
Callback=function(p)
e.ToggleTask("AutoEggHunt",p,function()
c.autoEggHunt()
task.wait(60)
end)
f()
if not p then
d.IsHuntEgg=false
d.IsEasterHarvesting=false
end
end,
})
end

function c.autoEggHunt()
local l=d.Options
if not l.tgEgghuntEnable.Value or d.IsHuntEgg then
return
end

local m=i:GetAttribute("EasterEggHuntCooldownRemaining")
if m and m>0 then
d.Log("⏳ กิจกรรมติดคูลดาวน์ รออีก: "..math.floor(m).." วินาที")
return
end
d.IsHuntEgg=true
d.IsEasterHarvesting=true
d.Log("🚀 กำลังส่งคำสั่งเริ่ม Egg Hunt ไปที่เซิร์ฟเวอร์...")
task.wait(1)

local n,o=k.EasterEventStartEggHunt:InvokeServer()


if o and type(o)=="table"then
local p=0


for q,r in pairs(o)do

if j:FindFirstChild("HumanoidRootPart")then
j:PivotTo(CFrame.new(r))

task.wait(0.5)
end


local s=k.CollectEasterEgg:InvokeServer(q)

if s then
p+=1
d.Log("✨ เก็บไข่ใบที่ "..p.." สำเร็จ! (ID: "..tostring(q)..")")
else
task.wait(1)
k.CollectEasterEgg:InvokeServer(q)
end


task.wait(1)
end
d.Log("🎉 ฟาร์มไข่เสร็จสิ้นทั้งหมด "..p.." ฟอง!")
d.Utils.ClickButton(d.Utils.GardenButton)
task.wait(1)
else
d.Log("❌ เริ่มเกมไม่ได้ หรือหาข้อมูลไข่ไม่พบ สถานะ: "..tostring(n))
end
d.IsHuntEgg=false
d.IsEasterHarvesting=false
end

return c end function a.p():typeof(__modImpl())local b=a.cache.p if not b then b={c=__modImpl()}a.cache.p=b end return b.c end end do local function __modImpl()

local b=game:GetService("ReplicatedStorage")

local c=require(b.Modules.PlantTraitsData::any)
local d={}
local e
local f
local g
local h
local i
local j=table.clone(c.Traits["EasterSlot"])
table.insert(j,1,"ALL")

local k
local l=game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")

function d.HarvestCrops()
local m=e.Options
if not m.tgEasterHarvestEnable or not m.tgEasterHarvestEnable.Value or e.IsEasterHarvesting then
return
end
if i.InventoryService.IsMaxInventory(i.LocalPlayer)then
return
end
e.IsEasterHarvesting=true
local n=k.GetPlantsFolder()
if not n then
e.IsEasterHarvesting=false
return
end
local o=k.GetSelectedItems(m.ddEasterHarvestPlant.Value)
local p
if table.find(o,"ALL")then
p=j
else
p=o
end
for q,r in ipairs(n:GetChildren())do
if not m.tgEasterHarvestEnable.Value or e.IsHuntEgg then
e.IsEasterHarvesting=false
return
end
local s=r:FindFirstChild("Fruits")
local t=s and s:GetChildren()or{r}

for u,v in ipairs(t)do
if v:IsA("Model")and table.find(p,v.Name)then

local w=v:FindFirstChild("ProximityPrompt",true)
if w and w.Enabled then
l:WaitForChild("Crops"):WaitForChild("Collect"):FireServer({v})
task.wait(0.1)
end
end
end
end
e.IsEasterHarvesting=false

end

function d.AutoEasterSell()
local m=e.Options
if not m.tgEasterSellEnable or not m.tgEasterSellEnable.Value then
return
end
e.IsEasterHarvesting=true
k.ClickButton(k.SellButton)
task.wait(0.5)
l:WaitForChild("EasterEvent"):WaitForChild("EasterSellInventoryRE"):FireServer()
task.wait(1)
k.ClickButton(k.GardenButton)
task.wait(1)
e.IsEasterHarvesting=false
end
function d.runSell(m)
g.ToggleTask("AutoEasterSell",m,function()
local n=e.Options
local o=n.ipEasterSellDelay and tonumber(n.ipEasterSellDelay.Value)or 600
local p=n.tgEasterSellFull and n.tgEasterSellFull.Value or false
local q
if p then
q=1
else
q=o
end
if p then
if i.InventoryService.IsMaxInventory(i.LocalPlayer)then
d.AutoEasterSell()
end
else
d.AutoEasterSell()
end
task.wait(q)
end)
end

function d.Initialize(m,n)
e=m
local o=e.Options

f=e.Window.QuickSave
g=e.EfTasks
h=n
i=e.sData


k=e.Utils

local p=h:AddCollapsibleSection("Eastersell",false)

p:AddButton({
Title="Clear Selected Plants",
Callback=function()
o.ddEasterHarvestPlant:SetValue({ALL=true})
end,
})

p:AddDropdown("ddEasterHarvestPlant",{
Title="Easter Harvest Plant",
Values=j,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
f()
end,
})

p:AddToggle("tgEasterHarvestEnable",{
Title="Easter Harvest Enable",
Default=false,
Callback=function(q)
g.ToggleTask("AutoEasterHarvest",q,function()
d.HarvestCrops()
task.wait(1)
end)
f()
end,
})

p:AddDivider()

p:AddInput("ipEasterSellDelay",{
Title="Easter Sell Delay",
Default=600,
Numeric=true,
Finished=true,
Callback=function()
f()
end,
})

p:AddToggle("tgEasterSellFull",{
Title="Easter Sell Full",
Default=false,
Callback=function()
f()
end,
})

p:AddToggle("tgEasterSellEnable",{
Title="Easter Sell Enable",
Default=false,
Callback=function(q)

d.runSell(q)

f()
if not q then
e.IsEasterHarvesting=false
end
end,
})
end

return d end function a.q():typeof(__modImpl())local b=a.cache.q if not b then b={c=__modImpl()}a.cache.q=b end return b.c end end do local function __modImpl()

local b=game:GetService("ReplicatedStorage")
local c=require(b.Modules.DataService::any)
local d=require(b.Data.EASTER_SeedGiverQuestProgression::any)
local e=b.GameEvents.SeedPackGiverEvent
local f=require(b.Modules.PlantTraitsData::any)
local g=table.clone(f.Traits["EasterSlot"])
table.insert(g,1,"ALL")

local h={}
local i
local j
local k
local l
local m
local n=CFrame.new(-100.68,7.91,-9.52)























local o,p,q,r,s
local t

local u=game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")

function h.Initialize(v,w)
i=v
local x=i.Options
_=x
k=i.Window.QuickSave
j=i.EfTasks
l=w
m=i.sData
t=i.Utils

local y=l:AddCollapsibleSection("Angryplant",false)
y:AddToggle("tgAngryplantEnable",{
Title="Angryplant Enable",
Default=false,
Callback=function(z)
j.ToggleTask("AutoAngryplant",z,function()
h.autoAngryplant()
task.wait(10)
end)
if not z then
i.IsHuntEgg=false
i.IsEasterHarvesting=false
end
k()
end,
})

y:AddToggle("tgAngryPlants",{
Title="Plants Quest Seed Enable",
Default=false,
Callback=function(z)
k()
end,
})

y:AddDropdown("ddFocusPlant",{
Title="Focus Plant",
Values=g,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function()
k()
end,
})
y:AddButton({
Title="Set Position",
Callback=function()
local z=m.Character:GetPivot().Position
local A=string.format("%.3f, %.3f, %.3f",z.X,z.Y,z.Z)
x.ipAngryplantPos:SetValue(A)
k()
end,
})
y:AddInput("ipAngryplantPos",{
Title="Position",
Default="",
Placeholder="X, Y, Z",
Numeric=false,
Finished=false,
Callback=function(z)
k()
end,
})

y:AddParagraph("NextQuest",{
Title="Next Quest Time",
Content="Wait for update...",
})
end
local function QuestValue()
local v=i.Options
local w=c:GetData().EasterEventData
local x=w.Progression or 1
local y=x>#d
if not y then
local z=d[x]
local A=z.PLANT_NAME or nil
local B=z.WEIGHT or 0
local C=z.MUTATION or"ALL"
local D=z.VARIANT or"ALL"
local E=d[x+1]
local F=""


if E then

local G=tostring(E.PLANT_NAME or"Unknown")
local H=tonumber(E.WEIGHT)or 0
local I=tostring(E.MUTATION or"ALL")
local J=tostring(E.VARIANT or"ALL")


F=string.format("Name: %s \n Weight: %.2f kg \n Mutation: %s \n Variant: %s",G,H,I,J)
else

F="Next Quest: None"
end
return A,B,C,D,F
end
v.NextQuest:SetValue("Completed")
return nil,nil,nil,nil
end

local function CheckQuest(v)
local w=i.Options
o,p,q,r,s=QuestValue()
if not o then
return
end
local x=v:FindFirstChild("Item_String")and v:FindFirstChild("Item_String").Value or v.Name
local y=v:FindFirstChild("Variant")and v:FindFirstChild("Variant").Value
local z=v:FindFirstChild("Weight")and v:FindFirstChild("Weight").Value

if x~=o then
return
end
if z<p then
return
end
if q~="ALL"and v:GetAttribute(q)~=true then
return
end
if r~="ALL"and y~=r then
return
end
if s then
w.NextQuest:SetValue(s)
end
return true
end

function h.autoAngryplant()
local v=i.Options
if not v.tgAngryplantEnable.Value or i.IsHuntEgg then
return
end

local w=c:GetData().EasterEventData
if w.Progression>#d then
i.Log("Auto Claim: Exotic Seed Pack ready!")
i.IsHuntEgg=true
task.wait(1)
i.IsEasterHarvesting=true
i.sData.Character:PivotTo(n)
task.wait(0.5)
e:FireServer("ClaimPremiumPack")
task.wait(1.5)
i.Utils.ClickButton(i.Utils.GardenButton)
task.wait(1)
i.IsHuntEgg=false
i.IsEasterHarvesting=false
return
end

i.IsHuntEgg=true
task.wait(1)
i.IsEasterHarvesting=true

local x=i.sData.Backpack
local y=false
for z,A in ipairs(x:GetChildren())do
if CheckQuest(A)then
i.sData.Character:PivotTo(n)
task.wait(0.5)
i.Utils.EquipTool(A)
local B=A:FindFirstChild("Item_String")and A:FindFirstChild("Item_String").Value
if B then
i.Log("Submit "..tostring(B))
end
task.wait(0.5)
e:FireServer("SubmitHeldPlant")
task.wait(0.5)
i.Utils.ClickButton(i.Utils.GardenButton)
task.wait(1)
y=true
break
end
end
if not y then
task.spawn(function()
pcall(h.chkGarden)
end)
end
i.IsHuntEgg=false
i.IsEasterHarvesting=false
end

function h.chkGarden()
local v=i.Options
local w=false
local x=t.GetPlantsFolder()
local y=nil
for z,A in ipairs(x:GetChildren())do
local B=A:FindFirstChild("Fruits")
local C=B and B:GetChildren()or{A}

for D,E in ipairs(C)do
if E:IsA("Model")and CheckQuest(E)then
local F=E:FindFirstChild("ProximityPrompt",true)
if F and F.Enabled then
w=true
y=E
else
task.wait(10)
end
break
end
end
if w then
local D=u:WaitForChild("Crops",5):WaitForChild("Collect",5)
if D then
local E,F=pcall(function()
D:FireServer({y})
end)
if E then
task.wait(1)
task.spawn(function()
h.autoAngryplant()
end)
end
end
else
if v.tgAngryPlants.Value then
if q=="Choc"then
if h.ChkBackpack("Chocolate Sprinkler")then
task.spawn(function()
h.autoPlants()
end)
end
else
task.spawn(function()
h.autoPlants()
end)
end
end
end
end
end

function h.autoPlants()
local v=i.Options
local w=t.GetSelectedItems(v.ddFocusPlant.Value)
if not table.find(w,o)then
if q=="Choc"then
local x=v.ipSprinklerPosition.Value
local y=t.ParseVector3(x)
if y then
h.autoChoco(y)
end
end
return
end

local x=m.Backpack
for y,z in ipairs(x:GetChildren())do
local A=z:GetAttribute("Seed")
if A and A==o then
local B=t.ParseVector3(v.ipAngryplantPos.Value)
if B then
t.UnequipTool()
task.wait(0.1)
t.EquipTool(z)
task.wait(0.1)
m.GameEvents:WaitForChild("Plant_RE"):FireServer(vector.create(B.X,B.Y,B.Z),A)
task.wait(0.2)
t.UnequipTool()
task.wait(0.1)
if q=="Choc"then
h.autoChoco(B)
end
break
end
end
end
end

function h.autoChoco(v)
if h.ChkSprinkle("Chocolate Sprinkler")then
return
end
local w=m.Backpack
for x,y in ipairs(w:GetChildren())do
if y:IsA("Tool")and y.Name:match("Chocolate Sprinkler")then
local z=CFrame.new(v)
t.EquipTool(y)
m.SprinklerEvent:FireServer("Create",z)
task.wait(0.1)
t.UnequipTool()
task.wait(5)
h.autoGrand(v)
end
end
end

function h.autoGrand(v)
if h.ChkSprinkle("Grandmaster Sprinkler")then
return
end
local w=m.Backpack
for x,y in ipairs(w:GetChildren())do
if y:IsA("Tool")and y.Name:match("Grandmaster Sprinkler")then
local z=CFrame.new(v)
t.EquipTool(y)
m.SprinklerEvent:FireServer("Create",z)
task.wait(0.1)
t.UnequipTool()
task.wait(0.1)
end
end
end

function h.ChkSprinkle(v)
local w=t.GetMyFarm():FindFirstChild("Important")
local x=w:FindFirstChild("Objects_Physical")
if not x then
return
end
for y,z in ipairs(x:GetChildren())do
if z:IsA("Model")and z.Name:match(v)then
return true
end
end
return false
end

function h.ChkBackpack(v)
local w=m.Backpack
for x,y in ipairs(w:GetChildren())do
if y:IsA("Tool")and y.Name:match(v)then
return true
end
end
return false
end

return h end function a.r():typeof(__modImpl())local b=a.cache.r if not b then b={c=__modImpl()}a.cache.r=b end return b.c end end do local function __modImpl()

local b={}
local c

local d=game:GetService("ReplicatedStorage")
local e=d:WaitForChild("GameEvents")
local f=e.EasterEvent.TryBuyGoldenEggRE
local g=require(d.Modules.DataService::any)
local h=require(d.Modules.EasterEvent.EasterHelper::any)
local i={}
for j=0,15 do
local k=h:GetNextGoldenEggPrice(j)
table.insert(i,k)
end

local j=CFrame.new(-55.38,5.6,-14.77)

local k=game:GetService("Players")
local l=k.LocalPlayer
local m=l.Character or l.CharacterAdded:Wait()

local n={}

local function BuyGoldenEgg()
local o=c.Options
if not o.tgGoldeneggEnable.Value then
return
end
c.IsEasterHarvesting=true
local p=tonumber(o.ddGoldeneggMaxPrice.Value)or 25000
local q=g:GetData()
local r=tonumber(q.SpecialCurrency.ChocCoins)
local s=tonumber(q.EasterEventData.GoldenEgg.BuyAmount)
local t=tonumber(h:GetNextGoldenEggPrice(s))
if r>=(t*2)and t<=p then
m:PivotTo(j)
task.wait(0.5)
f:FireServer()
task.wait(1)
c.Utils.ClickButton(c.Utils.GardenButton)
task.wait(1)
c.IsEasterHarvesting=false
return
end
c.IsEasterHarvesting=false
end

local function EventDrive(o:boolean)
for p,q in pairs(n)do
q:Disconnect()
end
table.clear(n)

if o then
local p=g:GetPathSignal("SpecialCurrency/ChocCoins/@")
if p then
table.insert(n,p:Connect(BuyGoldenEgg))
end
local q=g:GetPathSignal("EasterEventData/GoldenEgg/@")
if q then
table.insert(n,q:Connect(BuyGoldenEgg))
end
end
end

function b.Initialize(o,p)
c=o
local q=c.Options
_=q
local r=c.Window.QuickSave
local s=p
local t=s:AddCollapsibleSection("Golden Egg",false)
t:AddToggle("tgGoldeneggEnable",{
Title="Buy Golden Egg Enable",
Default=false,
Callback=function(u)
EventDrive(u)
r()
end,
})
t:AddDropdown("ddGoldeneggMaxPrice",{
Title="Max Buy Golden Egg",
Values=i,
Default=6,
Multi=false,
Searchable=true,
Callback=function()
r()
end,
})
end

return b end function a.s():typeof(__modImpl())local b=a.cache.s if not b then b={c=__modImpl()}a.cache.s=b end return b.c end end do local function __modImpl()

local b={}
local c
local d
local e
local f
local g
local h

local i:Folder?

local j="Shovel [Destroy Plants]"

local function getShovelTool()
local k=g.Backpack
local l=h.FindToolByName(k,j)
if l then
return l
end
local m=g.Character
if m then
return m:FindFirstChild(j)
end
return nil
end

local function ensureEvilFolder():Folder?
if i and i.Parent then
return i
end
local k=g.GameEvents:FindFirstChild("EvilBunny")
or g.GameEvents:WaitForChild("EvilBunny",15)
if not k then
return nil
end
i=k::Folder
return i
end

local function findTargetPlants(k:string)
local l=h.GetPlantsFolder()
if not l then
return{}
end
local m={}
for n,o in ipairs(l:GetChildren())do
if o:IsA("Model")and o.Name==k and o:GetAttribute("Favorited")~=true then
table.insert(m,o)
end
end
return m
end

local function shovelPlant(k:Model):boolean
local l=getShovelTool()
if not l then
c.Log("Evil Bunny: ไม่พบพลั่ว (Shovel)","WARN")
return false
end
h.UnequipTool()
task.wait(0.05)
h.EquipTool(l)
g.RemoveItemEvent:FireServer(k)
task.wait(0.12)
h.UnequipTool()
return true
end

local function findSeedToolForPlant(k:string):Tool?
for l,m in ipairs(g.Backpack:GetChildren())do
if m:IsA("Tool")and m:GetAttribute("Seed")==k then
return m
end
end
local l=g.Character
if l then
for m,n in ipairs(l:GetChildren())do
if n:IsA("Tool")and n:GetAttribute("Seed")==k then
return n
end
end
end
return nil
end


local function tryReplantAtOriginalSpot(k:string,l:Vector3)
if not k or k==""then
return
end
local m=findSeedToolForPlant(k)
if not m then
c.Log("Evil Bunny: ไม่มีเมล็ด '"..k.."' ในถุง — ข้ามปลูกทดแทน")
return
end
local n=g.GameEvents:FindFirstChild("Plant_RE")or g.GameEvents:WaitForChild("Plant_RE",8)
if not n then
c.Log("Evil Bunny: ไม่พบ Plant_RE — ปลูกทดแทนไม่ได้","WARN")
return
end
h.UnequipTool()
task.wait(0.06)
h.EquipTool(m)
task.wait(0.1)
local o,p=pcall(function()
n:FireServer(vector.create(l.X,l.Y,l.Z),k)
end)
task.wait(0.12)
h.UnequipTool()
if o then
c.Log("Evil Bunny: ปลูกทดแทนตำแหน่งเดิม — "..k)
else
c.Log("Evil Bunny: ปลูกทดแทนล้มเหลว — "..tostring(p),"WARN")
end
end


local function destroyQuestPlant(k:string):(boolean,string?,Vector3?)
if not k or k==""or k=="???"then
c.Log("Evil Bunny: ไม่ได้รับชื่อต้นเป้าหมายจากเซิร์ฟเวอร์","WARN")
return false,nil,nil
end
local l=findTargetPlants(k)
if#l==0 then
c.Log("Evil Bunny: ไม่พบต้น '"..k.."' ในสวน (หรือถูก Favorite)","WARN")
return false,nil,nil
end
if#l>1 then
c.Log("Evil Bunny: พบหลายต้นชื่อ '"..k.."' — จะทำลายต้นแรกที่ไม่ Favorite","WARN")
end
local m=l[1]
local n=m:GetPivot().Position
if not shovelPlant(m)then
return false,nil,nil
end
task.wait(0.2)
return true,k,n
end

local function pollUntilComplete(k,l,m:number):boolean
local n=os.clock()+m
while os.clock()<n do
task.wait(0.35)
local o,p=pcall(function()
return k:InvokeServer()
end)
if o and type(p)=="table"then
if p.QuestState=="Complete"then
local q,r=pcall(function()
return l:InvokeServer()
end)
if q and r then
c.Log("Evil Bunny: รับรางวัล — "..tostring(r))
elseif q then
c.Log("Evil Bunny: รับรางวัลไม่สำเร็จ (เซิร์ฟเวอร์ปฏิเสธ)","WARN")
end
return true
end
end
end
c.Log("Evil Bunny: หมดเวลารอเควสเสร็จ — ลองใหม่รอบถัดไป","WARN")
return false
end

function b.autoEvilbunny()
local k=c.Options
if not k.tgEvilbunnyEnable.Value or c.IsEvilbunny or c.IsHuntEgg then
return
end

local l=ensureEvilFolder()
if not l then
c.Log("Evil Bunny: ไม่พบ GameEvents.EvilBunny (อีเวนต์อาจยังไม่เปิด)","WARN")
task.wait(20)
return
end

local m=l:FindFirstChild("EvilBunnyInteract")::RemoteFunction?
local n=l:FindFirstChild("EvilBunnyGiveQuest")::RemoteFunction?
local o=l:FindFirstChild("EvilBunnyClaim")::RemoteFunction?
if not(m and n and o)then
c.Log("Evil Bunny: Remote ไม่ครบในโฟลเดอร์ EvilBunny","WARN")
task.wait(15)
return
end

c.IsEvilbunny=true
c.IsEasterHarvesting=true

local p,q=pcall(function()
local p,q=pcall(function()
return m:InvokeServer()
end)
if not p or type(q)~="table"then
c.Log("Evil Bunny: EvilBunnyInteract ล้มเหลว — "..tostring(q),"WARN")
return
end

local r=q.QuestState

if r=="Cooldown"then
local s=tonumber(q.CooldownRemaining)or 60
c.Log("Evil Bunny: คูลดาวน์ ~"..tostring(math.ceil(s)).." วินาที")
task.wait(math.clamp(s,2,3660))
return
end

if r=="Complete"then
local s,t=pcall(function()
return o:InvokeServer()
end)
if s and t then
c.Log("Evil Bunny: รับรางวัล — "..tostring(t))
elseif s then
c.Log("Evil Bunny: ยังรับรางวัลไม่ได้","WARN")
else
c.Log("Evil Bunny: EvilBunnyClaim error — "..tostring(t),"WARN")
end
task.wait(1)
return
end

if r=="Active"then
local s=q.TargetPlantName
if not s then
local t,u=pcall(function()
return m:InvokeServer()
end)
s=(t and type(u)=="table"and u.TargetPlantName)or nil
end
local t,u,v=destroyQuestPlant(tostring(s or""))
if not t or not u or not v then
task.wait(3)
return
end
tryReplantAtOriginalSpot(u,v)
pollUntilComplete(m,o,45)
return
end


local s,t=pcall(function()
return n:InvokeServer()
end)
if not s then
c.Log("Evil Bunny: EvilBunnyGiveQuest error — "..tostring(t),"WARN")
return
end
if not t then
c.Log("Evil Bunny: ไม่มีต้นที่ใช้เควสได้ — ปลูกต้นอื่นก่อน","WARN")
task.wait(12)
return
end

local u=type(t)=="string"and t or tostring(t)
c.Log("Evil Bunny: รับเควส — ทำลาย: "..u)
task.wait(0.25)
local v,w,x=destroyQuestPlant(u)
if not v or not w or not x then
task.wait(3)
return
end
tryReplantAtOriginalSpot(w,x)
pollUntilComplete(m,o,45)
end)

c.IsEasterHarvesting=false
c.IsEvilbunny=false

if not p then
c.Log("Evil Bunny: "..tostring(q),"ERROR")
end
end

function b.Initialize(k,l)
c=k
local m=c.Options
_=m
e=c.Window.QuickSave
d=c.EfTasks
f=l
g=c.sData
h=c.Utils

local n=f:AddCollapsibleSection("Evilbunny",false)
n:AddToggle("tgEvilbunnyEnable",{
Title="Evilbunny Enable",
Default=false,
Callback=function(o)
d.ToggleTask("AutoEvilbunny",o,function()
b.autoEvilbunny()
task.wait(4)
end)
if not o then
c.IsEvilbunny=false
c.IsEasterHarvesting=false
end
e()
end,
})
end

return b end function a.t():typeof(__modImpl())local b=a.cache.t if not b then b={c=__modImpl()}a.cache.t=b end return b.c end end do local function __modImpl()



local b=(getfenv()::any).getgenv
local c=b().EF_REMOTE
local d={}
local e
local f

local function LoadEvents()
local g={}
if b().DEV_MODE then
g.Egghunt=c("UI/Tabs/Events/Egghunt")
g.Eastersell=c("UI/Tabs/Events/Eastersell")
g.Angryplant=c("UI/Tabs/Events/Angryplant")
g.Goldenegg=c("UI/Tabs/Events/Goldenegg")
g.Evilbunny=c("UI/Tabs/Events/Evilbunny")
else
g.Egghunt=a.p()
g.Eastersell=a.q()
g.Angryplant=a.r()
g.Goldenegg=a.s()
g.Evilbunny=a.t()
end
return g
end

function d.Initialize(g)
e=g
local h=e.Interface
f=e.Tabs


e.IsEasterHarvesting=false
e.IsHuntEgg=false
f.Events=h:AddTab({Title="Events",Icon="calendar"})

local i=LoadEvents()
i.Egghunt.Initialize(e,f.Events)
i.Eastersell.Initialize(e,f.Events)
i.Angryplant.Initialize(e,f.Events)
i.Goldenegg.Initialize(e,f.Events)
i.Evilbunny.Initialize(e,f.Events)


end

return d end function a.u():typeof(__modImpl())local b=a.cache.u if not b then b={c=__modImpl()}a.cache.u=b end return b.c end end do local function __modImpl()





local b=(getfenv()::any).setclipboard or(getfenv()::any).toclipboard
local c={}
local d
local e=""
local f=0
function c.Log(g,h)
h=h or"INFO"
local i=os.date("%H:%M:%S")
local j="🟢 "
if h=="WARN"then
j="🟡 "
elseif h=="ERROR"then
j="🔴 "
end
local k=j.."["..i.."] "..tostring(g).."\n"

e=k..e
f=f+1

if f>100 then
local l=string.find(e,"\n",-2)
if l then
e=string.sub(e,1,l)
end
f=100
end

if d and d.fDisplay then
d.fDisplay:SetValue(e)
end
end

function c.Initialize(g)
d=g
local h=g.Options
_=h
local i=g.Interface
local j=g.Tabs
local k=g.Fluent


g.Log=c.Log

j.Log=i:AddTab({Title="Log",Icon="scroll"})

j.Log:AddButton({
Title="❌ Clear Log",
Callback=function()
e=""
f=0
if d and d.fDisplay then
d.fDisplay:SetValue("Waiting for new activity...\n")
end
end,
})

j.Log:AddButton({
Title="📑 Copy Log",
Callback=function()
if e~=""then
if b then
b(e)
k:Notify({
Title="EfHub System",
Content="✅ คัดลอก Log แล้ว",
Duration=3,
})
else
k:Notify({
Title="EfHub System",
Content="❌ ตัวรันของคุณไม่รองรับการคัดลอก (setclipboard)",
Duration=3,
})
end
end
end,
})

d.fDisplay=j.Log:AddParagraph("ActivityLogs",{
Title="📃 Activity Logs",
Content="Waiting for system to start...\n",
})
end

return c end function a.v():typeof(__modImpl())local b=a.cache.v if not b then b={c=__modImpl()}a.cache.v=b end return b.c end end do local function __modImpl()





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
e.Shop=c("Modules/Shop")
e.Auto=c("Modules/Auto")
e.Pets=c("Modules/Pets")
e.Misc=c("Modules/Misc")







e.Window=c("UI/Window")
e.MainTab=c("UI/Tabs/MainTab")
e.ShopTab=c("UI/Tabs/ShopTab")
e.PetsTab=c("UI/Tabs/PetsTab")
e.AutoTab=c("UI/Tabs/AutoTab")
e.MiscTab=c("UI/Tabs/MiscTab")
e.EventsTab=c("UI/Tabs/EventsTab")
e.LogTab=c("UI/Tabs/LogTab")







else

e.sData=a.a()
e.fVar=a.b()


e.Utils=a.c()
e.EfTasks=a.d()
e.Main=a.e()
e.Shop=a.f()
e.Auto=a.g()
e.Pets=a.h()
e.Misc=a.i()








e.Window=a.j()
e.MainTab=a.k()
e.ShopTab=a.l()
e.PetsTab=a.m()
e.AutoTab=a.n()
e.MiscTab=a.o()
e.EventsTab=a.u()
e.LogTab=a.v()






end

return e
end

function d.Initialize()
local e=LoadModules()

e.Window.Initialize(e)



e.Pets.Initialize(e)
e.Utils.Initialize(e)
e.EfTasks.Initialize(e)
e.Misc.Initialize(e)
e.Main.Initialize(e)
e.Shop.Initialize(e)

e.Auto.Initialize(e)


e.MainTab.Initialize(e)
e.ShopTab.Initialize(e)
e.AutoTab.Initialize(e)
e.PetsTab.Initialize(e)
e.EventsTab.Initialize(e)
e.MiscTab.Initialize(e)

e.LogTab.Initialize(e)

e.Window.Finalize()
e.Utils.ViewButton()


return e
end

return d end function a.w():typeof(__modImpl())local b=a.cache.w if not b then b={c=__modImpl()}a.cache.w=b end return b.c end end end


local b=(getfenv()::any).getgenv
b().DEV_MODE=false

local c

if b().DEV_MODE then
local d="https://raw.githubusercontent.com/suta007/EfHub/refs/heads/master/GAG/src/"

local function GetRemote(e)
local f=d..e..".luau?t="..tostring(tick())
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
c=a.w()
end


c.Initialize()
task.wait(1)



local d=game:GetService("Players").LocalPlayer
local e=game:GetService("VirtualUser")
d.Idled:Connect(function()
e:CaptureController()
e:ClickButton2(Vector2.new())
end)