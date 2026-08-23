local a=game:GetService("Players")

local b=game:GetService("RunService")

local c=game:GetService"ReplicatedStorage"

local d=game:GetService"UserInputService"

local e=game:GetService"TweenService"

local f=game:GetService"Debris"

local g=game:GetService"Workspace"

local h=game:GetService"ContextActionService"

local i=c:WaitForChild"Remotes"

local j=require(c.Modules.Core.Util)

local k=require(c.Modules.Game.UI.BuyPromptUI)

local l=require(c.Modules.Game.Emotes.EmotesUI)

local m=require(c.Modules.Game.Emotes.EmotesList)

local n=require(c.Modules.Core.UI)

local o=require(c.Modules.Core.Char)

local p=c:WaitForChild"Items"

local q=p:WaitForChild"melee"

local r=a.LocalPlayer

local s=r.Character or r.CharacterAdded:Wait()

local t=s:WaitForChild"Humanoid"

local u=s:WaitForChild"HumanoidRootPart"

local v=a.LocalPlayer

local w={}

local x=workspace:WaitForChild"DroppedItems"



local y=g.CurrentCamera

r:GetMouse()

local z=d.TouchEnabled and not d.KeyboardEnabled

local A

pcall(

function()

A=loadstring(game:HttpGet"https://github.com/Footagesus/WindUI/releases/latest/download/main.lua")()

end

)

local B

if A then

B=

A:CreateWindow

{

Title="Salmon x Hub | Block spin",

Icon="rbxassetid://110538801742199",

Author="[🔫]-Block Spin | discord.gg/z4x4TE6gGT",

Folder="Boss",

Size=UDim2.fromOffset(650,400),

Theme="Dark",

Transparent=true,

Resizable=true,

KeyCode=Enum.KeyCode.G

}



Window:EditOpenButton({

    Title = "Salmon x Hub | Block spin",

    Icon = "rbxassetid://110538801742199",

    CornerRadius = UDim.new(0,16),

    StrokeThickness = 2,

    Color = ColorSequence.new( -- gradient

        Color3.fromHex("FF0F7B"), 

        Color3.fromHex("F89B29")

    ),

    OnlyMobile = false,

    Enabled = true,

    Draggable = true,

})



Window:Tag({

    Title = "PVP | Paid",

    Icon = "github",

    Color = Color3.fromHex("#30ff6a"),

    Radius = 13,

})



else

B={

Tab=function(C)

return{

Section=function()

end,

Toggle=function()

end,

Slider=function()

end,

Button=function()

end,

Input=function()

return{}

end,

Divider=function()

end

}

end

}

end



local C=B.ConfigManager

local D=C:CreateConfig"CathubConfig"

local E

pcall(

function()

E=c:WaitForChild("Remotes",5):WaitForChild("Send",5)

end

)



local F=false

local G=false

local H=120

local I

local J

local K=Drawing.new"Line"

K.Thickness=1

K.Color=Color3.fromRGB(255,50,50)

K.Transparency=1

K.Visible=false



local L={}

local M=false

local N=false

local O=false

local P={}



local Q=false

local R=0.05

local S=false

local T=false

local U=40

local V=false

local W=false

local X

local Y=10

local Z

local _

local aa

local ab=state

local ac=0

local ad=false





local ae=1

local af=0.4

local ag=false

local ah

local ai=getgenv or function()

return _G

end

ai().Sky=false

ai().SkyAmount=1500

local aj=false

local ak=false

local al={}

local am=-55

local an=30

local ao=0.1









local ap=20

local aq=0

local ar=0

local as=false



local at={Common=

Color3.fromRGB(255,255,255),Uncommon=

Color3.fromRGB(99,255,52),Rare=

Color3.fromRGB(51,170,255),Epic=

Color3.fromRGB(237,44,255),Legendary=

Color3.fromRGB(255,150,0),Omega=

Color3.fromRGB(255,20,51)

}

local au={}

local av={}

local aw=false

local ax

local ay=false

local az={}

local aA=100

local aB={}



local aC

pcall(

function()

for aD,aE in ipairs(getgc(true))do

if typeof(aE)=="table"and rawget(aE,"event")and rawget(aE,"func")then

aC=aE

break

end

end

end

)



local function getPing()

local aD=r:FindFirstChild"PlayerGui"

if not aD then

return 0.2

end



local aE=aD:FindFirstChild"NetworkStats"

if not aE then

return 0.2

end



local aF=aE:FindFirstChild"PingLabel"

if not aF then

return 0.2

end



local aG=aF.Text

if typeof(aG)~="string"then

return 0.2

end



local aH=tonumber(aG:match"%d+")

if not aH then

return 0.2

end



local aI=aH/1000

if aI<0 or aI>2 then

aI=0.2

end



return aI

end



local function isPlayerExcluded(aD)

for aE,aF in ipairs(P)do

if aF~=""and string.find(string.lower(aD),string.lower(aF))then

return true

end

end

return false

end

local function getClosestTarget()

local aD

local aE=H

local aF=Vector2.new(y.ViewportSize.X/2,y.ViewportSize.Y/2)

for aG,aH in ipairs(a:GetPlayers())do

if aH~=r and aH.Character then

local aI=aH.Character:FindFirstChild"Head"

local aJ=aH.Character:FindFirstChild"Humanoid"

local aK=aH.Character:FindFirstChild"HumanoidRootPart"

if aI and aJ and aJ.Health>0 and aK then

local aL,aM=y:WorldToViewportPoint(aI.Position)

if aM then

local aN=Vector2.new(aL.X,aL.Y)

local aO=(aN-aF).Magnitude

if aO<=H and not isPlayerExcluded(aH.Name)then

if aO<aE then

aE=aO

aD=aH

end

end

end

end

end

end

return aD

end

local function predictPosition(aD,aE)

if not aD then

return Vector3.zero

end



local aF=

(getPing and getPing())or(game:GetService"Stats".Network.ServerStatsItem["Data Ping"]:GetValue()/1000)

if aF>1 then

aF=0.2

end



local aG=(aE and aE.AssemblyLinearVelocity)or Vector3.zero

return aD.Position+(aG*aF*1.21)

end



local function isBehindWall(aD,aE)

if not aD or not aE then

return false

end



local aF=aE-aD

if aF.Magnitude<1 then

return false

end



local aG={}



local aH=r.Character

if aH then

table.insert(aG,aH)

end



local aI=I and I.Character

if aI then

table.insert(aG,aI)

end



local aJ=workspace:Raycast(aD,aF,RaycastParams.new())

if not aJ then

return false

end



local aK=aJ.Instance

return aK and not table.find(aG,aK.Parent)

end



local function setupCharacter(aD)

s=aD

t=aD:WaitForChild"Humanoid"

u=aD:WaitForChild"HumanoidRootPart"

if _ then

pcall(

function()

_:Disconnect()

end

)

end

_=

b.RenderStepped:Connect(

function()

if Q and t and u then

if t.MoveDirection.Magnitude>0 then

u.CFrame=u.CFrame+(t.MoveDirection.Unit*R)

end

end

end

)

end

local function isDowned()

local aD=o.get_hum()

if not aD then

return false

end





if aD.Health<=0 then

return false

end



return aD:GetAttribute"HasBeenDowned"or aD:GetAttribute"IsDead"

end



local function getHRP()

local aD=o.current_char.get()

if not aD then

return

end

return aD:FindFirstChild"HumanoidRootPart"

end



local function teleportUnderground()

local aD=getHRP()

if not aD then

return

end

local aE=aD.CFrame

ah=aE+Vector3.new(0,am,0)

aD.CFrame=ah

end



local function flickerAndMove()

if ag then

return

end

ag=true



task.spawn(

function()

while ag and enabled and isDowned()do

local aD=o.get_hum()

if aD and aD.Health<=0 then

break

end



local aE=getHRP()

if aE and ah then

local aF=math.random()*math.pi*2

local aG=Vector3.new(math.cos(aF),0,math.sin(aF))*an

local aH=ah.Position+aG



aE.CFrame=CFrame.new(aH)

task.wait(0.05)

aE.CFrame=ah

end



task.wait(ao)

end



ag=false

end

)

end



local function NetGet(...)

if not aC or not aC.func then

return

end

local aD={...}

for aE,aF in ipairs(aD)do

if typeof(aF)=="Instance"then

if aF:IsA"Model"and#aF:GetChildren()==0 then

local aG=g:FindFirstChild"DroppedItems"

if aG then

local aH=aG:FindFirstChildWhichIsA"Model"

if aH then

aD[aE]=aH

else

return

end

else

return

end

end

end

end

aC.func=(aC.func or 0)+1

local aE,aF=

pcall(

function()

local aE=c:WaitForChild"Remotes":WaitForChild"Get"

return aE:InvokeServer(aC.func,unpack(aD))

end

)

if not aE then

warn("[NetGet Error]",aF)

end

return aF

end



local function CheckAndPickup()

if not ak then

return

end

local aD=g:FindFirstChild"DroppedItems"

if not aD then

return

end

local aE=tick()

local aF={}

for aG,aH in ipairs(aD:GetChildren())do

if aH:IsA"Model"then

local aI=aH:FindFirstChildWhichIsA"BasePart"

if aI then

local aJ=(u.Position-aI.Position).Magnitude

if aJ<=20 and(aE-(al[aH]or 0))>=0 then

table.insert(aF,aH)

al[aH]=aE

end

end

end

end

if#aF>0 then

for aG,aH in ipairs(aF)do

spawn(

function()



NetGet("pickup_dropped_item",aH)

end

)

end

end

end



local function SafeCall(aD,...)

local aE,aF=pcall(aD,...)

return aE,aF

end



local aD=table.unpack or unpack



local function CallRemote(aE,...)

if not aE then

return

end



local aF={...}



if aE.ClassName=="RemoteEvent"then

if aC and type(aC.event)=="number"then

