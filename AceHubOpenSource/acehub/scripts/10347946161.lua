--Auth
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
if _G.keyss == nil then
    game.Players.LocalPlayer:Kick("nice try")
end

function checkauth()
    local Response = httprequest({
        Url = "http://acehub.pro/api/checkauth",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            key=_G.keyss,
            userid=tostring(game.Players.LocalPlayer.UserId),
            gameid=tostring(game.PlaceId)
        })
    })
    if Response.Body == nil then
        game.Players.LocalPlayer:Kick("Cant reach API or Key Error")
    else if Response.Body == "authenticated" then
        wait()
    else
        game.Players.LocalPlayer:Kick("Expired or invalid key!")
        end
    end
end


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Rat Washing Simulator 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})



OrionLib:MakeNotification({
	Name = "Loaded!",
	Content = "GalaxyHub loaded sucessfully.",
	Image = "rbxassetid://4483345998",
	Time = 5
})


local tab = Window:MakeTab({Name = "AutoFarm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "AutoFarm"})
local tab2 = Window:MakeTab({Name = "Settings", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Delays"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab3:AddSection({Name = "Discord/Credits"})

--Variables 
local autosell = false
local autocollect = false
local autoobby = false
local autocollectdelay = nil
local autoselldelay = nil


tab:AddToggle({
    Name = "Auto Wash",
    Default = false,
    Callback = function(Value)
        if Value == true then
            autosell = true
        while autosell == true do
            game:GetService("ReplicatedStorage").Knit.Services.TycoonService.RE.SellRats:FireServer()
            wait(autoselldelay)
            end
        else
            autosell = false
        end
    end    
})

tab:AddToggle({
    Name = "Auto Collect",
    Default = false,
    Callback = function(Value)
        if Value == true then
            autocollect = true
            while autocollect == true do
                local Tycoon = game:GetService("ReplicatedStorage").Knit.Services.TycoonService.RF.getTycoon:InvokeServer()
                for _,v in pairs(Tycoon.Rats:GetChildren()) do
                    local A_1 = tonumber(v.Name)
                    local Event = game:GetService("ReplicatedStorage").Knit.Services.TycoonService.RE.CollectRat
                    Event:FireServer(A_1)
                    wait(autocollectdelay)
                end
            end
        else
            autocollect = false
    end
end
})

tab:AddToggle({
	Name = "Auto Obby",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoobby = true
            while autoobby == true do
                wait()
                if game:GetService("Workspace").Obby.Sign.Forcefield.Wall.CanCollide == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Obby.Button.Ring.CFrame * CFrame.new(0,8,0)
                end
            end
            else
                autoobby = false
            end
    	end    
})

section2:AddSlider({
	Name = "Auto Collect Delay",
	Min = 0.1,
	Max = 1,
	Default = 0.5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.1,
	ValueName = "Seconds",
	Callback = function(Value)
		autocollect = Value
	end    
})

section2:AddSlider({
	Name = "Auto Wash Delay",
	Min = 0.1,
	Max = 5,
	Default = 0.5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.1,
	ValueName = "Seconds",
	Callback = function(Value)
		autoselldelay = Value
	end    
})

section3:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section3:AddParagraph("Credits","!EwItsCaydon<3#0001") 