local a={cache={}::any}do do local function __modImpl()local b={}
local c=game:GetService("ReplicatedStorage")
local d=c:WaitForChild("Shop"):WaitForChild("ShopData")
local e=c:WaitForChild("Plants"):WaitForChild("Definitions"):WaitForChild("PlantDataDefinitions")::any
local f=c:WaitForChild("Plants"):WaitForChild("Definitions"):WaitForChild("MutationDataDefinitions")::any
local g=c:WaitForChild("RNGPacks"):WaitForChild("SeedPackDefinitions")::any

local function getShopData(h)
local i={"ALL"}
local j,k=pcall(require,d[h])
if j then
for l,m in pairs(k.ShopData)do
table.insert(i,m.Name)
end
end
return i
end
b.SeedShopTable=getShopData("SeedShopData")
b.GearShopTable=getShopData("GearShopData")
b.PlantDataTable={"ALL"}
b.SeedDataTable={"ALL"}
b.MutationDataTable={"ALL"}
b.PlantDataBlackTable={}
b.MutationDataBlackTable={}

local h=require(e)
for i,j in pairs(h)do
table.insert(b.PlantDataTable,i)
table.insert(b.SeedDataTable,i.." Seed")
end

local i=require(f)
for j,k in pairs(i)do
table.insert(b.MutationDataTable,j)
end

b.PlantDataBlackTable=table.clone(b.PlantDataTable)
b.PlantDataBlackTable[1]="NONE"

b.MutationDataBlackTable=table.clone(b.MutationDataTable)
b.MutationDataBlackTable[1]="NONE"

b.SeedPackTable={"ALL"}
local j=require(g)
for k,l in pairs(j)do
table.insert(b.SeedPackTable,k)
end

return b end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()

local b={}
local c


b.actionQueue={}


b.SutaDistLimit=15
b.SutaYoffset=4
b.Pos={
GearShop=CFrame.new(211.64,205.50,608.18),
SeedShop=CFrame.new(176.70,205.50,672.00),
Botanist=CFrame.new(214.00,205.50,621.05),
Sell=CFrame.new(149.40,205.50,672.00),
Quest=CFrame.new(111.52,205.50,635.02),
Strange=CFrame.new(168.74,270.57,768.77),
Trowel=nil,
}


b.isPlanting=false
b.isBuyingSeed=false
b.isBuyingGear=false
b.isProcessing=false
b.isSelling=false
b.HarvestPause=false
b.isHarvesting=false
b.isQuestClaiming=false
b.isRemovePlants=false
b.isRemoveCrops=false
b.isTroweling=false

function b.ResetControlVar()
b.isPlanting=false
b.isBuyingSeed=false
b.isBuyingGear=false
b.isProcessing=false
b.isSelling=false
b.HarvestPause=false
b.isHarvesting=false
b.isQuestClaiming=false
b.isRemovePlants=false
b.isRemoveCrops=false
b.isTroweling=false

table.clear(b.actionQueue)
end

function b.LockDownControlVar()
b.isPlanting=true
b.isBuyingSeed=true
b.isBuyingGear=true
b.isProcessing=true
b.isSelling=true
b.HarvestPause=true
b.isHarvesting=true
b.isQuestClaiming=true
b.isRemovePlants=true
b.isRemoveCrops=true
b.isTroweling=true
end

function b.IsBuying()
return b.isBuyingSeed or b.isBuyingGear or b.isSelling
end

return b end function a.b():typeof(__modImpl())local b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do local function __modImpl()

local b={}
local c=nil
local d={}
local e=Random.new()
local f

local g=game:GetService("Players")
local h=g.LocalPlayer
local i=h.Character or h.CharacterAdded:Wait()

local j=game:GetService("TweenService")
local k=game:GetService("RunService")

local l=nil

local function InitializePlotData()
local m=workspace:FindFirstChild("Plots")
if not m then
return false
end
for n,o in ipairs(m:GetChildren())do
local p=o:FindFirstChild("Owner")
if p and p.Value==h.Name then
local q=o:FindFirstChild("PlantableArea")
c.MyPlot=o
c.MySpawn=c.MyPlot.Spawn
c.MySpawnPoint=c.MySpawn:GetPivot()
if q then
table.clear(d)
for r,s in ipairs(q:GetChildren())do
if s:IsA("BasePart")then
table.insert(d,s)
end
end
return true
end
end
end
return false
end

function b.Initialize(m)
c=m
f=m.fVar

InitializePlotData()
end

function b.GetSelectedItems(m)
local n={}
if type(m)=="table"then
for o,p in pairs(m)do
if p then
table.insert(n,o)
end
end
end
return n
end