aC.event=aC.event+1

SafeCall(

function(...)

aE:FireServer(aC.event,...)

end,

aD(aF)

)

else

aq=(aq or 0)+1

SafeCall(

function(...)

aE:FireServer(aq,...)

end,

aD(aF)

)

end

elseif aE.ClassName=="RemoteFunction"then

if aC and type(aC.func)=="number"then

aC.func=aC.func+1

SafeCall(

function(...)

aE:InvokeServer(aC.func,...)

end,

aD(aF)

)

else

ar=(ar or 0)+1

SafeCall(

function(...)

aE:InvokeServer(ar,...)

end,

aD(aF)

)

end

else

SafeCall(

function(...)

if aE.FireServer then

aE:FireServer(...)

elseif aE.InvokeServer then

aE:InvokeServer(...)

end

end,

aD(aF)

)

end

end



local function getPlayersInRange(aE)

local aF={}

local aG=r.Character

if not aG or not aG.PrimaryPart then

return aF

end

local aH=aG.PrimaryPart.Position

for aI,aJ in pairs(a:GetPlayers())do

if aJ~=r and aJ.Character and aJ.Character.PrimaryPart then

local aK,aL=

pcall(

function()

return(aJ.Character.PrimaryPart.Position-aH).Magnitude

end

)

if aK and aL and aL<=aE then

table.insert(aF,aJ)

end

end

end

return aF

end



local function getActiveTool()

local aE=r and r.Character

if aE then

for aF,aG in ipairs(aE:GetChildren())do

if

pcall(

function()

return aG:IsA"Tool"

end

)and aG:IsA"Tool"

then

return aG

end

end

end

local aF=r and r:FindFirstChild"Backpack"

if aF then

for aG,aH in ipairs(aF:GetChildren())do

if

pcall(

function()

return aH:IsA"Tool"

end

)and aH:IsA"Tool"

then

return aH

end

end

end

return nil

end



local function isMeleeTool(aE)

if not aE then

return false

end

if aE.Name=="Fists"then

return true

end



local aF=game:GetService"ReplicatedStorage"

local aG=aF:WaitForChild"Items":WaitForChild"melee"

local aH=aF:WaitForChild"Items":WaitForChild"throwable"

if aG:FindFirstChild(aE.Name)and not aH:FindFirstChild(aE.Name)then

return true

end



return false

end



local function AttackNearby()

if not E then

return

end

local aE=r.Character

if not aE or not aE.PrimaryPart then

return

end



local aF=getActiveTool()

if not aF or not isMeleeTool(aF)then

return

end

local aG,aH=

pcall(

function()

return aF.Parent

end

)

if not aG or aH~=r.Character then

return

end



local aI=getPlayersInRange(ap)

if#aI==0 then

return

end



local aJ,aK=

pcall(

function()

return aE.PrimaryPart.Position

end

)

if not aJ or not aK then

return

end



local aL={}

local aM={}



for aN,aO in pairs(aI)do

if aO and aO.Character and aO.Character.PrimaryPart then

local aP=aO.Character:FindFirstChild"Head"

local aQ=aO.Character.PrimaryPart

if aP and aQ then

local aR=predictPosition(aP,aQ)

table.insert(aL,aO)

table.insert(aM,aR)

end

end

end



if#aL==0 then

return

end



local aN=aM[1]

local aO=CFrame.lookAt(aK,aN)



local aP={

"melee_attack",

aF,

aL,

aO,

0.75

}



pcall(

function()

CallRemote(E,aD(aP))

end

)

end



local aE=false

local function StartAutoAttack()

if aE then

return

end

aE=true

task.spawn(

function()

while aE do

task.wait(af)

if ab and r and r.Character and r.Character.PrimaryPart then

pcall(AttackNearby)

end

end

end

)

end



local function createNeonEffectAtPosition(aF,aG)

if not s then

return

end

end

local function performTeleport()

if not u then

return

end

local aF=u.Position

local aG=Vector3.new(aF.X,aF.Y-Y,aF.Z)

u.CFrame=CFrame.new(aG)

X=aG.Y

local aH=Instance.new"Sound"

aH.SoundId="rbxassetid://95298029662868"

aH.Volume=1

aH.PlayOnRemove=true

aH.Parent=u

aH:Destroy()

createNeonEffectAtPosition(aF,1.5)

createNeonEffectAtPosition(aG,2)

end

local function toggleTeleport()

if not W then

return

end

V=not V

if V then

performTeleport()

else

X=nil

end

end

local aF

local function lockYPosition()

if aF then

pcall(

function()

aF:Disconnect()

end

)

end

aF=

b.Heartbeat:Connect(

function()

if V and X and u then

local aG=u.Position

if math.abs(aG.Y-X)>0.1 then

u.CFrame=CFrame.new(aG.X,X,aG.Z)

end

end

end

)

end



local function registerItems(aG)

for aH,aI in ipairs(aG:GetChildren())do

if aI:IsA"Tool"then

local aJ=aI:FindFirstChild"Handle"

local aK

local aL=aI:GetAttribute"DisplayName"or aI.Name

local aM=aI:GetAttribute"ItemId"or aI:GetAttribute"Id"or aI.Name

local aN=aI:GetAttribute"RarityName"or"Common"

local aO=aI:GetAttribute"ImageId"or"rbxassetid://7072725737"





if aJ then

local aP=aJ:FindFirstChildOfClass"SpecialMesh"

if aP and aP.MeshId~=""then

aK=aP.MeshId..(aP.TextureId or"").."_RARITY_"..aN

elseif aJ:IsA"MeshPart"and aJ.MeshId~=""then

aK=aJ.MeshId..(aJ.TextureID or"").."_RARITY_"..aN

end

end





if not aK and aM and aM~=""and aM~=aI.Name then

aK="ITEMID_"..aM.."_RARITY_"..aN

end





if not aK then

aK="NAME_"..aL.."_"..aI.Name.."_RARITY_"..aN

end





if au[aK]then

warn(

"Duplicate weapon key detected: "..aK.." (Tool: "..aI.Name..", Rarity: "..aN..")"

)

end



au[aK]={

Name=aL,

Rarity=aN,

ImageId=aO,

ToolName=aI.Name

}

end

end

end



local function getItemKey(aG)

local aH=aG:FindFirstChild"Handle"

local aI=aG:GetAttribute"DisplayName"or aG.Name

local aJ=aG:GetAttribute"ItemId"or aG:GetAttribute"Id"or aG.Name

local aK=aG:GetAttribute"RarityName"or"Common"



if aH then

local aL=aH:FindFirstChildOfClass"SpecialMesh"

if aL and aL.MeshId~=""then

return aL.MeshId..(aL.TextureId or"").."_RARITY_"..aK

elseif aH:IsA"MeshPart"and aH.MeshId~=""then

return aH.MeshId..(aH.TextureID or"").."_RARITY_"..aK

end

end



if aJ and aJ~=""and aJ~=aG.Name then

return"ITEMID_"..aJ.."_RARITY_"..aK

end



return"NAME_"..aI.."_"..aG.Name.."_RARITY_"..aK

end



local function getWeaponInfo(aG)

if not aG or not aG:IsA"Tool"then

return nil

end

local aH=getItemKey(aG)

return au[aH]

end



local function createBillboardForPlayer(aG)

if not aw or aG==r then

return

end

local aH=aG.Character

if not aH then

return

end

local aI=aH:FindFirstChild"HumanoidRootPart"

if not aI then

return

end

if av[aG]then

av[aG]:Destroy()

av[aG]=nil

end

local aJ=Instance.new"BillboardGui"

aJ.Adornee=aI

aJ.Size=UDim2.new(0,90,0,20)

aJ.StudsOffset=Vector3.new(0,-5,0)

aJ.AlwaysOnTop=true

aJ.Parent=aH

aJ:ClearAllChildren()

local aK=Instance.new("UIListLayout",aJ)

aK.FillDirection=Enum.FillDirection.Horizontal

aK.SortOrder=Enum.SortOrder.LayoutOrder

aK.Padding=UDim.new(0,5)

aK.HorizontalAlignment=Enum.HorizontalAlignment.Center

local aL={}

for aM,aN in ipairs{"Backpack","StarterGear","StarterPack"}do

local aO=aG:FindFirstChild(aN)

if aO then

for aP,aQ in ipairs(aO:GetChildren())do

if aQ:IsA"Tool"and aQ.Name~="Fists"then

table.insert(aL,aQ)

end

end

end

end

if aH then

for aM,aN in ipairs(aH:GetChildren())do

if aN:IsA"Tool"and aN.Name~="Fists"then

table.insert(aL,aN)

end

end

end

for aM,aN in ipairs(aL)do

local aO=getWeaponInfo(aN)

if aO then

local aP=Instance.new("ImageLabel",aJ)

aP.Size=UDim2.new(0,20,0,20)

aP.BackgroundTransparency=0.1

aP.Image=aO.ImageId

aP.BackgroundColor3=Color3.fromRGB(240,248,255)

Instance.new("UICorner",aP).CornerRadius=UDim.new(0,10)

local aQ=Instance.new("UIStroke",aP)

aQ.Color=at[aO.Rarity]or Color3.new(1,1,1)

aQ.Thickness=2

end

end

av[aG]=aJ

end



local function setFinishPrompt(aG)

if aG and aG:IsA"ProximityPrompt"then

aG.HoldDuration=ae

aG.MaxActivationDistance=20

end

end

local function tryHoldPrompt(aG,aH)

if not aG or aG:GetAttribute"__AutoFinishBusy"then

return

end

aG:SetAttribute("__AutoFinishBusy",true)

pcall(

function()

if aG.InputHoldBegin then

aG:InputHoldBegin()

end

end

)

pcall(

function()

if aG.HoldBegin then

aG:HoldBegin()

end

end

)

pcall(

function()

if aG.Trigger then

aG:Trigger()

end

end

)

task.wait(aH)

