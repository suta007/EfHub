local a={cache={}::any}do do local function __modImpl()



local b=(getfenv()::any).getgenv
local c=b().EF_REMOTE
local d={}

local function LoadModules()
local e={}
local f=b().DEV_MODE
local g="Core/Loader"
local h

if f then
h=c(g)
else
h=require("./"..g..".luau")
end

e.Loader=h


local function Require(i)
return h.Require(i)
end


e.sData=Require("Core/sData")
e.fVar=Require("Core/fVar")


e.Utils=Require("Modules/Utils")
e.EfTasks=Require("Modules/EfTasks")

e.Main=Require("Modules/Main")
e.Shop=Require("Modules/Shop")
e.Auto=Require("Modules/Auto")
e.Pets=Require("Modules/Pets")
e.Misc=Require("Modules/Misc")


e.Window=Require("UI/Window")
e.MainTab=Require("UI/Tabs/MainTab")
e.ShopTab=Require("UI/Tabs/ShopTab")
e.PetsTab=Require("UI/Tabs/PetsTab")
e.AutoTab=Require("UI/Tabs/AutoTab")
e.MiscTab=Require("UI/Tabs/MiscTab")
e.LogTab=Require("UI/Tabs/LogTab")

return e
end

function d.Initialize()
local e=LoadModules()

e.Window.Initialize(e)



e.Pets.Initialize(e)
e.Utils.Initialize(e)
e.Misc.Initialize(e)
e.Main.Initialize(e)
e.Shop.Initialize(e)

e.Auto.Initialize(e)


e.MainTab.Initialize(e)
e.ShopTab.Initialize(e)
e.AutoTab.Initialize(e)

e.MiscTab.Initialize(e)
e.PetsTab.Initialize(e)
e.LogTab.Initialize(e)

e.Window.Finalize()
e.Utils.ViewButton()


return e
end

return d end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end end


local b=(getfenv()::any).getgenv
b().DEV_MODE=false

local c

if b().DEV_MODE then
local d="https://raw.githubusercontent.com/suta007/EfHub/refs/heads/master/GAG/src/"


local e,f=pcall(function()
return(game::any):HttpGet(d.."Core/Loader.luau")
end)
if not e or not f then
error("Bootloader Error: Could not fetch Core/Loader")
end

local g,h=loadstring(f)
if not g then
error("Bootloader Compile Error: Core/Loader: "..tostring(h))
end
local i=g()


b().EF_REMOTE=i.Require


c=i.Require("EfHub")
else
c=a.a()
end


c.Initialize()
task.wait(1)



local d=game:GetService("Players").LocalPlayer
local e=game:GetService("VirtualUser")
d.Idled:Connect(function()
e:CaptureController()
e:ClickButton2(Vector2.new())
end)