function b.GetRandomPlantPosition()
if#d==0 then
if not InitializePlotData()then
return nil
end
end
local m=d[math.random(1,#d)]
local n=m.Size
local o=m.CFrame

local p=e:NextNumber(-n.Y/2,n.Y/2)
local q=e:NextNumber(-n.Z/2,n.Z/2)

local r=5

local s=CFrame.new(r,p,q)
local t=o*s

local u=t.Position.X
local v=o.Position.Y
local w=t.Position.Z

return CFrame.new(u,v,w)
end

function b.GetCenterPlots()
if#d<2 then
if not InitializePlotData()then
return nil,nil
end
end

local m=d[1]
local n=d[2]

local o=CFrame.new(m.Position.X,m.Position.Y,m.Position.Z)

local p=CFrame.new(n.Position.X,n.Position.Y,n.Position.Z)

return{o,p}
end

function b.getPlotsIntersections(m)
local n=m.CFrame
local o=m.Size
local p=o.Z/6
local q=Vector3.new(0,0,-p)
local r=Vector3.new(0,0,p)

local s=n*q
local t=n*r

local u=s+Vector3.new(0,4,0)
local v=t+Vector3.new(0,4,0)

local w=CFrame.new(u)
local x=CFrame.new(v)

return w,x
end

function b.GetCheckPos()
if#d<2 then
if not InitializePlotData()then
return nil,nil
end
end

local m=d[1]
local n=d[2]

local o,p=b.getPlotsIntersections(m)
local q,r=b.getPlotsIntersections(n)

return{o,p,q,r}
end

function b.SafeTeleport(m)
local n=i:FindFirstChild("Humanoid")
local o=i:FindFirstChild("HumanoidRootPart")

if n then
if n.Sit then
n.Sit=false
end
n.Jump=true
task.wait(0.05)
n:ChangeState(Enum.HumanoidStateType.GettingUp)
end

if o then
o.AssemblyLinearVelocity=Vector3.zero
o.AssemblyAngularVelocity=Vector3.zero
end
o.Anchored=false
i:PivotTo(m)

task.wait(0.1)
end

function b.SetNoClip(m)
if m then
if not l then
l=k.Stepped:Connect(function()
if i then
for n,o in ipairs(i:GetDescendants())do
if o:IsA("BasePart")and o.CanCollide then
o.CanCollide=false
end
end
end
end)
end
else
if l then
l:Disconnect()
l=nil
end
end
end

function b.TweenToTarget(m,n)
local o=i:FindFirstChild("HumanoidRootPart")
if not o then
return false
end

local p=(o.Position-m.Position).Magnitude
if p<=f.SutaDistLimit then
return true
end

local q=n or 50
local r=f.SutaYoffset or 3
local s=m.Position
local t=(c.MySpawnPoint and c.MySpawnPoint.Position.Y or 0)

local u=Vector3.new(s.X,t,s.Z)
local v=(s-u).Magnitude

local w
if v>f.SutaDistLimit then
w=s.Y+r
else
w=t+r
end

w=math.max(w,t+r)

local x=CFrame.new(Vector3.new(s.X,w,s.Z))

o.Anchored=false
b.SetNoClip(true)

local y=(o.Position-x.Position).Magnitude/q
local z=TweenInfo.new(y,Enum.EasingStyle.Linear)
local A=j:Create(o,z,{CFrame=x})

A:Play()


local B=false
task.delay(math.min(y+2,5),function()
if A.PlaybackState==Enum.PlaybackState.Playing then
A:Cancel()
B=true
end
end)

A.Completed:Wait()

o.Anchored=true
b.SetNoClip(false)

if B then
b.SafeTeleport(x)
task.wait(0.2)
end

return true
end

function b.ParseFruitUuid(m)
local n=string.split(m,":")[1]
local o=string.match(m,":(%d+)$")
local p=nil
if o then
p=tonumber(o)
end
return n,p
end

function b.EquipItem(m)
local n=i:FindFirstChild("Humanoid")
if n and m then
pcall(function()
n:UnequipTools()
end)
task.wait(0.05)
pcall(function()
n:EquipTool(m)
end)
end
end

function b.UnequipTools()
local m=i:FindFirstChild("Humanoid")
if m then
pcall(function()
m:UnequipTools()
end)
end
end

function b.GetPlayerPosition()
local m=i:FindFirstChild("HumanoidRootPart")
if not m then
return nil
end
return m.Position
end

return b end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()

local b={}
local c
local d
local e=false

local f={}
local g=workspace.Terrain
local h=game:GetService("Lighting")

local i="PlantsESP"
local j="FruitESP"
local k
local l={}
local m=game:GetService("CollectionService")
local n=game:GetService("CoreGui")
local o

function b.Initialize(p)
c=p
d=c.fVar
o=c.Utils.GetSelectedItems
b.SetupTracker()
end

function b.AntiLag()

h.GlobalShadows=false
h.FogEnd=9e9
h.Brightness=2
h.EnvironmentDiffuseScale=0
h.EnvironmentSpecularScale=0
h.OutdoorAmbient=Color3.new(0,0,0)


g.WaterWaveSize=0
g.WaterWaveSpeed=0
g.WaterReflectance=0
g.WaterTransparency=1


local p={
workspace:FindFirstChild("ClientPlants"),
workspace:FindFirstChild("MapPhysical"),
workspace:FindFirstChild("Plots"),
}

local function ApplyToPart(q)







if q:IsA("BasePart")then
q.Material=Enum.Material.SmoothPlastic
q.Reflectance=0
elseif q:IsA("ParticleEmitter")then
q.Enabled=false
elseif q:IsA("Decal")or q:IsA("Texture")then
q.Transparency=1
end
end

for q,r in ipairs(p)do
if r then

for s,t in ipairs(r:GetDescendants())do
if s%200==0 then task.wait()end
ApplyToPart(t)
end


table.insert(
f,
r.DescendantAdded:Connect(function(s)
if e then ApplyToPart(s)end
end)
)
end
end


pcall(function()
settings().Rendering.QualityLevel=Enum.QualityLevel.Level01
end)
end

local function SetVisibility(p,q)
if p:IsA("BasePart")or p:IsA("Decal")or p:IsA("Texture")then
if q then
if not p:GetAttribute("OriginalTrans")then p:SetAttribute("OriginalTrans",p.Transparency)end
p.Transparency=1

if p:IsA("BasePart")then
if p:GetAttribute("OriginalCollide")==nil then p:SetAttribute("OriginalCollide",p.CanCollide)end
p.CanCollide=false
end
else
local r=p:GetAttribute("OriginalTrans")
if r then p.Transparency=r end

if p:IsA("BasePart")then
local s=p:GetAttribute("OriginalCollide")
if s~=nil then p.CanCollide=s end
end
end
elseif p:IsA("ParticleEmitter")or p:IsA("Sparkles")or p:IsA("Fire")or p:IsA("Trail")then
if q then
if p:GetAttribute("OriginalEnabled")==nil then p:SetAttribute("OriginalEnabled",p.Enabled)end
p.Enabled=false
else
local r=p:GetAttribute("OriginalEnabled")
if r~=nil then p.Enabled=r end
end
end
end

local function UpdateVisibilityFromAnchor(p,q,r)
local s=workspace:FindFirstChild("ClientPlants")
if not s then return end

for t,u in ipairs(s:GetDescendants())do
if u.Name==p then
local v=u.Parent
if v then
if r and v:FindFirstChild("FruitAnchor")then continue end
for w,x in ipairs(v:GetChildren())do
SetVisibility(x,q)
end
end
end
end
end

function b.HidePlant(p)
UpdateVisibilityFromAnchor("PlantAnchor",p,true)
end

function b.HideFruit(p)
UpdateVisibilityFromAnchor("FruitAnchor",p,false)
end

local function CreatESP(p,q,r,s,t,u)
if not(p and q and r and s)then return end
local v=u or 0
if l[r]then
l[r]:Destroy()
l[r]=nil
end

local w=Instance.new("BillboardGui")
w.Name="ESP_"..r
w.Adornee=q
w.Size=UDim2.new(0,200,0,80)
w.StudsOffset=Vector3.new(0,3.5,0)
w.AlwaysOnTop=true
w.LightInfluence=0
w.Parent=p

local x=Instance.new("TextLabel")
x.Parent=w
x.Size=UDim2.new(1,0,0,0)
x.AutomaticSize=Enum.AutomaticSize.XY
x.BackgroundTransparency=1
x.TextWrapped=false
if t and t~=""then
x.Text=string.format("%s\n%s",tostring(s),tostring(t))
else
x.Text=tostring(s)
end

if v==3 then
x.TextColor3=Color3.fromRGB(200,200,10)
elseif v==2 then
x.TextColor3=Color3.fromRGB(200,50,10)
elseif v==1 then
x.TextColor3=Color3.fromRGB(10,200,10)
else
x.TextColor3=Color3.fromRGB(200,200,200)
end

x.TextStrokeTransparency=0
x.TextSize=16
x.Font=Enum.Font.FredokaOne

x.AnchorPoint=Vector2.new(0.5,0.5)
x.Position=UDim2.new(0.5,0,0.5,0)
l[r]=w
end

function b.SetEspPlant(p)
local q=c.Options
if not q.tgEspPlants.Value then return end

local r=(p:IsA("Model")and p)or p:FindFirstAncestorOfClass("Model")
if not r then return end
local s=r:GetAttribute("PlantType")
if not s then return end

local t=gethui and gethui()or n
local u=t:FindFirstChild(i)
local v=o(q.ddEspPlants.Value)

if table.find(v,"NONE")then return end

if table.find(v,s)then
local w=r:GetAttribute("Uuid")or r.Name
local x=r:GetAttribute("HiddenNumber")or 0
local y=r:GetAttribute("PlantWeight")or 0
local z=0
if x>=2 then
z=3
elseif x>=1.5 then
z=2
elseif x>=1 then
z=1
end
if y>0 then
CreatESP(u,r,w,"🌱 "..s,string.format("Weight : %.2f kg",y),z)
else
CreatESP(u,r,w,"🌱 "..s,string.format("Scale : %.2f",x),z)
end
end
end

function b.EspPlants(p)
local q=c.Options

local r=gethui and gethui()or n

local s=r:FindFirstChild(i)
if s then s:Destroy()end

if p~=true then return end
local t=o(q.ddEspPlants.Value)
if table.find(t,"NONE")then return end

local u=Instance.new("Folder")
u.Name=i
u.Parent=r

local v=workspace:FindFirstChild("ClientPlants")
if v then
for w,x in pairs(v:GetChildren())do
b.SetEspPlant(x)
end
end
end

function b.SetEspCrops(p)
local q=c.Options
if not q.tgEspCrops.Value then return end

local r=(p:IsA("Model")and p)or p:FindFirstAncestorOfClass("Model")
if not r then return end

local s=r:GetAttribute("PlantType")or(r.Parent and r.Parent:GetAttribute("PlantType"))
if not s then return end

local t=gethui and gethui()or n
local u=t:FindFirstChild(j)
local v=o(q.ddEspCrops.Value)

if table.find(v,"NONE")then return end

if table.find(v,s)then
local w=r:GetAttribute("Uuid")or s
local x=0
for y=1,3 do
x=r:GetAttribute("FruitWeight")or r:GetAttribute("PlantWeight")or 0

if x>0 then break end

task.wait(1)
end

local y=r:GetAttribute("HiddenNumber")or 0
local z=0
if y>=2 then
z=3
elseif y>=1.5 then
z=2
elseif y>=1 then
z=1
end
if x>0 then
CreatESP(u,r,w,"🍎"..s,string.format("Weight : %.2f kg, Scale : %.2f",x,y),z)
else
CreatESP(u,r,w,"🍎"..s,string.format("Scale : %.2f",y),z)
end
end
end

function b.EspCrops(p)
local q=c.Options

local r=gethui and gethui()or n

local s=r:FindFirstChild(j)
if s then s:Destroy()end
if k then
k:Disconnect()
k=nil
end
if p~=true then return end

local t=o(q.ddEspCrops.Value)
if table.find(t,"NONE")then return end

local u=Instance.new("Folder")
u.Name=j
u.Parent=r

for v,w in pairs(m:GetTagged("HarvestPrompt"))do

b.SetEspCrops(w)
end
k=m:GetInstanceAddedSignal("HarvestPrompt"):Connect(function(v)
b.SetEspCrops(v)
end)
end

function b.SetupTracker()
local p=workspace:FindFirstChild("ClientPlants")

if not p then return end

p.DescendantAdded:Connect(function(q)
local r=c.Options
task.wait(0.5)

for s,t in ipairs(q:GetDescendants())do
if t.Name=="PlantAnchor"then
local u=t.Parent

if r.tgEspPlants.Value then
if u:GetAttribute("HarvestablePlant")then
b.SetEspCrops(t)
else
b.SetEspPlant(t)
end
end

if u:GetAttribute("HarvestablePlant")then
if r.tgHideFruits.Value then
for v,w in ipairs(t.Parent:GetChildren())do
SetVisibility(w,true)
end
end
else
if r.tgHidePlants.Value then
for v,w in ipairs(u:GetChildren())do
SetVisibility(w,true)
end
end
end
elseif t.Name=="FruitAnchor"then
local u=t.Parent
if r.tgEspCrops.Value then b.SetEspCrops(t)end
if r.tgHideFruits.Value then
for v,w in ipairs(u:GetChildren())do
SetVisibility(w,true)
end
end
end
end
end)
end

return b end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()

local b={}
local c

local d
local e
local f
local g
local h={}

local i=game:GetService("Players")
local j=i.LocalPlayer
local k=j.Character or j.CharacterAdded:Wait()
local l=k:WaitForChild("Humanoid")

local m=game:GetService("ReplicatedStorage")
local n=m:WaitForChild("RemoteEvents")
local o=n:WaitForChild("PlantSeed")::RemoteFunction
local p=n:WaitForChild("HarvestFruit")::RemoteEvent
local q=n:WaitForChild("SellItems")::RemoteFunction

local r=game:GetService("CollectionService")

function b.Initialize(s)
c=s
d=s.fVar
e=s.Utils.GetSelectedItems
GetRandomPlantPosition=s.Utils.GetRandomPlantPosition
f=s.Utils.TweenToTarget
g=s.Utils.SafeTeleport

c.HarVestCropsList=h
end

function b.AutoPlantsSeeds()
local s=c.Options
if not s.tgPlantsEnable.Value or d.isPlanting or d.IsBuying()then
return
end

pcall(function()
l:UnequipTools()
end)
local t=s.ddPlantsPos.Value
local u
local v=nil
local w=j.Backpack
local x=e(s.ddPlantsSeeds.Value)

if w then
for y,z in pairs(w:GetChildren())do
if not s.tgPlantsEnable.Value or d.IsBuying()then
break
end
if z:GetAttribute("Type")=="Seeds"and(table.find(x,"ALL")or table.find(x,z:GetAttribute("PlantType")))then
d.isPlanting=true

local A=z:GetAttribute("ItemCount")or 0
for B=1,A do
if not s.tgPlantsEnable.Value or d.IsBuying()then
d.isPlanting=false
break
end

if t=="Player"then
u=k:GetPivot()
else
if t=="Random"then
u=GetRandomPlantPosition()
elseif t=="Here"then
if not v then
v=k:GetPivot()
end
u=v
end
f(CFrame.new(u.X+3,u.Y,u.Z),100)
end
pcall(function()
l:EquipTool(z)
end)
local C={
z:GetAttribute("PlantType"),
u.Position,
}
o:InvokeServer(unpack(C))
task.wait(0.3)
pcall(function()
l:UnequipTools()
end)
end
pcall(function()
l:UnequipTools()
end)
end
end
d.isPlanting=false
end
end

local function GetHarvestConfig()
local s=c.Options
return{
mode="Harvest",
wl={
crops=e(s.ddHarvestCrops.Value),
mutants=e(s.ddHarvestMutants.Value),
ripeness=e(s.ddRipeness.Value),
ripenessMulti=tonumber(s.ipRipenessMulti.Value)or 0,
variant=e(s.ddVariant.Value),
weightCondition=s.ddWeight.Value,
weightValue=tonumber(s.ipWeight.Value)or 0,
scaleCondition="",
scaleValue=0,
},
bl={
crops=e(s.ddHarvestBlackCrops.Value),
ripeness=e(s.ddBlackRipeness.Value),
variant=e(s.ddBlackVariant.Value),
mutants=e(s.ddHarvestBlackMutants.Value),
},
}
end

function b.CheckCrops(s,t)
local u=s:GetAttribute("PlantType")or(s.Parent and s.Parent:GetAttribute("PlantType"))or"Fruit"
local v=s:GetAttribute("RipenessStage")
local w=s:GetAttribute("Variant")
local x=s:GetAttribute("Mutation")

if not table.find(t.wl.crops,"ALL")and not table.find(t.wl.crops,u)then
return false
end
if s:GetAttribute("Favorited")==true then
return false
end
if not table.find(t.wl.ripeness,"ALL")and not table.find(t.wl.ripeness,v)then
return false
end
local y=s:GetAttribute("RipenessMultiplier")
if t.wl.ripenessMulti~=0 and(not y or y<t.wl.ripenessMulti)then
return false
end
if not table.find(t.wl.variant,"ALL")and not table.find(t.wl.variant,w)then
return false
end

if not table.find(t.wl.mutants,"ALL")then
if not x or x==""then
return false
end
local z=string.split(x,",")
local A=false
for B,C in ipairs(z)do
if table.find(t.wl.mutants,C)then
A=true
end
end
if not A then
return false
end
end

local z=s:GetAttribute("FruitWeight")or s:GetAttribute("PlantWeight")
if not z then
if t.mode=="Harvest"then
return false
elseif t.mode=="Remove"then
if t.wl.scaleValue~=0 then
local A=s:GetAttribute("HiddenNumber")
if not A then
return false
end
local B=tonumber(A)
if t.wl.scaleCondition=="Below"and B>=t.wl.scaleValue then
return false
end
if t.wl.scaleCondition=="Above"and B<=t.wl.scaleValue then
return false
end
end
end
else
if t.wl.weightValue~=0 then
local A=tonumber(z)
if t.wl.weightCondition=="Below"and A>=t.wl.weightValue then
return false
end
if t.wl.weightCondition=="Above"and A<=t.wl.weightValue then
return false
end
end
end

if not table.find(t.bl.crops,"NONE")and table.find(t.bl.crops,u)then
return false
end
if not table.find(t.bl.ripeness,"NONE")and table.find(t.bl.ripeness,v)then
return false
end
if not table.find(t.bl.variant,"NONE")and table.find(t.bl.variant,w)then
return false
end

if not table.find(t.bl.mutants,"NONE")then
if x and x~=""then
local A=string.split(x,",")
local B=false
for C,D in ipairs(A)do
if table.find(t.bl.mutants,D)then
B=true
end
end
if B then
return false
end
end
end

return true
end

function b.ScanCrops()
local s=c.Options
if not s.tgHarvestEnable.Value then
return
end
table.clear(h)


local t=GetHarvestConfig()
for u,v in pairs(r:GetTagged("HarvestPrompt"))do
if v.Enabled then
local w=v.Parent.Parent

if b.CheckCrops(w,t)then
table.insert(h,w)
end
end
end


if#h>1 then
table.sort(h,function(u,v)
local w=u:GetAttribute("PlantType")or(u.Parent and u.Parent:GetAttribute("PlantType"))or"Fruit"
local x=v:GetAttribute("PlantType")or(v.Parent and v.Parent:GetAttribute("PlantType"))or"Fruit"
return w<x
end)
end
c.HarVestCropsList=h
end
function b.ScanCrops2()
local s=c.Options
if d.isPlanting or d.IsBuying()or d.isProcessing or d.HarvestPause then
return
end
if d.isHarvesting or not s.tgHarvestEnable.Value then
return
end

table.clear(h)




if d.isPlanting or d.IsBuying()or d.isProcessing or d.HarvestPause then
return
end





local t=workspace:FindFirstChild("ClientPlants")
if t then
for u,v in t:GetChildren()do
if d.isPlanting or d.IsBuying()or d.isProcessing or d.HarvestPause then
return
end
local w=GetHarvestConfig()
local x=v:GetAttribute("HarvestablePlant")and{v}or v:GetChildren()
for y,z in ipairs(x)do
local A=z:GetAttribute("FullyGrown")
if A then
if b.CheckCrops(z,w)then
table.insert(h,z)
end
end
end
end
end

end

function b.HarvestCrops()
local s=c.Options
local t=c.fVar
local u=c.Utils.ParseFruitUuid
local v=c.Utils.TweenToTarget
h=c.HarVestCropsList
if t.isPlanting or t.IsBuying()then
return
end
if t.HarvestPause or t.isProcessing or t.isHarvesting or not s.tgHarvestEnable.Value then
return
end

if#h>0 then
t.isHarvesting=true
local w=table.remove(h,1)

local x=w:FindFirstChild("HarvestPrompt",true)
if not w or not w.Parent or not x or not x.Enabled then
t.isHarvesting=false
return
end

local y=CFrame.new(w:GetPivot().Position+Vector3.new(3,0,0))

v(y,100)
task.wait(0.1)
local z,A=u(w:GetAttribute("Uuid"))
local B={}
if A then
B={
{
{
GrowthAnchorIndex=A,
Uuid=z,
},
},
}
else
B={
{
{
Uuid=z,
},
},
}
end
pcall(function()
p:FireServer(unpack(B))
end)
task.wait(0.1)
end
t.isHarvesting=false
end

local function GetSellConfig()
local s=c.Options
return{
mode="Sell",
wl={
crops=e(s.ddSellCrops.Value),
ripeness=e(s.ddSellRipeness.Value),
mutants=e(s.ddSellMutants.Value),
weightCondition=s.ddSellWeight.Value,
weightValue=tonumber(s.ipSellWeight.Value)or 0,
valueCondition=s.ddSellValue.Value,
valueValue=tonumber(s.ipSellValue.Value)or 0,
},
bl={
crops=e(s.ddSellBlackCrops.Value),
ripeness=e(s.ddSellBlackRipeness.Value),
mutants=e(s.ddSellBlackMutants.Value),
},
}
end

function b.CheckSellItem(s,t)
local u=s:GetAttribute("BaseName")or s.Name
local v=s:GetAttribute("RipenessStage")
local w=s:GetAttribute("Mutation")
local x=tonumber(s:GetAttribute("FruitWeight"))or 0
local y=tonumber(s:GetAttribute("FruitValue"))or 0


if not table.find(t.bl.crops,"NONE")and table.find(t.bl.crops,u)then
return false
end


if not table.find(t.wl.ripeness,"ALL")and not table.find(t.wl.ripeness,v)then
return false
end
if not table.find(t.bl.ripeness,"NONE")and table.find(t.bl.ripeness,v)then
return false
end


if not table.find(t.wl.mutants,"ALL")then
if not w or w==""then
return false
end
local z=string.split(w,",")
local A=false
for B,C in ipairs(z)do
if table.find(t.wl.mutants,C)then
A=true
end
end
if not A then
return false
end
end
if not table.find(t.bl.mutants,"NONE")then
if w and w~=""then
local z=string.split(w,",")
local A=false
for B,C in ipairs(z)do
if table.find(t.bl.mutants,C)then
A=true
end
end
if A then
return false
end
end
end


if t.wl.weightValue~=0 then
if t.wl.weightCondition=="Below"and x>=t.wl.weightValue then
return false
end
if t.wl.weightCondition=="Above"and x<=t.wl.weightValue then
return false
end
end


if t.wl.valueValue~=0 then
if t.wl.valueCondition=="Below"and y>=t.wl.valueValue then
return false
end
if t.wl.valueCondition=="Above"and y<=t.wl.valueValue then
return false
end
end

return true
end

function b.AutoSellCrops()
local s=c.Options
local t=c.Utils.EquipItem
local u=c.Utils.UnequipTools
if not s.tgSellCropsEnable.Value or d.isSelling then
return
end

local v=j.Backpack
if not v then
return
end

local w={}
local x=GetSellConfig()


if not s.tgSellAllCropsEnable.Value then
for y,z in ipairs(v:GetChildren())do
if z:IsA("Tool")and z:GetAttribute("IsHarvested")then
if b.CheckSellItem(z,x)then
table.insert(w,z)
end
end
end
else
for y,z in ipairs(v:GetChildren())do
if z:IsA("Tool")and z:GetAttribute("IsHarvested")then
table.insert(w,z)
break
end
end
end


if#w>0 then
d.isSelling=true
d.HarvestPause=true
u()

g(d.Pos.Sell)
task.wait(0.5)

if not s.tgSellAllCropsEnable.Value then

for y,z in ipairs(w)do
if z and z.Parent==v then
t(z)
task.wait(0.1)
q:InvokeServer("SellSingle")
task.wait(0.1)
end
end
else

q:InvokeServer("SellAll")
end


task.wait(2)
g(c.MySpawnPoint)
task.wait(0.3)
d.isSelling=false
d.HarvestPause=false
end
end

return b end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()

local b={}
local c
local d

local e=game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents")
local f=e:WaitForChild("PurchaseShopItem")::RemoteFunction

function b.Initialize(g)
c=g
d=c.fVar
end

function b.AutoBuyItem(g,h,i)
local j=c.Utils.GetSelectedItems
local k=c.Utils.SafeTeleport

local l=d.Pos
local m=c.MySpawnPoint
if not h then return end
d.HarvestPause=true
if g=="SeedShop"then
d.isBuyingSeed=true
else
d.isBuyingGear=true
end

local n=j(i)
k(l[g])
task.wait(0.5)

for o,p in pairs(h)do
if table.find(n,"ALL")or table.find(n,o)then
for q=1,tonumber(p.Amount)or 0 do
f:InvokeServer(g,o)
task.wait(0.2)
end
end
end

k(m)
task.wait(1)
if g=="SeedShop"then
d.isBuyingSeed=false
else
d.isBuyingGear=false
end
d.HarvestPause=false
task.wait(0.2)
end

function b.AutoBuySeed(g)
local h=c.Options
if not h.tgBuySeedEnable.Value then return end
b.AutoBuyItem("SeedShop",g,h.ddBuySeeds.Value)
end

function b.AutoBuyGear(g)
local h=c.Options
if not h.tgBuyGearEnable.Value then return end
b.AutoBuyItem("GearShop",g,h.ddBuyGear.Value)
end
return b end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()

local b={}
local c
local d

function b.Initialize(e)
c=e
d=c.fVar
end

function b.processQueue()
if d.isProcessing then return end
d.isProcessing=true
d.HarvestPause=true
task.wait(0.2)

while#d.actionQueue>0 do
local e=table.remove(d.actionQueue,1)
pcall(function()
if e.args~=nil then
e.FuncName(e.args)
else
e.FuncName()
end
end)
end
d.isProcessing=false
d.HarvestPause=false
task.wait(0.5)
end

return b end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()

local b=(getfenv()::any).getgenv
local c=(getfenv()::any).getgc
local d={}
local e
local f
local g=Random.new()


local h=game:GetService("Players")
local i=h.LocalPlayer
local j=i.Character or i.CharacterAdded:Wait()

local k=game:GetService("ReplicatedStorage")
local l=k:WaitForChild("RemoteEvents")
local m=l:WaitForChild("ClaimQuest")::RemoteEvent
local n=l:WaitForChild("RemovePlant")::RemoteEvent
local o=l:WaitForChild("TrowelAction")::RemoteEvent
local p=l:WaitForChild("TrowelCancel")::RemoteEvent

local q=k:WaitForChild("RNGPacks"):WaitForChild("RNGPackManager")::any
require(q)

local r=k:WaitForChild("RemoteEvents"):WaitForChild("RequestSpin")

function d.Initialize(s)
e=s
f=s.Utils.GetSelectedItems
end

local function GetRemoveConfig()
local s=e.Options
return{
mode="Remove",
wl={
crops=f(s.ddRemoveCrops.Value),
mutants=f(s.ddRemoveMutants.Value),
ripeness=f(s.ddRemoveRipeness.Value),
ripenessMulti=tonumber(s.ipRemoveRipenessMulti.Value)or 0,
variant=f(s.ddRemoveVariant.Value),
weightCondition=s.ddRemoveWeight.Value,
weightValue=tonumber(s.ipRemoveWeight.Value)or 0,
scaleCondition=s.ddRemoveScale.Value,
scaleValue=tonumber(s.ipRemoveScale.Value)or 0,
},
bl={
crops=f(s.ddRemoveBlackCrops.Value),
ripeness=f(s.ddRemoveBlackRipeness.Value),
variant=f(s.ddRemoveBlackVariant.Value),
mutants=f(s.ddRemoveBlackMutants.Value),
},
}
end

function d.AutoClaimQuest(s)
local t=e.Options
local u=e.fVar
if not t.tgQuestEnable.Value or u.isQuestClaiming or not s then
return
end

u.isQuestClaiming=true
local v=s.Daily.Active
for w,x in pairs(v)do
if x.CompletedAt and not x.Claimed then
m:FireServer("Daily",w)
end
end

local w=s.Weekly.Active
for x,y in pairs(w)do
if y.CompletedAt and not y.Claimed then
m:FireServer("Weekly",x)
end
end
u.isQuestClaiming=false
end

local function ProcessRemove(s)
local t=workspace:FindFirstChild("ClientPlants")
if not t then
return
end

local u=e.Options
local v=e.Utils

local w=e.Main

local x=i.Backpack
local y=x:FindFirstChild("Shovel",true)or j:FindFirstChild("Shovel",true)
if not y then
return
end

local z=s and v.GetSelectedItems(u.ddRemoveCrops.Value)or v.GetSelectedItems(u.ddRemovePlants.Value)
local A=s and GetRemoveConfig()or nil

local B=0
local C=""
if not s then
C=u.ddRemovePlantsScale.Value
B=tonumber(u.ipRemovePlantsScale.Value)or 0
end

local function CheckPlantsScale(D)
if B==0 then
return true
end
local E=D:GetAttribute("HiddenNumber")
if not E then
return false
end
local F=tonumber(E)
if C=="Below"then
return F<B
elseif C=="Above"then
return F>B
end
return false
end

local function PerformDig(D)
v.UnequipTools()
task.wait()
v.EquipItem(y)
task.wait()
local E=CFrame.new(D:GetPivot().Position+Vector3.new(3,0,4))
v.TweenToTarget(E,100)

local F,G=v.ParseFruitUuid(D:GetAttribute("Uuid"))
if s then
if G then
n:FireServer(F,G)
else
n:FireServer(F)
end
else
n:FireServer(F)
end
task.wait()
end

for D,E in pairs(t:GetChildren())do
local F=s and u.tgRemoveFruitEnable.Value or u.tgRemovePlantsEnable.Value
if not F then
break
end

local G=E:GetAttribute("PlantType")
if G and(table.find(z,"ALL")or table.find(z,G))then
if s then
local H=E:GetAttribute("HarvestablePlant")and{E}or E:GetChildren()
for I,J in pairs(H)do
if not u.tgRemoveFruitEnable.Value then
break
end
if J:IsA("Model")and w.CheckCrops(J,A)then
PerformDig(J)
end
end
else
if CheckPlantsScale(E)then
PerformDig(E)
end
end
end
end
end

function d.RemovePlants()
local s=e.Options
local t=e.fVar
if not s.tgRemovePlantsEnable.Value or t.isRemovePlants then
return
end
t.isRemovePlants=true
ProcessRemove(false)
t.isRemovePlants=false
end

function d.RemoveCrops()
local s=e.Options
local t=e.fVar
if not s.tgRemoveFruitEnable.Value or t.isRemoveCrops then
return
end
t.isRemoveCrops=true
ProcessRemove(true)
t.isRemoveCrops=false
end


d.BackupFuncs=d.BackupFuncs or{
RNGManager=nil,
CutsceneManager=nil,
Originals={},
}

function d.disablePackAnimations()

if not d.BackupFuncs.RNGManager then
for s,t in pairs(c(true))do
if type(t)=="table"then
if rawget(t,"RunSpinAnimation")then
d.BackupFuncs.RNGManager=t
d.BackupFuncs.Originals["RunSpinAnimation"]=t.RunSpinAnimation
d.BackupFuncs.Originals["ShowcaseRewards"]=t.ShowcaseRewards
d.BackupFuncs.Originals["Initiate"]=t.Initiate
end
if rawget(t,"Play")and rawget(t,"Preload")then
d.BackupFuncs.CutsceneManager=t
d.BackupFuncs.Originals["Play"]=t.Play
end
end
end
end


local s=d.BackupFuncs.RNGManager
if s then
s.RunSpinAnimation=function()
return
end
s.ShowcaseRewards=function()
return
end
s.Initiate=function()
return
end
end

local t=d.BackupFuncs.CutsceneManager
if t then
t.Play=function()
return
end
end

b().fLog("🚫 ปิดแอนิเมชันแล้ว")


end

function d.enablePackAnimations()

if d.BackupFuncs.RNGManager then
local s=d.BackupFuncs.RNGManager
local t=d.BackupFuncs.Originals

if s and t["RunSpinAnimation"]then
s.RunSpinAnimation=t["RunSpinAnimation"]
s.ShowcaseRewards=t["ShowcaseRewards"]
s.Initiate=t["Initiate"]
end

local u=d.BackupFuncs.CutsceneManager
if u and t["Play"]then
u.Play=t["Play"]
end

b().fLog("🎬 เปิดแอนิเมชันกลับมาเหมือนเดิมแล้ว")
end
end

function d.OpenPack()
local s=e.Options
local t=e.sData
local u=e.Utils

if not s.tgOpenPackEnable.Value then
return
end
local v=f(s.ddOpenPackSelect.Value)
if table.find(v,"ALL")then
v=t.SeedPackTable
end
u.UnequipTools()
task.wait()
local w=i.Backpack
if not w then
b().fLog("No Backpack")
end
for x,y in pairs(w:GetChildren())do
if not s.tgOpenPackEnable.Value then
return
end
local z=y:GetAttribute("BaseName")
if table.find(v,z)then
local A=y:GetAttribute("ItemCount")or 0
for B=1,A do
if not s.tgOpenPackEnable.Value then
return
end
u.EquipItem(y)
task.wait()
local C,D=pcall(function()
return r:InvokeServer()
end)

if C and D and D.RewardId then
b().fLog("🌱 ได้รับไอเทมแล้ว: "..tostring(D.RewardId))
else
b().fLog("❌ เปิดไม่สำเร็จ (อาจจะไม่มีซองในมือ หรือติด Cooldown)")
end
task.wait(0.5)
end
end
end
if s.tgOpenPackEnable.Value then
s.tgOpenPackEnable:SetValue(false)
b().fLog("✅ เปิดซองทั้งหมดเรียบร้อยแล้ว ระบบพักการทำงาน")
end
end

local function getSafeOffset()
local s=g:NextInteger(5,20)/10
local t=math.random(1,2)==1 and 1 or-1
return s*t
end

function d.Trowel()
local s=e.Options
local t=e.fVar
local u=e.Utils
local v=workspace:FindFirstChild("ClientPlants")

if not s.tgTrowelEnable.Value or not t.Pos.Trowel or t.isTroweling then
return
end
t.isTroweling=true
u.UnequipTools()
task.wait()
local w=i.Backpack
local x=nil

for y,z in pairs(w:GetChildren())do
if z:GetAttribute("BaseName")=="Trowel"then
x=z
break
end
end

if not x then
b().fLog("🟡 No Trowel")
t.isTroweling=false
return
end

u.EquipItem(x)
task.wait(0.2)

local y=u.GetSelectedItems(s.ddTrowelSelect.Value)
for z,A in pairs(v:GetChildren())do
local B=A:GetAttribute("PlantType")
if B and(table.find(y,"ALL")or table.find(y,B))then
local C=A:GetAttribute("FullyGrown")
if not C then
continue
end
local D=CFrame.new(A:GetPivot().Position+Vector3.new(3,0,4))
local E=A:GetAttribute("Uuid")
local F=A:GetAttribute("AppliedRotationY")
u.SafeTeleport(D)
task.wait(0.2)
local G=A:FindFirstChildWhichIsA("Highlight")
if G then
G.Parent=game:GetService("Lighting")
end
local H={
{
Action="Pickup",
PlantUuid=E,
},
}
local I=o:InvokeServer(unpack(H))

if not I then
b().fLog("🔴 Server ปฏิเสธการหยิบต้นไม้! กำลังรีเซ็ตเกรียง...")
p:FireServer()
continue
end

task.wait(0.5)

local J=CFrame.new(t.Pos.Trowel+Vector3.new(3,0,4))
u.SafeTeleport(J)
task.wait(0.2)
local K=getSafeOffset()
local L=getSafeOffset()

local M=t.Pos.Trowel.X+K
local N=t.Pos.Trowel.Y+0.1
local O=t.Pos.Trowel.Z+L
local P={
{
PlantUuid=E,
Position=vector.create(M,N,O),
Action="Place",
RotationY=F,
},
}
o:InvokeServer(unpack(P))
task.wait(1.2)
end
end
if s.tgTrowelEnable.Value then
s.tgTrowelEnable:SetValue(false)
b().fLog("🟢 ย้ายต้นไม้เรียบร้อยแล้ว ระบบพักการทำงาน")
end
u.UnequipTools()
t.isTroweling=false
end

return d end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()

local b={}
local c


function b.Initialize(d)
c=d


game.DescendantAdded:Connect(function(e)
b.hookIncoming(e)
end)


for e,f in ipairs(game:GetDescendants())do
b.hookIncoming(f)
end
end

local function RemoteReplicaSet(d)
local e=c.fVar
local f=e.actionQueue

if type(d[2])~="table"then return end
local g=d[2][1]
local h=d[3]
if g=="SeedShop"and not e.isBuyingSeed then
table.insert(f,{
FuncName=c.Shop.AutoBuySeed,
args=h.Items,
})
elseif g=="GearShop"and not e.isBuyingGear then
table.insert(f,{
FuncName=c.Shop.AutoBuyGear,
args=h.Items,
})
elseif g=="Money"then
end
end

local function RemoteNotification(d)
local e=c.fVar
local f=e.actionQueue
if d[1]and type(d[1])=="string"then
local g=string.lower(d[1])
if string.find(g,"inventory is full!")then
e.HarvestPause=true
if c.HarVestCropsList then
table.clear(c.HarVestCropsList)
end
table.insert(f,{
FuncName=c.Main.AutoSellCrops,
})
end
end
end



function b.hookIncoming(d)
local e=c.fVar.actionQueue
if d:IsA("RemoteEvent")then
d.OnClientEvent:Connect(function(...)
local f=d.Name
local g={...}
if f=="ReplicaSet"then
RemoteReplicaSet(g)
elseif f=="Notification"then
RemoteNotification(g)
elseif f=="UpdateQuests"then
table.insert(e,{
FuncName=c.Auto.AutoClaimQuest,
args=g[1],
})










end
end)
end
end

return b end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()


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
Title="Garden Horizons",
SubTitle="2569.03.26-09.21",
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
e:SetFolder("EfHub/GHZs")

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
j.BackgroundColor3=Color3.fromRGB(20,20,100)
j.Position=UDim2.new(0,10,0.5,0)
j.Size=UDim2.new(0,50,0,50)
j.Text="EF"
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
c.SaveManager.Options.SaveManager_ConfigList:SetValue("Horizons")
c.SaveManager:Load("Horizons")
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
c.SaveManager:Save("Horizons")
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
local k,l
function b.Initialize(m)
c=m.Interface
d=m.Tabs
e=m.Options
f=m.Window.QuickSave
g=m.sData
h=m.fVar
i=m.Main
j=m.fVar.actionQueue
d.Main=c:AddTab({Title="Main",Icon="dices"})
local n=d.Main:AddCollapsibleSection("Plants",false)
n:AddToggle("tgPlantsEnable",{
Title="Auto Plants",
Default=false,
Callback=function(o)
if o then
k=task.spawn(function()
while true do
if not h.isPlanting then i.AutoPlantsSeeds()end
task.wait(30)
end
end)
else
if k then
task.cancel(k)
k=nil
end
h.isPlanting=false
end
f()
end,
})
n:AddButton({
Title="Clear Selected Seeds",
Callback=function()
e.ddPlantsSeeds:SetValue({})
end,
})
n:AddDropdown("ddPlantsSeeds",{
Title="Select Seeds",
Values=g.PlantDataTable,
Multi=true,
Default={},
Searchable=true,
Callback=function(o)
f()
end,
})

n:AddDropdown("ddPlantsPos",{
Title="Select Plants Position",
Values={"Player","Random","Here"},
Default="Player",
Callback=function(o)
f()
end,
})




local o=d.Main:AddCollapsibleSection("Harvest",false)
o:AddToggle("tgHarvestEnable",{
Title="Auto Harvest",
Default=false,
Callback=function(p)
if p then
l=task.spawn(function()
while task.wait(0.3)do
if not h.isHarvesting and not h.HarvestPause then
if#m.HarVestCropsList>0 then
i.HarvestCrops()
else
i.ScanCrops2()
end
elseif h.HarvestPause then
if#m.HarVestCropsList>0 then table.clear(m.HarVestCropsList)end
end
end
end)
else
if l then
task.cancel(l)
l=nil
table.clear(m.HarVestCropsList)
end
h.isHarvesting=false
end
f()
end,
})

o:AddDivider()

o:AddButton({
Title="Clear Selected Crops",
Callback=function()
e.ddHarvestCrops:SetValue({ALL=true})
end,
})
o:AddDropdown("ddHarvestCrops",{
Title="Select Crops",
Values=g.PlantDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(p)
f()
end,
})
o:AddButton({
Title="Clear Backlist Crops",
Callback=function()
e.ddHarvestBlackCrops:SetValue({NONE=true})
end,
})
o:AddDropdown("ddHarvestBlackCrops",{
Title="Blacklist Crops",
Values=g.PlantDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(p)
f()
end,
})

o:AddDivider()
o:AddButton({
Title="Clear Selected Mutant",
Callback=function()
e.ddHarvestMutants:SetValue({ALL=true})
end,
})

o:AddDropdown("ddHarvestMutants",{
Title="Select Mutants",
Values=g.MutationDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(p)
f()
end,
})

o:AddButton({
Title="Clear Backlist Mutant",
Callback=function()
e.ddHarvestBlackMutants:SetValue({NONE=true})
end,
})

o:AddDropdown("ddHarvestBlackMutants",{
Title="Backlist Mutants",
Values=g.MutationDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(p)
f()
end,
})

o:AddDivider()
o:AddDropdown("ddRipeness",{
Title="Ripeness Stage",
Values={"ALL","Unripe","Ripened","Lush"},
Default={"Lush"},
Multi=true,
Callback=function(p)
f()
end,
})

o:AddInput("ipRipenessMulti",{
Title="Ripeness Multiplier",
Default=3,
Numeric=false,
Finished=false,
Callback=function(p)
f()
end,
})

o:AddDropdown("ddBlackRipeness",{
Title="Backlist Ripeness Stage",
Values={"NONE","Unripe","Ripened","Lush"},
Default={"NONE"},
Multi=true,
Callback=function(p)
f()
end,
})

o:AddDivider()
o:AddDropdown("ddVariant",{
Title="Variant",
Values={"ALL","Silver","Gold"},
Default={"ALL"},
Multi=true,
Callback=function(p)
f()
end,
})
o:AddDropdown("ddBlackVariant",{
Title="Backlist Variant",
Values={"NONE","Silver","Gold"},
Default={"NONE"},
Multi=true,
Callback=function(p)
f()
end,
})
o:AddDivider()
o:AddDropdown("ddWeight",{
Title="Weight",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function(p)
f()
end,
})
o:AddInput("ipWeight",{
Title="Weight",
Default=0,
Numeric=true,
Finished=true,
Callback=function(p)
f()
end,
})




local p=d.Main:AddCollapsibleSection("Sell",false)
p:AddToggle("tgSellCropsEnable",{
Title="Sell",
Default=false,
Callback=function(q)




f()
end,
})

p:AddToggle("tgSellAllCropsEnable",{
Title="Sell All Crops",
Default=false,
Callback=function(q)
f()
end,
})

p:AddDivider()

p:AddButton({
Title="Clear Sell Crops",
Callback=function()
e.ddSellCrops:SetValue({ALL=true})
end,
})
p:AddDropdown("ddSellCrops",{
Title="Select Crops to Sell",
Values=g.PlantDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(q)
f()
end,
})
p:AddButton({
Title="Clear Blacklist Crops",
Callback=function()
e.ddSellBlackCrops:SetValue({NONE=true})
end,
})
p:AddDropdown("ddSellBlackCrops",{
Title="Blacklist Crops",
Values=g.PlantDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(q)
f()
end,
})

p:AddDivider()
p:AddDropdown("ddSellRipeness",{
Title="Ripeness Stage",
Values={"ALL","Unripe","Ripened","Lush"},
Default={"ALL"},
Multi=true,
Callback=function(q)
f()
end,
})
p:AddDropdown("ddSellBlackRipeness",{
Title="Blacklist Ripeness Stage",
Values={"NONE","Unripe","Ripened","Lush"},
Default={"NONE"},
Multi=true,
Callback=function(q)
f()
end,
})

p:AddDivider()
p:AddButton({
Title="Clear Selected Mutant",
Callback=function()
e.ddSellMutants:SetValue({ALL=true})
end,
})
p:AddDropdown("ddSellMutants",{
Title="Select Mutants",
Values=g.MutationDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(q)
f()
end,
})
p:AddButton({
Title="Clear Blacklist Mutant",
Callback=function()
e.ddSellBlackMutants:SetValue({NONE=true})
end,
})
p:AddDropdown("ddSellBlackMutants",{
Title="Blacklist Mutants",
Values=g.MutationDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(q)
f()
end,
})

p:AddDivider()
p:AddDropdown("ddSellWeight",{
Title="Weight Filter",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function(q)
f()
end,
})
p:AddInput("ipSellWeight",{
Title="Weight Value",
Default=0,
Numeric=true,
Finished=true,
Callback=function(q)
f()
end,
})

p:AddDivider()
p:AddDropdown("ddSellValue",{
Title="Value (Price) Filter",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function(q)
f()
end,
})
p:AddInput("ipSellValue",{
Title="Price Value",
Default=0,
Numeric=true,
Finished=true,
Callback=function(q)
f()
end,
})
p:AddSpacer(10)
end
return b end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()

local b={}
local c

local d=game:GetService("ReplicatedStorage")
local e=d:WaitForChild("RemoteEvents")
local f=e:WaitForChild("GetShopData")::RemoteFunction
function b.Initialize(g)
c=g
local h=c.Options
local i=c.Interface
local j=c.Tabs
local k=c.Window.QuickSave
local l=c.fVar.actionQueue
local m=c.sData

j.Shop=i:AddTab({Title="Shop",Icon="shopping-cart"})
local n=j.Shop:AddCollapsibleSection("Buy Seed",false)










local function tempBuy(o)
local p=f:InvokeServer(o)
if not p then return end
local q
if o=="SeedShop"then
q=c.Shop.AutoBuySeed
elseif o=="GearShop"then
q=c.Shop.AutoBuyGear
end
table.insert(l,{
FuncName=q,
args=p.Items,
})
end

n:AddToggle("tgBuySeedEnable",{
Title="Auto Buy Seed",
Default=false,
Callback=function(o)
if o then
if tempBuy then tempBuy("SeedShop")end
end
k()
end,
})
n:AddButton({
Title="Clear Selected Seeds",
Callback=function()
h.ddBuySeeds:SetValue({ALL=true})
end,
})
n:AddDropdown("ddBuySeeds",{
Title="Select Seed",
Values=m.SeedShopTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(o)
k()
end,
})

local o=j.Shop:AddCollapsibleSection("Buy Gear",false)
o:AddToggle("tgBuyGearEnable",{
Title="Auto Buy Gear",
Default=false,
Callback=function(p)
if p then
if tempBuy then tempBuy("GearShop")end
end
k()
end,
})
o:AddButton({
Title="Clear Selected Gear",
Callback=function()
h.ddBuyGear:SetValue({ALL=true})
end,
})
o:AddDropdown("ddBuyGear",{
Title="Select Gear",
Values=m.GearShopTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(p)
k()
end,
})
end

return b end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()

local b={}
local c

local d=game:GetService("ReplicatedStorage")
local e=d:WaitForChild("RemoteEvents")
local f=e:WaitForChild("SellItems")::RemoteFunction

function b.Initialize(g)
c=g
local h=g.Options
local i=g.Interface
local j=g.Tabs
local k=g.Window.QuickSave
local l=g.fVar.actionQueue
local m=g.Misc
local n=g.sData

local o

j.MiscTab=i:AddTab({Title="Misc",Icon="flower"})
local p=j.MiscTab:AddCollapsibleSection("Misc",false)
p:AddButton({
Title="Reset Control Var",
Callback=function()
c.fVar.ResetControlVar()
end,
})
local q=j.MiscTab:AddCollapsibleSection("New Player",false)
q:AddToggle("tgNewPlayerSell",{
Title="New Playe Auto Sell",
Default=false,
Callback=function(r)
if r then
o=task.spawn(function()
while true do
table.insert(l,{FuncName=b.NewPlayerAutoSell,Args={}})
local s=(tonumber(h.ipNewPlayerSell.Value)or 5)*60
task.wait(s)
end
end)
else
if o then
task.cancel(o)
o=nil
end
end

end,
})
q:AddInput("ipNewPlayerSell",{
Title="Auto Sell Delay (Minutes)",
Default=5,
Numeric=true,
Finished=true,
Callback=function(r)
k()
end,
})

local r=j.MiscTab:AddCollapsibleSection("AntiLag",false)
r:AddToggle("tgAntiLag",{
Title="AntiLag",
Default=false,
Callback=function(s)
if s then m.AntiLag()end
k()
end,
})

r:AddToggle("tgHideFruits",{
Title="Hide Fruits",
Default=false,
Callback=function(s)
if s then
m.HideFruit(true)
else
m.HideFruit(false)
end
k()
end,
})

r:AddToggle("tgHidePlants",{
Title="Hide Plants",
Default=false,
Callback=function(s)
if s then
m.HidePlant(true)
else
m.HidePlant(false)
end
k()
end,
})

local s=j.MiscTab:AddCollapsibleSection("Esp",false)
s:AddToggle("tgEspCrops",{
Title="Esp Crops",
Default=false,
Callback=function(t)
m.EspCrops(t)
k()
end,
})
s:AddButton({
Title="Clear Selected Crops",
Callback=function()
h.ddEspCrops:SetValue({NONE=true})
end,
})
s:AddDropdown("ddEspCrops",{
Title="Select Crops",
Values=n.PlantDataBlackTable,
Default={"NONE"},
Multi=true,
Searchable=true,
Callback=function(t)
k()
end,
})
s:AddToggle("tgEspPlants",{
Title="Esp Plants",
Default=false,
Callback=function(t)
m.EspPlants(t)
k()
end,
})
s:AddButton({
Title="Clear Selected Plants",
Callback=function()
h.ddEspPlants:SetValue({NONE=true})
end,
})
s:AddDropdown("ddEspPlants",{
Title="Select Plants",
Values=n.PlantDataBlackTable,
Default={"NONE"},
Multi=true,
Searchable=true,
Callback=function(t)
k()
end,
})
end

function b.NewPlayerAutoSell()
local g=c.fVar
local h=c.Utils.SafeTeleport
local i=c.Utils.UnequipTools

g.isSelling=true
g.HarvestPause=true
g.isPlanting=true
i()

h(g.Pos.Sell)
task.wait(0.5)

f:InvokeServer("SellAll")
task.wait(2)
h(c.MySpawnPoint)
task.wait(0.3)
g.isSelling=false
g.HarvestPause=false
g.isPlanting=false
end

return b end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end do local function __modImpl()

local b={}
local c
local d
local e
local f
local g=false
local h=game:GetService("ReplicatedStorage")
local i=h:WaitForChild("RemoteEvents")
local j=i:WaitForChild("GetIGMAData")::RemoteFunction
local k=i:WaitForChild("IGMATurnIn")::RemoteFunction
local l=i:WaitForChild("RestartIGMA")::RemoteFunction
local m=i:WaitForChild("ClaimIGMAReward")::RemoteFunction
local n=require(h:WaitForChild("IGMA"):WaitForChild("IGMARewardDefinitions"))

local o={
CFrame.new(426,213,405),
CFrame.new(465,213,405),
CFrame.new(465,213,345),
CFrame.new(426,213,345),
}

function b.Initialize(p,q)
c=p
d=q
local r=c.Options
local s=c.Window.QuickSave
local t=c.sData
local u=c.Utils.SafeTeleport
f=c.fVar.Pos.Strange
local v=c.fVar

local w=d:AddCollapsibleSection("Strange",false)
w:AddToggle("tgStrangeEnable",{
Title="Event Enable",
Default=false,
Callback=function(x)
if x then
e=task.spawn(function()
while true do
b.doEvent()
task.wait(30)
end
end)
else
g=false
if e then
task.cancel(e)
e=nil
end
end
s()
end,
})
w:AddButton({
Title="Clear Selected Plants",
Callback=function()
r.ddStrangeBlackList:SetValue({"NONE"})
end,
})
w:AddDropdown("ddStrangeBlackList",{
Title="Blacklist Plants",
Values=t.PlantDataBlackTable,
Default={"NONE"},
Multi=true,
Searchable=true,
Callback=function(x)
s()
end,
})
w:AddButton({
Title="Turn In Now!",
Callback=function()
v.LockDownControlVar()
task.wait(1)
u(f)
task.wait(1)
k:InvokeServer("TurnInAll")
task.wait(1)
u(c.MySpawnPoint)
task.wait(1)
v.ResetControlVar()
end,
})
w:AddToggle("tgStrangeAutoReset",{
Title="Auto Reset",
Default=false,
Callback=function(x)
s()
end,
})

local function CheckIGMAStatus()
fLog("📡 กำลังดึงข้อมูล IGMA จาก Server...")


local x,y=pcall(function()
return j:InvokeServer()
end)

if x and type(y)=="table"then
fLog("✅ ข้อมูล IGMA | แต้ม: "..tostring(y.Points).."/"..tostring(n.MAX_POINTS).." | เต็ม: "..tostring(y.Completed))

if y.ClaimedRewards and type(y.ClaimedRewards)=="table"then
local z=0
for A,B in pairs(y.ClaimedRewards)do

local C=n.GetRewardByIndex(B)

if C then
local D=tostring(C.Item)
local E=tostring(C.Amount)
local F=tostring(C.Points)

fLog("🎁 รับแล้ว: ขั้น "..F.." แต้ม -> "..D.." (x"..E..")")
else
fLog("🎁 รับแล้ว: ID ลำดับที่ "..tostring(B).." (ไม่พบข้อมูลในระบบ)")
end
z=z+1
end

if z==0 then fLog("ℹ️ ยังไม่มีประวัติการรับของรางวัลค่ะ")end
end
else
fLog("❌ ดึงข้อมูลไม่สำเร็จ Server ไม่ได้ตอบกลับมาเป็น Table ค่ะ")
end
end

w:AddButton({
Title="Check Info",
Callback=function()
CheckIGMAStatus()
end,
})
end

local function SafeResetIGMAQuest()
fLog("📡 ตรวจสอบสถานะเควสก่อนทำการรีเซ็ต...")

local p,q=pcall(function()
return j:InvokeServer()
end)

if p and type(q)=="table"then
if q.Completed then
fLog("⚠️ เควสตันแล้ว! กำลังดำเนินการรีเซ็ต (หัก 100M Shillings)...")

local r,s=pcall(function()
return l:InvokeServer()
end)

if r and type(s)=="table"then
if s.Status=="success"then
fLog("✅ รีเซ็ตเควสสำเร็จ! ระบบพร้อมเริ่มรอบใหม่แล้วค่ะ")
elseif s.Status=="insufficient_funds"then
fLog("❌ รีเซ็ตระงับ: พี่เอฟมีเงินไม่ถึง 100,000,000 Shillings ค่ะ")
else
fLog("❌ รีเซ็ตเกิดข้อผิดพลาด: "..tostring(s.Status))
end
else
fLog("❌ ส่งคำสั่งรีเซ็ตไม่สำเร็จ Server ไม่ตอบสนองค่ะ")
end
else
fLog("ℹ️ เควสยังไม่ตันค่ะ (แต้ม: "..tostring(q.Points)..") ข้ามการรีเซ็ต")
end
else
fLog("❌ ดึงข้อมูลสถานะไม่สำเร็จ ไม่สามารถตรวจสอบได้ค่ะ")
end
end

local function AutoClaimMissingRewards()
fLog("🔍 กำลังตรวจสอบของรางวัลที่อาจตกหล่น...")

local p,q=pcall(function()
return j:InvokeServer()
end)

if p and type(q)=="table"then
local r=q.Points
local s=q.ClaimedRewards or{}
local t=false

local u={}
for v,w in pairs(s)do
u[w]=true
end

for v,w in ipairs(n.Rewards)do
if r>=w.Points and not u[v]then
t=true
fLog("🎁 พบของตกหล่น! ขั้น "..tostring(w.Points).." แต้ม ("..tostring(w.Item)..")")

local x,y=pcall(function()
return m:InvokeServer(v)
end)

if x and y then
fLog("✅ เก็บตกสำเร็จ: ได้รับ "..tostring(w.Item).." (x"..tostring(w.Amount)..")")
else
fLog("❌ เก็บตกไม่สำเร็จสำหรับลำดับที่ "..tostring(v))
end

task.wait(0.5)
end
end

if not t then fLog("ℹ️ ตรวจสอบเรียบร้อย: รับของรางวัลครบตามแต้มแล้วค่ะ")end
else
fLog("❌ ดึงข้อมูลไม่สำเร็จ ไม่สามารถตรวจสอบรางวัลตกหล่นได้ค่ะ")
end
end

function b.doEvent()
local p=c.fVar
local q=c.Options
local r=c.Utils
local s=r.GetSelectedItems
local t=r.SafeTeleport
local u=r.TweenToTarget
local v=r.ParseFruitUuid
local w=i:WaitForChild("HarvestFruit")

local x={"Strange"}
local y={}

if not q.tgStrangeEnable.Value then return end

local z=os.date("*t").min

if(z>=6 and z<15)or(z>=36 and z<45)then
if not g then
g=true

local A,B=pcall(function()
p.LockDownControlVar()
task.wait(2)
c.MiscTab.NewPlayerAutoSell()
p.LockDownControlVar()
task.wait(3)
local A=s(q.ddStrangeBlackList.Value)
task.wait(0.2)
local B=c.Utils.GetCenterPlots()
table.insert(B,c.MySpawnPoint)
for C,D in B do
t(D)
task.wait(5)

local E=workspace:FindFirstChild("ClientPlants")
if E then
for F,G in E:GetChildren()do
local H=G:GetAttribute("PlantType")
if H and(table.find(A,"NONE")or not table.find(A,H))then
local I=G:GetAttribute("HarvestablePlant")and{G}or G:GetChildren()
for J,K in I do
local L=K:GetAttribute("Mutation")
local M=K:GetAttribute("FullyGrown")
if M and L and K:GetAttribute("Favorited")~=true then
local N=false
for O,P in ipairs(x)do
if string.find(L,P)then
N=true
break
end
end

if N and not table.find(y,K)then table.insert(y,K)end
end
end
end
end
end
end

if#y>0 then
for C,D in y do
local E=D:FindFirstChild("HarvestPrompt",true)
if E then
local F=CFrame.new(D:GetPivot().Position+Vector3.new(3,0,0))
u(F,100)
task.wait(0.1)

local G,H=v(D:GetAttribute("Uuid"))
local I=H and{{{GrowthAnchorIndex=H,Uuid=G}}}or{{{Uuid=G}}}

w:FireServer(table.unpack(I))
task.wait(0.1)
end
end
end

if#y>0 then
p.LockDownControlVar()
task.wait(1)
t(f)
task.wait(1)
k:InvokeServer("TurnInAll")
task.wait(1)
AutoClaimMissingRewards()
task.wait(1)
if q.tgStrangeAutoReset.Value then SafeResetIGMAQuest()end
task.wait(1)
t(c.MySpawnPoint)
task.wait(0.2)
end
end)

p.ResetControlVar()
if not A then fLog("⚠️ Strange Event Error: "..tostring(B))end
end
elseif g then
g=false
end
end

return b end function a.n():typeof(__modImpl())local b=a.cache.n if not b then b={c=__modImpl()}a.cache.n=b end return b.c end end do local function __modImpl()



local b=(getfenv()::any).getgenv
local c=b().EF_REMOTE
local d={}
local e
local f

local function LoadEvents()
local g={}
if b().DEV_MODE then
g.Strange=c("UI/Tabs/Events/Strange")
else
g.Strange=a.n()
end
return g
end

function d.Initialize(g)
e=g
local h=e.Interface
f=e.Tabs



f.Events=h:AddTab({Title="Events",Icon="calendar"})

local i=LoadEvents()
i.Strange.Initialize(e,f.Events)


end

return d end function a.o():typeof(__modImpl())local b=a.cache.o if not b then b={c=__modImpl()}a.cache.o=b end return b.c end end do local function __modImpl()

local b=(getfenv()::any).getgenv
local c={}
local d
local e=game:GetService("ReplicatedStorage")
local f=e:WaitForChild("RemoteEvents")
local g,h

function c.Initialize(i)
d=i
local j=d.Interface
local k=d.Tabs
local l=d.Options
local m=d.Window.QuickSave
local n=d.sData
local o=d.Auto
local p=d.fVar
local q=d.Utils

k.Auto=j:AddTab({Title="Automatic",Icon="bot"})


local r=k.Auto:AddCollapsibleSection("Quest",false)
r:AddToggle("tgQuestEnable",{
Title="Auto Claim Quest",
Default=false,
Callback=function(s)
if s then
f:WaitForChild("RequestQuests"):FireServer()
end
m()
end,
})


local s=k.Auto:AddCollapsibleSection("Destroy Plants",false)
s:AddToggle("tgRemovePlantsEnable",{
Title="Enable Destroy Plants",
Default=false,
Callback=function(t)
if t then
g=task.spawn(function()
while true do
if not p.isRemovingPlants then
o.RemovePlants()
end
task.wait(0.5)
end
end)
else
if g then
task.cancel(g)
g=nil
end
p.isRemovePlants=false
end
m()
end,
})
s:AddButton({
Title="Clear Selected Plants",
Callback=function()
l.ddRemovePlants:SetValue({})
end,
})
s:AddDropdown("ddRemovePlants",{
Title="Select Plants to Destroy",
Values=n.PlantDataTable,
Default={},
Multi=true,
Searchable=true,
Callback=function(t)
m()
end,
})
s:AddDropdown("ddRemovePlantsScale",{
Title="Plants Scale Threshold",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function(t)
m()
end,
})
s:AddInput("ipRemovePlantsScale",{
Title="Plants Scale",
Default=0,
Numeric=true,
Finished=false,
Callback=function(t)
m()
end,
})


local t=k.Auto:AddCollapsibleSection("Destroy Fruit",false)
t:AddToggle("tgRemoveFruitEnable",{
Title="Enable Destroy Fruit",
Default=false,
Callback=function(u)
if u then
h=task.spawn(function()
while true do
if not p.isRemovePlants then
o.RemoveCrops()
end
task.wait(0.5)
end
end)
else
if h then
task.cancel(h)
h=nil
end
p.isRemoveCrops=false
end
m()
end,
})

t:AddDivider()

t:AddButton({
Title="Clear Selected Crops",
Callback=function()
l.ddRemoveCrops:SetValue({ALL=true})
end,
})
t:AddDropdown("ddRemoveCrops",{
Title="Select Crops to Destroy",
Values=n.PlantDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(u)
m()
end,
})
t:AddButton({
Title="Clear Backlist Remove Crops",
Callback=function()
l.ddRemoveBlackCrops:SetValue({NONE=true})
end,
})

t:AddDropdown("ddRemoveBlackCrops",{
Title="Blacklist Remove Crops",
Values=n.PlantDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(u)
m()
end,
})

t:AddDivider()
t:AddButton({
Title="Clear Selected Mutant",
Callback=function()
l.ddRemoveMutants:SetValue({ALL=true})
end,
})

t:AddDropdown("ddRemoveMutants",{
Title="Select Mutants",
Values=n.MutationDataTable,
Multi=true,
Default={"ALL"},
Searchable=true,
Callback=function(u)
m()
end,
})

t:AddButton({
Title="Clear Backlist Mutant",
Callback=function()
l.ddRemoveBlackMutants:SetValue({NONE=true})
end,
})

t:AddDropdown("ddRemoveBlackMutants",{
Title="Backlist Mutants",
Values=n.MutationDataBlackTable,
Multi=true,
Default={"NONE"},
Searchable=true,
Callback=function(u)
m()
end,
})

t:AddDivider()
t:AddDropdown("ddRemoveRipeness",{
Title="Ripeness Stage",
Values={"ALL","Unripe","Ripened","Lush"},
Default={"ALL"},
Multi=true,
Callback=function(u)
m()
end,
})

t:AddInput("ipRemoveRipenessMulti",{
Title="Ripeness Multiplier",
Default=0,
Numeric=false,
Finished=false,
Callback=function(u)
m()
end,
})

t:AddDropdown("ddRemoveBlackRipeness",{
Title="Backlist Ripeness Stage",
Values={"NONE","Unripe","Ripened","Lush"},
Default={"NONE"},
Multi=true,
Callback=function(u)
m()
end,
})

t:AddDivider()
t:AddDropdown("ddRemoveVariant",{
Title="Variant",
Values={"ALL","Silver","Gold"},
Default={"ALL"},
Multi=true,
Callback=function(u)
m()
end,
})
t:AddDropdown("ddRemoveBlackVariant",{
Title="Backlist Variant",
Values={"NONE","Silver","Gold"},
Default={"NONE"},
Multi=true,
Callback=function(u)
m()
end,
})
t:AddDivider()
t:AddDropdown("ddRemoveWeight",{
Title="Weight",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function(u)
m()
end,
})
t:AddInput("ipRemoveWeight",{
Title="Weight",
Default=0,
Numeric=true,
Finished=true,
Callback=function(u)
m()
end,
})

t:AddDivider()
t:AddDropdown("ddRemoveScale",{
Title="Scale",
Values={"Below","Above"},
Default="Below",
Multi=false,
Callback=function(u)
m()
end,
})
t:AddInput("ipRemoveScale",{
Title="Scale",
Default=0,
Numeric=true,
Finished=true,
Callback=function(u)
m()
end,
})
local u=k.Auto:AddCollapsibleSection("Open Pack",false)
u:AddToggle("tgOpenPackAnimation",{
Title="Disable Animation",
Default=false,
Callback=function(v)
if v then
pcall(function()
o.disablePackAnimations()
end)
else
pcall(function()
o.enablePackAnimations()
end)
end

end,
})

l.tgOpenPackAnimation:SetValue(false)

u:AddToggle("tgOpenPackEnable",{
Title="Auto Open Pack",
Default=false,
Callback=function(v)
if v then
p.LockDownControlVar()
o.OpenPack()
p.ResetControlVar()
else
p.ResetControlVar()
end
m()
end,
})

u:AddDropdown("ddOpenPackSelect",{
Title="Select Seed Pack",
Values=n.SeedPackTable,
Default={"ALL"},
Multi=true,
Searchable=true,
Callback=function(v)
m()
end,
})

local v=k.Auto:AddCollapsibleSection("Trowel",false)
v:AddButton({
Title="Set Position",
Callback=function()

p.Pos.Trowel=q.GetPlayerPosition()
l.TrowelPosition:SetValue("Position: "..tostring(p.Pos.Trowel))
end,
})

v:AddParagraph("TrowelPosition",{
Title="Trowel Position",
Content="Waiting for set position...",
})
if p.Pos.Trowel~=nil then
l.TrowelPosition:SetValue("Position: "..tostring(p.Pos.Trowel))
end

v:AddToggle("tgTrowelEnable",{
Title="Auto Trowel",
Default=false,
Callback=function(w)
if w then
p.LockDownControlVar()
p.isTroweling=false
local x,y=pcall(function()
o.Trowel()
end)
if not x then
b().fLog("❌ "..tostring(y))
end
p.ResetControlVar()
else
p.isTroweling=false
end
m()
end,
})
v:AddButton({
Title="Clear Selected Plant",
Callback=function()
l.ddTrowelSelect:SetValue({})
end,
})
v:AddDropdown("ddTrowelSelect",{
Title="Select Plant to Move",
Values=n.PlantDataTable,
Default={"ALL"},
Multi=true,
Searchable=true,
Callback=function(w)
m()
end,
})
end

return c end function a.p():typeof(__modImpl())local b=a.cache.p if not b then b={c=__modImpl()}a.cache.p=b end return b.c end end do local function __modImpl()

local b=(getfenv()::any).getgenv
local c=(getfenv()::any).setclipboard
local d={}
local e
local f=""
local g=0
function d.Initialize(h)
e=h
local i=h.Options
local j=h.Interface
local k=h.Tabs
local l=h.Fluent

k.Log=j:AddTab({Title="Log",Icon="scroll"})

k.Log:AddButton({
Title="❌ Clear Log",
Description="ล้างประวัติข้อความทั้งหมดบนหน้าจอ",
Callback=function()
f=""
g=0
if e and e.fDisplay then e.fDisplay:SetValue("Waiting for new activity...\n")end
end,
})

k.Log:AddButton({
Title="📑 Copy Log",
Description="คัดลอกประวัติข้อความทั้งหมดไปที่ Clipboard",
Callback=function()
if f~=""then
c(f)

l:Notify({
Title="EfHub System",
Content="✅ คัดลอก Log แล้ว",
Duration=3,
})
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
if k then f=string.sub(f,1,k)end
g=100
end

if e and e.fDisplay then e.fDisplay:SetValue(f)end
end

return d end function a.q():typeof(__modImpl())local b=a.cache.q if not b then b={c=__modImpl()}a.cache.q=b end return b.c end end do local function __modImpl()





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
e.Misc=c("Modules/Misc")
e.Main=c("Modules/Main")
e.Shop=c("Modules/Shop")
e.Process=c("Modules/Process")
e.Auto=c("Modules/Auto")
e.EventDrive=c("Modules/EventDrive")


e.Window=c("UI/Window")
e.MainTab=c("UI/Tabs/MainTab")
e.ShopTab=c("UI/Tabs/ShopTab")
e.MiscTab=c("UI/Tabs/MiscTab")
e.EventsTab=c("UI/Tabs/EventsTab")
e.AutoTab=c("UI/Tabs/AutoTab")
e.LogTab=c("UI/Tabs/LogTab")
else

e.sData=a.a()
e.fVar=a.b()


e.Utils=a.c()
e.Misc=a.d()
e.Main=a.e()
e.Shop=a.f()
e.Process=a.g()
e.Auto=a.h()
e.EventDrive=a.i()


e.Window=a.j()
e.MainTab=a.k()
e.ShopTab=a.l()
e.MiscTab=a.m()
e.EventsTab=a.o()
e.AutoTab=a.p()
e.LogTab=a.q()
end

return e
end

function d.Initialize()
local e=LoadModules()

e.Window.Initialize(e)


e.Utils.Initialize(e)
e.Misc.Initialize(e)
e.Main.Initialize(e)
e.Shop.Initialize(e)
e.Process.Initialize(e)
e.Auto.Initialize(e)
e.EventDrive.Initialize(e)

e.MainTab.Initialize(e)
e.ShopTab.Initialize(e)
e.AutoTab.Initialize(e)
e.EventsTab.Initialize(e)
e.MiscTab.Initialize(e)
e.LogTab.Initialize(e)

e.Window.Finalize()
return e
end

function d.RunTask(e)
local f=e.fVar
local g=e.Process
task.spawn(function()
while task.wait(0.1)do
if#f.actionQueue>0 and not f.isProcessing then g.processQueue()end
end
end)
end

return d end function a.r():typeof(__modImpl())local b=a.cache.r if not b then b={c=__modImpl()}a.cache.r=b end return b.c end end end




local b=(getfenv()::any).getgenv
b().DEV_MODE=false

local c

if b().DEV_MODE then
local d="https://raw.githubusercontent.com/suta007/EfHub/refs/heads/master/GHZs/src/"

local function GetRemote(e)
local f=d..e..".luau"
local g,h=pcall(function()
return game:HttpGet(f)
end)
if not g or not h then error("Remote Error: Could not fetch "..e)end
local i,j=loadstring(h)
if not i then error("Compile Error in "..e..": "..tostring(j))end
return i()
end







b().EF_REMOTE=GetRemote

c=GetRemote("EfHub")
else
c=a.r()
end

local d=c.Initialize()
task.wait(1)
c.RunTask(d)


local e=game:GetService("Players").LocalPlayer
local f=game:GetService("VirtualUser")
e.Idled:Connect(function()
f:CaptureController()
f:ClickButton2(Vector2.new())
end)