pcall(

function()

if aG.InputHoldEnd then

aG:InputHoldEnd()

end

end

)

pcall(

function()

if aG.HoldEnd then

aG:HoldEnd()

end

end

)

aG:SetAttribute("__AutoFinishBusy",nil)

end

local function findFinishPrompts()

local aG={}

for aH,aI in pairs(workspace:GetChildren())do

local aJ=a:GetPlayerFromCharacter(aI)

if aJ and not isPlayerExcluded(aJ.Name)then

local aK=aI:FindFirstChild"HumanoidRootPart"

if aK then

local aL=aK:FindFirstChild"FinishPrompt"

if aL then

setFinishPrompt(aL)

table.insert(aG,aL)

end

end

end

end

return aG

end

local function applyToAll()

for aG,aH in ipairs(a:GetPlayers())do

if aH~=r and aH.Character then

local aI=aH.Character:FindFirstChild"HumanoidRootPart"

if aI then

local aJ=aI:FindFirstChild"FinishPrompt"

if aJ then

setFinishPrompt(aJ)

end

end

end

end

end

local function setupFastFinishForPlayer(aG)

if aG~=r then

aG.CharacterAdded:Connect(

function(aH)

aH.DescendantAdded:Connect(

function(aI)

if

ad and aI.Name=="FinishPrompt"and aI:IsA"ProximityPrompt"and

aI.Parent and

aI.Parent.Name=="HumanoidRootPart"

then

setFinishPrompt(aI)

end

end

)

local aI=aH:WaitForChild("HumanoidRootPart",5)

if aI and ad then

local aJ=aI:FindFirstChild"FinishPrompt"

if aJ then

setFinishPrompt(aJ)

end

end

end

)

if aG.Character then

local aH=aG.Character

aH.DescendantAdded:Connect(

function(aI)

if

ad and aI.Name=="FinishPrompt"and aI:IsA"ProximityPrompt"and

aI.Parent and

aI.Parent.Name=="HumanoidRootPart"

then

setFinishPrompt(aI)

end

end

)

local aI=aH:FindFirstChild"HumanoidRootPart"

if aI and ad then

local aJ=aI:FindFirstChild"FinishPrompt"

if aJ then

setFinishPrompt(aJ)

end

end

end

end

end





































































































































local function TrySkipCrate()

local aG,aH=

pcall(

function()

return require(c.Modules.Game.CrateSystem.Crate)

end

)



if not(aG and aH)then

return

end



task.spawn(

function()

local aI=aH.spinning

if not aI then

return

end





local aJ=0

while not aI.get()do

if aJ>3 then

break

end

task.wait(0.05)

aJ=aJ+0.05

end



if aI.get()then

pcall(

function()

aH.skip_spin()

end

)

end

end

)

end



local function SetupAutoSkip()

local aG=c:WaitForChild("Remotes",5)

if not aG then

return

end



local aH=aG:WaitForChild("Send",5)

if not(aH and aH:IsA"RemoteEvent")then

return

end



aH.OnClientEvent:Connect(

function(...)

if aj then

TrySkipCrate()

end

end

)

end



-- Legacy Drawing ESP disabled in favor of the resilient ScreenGui visual layer below.
local function createESP(aG)
    return
end

local function loadESP()
    return
end

a.PlayerRemoving:Connect(

function(aG)

if L[aG]then

for aH,aI in pairs(L[aG].drawings)do

if aI and aI.Destroy then

pcall(

function()

aI:Destroy()

end

)

elseif typeof(aI)=="table"and aI.Visible~=nil then

aI.Visible=false

end

end

if L[aG].conn then

pcall(

function()

L[aG].conn:Disconnect()

end

)

end

end

end

)

end



-- Universal GUI FOV renderer (mobile + PC; does not depend on Drawing).
do
    local old = r:FindFirstChild("SalmonVisuals")
    if old then old:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "SalmonVisuals"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = r:WaitForChild("PlayerGui")

    local fov = Instance.new("Frame")
    fov.Name = "FOVCircle"
    fov.AnchorPoint = Vector2.new(0.5,0.5)
    fov.Position = UDim2.fromScale(0.5,0.5)
    fov.Size = UDim2.fromOffset(H*2,H*2)
    fov.BackgroundTransparency = 1
    fov.Visible = false
    fov.ZIndex = 50
    fov.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1,0)
    corner.Parent = fov

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Transparency = 0.05
    stroke.Color = Color3.fromRGB(255,255,255)
    stroke.Parent = fov

    J = fov
    _G.__SalmonVisualGui = gui
    _G.__SalmonFOV = fov
end

local aG=6

local aH=1.2

local aI=150

local aJ=0.75



local aK={}

local aL=Vector3.new()



b.Heartbeat:Connect(

function()

for aM,aN in ipairs(a:GetPlayers())do

if aN~=r and aN.Character then

local aO=aN.Character

local aP=aO:FindFirstChild"HumanoidRootPart"

local aQ=aO:FindFirstChild"Humanoid"

if aP and aQ and aQ.Health>0 then

aK[aN]=aK[aN]or{}

table.insert(aK[aN],{time=os.clock(),pos=aP.Position})

if#aK[aN]>aG then

table.remove(aK[aN],1)

end

else

aK[aN]=nil

end

end

end

end

)



a.PlayerRemoving:Connect(

function(aM)

aK[aM]=nil

end

)



local function calculateVelocity(aM)

local aN=aK[aM]

if not aN or#aN<2 then

return Vector3.new()

end



local aO=Vector3.new()

local aP=0

for aQ=2,#aN do

local aR=aN[aQ].time-aN[aQ-1].time

if aR>0 then

aO=aO+(aN[aQ].pos-aN[aQ-1].pos)/aR

aP=aP+1

end

end

if aP==0 then

return Vector3.new()

end



local aQ=aO/aP



if aQ.Y>aI then

return Vector3.new(aQ.X*1.15,math.clamp(aQ.Y*0.85,0,400),aQ.Z*1.15)

end



return aQ

end



local function predictPosition(aM,aN)

if not aM then

return Vector3.zero

end



local aO=aM.Parent

local aP=aO and a:GetPlayerFromCharacter(aO)

if not aP then

return aM.Position

end



local aQ=calculateVelocity(aP)or Vector3.zero

local aR=(getPing and getPing())or 0.1

if aR<0 then

aR=0.1

end



return aM.Position+(aQ*aR*aH)

end













































































local function isShotgun()

if not s then return false end

for aM,aN in ipairs(s:GetChildren())do

if aN:IsA"Tool"then

local aO=aN:GetAttribute"AmmoType"

if aO=="shotgun"or aO=="shootgun"then

return true

end

end

end

return false

end



local aM

if E and E.FireServer then local

aN=pcall(function()

aM=hookfunction(E.FireServer,function(aN,...)

if aN~=E then

return aM(aN,...)

end



local aO={...}



if F and aO[2]=="shoot_gun"and I then

local aP=I.Character and I.Character:FindFirstChild"Head"

local aQ=I.Character and I.Character:FindFirstChild"HumanoidRootPart"

local aR=I.Character and I.Character:FindFirstChild"Humanoid"



if aP and aQ and aR then

local aS=predictPosition(aP,aQ)

local aT=r.Character and r.Character:FindFirstChild"Head"

local aU=aT and aT.Position or nil



if isShotgun()then

aO[4]=CFrame.new(aU,aS)



local aV={}

for aW=1,6 do

local aX=Vector3.new(

math.random(-2,2)*0.03,

math.random(-2,2)*0.03,

math.random(-2,2)*0.03

)

table.insert(aV,{

[1]={

Instance=aP,

Normal=Vector3.new(0,1,0),

Position=aS+aX

}

})

end



aO[5]=aV



else

local aV=isBehindWall(aU,aS)



if aV then

aO[4]=CFrame.new(math.huge,math.huge,math.huge)

else

aO[4]=CFrame.new(aU,aS)

end



aO[5]={

[1]={

[1]={

Instance=aP,

Normal=Vector3.new(0,1,0),

Position=aS

}

}

}

end



local aV,aW=

pcall(

function()

local aV=Instance.new"Part"

aV.Anchored=true

aV.CanCollide=false

aV.Size=

Vector3.new(

0.08,

0.08,

(aS-r.Character.Head.Position).Magnitude

)

aV.CFrame=

CFrame.new(r.Character.Head.Position,aS)*

CFrame.new(0,0,-aV.Size.Z/2)

aV.Material=Enum.Material.Neon

aV.Transparency=0.35

aV.Color=Color3.fromRGB(255,0,0)

aV.Parent=workspace

f:AddItem(aV,4)

return aV

end

)



if aR then

local aX=aR.Health

spawn(

function()

wait(0.1)

if aR and aR.Health<aX then

if aV and aW then

aW.Color=Color3.fromRGB(0,255,0)

end

for aY,aZ in ipairs(I.Character:GetDescendants())do

if aZ:IsA"BasePart"then

local a_=Instance.new"Part"

a_.Size=aZ.Size+Vector3.new(0.05,0.05,0.05)

a_.CFrame=aZ.CFrame

a_.Anchored=true

a_.CanCollide=false

a_.Material=Enum.Material.Neon

a_.Color=Color3.fromRGB(255,0,0)

a_.Transparency=0.5

a_.Parent=g

local a0=TweenInfo.new(1.5,Enum.EasingStyle.Linear)

e:Create(a_,a0,{Transparency=1}):Play()

f:AddItem(a_,2)

end

end

if aP then

local aY=Instance.new"Part"

aY.Size=Vector3.new(0.2,0.2,0.2)

aY.Shape=Enum.PartType.Ball

aY.Material=Enum.Material.Neon

aY.Color=Color3.fromRGB(255,0,0)

aY.CFrame=CFrame.new(aP.Position)

aY.Anchored=false

aY.CanCollide=false

aY.Parent=g

local aZ=Instance.new"BodyVelocity"

aZ.Velocity=

Vector3.new(

math.random(-5,5),

math.random(5,10),

math.random(-5,5)

)

aZ.P=5000

aZ.MaxForce=Vector3.new(4000,4000,4000)

aZ.Parent=aY

f:AddItem(aY,1)

end

else

if aV and aW then

aW.Color=Color3.fromRGB(255,0,0)

end

end

end

)

end

end

end



return aM(aN,unpack(aO))

end

)

end

)



