local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/GrowOldSimulator/main/GrowOldSimulator.lua')))()
local w = library:CreateWindow("Grow Old Simulator")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("AutoBuy")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")

b:Toggle ("Auto Collect Toys",function(bool)
    shared.toggle = bool
    autotoy = bool
end)

b:Toggle ("Auto Sell",function(bool)
    shared.toggle = bool
    autosell = bool
end)

f:Toggle ("Auto Rebirth",function(bool)
    shared.toggle = bool
    autorebirth = bool
end)

f:Toggle ("Auto SuperRebirth",function(bool)
    shared.toggle = bool
    autosr = bool
end)

f:Toggle ("Auto Buy Areas",function(bool)
    shared.toggle = bool
    autoarea = bool
end)

e:Button("Tp Shop",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Debris.Activations.Shop.CFrame.Position + Vector3.new(0,0,0))
end)

e:Button("Tp Rebirth",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Debris.Activations.Rebirths.CFrame.Position + Vector3.new(0,0,0))
end)

e:Slider("WalkSpeed",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

e:Slider("JumpPower",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)

u:Button("Discrod Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)


while wait() do

    if autotoy == true then
        for i,v in pairs(game:GetService("Workspace").Debris.Pickups.Spawned:GetChildren()) do
            v.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position)
        end
    end

    if autosell == true then
        game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("Sell","Home")
    end

    if autorebirth == true then
        game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("Rebirth")
    end

    if autosr == true then
        game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer("SuperRebirth")
    end

    if autoarea == true then
        game:GetService("ReplicatedStorage").Events.RemoteFunction:InvokeServer("BuyArea","Food")
        game:GetService("ReplicatedStorage").Events.RemoteFunction:InvokeServer("BuyArea","Toilet")
        game:GetService("ReplicatedStorage").Events.RemoteFunction:InvokeServer("BuyArea","Book")
        game:GetService("ReplicatedStorage").Events.RemoteFunction:InvokeServer("BuyArea","Beach")
        game:GetService("ReplicatedStorage").Events.RemoteFunction:InvokeServer("BuyArea","Gaming")
        game:GetService("ReplicatedStorage").Events.RemoteFunction:InvokeServer("BuyArea","Cemetery")
    end

    if AntiAfk == true then
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
           vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
           wait(1)
           vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end