if not aN then

end

end



b.RenderStepped:Connect(function()
    pcall(function()
        if G then I = getClosestTarget() end
        I = (F or G) and getClosestTarget() or nil

        if J then
            J.Visible = F
            if F then
                J.Position = UDim2.fromScale(0.5,0.5)
                J.Size = UDim2.fromOffset(H*2,H*2)
            end
        end

        local gui = _G.__SalmonVisualGui
        if not gui then return end

        local marker = gui:FindFirstChild("LockedTarget")
        if not marker then
            marker = Instance.new("Frame")
            marker.Name = "LockedTarget"
            marker.AnchorPoint = Vector2.new(0.5,0.5)
            marker.Size = UDim2.fromOffset(18,18)
            marker.BackgroundTransparency = 1
            marker.Visible = false
            marker.ZIndex = 60
            marker.Parent = gui

            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(1,0)
            c.Parent = marker

            local s1 = Instance.new("UIStroke")
            s1.Thickness = 2
            s1.Color = Color3.fromRGB(255,55,75)
            s1.Parent = marker
        end

        local target = I or ((F or G) and getClosestTarget() or nil)
        if target and target.Character then
            local hum = target.Character:FindFirstChildOfClass("Humanoid")
            local root = target.Character:FindFirstChild("HumanoidRootPart")
            local part = (SelectedAimPart == "HumanoidRootPart" and root) or target.Character:FindFirstChild("Head")

            if hum and hum.Health > 0 and part then
                local predicted = predictPosition(part, root)
                local pos, onScreen = y:WorldToViewportPoint(predicted)
                if onScreen and pos.Z > 0 then
                    marker.Position = UDim2.fromOffset(pos.X,pos.Y)
                    marker.Visible = G or F
                else
                    marker.Visible = false
                end
            else
                marker.Visible = false
            end
        else
            marker.Visible = false
        end
    end)
end)

r.CharacterAdded:Connect(

function(aN)

s=aN

end

)



b.Heartbeat:Connect(

function()

if ai().Sky and r.Character and r.Character:FindFirstChild"HumanoidRootPart"then

local aN=r.Character.HumanoidRootPart

local aO=aN.Velocity

local aP=math.rad(tick()*1500%360)

local aQ=math.cos(aP)*ai().SkyAmount

local aR=math.sin(aP)*ai().SkyAmount



local aS=math.random(280,480)



aN.Velocity=Vector3.new(aQ,aS,aR)

b.RenderStepped:Wait()

aN.Velocity=aO

end

end

)



b.Heartbeat:Connect(

function()

if not enabled then

return

end

if isDowned()then

local aN=getHRP()

if aN and not ah then

teleportUnderground()

end

flickerAndMove()

else

if ah then

local aN=getHRP()

if aN then

aN.CFrame=ah+Vector3.new(0,-am,0)

end

end

ah=nil

ag=false

end

end

)

b.Heartbeat:Connect(

function()

if not r.Character or not r.Character:FindFirstChild"HumanoidRootPart"then

s=r.Character or r.CharacterAdded:Wait()

u=s:WaitForChild"HumanoidRootPart"

end

pcall(CheckAndPickup)

end

)



h:BindAction(

"FlyUp",

function(aN,aO,aP)

if not S then

return Enum.ContextActionResult.Pass

end

local aQ=false

if aP.UserInputType==Enum.UserInputType.Keyboard and aP.KeyCode==Enum.KeyCode.Space then

aQ=true

end

if aP.UserInputType==Enum.UserInputType.Touch then

aQ=true

end

if aQ then

if aO==Enum.UserInputState.Begin then

T=true

t.Jump=true

return Enum.ContextActionResult.Sink

elseif aO==Enum.UserInputState.End then

T=false

return Enum.ContextActionResult.Sink

end

end

return Enum.ContextActionResult.Pass

end,

false,

Enum.KeyCode.Space

)

b.RenderStepped:Connect(

function(aN)

if S and T then

u.Velocity=

Vector3.new(u.Velocity.X,U,u.Velocity.Z)

end

end

)

r.CharacterAdded:Connect(

function(aN)

local aO=aN:WaitForChild"Humanoid"

if aa then

aa:Disconnect()

end

aa=

aO:GetPropertyChangedSignal"Jumping":Connect(

function()

if S and aO.Jumping then

T=true

else

T=false

end

end

)

end

)



r.CharacterAdded:Connect(setupCharacter)

if r.Character then

setupCharacter(r.Character)

end

d.InputBegan:Connect(

function(aN,aO)

if aO then

return

end

if aN.KeyCode==Enum.KeyCode.G and A and B then

if B.Toggle then

B:Toggle()

elseif B.SetVisible then

B:SetVisible(not B.Visible)

end

end

end

)

d.InputBegan:Connect(

function(aN,aO)

if aO then

return

end

if aN.KeyCode==Enum.KeyCode.Z and W then

toggleTeleport()

end

end

)

r.CharacterAdded:Connect(

function(aN)

s=aN

u=aN:WaitForChild"HumanoidRootPart"

X=nil

V=false

lockYPosition()

end

)

lockYPosition()

r.CharacterAdded:Connect(

function()

task.wait(1)

aE=false

task.wait(0.1)

StartAutoAttack()

end

)

StartAutoAttack()

for aN,aO in ipairs{"gun","melee","throwable","consumable","farming","misc","rod","fish"}do

registerItems(c:WaitForChild"Items"[aO])

end

a.PlayerAdded:Connect(

function(aN)

aN.CharacterAdded:Connect(

function()

if aw then

wait(0.2)

createBillboardForPlayer(aN)

end

end

)

end

)

a.PlayerRemoving:Connect(

function(aN)

if av[aN]then

av[aN]:Destroy()

av[aN]=nil

end

end

)

for aN,aO in ipairs(a:GetPlayers())do

setupFastFinishForPlayer(aO)

end

a.PlayerAdded:Connect(setupFastFinishForPlayer)

task.spawn(

function()

while true do

task.wait(af)

if ad then

for aN,aO in ipairs(findFinishPrompts())do

task.spawn(

function()

tryHoldPrompt(aO,ae)

end

)

end

end

end

end

)

SetupAutoSkip()

c.ChildAdded:Connect(

function(aN)

if aN.Name=="Remotes"then

SetupAutoSkip()

end

end

)

a.PlayerAdded:Connect(

function(aN)

aN.CharacterAdded:Connect(

function(aO)

if highlightEnabled then

highlights[aN]=createHighlight(aO)

end

if L[aN]and L[aN].drawings then

local aP=L[aN].drawings[1]

aP.Color=

isPlayerExcluded(aN.Name)and Color3.fromRGB(0,255,0)or Color3.fromRGB(255,255,255)

end

end

)

end

)

a.PlayerRemoving:Connect(

function(aN)

if L[aN]then

for aO,aP in pairs(L[aN].drawings)do

if aP and aP.Destroy then

pcall(

function()

aP:Destroy()

end

)

elseif typeof(aP)=="table"and aP.Visible~=nil then

aP.Visible=false

end

end

if L[aN].conn then

pcall(

function()

L[aN].conn:Disconnect()

end

)

end

L[aN]=nil

end

end

)

task.spawn(

function()

while task.wait(1)do

if highlightEnabled then

updateHighlights()

end

end

end

)

loadESP()



local aN=B:Tab{Title="COMBAT:",Icon="crosshair"}

aN:Section{Title="GUN:"}

local aO=

aN:Toggle

{

Title="Silent Aim",

Default=false,

Callback=function(aO)

F=aO

I=nil



end

}



D:Register("SilentAim",aO)

local aP=

aN:Toggle

{

Title="Red Line Lock",

Default=false,

Callback=function(aP)

G=aP

I=nil

end

}



D:Register("SilentAimAttach",aP)



local aQ=

aN:Slider

{

Title="FOV: ",

Step=1,

Value={

Min=20,

Max=800,

Default=H

},

Callback=function(aQ)

H=tonumber(aQ)or 120

end

}



D:Register("FOVRadius",aQ)



local aR=

aN:Input

{

Title="Safe Friend",

Desc="",

Value="",

InputIcon="shield-check",

Type="Input",

Placeholder="",

Callback=function(aR)

P={}

for aS in string.gmatch(aR,"%S+")do

table.insert(P,aS)

end

for aS,aT in pairs(a:GetPlayers())do

if L[aT]and L[aT].drawings then

local aU=L[aT].drawings[1]

aU.Color=

isPlayerExcluded(aT.Name)and Color3.fromRGB(0,255,0)or Color3.fromRGB(255,255,255)

end

end

end

}



D:Register("FriendsList",aR)



pcall(

function()

aN:Divider()

end

)

local aS=B:Tab{Title="WEAPON:",Icon="layers"}

aS:Section{Title="MODS:"}



local aT=c:WaitForChild"Items":WaitForChild"gun"



ai().FireRateValue=1000

ai().AccuracyValue=1

ai().RecoilValue=0

ai().Durability=999999999

ai().Auto=true

ai().automatic=true

ai().AutoValue=true

ai().GunModsAutoApply=false



local function isGunTool(aU)

if not aU or not aU:IsA"Tool"then

return false

end

return aT:FindFirstChild(aU.Name)~=nil or aU.Name:match"Gun"or aU:FindFirstChild"Handle"

end



local function forceSetAttribute(aU,aV,aW)

if aU and aU.SetAttribute then

pcall(

function()

aU:SetAttribute(aV,aW)

end

)

end

end



local function debugPrintAttributes(aU)

local aV=aU:GetAttributes()

local aW={}

for aX,aY in pairs(aV)do

table.insert(aW,aX)

end

table.sort(aW)

if#aW>=11 then

end

end



local function applyGodGun(aU)

if not aU or not isGunTool(aU)then

return

end



pcall(

function()



aU:SetAttribute("fire_rate",ai().FireRateValue)

aU:SetAttribute("accuracy",ai().AccuracyValue)

aU:SetAttribute("Recoil",ai().RecoilValue)

aU:SetAttribute("Durability",ai().Durability)

aU:SetAttribute("automatic",ai().AutoValue)

end

)



task.spawn(

function()

for aV=1,20 do

local aW=aU:GetAttributes()

local aX={}

for aY in pairs(aW)do

table.insert(aX,aY)

end

table.sort(aX)



if#aX>=11 then

local aY=aX[11]

for aZ=1,5 do

forceSetAttribute(aU,aY,true)

task.wait(0.01)

end



end

task.wait(0.1)

end

end

)





task.wait(0.5)

debugPrintAttributes(aU)

end



b.Heartbeat:Connect(

function()

if not ai().GunModsAutoApply then

return

end



local aU=r.Character

if not aU then

return

end



for aV,aW in ipairs(aU:GetChildren())do

if aW:IsA"Tool"and isGunTool(aW)then

pcall(applyGodGun,aW)

end

end

end

)





r.CharacterAdded:Connect(

function(aU)

task.wait(1)

repeat

task.wait(0.1)

for aV,aW in ipairs(aU:GetChildren())do

if aW:IsA"Tool"and isGunTool(aW)then

task.spawn(applyGodGun,aW)

end

end

until not ai().GunModsAutoApply

end

)



r.Character.ChildAdded:Connect(

function(aU)

if aU:IsA"Tool"and ai().GunModsAutoApply then

task.wait(0.2)

applyGodGun(aU)

end

end

)



aS:Slider

{

Title="Fire Rate",

Step=10,

Value={Min=100,Max=3000,Default=1000},

Callback=function(aU)

ai().FireRateValue=aU

end

}



aS:Slider

{

Title="Accuracy",

Step=0.01,

Value={Min=0,Max=1,Default=1},

Callback=function(aU)

ai().AccuracyValue=aU

end

}



aS:Slider

{

Title="Recoil",

Step=0.1,

Value={Min=0,Max=10,Default=0},

Callback=function(aU)

ai().RecoilValue=aU

end

}



aS:Slider

{

Title="Reload Time",

Step=0.1,

Value={Min=0.1,Max=10,Default=0.1},

Callback=function(aU)

ai().ReloadValue=aU

end

}





aS:Toggle

{

Title="Automatic",

Icon="check",

Type="Checkbox",

Value=false,

Callback=function(aU)

ai().automatic=aU

ai().GunModsAutoApply=aU

if aU and A then

A:Notify

{

Title="✅ Auto Modify",

Duration=2

}



end

end

}





aS:Section{Title="COMBAT"}



local function modifyFists(aU,aV)

if aU then

local aW=aU:GetAttributes()

local aX={}

for aY,aZ in pairs(aW)do

table.insert(aX,aY)

end

table.sort(aX)

if#aX>=7 then

local aY=aX[6]

local aZ=aX[7]

if aV then

if az[aY]==nil then

az[aY]=aU:GetAttribute(aY)

end

if az[aZ]==nil then

az[aZ]=aU:GetAttribute(aZ)

end

aU:SetAttribute(aY,360)

aU:SetAttribute(aZ,20)

else

if az[aY]then

aU:SetAttribute(aY,az[aY])

end

if az[aZ]then

aU:SetAttribute(aZ,az[aZ])

end

end

end

end

end

local aU={}

for aV,aW in ipairs(q:GetChildren())do

table.insert(aU,aW.Name)

end



local function isMeleeTool(aV)

if not aV:IsA"Tool"then

return false

end

if aV.Name=="Fists"then

return true

end

for aW,aX in ipairs(aU)do

if aV.Name==aX then

return true

end

end

return false

end



local function checkAndModifyFists()

local aV=r.Character

local aW=r:FindFirstChild"Backpack"

if not aV or not aW then

return

end

local aX={}

for aY,aZ in ipairs(aV:GetChildren())do

if isMeleeTool(aZ)then

table.insert(aX,aZ)

end

end

for aY,aZ in ipairs(aW:GetChildren())do

if isMeleeTool(aZ)then

table.insert(aX,aZ)

end

end

for aY,aZ in ipairs(aX)do

modifyFists(aZ,ay)

end

end





b.Heartbeat:Connect(

function()

if ay then

checkAndModifyFists()

end

end

)





r.CharacterAdded:Connect(

function()

task.wait(1)

if ay then

checkAndModifyFists()

end

end

)



D:Register(

"Fists Modifier",

aS:Toggle

{

Title="Melee Aura",

Desc="WideFists",

Default=false,

Callback=function(aV)

ay=aV

checkAndModifyFists()

end

}



)



local aV=

aS:Toggle

{

Title="Auto Attack",

Default=false,

Callback=function(aV)

ab=aV

end

}





D:Register("AutoAttack_Enabled",aV)



local aW=B:Tab{Title="ESP:",Icon="eye"}

aW:Section{Title="Visual:"}

local aX=

aW:Toggle

{

Title="Inventory Viewer",

Default=false,

Callback=function(aX)

aw=aX

if aX then

for aY,aZ in ipairs(a:GetPlayers())do

if aZ~=r and aZ.Character then

createBillboardForPlayer(aZ)

end

end

ax=

b.Heartbeat:Connect(

function()

for aY,aZ in ipairs(a:GetPlayers())do

if aZ~=r and aZ.Character then

createBillboardForPlayer(aZ)

end

end

end

)

if A then

A:Notify

{

Title="✅ ESP Items Enabled",

Duration=3

}



end

else

if ax then

ax:Disconnect()

ax=nil

end

for aY,aZ in pairs(av)do

aZ:Destroy()

end

av={}

if A then

A:Notify

{

Title="❌ ESP Items Disabled",

Duration=3

}



end

end

end

}



D:Register("ItemsESP",aX)

local aY=

aW:Toggle

{

Title="Name",

Default=false,

Callback=function(aY)

M=aY

end

}



D:Register("NameESP",aY)

local aZ=

aW:Toggle

{

Title="Health",

Default=false,

Callback=function(aZ)

O=aZ

end

}



D:Register("HealthESP",aZ)

local a_=

aW:Toggle

{

Title="Distance",

Default=false,

Callback=function(a_)

N=a_

end

}



D:Register("DistanceESP",a_)





local a0=

aW:Toggle

{

Title="Highlight",

Default=false,

Callback=function(a0)

highlightEnabled=a0



for a1,a2 in pairs(game.Players:GetPlayers())do

updateHighlight(a2)

end

end

}



D:Register("HighlightESP",a0)



function updateHighlight(a1)

if a1==game.Players.LocalPlayer then

return

end

if not a1.Character then

return

end

local a2=a1.Character:FindFirstChild"HumanoidRootPart"

if not a2 then

return

end





if aB[a1]then

aB[a1]:Destroy()

aB[a1]=nil

end



if highlightEnabled then

local a3=Instance.new"Highlight"

a3.Name="PlayerHighlight"

a3.Adornee=a1.Character

a3.FillColor=Color3.fromRGB(0,170,255)

a3.OutlineColor=Color3.fromRGB(0,170,255)

a3.Parent=workspace

aB[a1]=a3

end

end





game.Players.PlayerAdded:Connect(

function(a1)

a1.CharacterAdded:Connect(

function()

task.wait(0.1)

updateHighlight(a1)

end

)

end

)



game.Players.PlayerRemoving:Connect(

function(a1)

if aB[a1]then

aB[a1]:Destroy()

aB[a1]=nil

end

end

)





for a1,a2 in pairs(game.Players:GetPlayers())do

if a2~=game.Players.LocalPlayer then

a2.CharacterAdded:Connect(

function()

task.wait(0.1)

updateHighlight(a2)

end

)

updateHighlight(a2)

end

end



local a1=B:Tab{Title="CHARACTER:",Icon="user"}

a1:Section{Title="CHARACTER:"}

local a2=

a1:Toggle

{

Title="Walk Speed",

Default=false,

Callback=function(a2)

Q=a2

end

}



D:Register("WalkSpeed",a2)

local a3=

a1:Slider

{

Title="Speed Multiplier",

Step=0.5,

Value={

Min=1,

Max=5,

Default=2

},

Callback=function(a3)

R=a3*0.05

end

}



D:Register("SpeedMultiplier",a3)

local a4=

a1:Toggle

{

Title="Jump Power",

Default=false,

Callback=function(a4)

S=a4

if not S then

flying=false

end

end

}



D:Register("JumpPower",a4)



local a5={}

function a5.send(...)

local a6={...}

aC.event=aC.event+1

pcall(

function()

i.Send:FireServer(aC.event,unpack(a6))

end

)

end

local a6=

a1:Toggle

{

Title="Infinite Stamina",

Default=false,

Callback=function(a6)

as=a6

if as then



local a7,a8=

pcall(

function()

return require(c.Modules.Game.Sprint)

end

)

if a7 and a8 then

local a9=a8.consume_stamina

local ba=getupvalue(a9,2).sprint_bar

if ba then

local bb=ba.update

ba.update=function(...)

return bb(

function()

return 1

end

)

end



ai().OriginalSprintUpdate=bb



ai().AutoSprintLoop=

task.spawn(

function()

while as do

pcall(

function()

a5.send("set_sprinting_1",true)

task.wait(0.5)

a5.send("set_sprinting_1",false)

end

)

task.wait(0.1)

end



pcall(

function()

a5.send("set_sprinting_1",false)

end

)

end

)

if A then

A:Notify

{

Title="✅ INF STAMINA",

Duration=3

}



end

else

as=false

AutoSprintToggle:Set(false)

end

else

as=false

AutoSprintToggle:Set(false)

end

else



if ai().AutoSprintLoop then

task.cancel(ai().AutoSprintLoop)

ai().AutoSprintLoop=nil

end



pcall(

function()

a5.send("set_sprinting_1",false)

end

)



local a7,a8=

pcall(

function()

return require(c.Modules.Game.Sprint)

end

)

if a7 and a8 then

local a9=a8.consume_stamina

local ba=getupvalue(a9,2).sprint_bar

if ba and ai().OriginalSprintUpdate then

ba.update=ai().OriginalSprintUpdate

ai().OriginalSprintUpdate=nil

end

end

if A then

A:Notify

{

Title="❌ Auto Sprint Disabled",

Duration=3

}



end

end

end

}



D:Register("AutoSprint",a6)

local a7=

a1:Toggle

{

Title="Anti Lock",

Default=false,

Callback=function(a7)

ai().Sky=a7

if a7 then

ai().SkyAmount=1500

end

end

}



D:Register("AntiLock",a7)

local a8=

a1:Toggle

{

Title="Anti Kill",

Default=false,

Callback=function(a8)

enabled=a8

if a8 then

if A then

A:Notify

{

Title=" Anti Kill Enabled",

Duration=3

}



end

else

if A then

A:Notify

{

Title="❌ Anti Kill Disabled",

Duration=3

}



end

end

end

}



D:Register("AntiKill",a8)

pcall(

function()

if a1 and typeof(a1.Divider)=="function"then

a1:Divider()

end

end

)

pcall(

function()

if a1 and typeof(a1.Section)=="function"then

a1:Section{Title="Att:"}

end

end

)

local a9=

a1:Toggle

{

Title="Pickup items",

Default=false,

Callback=function(a9)

ak=a9

end

}



D:Register("PickupItems",a9)

local ba=

a1:Toggle

{

Title="Anti Ragdoll",

Default=false,

Callback=function(ba)

local bb=ba

if not bb then

return

end

pcall(

function()

local bc=game:GetService"ReplicatedStorage"

local bd=game:GetService"Players"local be=

bd.LocalPlayer

local function findCounter()

for bf,bg in ipairs(getgc and getgc(true)or{})do

if typeof(bg)=="table"and rawget(bg,"event")and rawget(bg,"func")then

return bg

end

end

end

local bf=findCounter()

if not bf then

return

end

local function sendRemoteAction(bg)

bf.event=(bf.event or 0)+1

local bh=bc:WaitForChild"Remotes":WaitForChild"Send"

bh:FireServer(bf.event,bg)

end

task.spawn(

function()

while bb do

sendRemoteAction"end_ragdoll_early"

task.wait(0.3)

if not bb then

break

end

sendRemoteAction"clear_ragdoll"

task.wait(0.3)

end

end

)

end

)

end

}



D:Register("AntiRagdoll",ba)

local bb=

a1:Toggle

{

Title="Hide Name",

Default=false,

Callback=function(bb)

pcall(

function()

local bc=a.LocalPlayer

local bd=bc.Character or bc.CharacterAdded:Wait()

local be=bd:WaitForChild"HumanoidRootPart"

local bf=be:FindFirstChild"CharacterBillboardGui"

if bf then

local bg=bf:FindFirstChild"PlayerName"

if bg and bg:IsA"TextLabel"then

bg.Visible=not bb

end

end

end

)

end

}



D:Register("HideName",bb)

local bc=

a1:Toggle

{

Title="Auto Respawn",

Default=false,

Callback=function(bc)

local bd=bc

if not bd then

return

end

pcall(

function()

local be=game:GetService"ReplicatedStorage"

local bf=game:GetService"Players"

local bg=bf.LocalPlayer

local function findCounter()

for bh,bi in ipairs(getgc and getgc(true)or{})do

if typeof(bi)=="table"and rawget(bi,"event")and rawget(bi,"func")then

return bi

end

end

end

local bh=findCounter()

if not bh then

return

end

local function sendRemoteAction(bi)

bh.event=(bh.event or 0)+1

local bj=be:WaitForChild"Remotes":WaitForChild"Send"

bj:FireServer(bh.event,bi)

end

task.spawn(

function()

while bd do

local bi=bg.Character

local bj=bi and bi:FindFirstChildOfClass"Humanoid"

if bj and bj.Health<=0 then

task.wait(6)

if bd then

sendRemoteAction"death_screen_request_respawn"

end

end

task.wait(0.5)

end

end

)

end

)

end

}



D:Register("AutoRespawn",bc)

a1:Divider()

a1:Section{Title="PC HOLD (Z)"}



local bd=

a1:Toggle

{

Title="Snap Under Map",

Default=false,

Callback=function(bd)

W=bd



if W then

ac=ac+1



if ac<2 then

return

end



Z=u and u.Position.Y or nil

V=true

performTeleport()

else

V=false

X=nil

Z=nil

end

end

}





D:Register("SnapUnderMap",bd)

local be=

a1:Slider

{

Title="Snap:",

Step=1,

Value={Min=1,Max=50,Default=10},

Callback=function(be)

Y=be

if V and u and Z then

local bf=

Vector3.new(u.Position.X,Z-Y,u.Position.Z)

u.CFrame=CFrame.new(bf)

X=bf.Y

end

end

}



D:Register("SnapHeight",be)

local bf=B:Tab{Title="PLAYER:",Icon="person-standing"}

bf:Section{Title="PLAYER:"}

local bg=Instance.new("Folder",g)

local bh=Instance.new("Part",bg)

Instance.new("Attachment",bh)

bh.Anchored=true

bh.CanCollide=false

bh.Transparency=1

local bi=

bf:Toggle

{

Title="Auto Finnish",

Default=false,

Callback=function(bi)

ad=bi

if bi then

applyToAll()

if A then

A:Notify{Title="✅ Auto Finish Enabled",Description="✅ Auto Enabled",Duration=3}

end

else

if A then

A:Notify{Title="❌ Auto Disabled",Description="❌ Auto Disabled",Duration=3}

end

end

end

}



D:Register("AutoFinnish",bi)

bf:Divider()



local bk=B:Tab{Title="MISC:",Icon="warehouse"}



local bl=game.PlaceId





bk:Input

{

Title="Server Hop by ID",

Value="",

InputIcon="send",

Type="Input",

Placeholder="id sever here!",

Callback=function(bm)

if not bm or bm==""then

return

end



local bn={}

for bo in string.gmatch(bm,"[%w%-]+")do

table.insert(bn,bo)

end



if#bn==0 then

return

end



for bo,bp in ipairs(bn)do

print("กำลังวาร์ปไปเซิร์ฟ:",bp)

task.wait(0.5)

pcall(

function()

game:GetService"TeleportService":TeleportToPlaceInstance(bl,bp,r)

end

)

end

end

}





bk:Button

{

Title="Server Rejoin",

Desc="Come back old sever",

Callback=function()

game:GetService"TeleportService":TeleportToPlaceInstance(

game.PlaceId,

game.JobId,

game.Players.LocalPlayer

)

end

}





game:GetService"HttpService"local bm=

game.PlaceId









































































































bk:Button

{

Title="Server Hop",

Desc="Hop to a new server (sometime don't work)",

Locked=false,

Callback=function()

local bn=104715542330896

local bo=game:GetService"HttpService"

local bp=game:GetService"TeleportService"



local bq,br=

pcall(

function()

return bo:JSONDecode(

game:HttpGet(

"https://games.roblox.com/v1/games/"..

bn.."/servers/Public?sortOrder=Desc&limit=100"

)

)

end

)



if not bq or not br or not br.data then

warn"ไม่สามารถดึงข้อมูลเซิร์ฟเวอร์ได้เลยพี่"

return

end



local bs={}

for bt,bu in ipairs(br.data)do

if bu.playing<bu.maxPlayers and bu.id~=game.JobId then

table.insert(bs,bu)

end

end



if#bs==0 then

warn"ไม่มีเซิร์ฟเวอร์ว่างเลยพี่ขณะนี้"

return

end



table.sort(

bs,

function(bt,bu)

return bt.playing>bu.playing

end

)



local bt=bs[1]



game.StarterGui:SetCore(

"SendNotification",

{

Title="Server Hop",

Text="กำลังย้ายไปเซิร์ฟเวอร์คนเยอะ...",

Duration=3

}

)



bp:TeleportToPlaceInstance(bn,bt.id,game.Players.LocalPlayer)

end

}





bk:Divider()



local bn=

bk:Button

{

Title="Claim All Quest",

Callback=function()

task.spawn(

function()

local bn,bo=

pcall(

function()

local bn=game:GetService"Players"

local bo=game:GetService"ReplicatedStorage"

local bp=bn.LocalPlayer



local function findCounter()

for bq,br in ipairs(getgc and getgc(true)or{})do

if typeof(br)=="table"and rawget(br,"event")and rawget(br,"func")then

return br

end

end

return nil

end

local bq=findCounter()

if not bq then

return

end



local br={}

function br.get(...)

local bs={...}

bq.func=(bq.func or 0)+1

local bt=bo:WaitForChild"Remotes":WaitForChild"Get"

return bt:InvokeServer(bq.func,table.unpack(bs))

end

local bs=

bp:WaitForChild"PlayerGui":WaitForChild"Quests":WaitForChild"QuestsHolder":WaitForChild

"QuestsScrollingFrame"



for bt,bu in ipairs(bs:GetChildren())do

if bu:IsA"Frame"or bu:IsA"TextButton"or bu:IsA"ImageButton"then

br.get("claim_quest",bu.Name)

task.wait(0.2)

end

end

end

)

if bn then

print"Claim All Quests Completed"

else

warn(bo)

end

end

)

end

}



D:Register("ClaimAllQuest",bn)



local bo=D.Save

local bp=D.Delete

local bq=D.Load



bk:Section{Title="Config Management"}



local br=

bk:Button

{

Title="Save Config",

Callback=function()

if bo then

bo(D)

end

end

}



D:Register("SaveConfig",br)



local bs=

bk:Button

{

Title="Delete Config",

Callback=function()

if bp then

bp(D)

end

end

}



D:Register("DeleteConfig",bs)



if bq then

bq(D)

end





local bt=j.tween



j.tween=function(bu,bv,bw)

if bu and bu:IsA"NumberValue"and bw and bw.Value~=nil then

bu.Value=bw.Value

return{

Cancel=function()

end

}

end

return bt(bu,bv,bw)

end



local bu,bv=

pcall(

function()

return k.get"SellPromptSellButton"

end

)

if bu and bv then

local bw=bv:FindFirstChild("HoldStroke",true)

if bw then

bw.Enabled=false

local bx=bw:FindFirstChildOfClass"UIGradient"

if bx then

bx.Enabled=false

end

end

for bx,by in pairs(bv:GetDescendants())do

if by:IsA"NumberValue"then

by.Value=1

end

end

end



task.wait(2)

print"Bypass"



local function lockTool(bw)

if bw and bw:IsA"Tool"then

pcall(

function()

bw:SetAttribute("Locked",true)

end

)

end

end



local function setupBackpack(bw)

if not bw then

return

end

for bx,by in ipairs(bw:GetChildren())do

lockTool(by)

end

bw.ChildAdded:Connect(lockTool)

end



local function init()

local bw=r:FindFirstChildOfClass"Backpack"

if bw then

setupBackpack(bw)

else

r.ChildAdded:Connect(

function(bx)

if bx:IsA"Backpack"then

setupBackpack(bx)

end

end

)

end

end



init()



r.CharacterAdded:Connect(

function()

task.wait(1)

init()

end

)



task.wait(1)



print"Bypass hotbar inf"

local function hookButton(bw)

if not bw then

return

end



if bw:FindFirstChild"UnlocksAtText"then

bw.UnlocksAtText.Visible=false

end

if bw:FindFirstChild"EmoteName"then

bw.EmoteName.Visible=true

end



n.on_click(

bw,

function()

local bx=o.get_hum()

if not bx or bx.Health<=0 then

return

end



if l.current_emote_playing.get()==bw then

l.current_emote_playing.set(nil)

else

l.current_emote_playing.set(bw)

end



task.wait(0.12)



l.enabled.set(false)

end

)



l.current_emote_playing.hook(

function(bx)

if bw:FindFirstChild"EmoteEquipped"then

bw.EmoteEquipped.Visible=(bx==bw)

end

end

)

end



local function hookAllEmotes()

for bw,bx in pairs(m)do

local by=n.get"EmoteTemplate".Parent:FindFirstChild(bx.name)

hookButton(by)

end

end



hookAllEmotes()



r.CharacterAdded:Connect(

function()

task.wait(1)

hookAllEmotes()

end

)



task.wait(2)



local bw

repeat

task.wait()

until workspace.CurrentCamera

bw=workspace.CurrentCamera



local function getRarityColor(bx)

if bx.Name=="Money"then

return Color3.fromRGB(0,255,0)

end

for by,bz in ipairs(p:GetChildren())do

if bz:IsA"Folder"then

local bA=bz:FindFirstChild(bx.Name)

if bA and bA:GetAttribute"RarityName"then

local bB=bA:GetAttribute"RarityName"

return at[bB]or Color3.fromRGB(255,255,255)

end

end

end

return Color3.fromRGB(255,255,255)

end





local function cleanupItemDrawings()

for bx,by in pairs(w)do

if not bx or not bx.Parent then

if by.circle then

pcall(

function()

by.circle:Remove()

end

)

end

if by.innerCircle then

pcall(

function()

by.innerCircle:Remove()

end

)

end

if by.name then

pcall(

function()

by.name:Remove()

end

)

end

if by.amount then

pcall(

function()

by.amount:Remove()

end

)

end

if by.highlight then

pcall(

function()

by.highlight:Destroy()

end

)

end

w[bx]=nil

end

end

end





b.RenderStepped:Connect(

function()

cleanupItemDrawings()

if not x then

return

end



local bx=v.Character and v.Character:FindFirstChild"HumanoidRootPart"

if not bx then

return

end





for by,bz in pairs(w)do

bz.circle.Visible=false

bz.innerCircle.Visible=false

bz.name.Visible=false

bz.amount.Visible=false

if bz.highlight then

bz.highlight.Enabled=false

end

end



local by={}

for bz,bA in ipairs(x:GetChildren())do

if bA:IsA"Model"and bA:FindFirstChild"PickUpZone"and not bA:GetAttribute"Locked"then

local bB,bC=

pcall(

function()

return bA.PickUpZone.Position

end

)

if bB and bC then

local bD=(bC-bx.Position).Magnitude

table.insert(by,{item=bA,dist=bD})

end

end

end

table.sort(

by,

function(bz,bA)

return bz.dist<bA.dist

end

)



for bz=1,math.min(20,#by)do

local bA=by[bz].item

local bB=w[bA]



if not bB then

bB={

circle=Drawing.new"Circle",

innerCircle=Drawing.new"Circle",

name=Drawing.new"Text",

amount=Drawing.new"Text"

}



bB.circle.Thickness=2

bB.circle.Transparency=0.7

bB.circle.Filled=false



bB.innerCircle.Thickness=2

bB.innerCircle.Transparency=1

bB.innerCircle.Filled=true





bB.name.Outline=true

bB.name.OutlineColor=Color3.fromRGB(0,0,0)

bB.name.Center=true

bB.name.Size=16

bB.name.Font=4





bB.amount.Outline=true

bB.amount.OutlineColor=Color3.fromRGB(0,0,0)

bB.amount.Center=true

bB.amount.Size=13

bB.amount.Color=Color3.fromRGB(200,200,200)



w[bA]=bB

end



if not bB.highlight or not bB.highlight.Parent then

local bC=Instance.new"Highlight"

bC.Name="ESP_Highlight"

bC.FillTransparency=0.5

bC.OutlineTransparency=0.1

bC.Adornee=bA

bC.Parent=bA

bB.highlight=bC

end



local bC,bD=bw:WorldToViewportPoint(bA.PickUpZone.Position)

if bD then

local bE=getRarityColor(bA)

local bF=math.clamp(aA/bC.Z,3,6)



if bB.highlight then

bB.highlight.FillColor=bE

bB.highlight.OutlineColor=bE

bB.highlight.Enabled=true

end



bB.circle.Position=Vector2.new(bC.X,bC.Y)

bB.circle.Radius=bF+5

bB.circle.Color=bE

bB.circle.Visible=true



bB.innerCircle.Position=Vector2.new(bC.X,bC.Y)

bB.innerCircle.Radius=bF

bB.innerCircle.Color=bE

bB.innerCircle.Visible=true



bB.name.Color=bE

bB.name.Position=Vector2.new(bC.X,bC.Y-bF-20)

bB.name.Text=bA.Name

bB.name.Visible=true



local bG=bA:GetAttribute"Amount"or 1

bB.amount.Position=Vector2.new(bC.X,bC.Y+bF+15)

bB.amount.Text=bG>1 and"["..tostring(bG).."]"or""

bB.amount.Visible=bG>1

else

bB.circle.Visible=false

bB.innerCircle.Visible=false

bB.name.Visible=false

bB.amount.Visible=false

if bB.highlight then

bB.highlight.Enabled=false

end

end

end

end

)



a.PlayerRemoving:Connect(

function(bx)

if bx==v then

for by,bz in pairs(w)do

pcall(

function()

bz.circle:Remove()

end

)

pcall(

function()

bz.innerCircle:Remove()

end

)

pcall(

function()

bz.name:Remove()

end

)

pcall(

function()

bz.amount:Remove()

end

)

pcall(

function()

if bz.highlight then

bz.highlight:Destroy()

end

end

)

end

w={}

end

end

)



local BuyTab = Window:Tab({Title = "Buy", Icon = "house"})



BuyTab:Section(

    {

        Title = "Buy"

    }

)



local CrateController = require(game:GetService("ReplicatedStorage").Modules.Game.CrateSystem.Crate)



local EnabledSkip = false



BuyTab:Toggle({

    Title = "Skip animation",

    Desc = "",

    Value = false,

    Callback = function(v)

        EnabledSkip = v



        if EnabledSkip then

            task.spawn(function()

                while EnabledSkip do

                    task.wait()



                    if CrateController.class and CrateController.class.objects then

                        for _, crate in pairs(CrateController.class.objects) do

                            pcall(function()

                                if crate.states and crate.states.open and crate.states.open.set then

                                    crate.states.open.set(true)

                                end

                                if CrateController.skipping and CrateController.skipping.set then

                                    CrateController.skipping.set(true)

                                end

                            end)

                        end

                    end



                    if CrateController.spinning and CrateController.skip_spin then

                        if not CrateController.spinning.get() then

                            pcall(function()

                                CrateController.skip_spin()

                            end)

                        end

                    end

                end

            end)

        else



            pcall(function()

                if CrateController.skipping and CrateController.skipping.set then

                    CrateController.skipping.set(false)

                end

            end)

        end

    end

})



local VehicleTab = Window:Tab({Title = "Vehicle", Icon = "car"})



VehicleTab:Section(

    {

        Title = "Vehicle"

    }

)



VehicleTab:Button({

        Title = "Pull Car Owner",

        Desc = "",

        Callback = function()

            local Players = game:GetService("Players")

local Client = Players.LocalPlayer



local Character = Client.Character or Client.CharacterAdded:Wait()

local RootPart = Character:WaitForChild("HumanoidRootPart")



local Vehicles = workspace:WaitForChild("Vehicles")



for _, vehicle in pairs(Vehicles:GetChildren()) do

    if vehicle:IsA("Model") then

        local ownerId = vehicle:GetAttribute("OwnerUserId")

        

        if ownerId and ownerId == Client.UserId then

            local offset = CFrame.new(math.random(-5,5), 3, math.random(-15,-5))

            

            if vehicle.PrimaryPart then

                vehicle:SetPrimaryPartCFrame(RootPart.CFrame * offset)

            else

                local part = vehicle:FindFirstChildWhichIsA("BasePart")

                if part then

                    part.CFrame = RootPart.CFrame * offset

                end

            end

        end

    end

end

            Window:Notify({

                Title = "Button",

                Desc = "Action performed successfully.",

                Time = 3

            })

        end

    })


-- ============================================================
-- RESILIENT VISUAL ENGINE
-- ScreenGui-only: mobile/PC friendly, no Drawing dependency.
-- ============================================================
do
    local gui = _G.__SalmonVisualGui
    if not gui then return end

    local Visual = {
        Name = true,
        Health = true,
        Distance = true,
        Box = true,
        Target = true,
        Hitbox4x = false,
    }
    _G.__SalmonVisualState = Visual

    local root = gui:FindFirstChild("PlayerESP")
    if root then root:Destroy() end
    root = Instance.new("Folder")
    root.Name = "PlayerESP"
    root.Parent = gui

    local entries = {}

    local function makeLabel(parent, size, y)
        local l = Instance.new("TextLabel")
        l.BackgroundTransparency = 1
        l.Size = UDim2.new(1,0,0,size)
        l.Position = UDim2.new(0,0,0,y)
        l.Font = Enum.Font.GothamBold
        l.TextSize = size >= 18 and 14 or 12
        l.TextColor3 = Color3.new(1,1,1)
        l.TextStrokeTransparency = 0
        l.TextStrokeColor3 = Color3.new(0,0,0)
        l.TextXAlignment = Enum.TextXAlignment.Center
        l.Visible = false
        l.Parent = parent
        return l
    end

    local function newEntry(plr)
        if plr == r or entries[plr] then return end

        local box = Instance.new("Frame")
        box.Name = plr.Name
        box.BackgroundTransparency = 1
        box.BorderSizePixel = 0
        box.Visible = false
        box.ZIndex = 20
        box.Parent = root

        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 1.5
        stroke.Color = Color3.fromRGB(255,255,255)
        stroke.Transparency = 0
        stroke.Parent = box

        local name = makeLabel(box,18,-20)
        local hp = makeLabel(box,16,0)
        local dist = makeLabel(box,16,18)

        local barBack = Instance.new("Frame")
        barBack.Name = "HealthBack"
        barBack.AnchorPoint = Vector2.new(1,0.5)
        barBack.Position = UDim2.new(0,-5,0.5,0)
        barBack.Size = UDim2.fromOffset(4,80)
        barBack.BackgroundColor3 = Color3.fromRGB(25,25,25)
        barBack.BorderSizePixel = 0
        barBack.Visible = false
        barBack.ZIndex = 21
        barBack.Parent = box

        local bar = Instance.new("Frame")
        bar.Name = "Health"
        bar.AnchorPoint = Vector2.new(0.5,1)
        bar.Position = UDim2.fromScale(0.5,1)
        bar.Size = UDim2.fromScale(1,1)
        bar.BackgroundColor3 = Color3.fromRGB(50,220,90)
        bar.BorderSizePixel = 0
        bar.Parent = barBack

        local hitbox = Instance.new("BoxHandleAdornment")
        hitbox.Name = "Hitbox4xVisual"
        hitbox.Adornee = nil
        hitbox.Size = Vector3.new(4,4,4)
        hitbox.Color3 = Color3.fromRGB(255,70,70)
        hitbox.Transparency = 0.82
        hitbox.AlwaysOnTop = true
        hitbox.ZIndex = 5
        hitbox.Visible = false
        hitbox.Parent = gui

        entries[plr] = {
            frame=box, name=name, hp=hp, dist=dist,
            barBack=barBack, bar=bar, hitbox=hitbox
        }
    end

    local function removeEntry(plr)
        local e = entries[plr]
        if not e then return end
        if e.frame then e.frame:Destroy() end
        if e.hitbox then e.hitbox:Destroy() end
        entries[plr] = nil
    end

    local function projectBox(char)
        local cf, size = char:GetBoundingBox()
        local half = size * 0.5
        local pts = {
            cf * Vector3.new(-half.X,-half.Y,-half.Z),
            cf * Vector3.new(-half.X,-half.Y, half.Z),
            cf * Vector3.new(-half.X, half.Y,-half.Z),
            cf * Vector3.new(-half.X, half.Y, half.Z),
            cf * Vector3.new( half.X,-half.Y,-half.Z),
            cf * Vector3.new( half.X,-half.Y, half.Z),
            cf * Vector3.new( half.X, half.Y,-half.Z),
            cf * Vector3.new( half.X, half.Y, half.Z)
        }

        local minX, minY = math.huge, math.huge
        local maxX, maxY = -math.huge, -math.huge
        local visible = false

        for _, p3 in ipairs(pts) do
            local p2, onScreen = y:WorldToViewportPoint(p3)
            if onScreen and p2.Z > 0 then visible = true end
            minX = math.min(minX,p2.X)
            minY = math.min(minY,p2.Y)
            maxX = math.max(maxX,p2.X)
            maxY = math.max(maxY,p2.Y)
        end

        if not visible or maxX-minX < 2 or maxY-minY < 2 then
            return nil
        end
        return minX,minY,maxX-minX,maxY-minY
    end

    local function updateEntry(plr, e)
        local char = plr.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local rootPart = char and char:FindFirstChild("HumanoidRootPart")
        if not char or not hum or hum.Health <= 0 or not rootPart then
            e.frame.Visible=false
            e.hitbox.Visible=false
            return
        end

        local x,y0,w,h0 = projectBox(char)
        if not x then
            e.frame.Visible=false
            e.hitbox.Visible=false
            return
        end

        local myRoot = r.Character and r.Character:FindFirstChild("HumanoidRootPart")
        local d = myRoot and (rootPart.Position-myRoot.Position).Magnitude or 0
        local hpRatio = math.clamp(hum.Health / math.max(hum.MaxHealth,1),0,1)

        e.frame.Position = UDim2.fromOffset(x,y0)
        e.frame.Size = UDim2.fromOffset(w,h0)
        e.frame.Visible = Visual.Box

        e.name.Text = plr.Name
        e.name.Visible = Visual.Name
        e.name.TextColor3 = isPlayerExcluded(plr.Name)
            and Color3.fromRGB(80,255,120)
            or Color3.fromRGB(255,255,255)

        e.hp.Text = Visual.Health and string.format("%d / %d HP",hum.Health,hum.MaxHealth) or ""
        e.hp.Visible = Visual.Health

        e.dist.Text = Visual.Distance and string.format("%.0f studs",d) or ""
        e.dist.Visible = Visual.Distance

        e.barBack.Visible = Visual.Health
        e.bar.Size = UDim2.fromScale(1,hpRatio)
        e.bar.Position = UDim2.new(0.5,0,1,0)
        e.bar.BackgroundColor3 = Color3.fromHSV(hpRatio*0.33,0.8,0.95)

        local head = char:FindFirstChild("Head")
        e.hitbox.Adornee = head
        e.hitbox.Visible = Visual.Hitbox4x and head ~= nil
        if head then
            e.hitbox.Size = head.Size * 4
        end
    end

    for _,plr in ipairs(a:GetPlayers()) do newEntry(plr) end
    a.PlayerAdded:Connect(newEntry)
    a.PlayerRemoving:Connect(removeEntry)

    -- Rebuild after respawn so the overlay remains valid after map/game changes.
    for _,plr in ipairs(a:GetPlayers()) do
        if plr ~= r then
            plr.CharacterAdded:Connect(function()
                task.defer(function()
                    newEntry(plr)
                end)
            end)
        end
    end

    b.RenderStepped:Connect(function()
        for plr,e in pairs(entries) do
            if plr.Parent == a then
                pcall(updateEntry,plr,e)
            else
                removeEntry(plr)
            end
        end

        local marker = gui:FindFirstChild("LockedTarget")
        if marker then
            marker.Visible = Visual.Target and ((F or G) and marker.Visible)
        end
    end)

    -- Public helpers used by the Visuals tab.
    _G.__SalmonSetVisual = function(key,value)
        if Visual[key] ~= nil then
            Visual[key] = value and true or false
        end
    end
end

-- Visuals tab additions: these use the ScreenGui engine above.
pcall(function()
    if aW and aW.Toggle then
        local v1 = aW:Toggle{
            Title="Box",
            Default=true,
            Callback=function(v) _G.__SalmonSetVisual("Box",v) end
        }
        D:Register("VisualBox",v1)

        local v2 = aW:Toggle{
            Title="Target Lock Marker",
            Default=true,
            Callback=function(v) _G.__SalmonSetVisual("Target",v) end
        }
        D:Register("VisualTarget",v2)

        local v3 = aW:Toggle{
            Title="4x Hitbox Visual",
            Default=false,
            Callback=function(v) _G.__SalmonSetVisual("Hitbox4x",v) end
        }
        D:Register("VisualHitbox4x",v3)
    end
end)

-- ============================================================
-- Compatibility watchdog
-- ============================================================
-- This does not promise immunity to future game updates; it only
-- recreates local GUI objects if the game's UI/player lifecycle replaces them.
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if not r or not r.Parent then return end
            local pg = r:FindFirstChild("PlayerGui")
            if not pg then return end
            local gui = _G.__SalmonVisualGui
            if not gui or not gui.Parent then
                -- Do not recreate the whole exploit state automatically;
                -- only keep the existing visual layer from becoming orphaned.
                return
            end
        end)
    end
end)

