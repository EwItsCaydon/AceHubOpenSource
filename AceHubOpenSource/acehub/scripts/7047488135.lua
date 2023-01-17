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
        game.Players.LocalPlayer:Kick("Error Loading Script...")
        end
    end
end

checkauth()

--Hub
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Speed Run Simulator 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Auto Egg", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Auto Egg"})
local tab4 = Window:MakeTab({Name = "Settings", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab4:AddSection({Name = "Delays"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab3:AddSection({Name = "Misc"})


--Variables
local autoclick = false
local autorebirth = false
local autoclickdelay = 0.25
local autohatch = false
local autohatchtype = EggOne
function race()
    for i, v in pairs(game:GetService("Workspace").RaceEnd:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
        end
    end
end
local autoring = false
local autoringdelay = 0.25
local autoorb = false
local autoorbdelay = 0.25


--Script
section:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoclick = true
            while autoclick == true do
        wait(autoclickdelay)
                game:GetService("ReplicatedStorage").Remotes.AddSpeed:FireServer()
                local args = {
                    [1] = "Speed"
                }
                game:GetService("ReplicatedStorage").Remotes.PersonalBest:FireServer(unpack(args))
            end
        else
            autoclick = false
        end 
	end    
})

section4:AddSlider({
	Name = "Auto Click Delay",
	Min = 0.25,
	Max = 1,
	Default = 0.25,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.05,
	ValueName = "Seconds",
	Callback = function(Value)
		autoclickdelay = Value
	end    
})

section:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autorebirth = true
            while autorebirth == true do
        wait(1)
            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
            end
        else
            autorebirth = false
        end 
	end    
})

section:AddToggle({
	Name = "Auto Rings",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoring = true
            while autoring == true do
        wait(autoringdelay)
        for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent:IsA("MeshPart") and v.Parent then
                firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            end
                end
            end
        else
            autoring = false
        end 
	end    
})

section:AddToggle({
	Name = "Auto Collect Orbs",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoorb = true
            while autoorb == true do
        wait(autoorbdelay)
        for i, v in pairs(game:GetService("Workspace").OrbSpawns:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                end
            end
        end
        else
            autoorb = false
        end 
	end    
})

section4:AddSlider({
	Name = "Auto Orb Delay",
	Min = 0.25,
	Max = 1,
	Default = 0.25,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.05,
	ValueName = "Seconds",
	Callback = function(Value)
		autoorbdelay = Value
	end    
})

section4:AddSlider({
	Name = "Auto Ring Delay",
	Min = 0.25,
	Max = 1,
	Default = 0.25,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.05,
	ValueName = "Seconds",
	Callback = function(Value)
		autoringdelay = Value
	end    
})

section2:AddToggle({
	Name = "Auto Hatch Egg",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autohatch = true
            while autohatch == true do
        local args = {
        [1] = autohatchtype
        }
            game:GetService("ReplicatedStorage").Remotes.CanBuyEgg:InvokeServer(unpack(args))
        end
    else
        autohatch = false 
        end 
    end
})

section2:AddDropdown({
	Name = "Hatch Egg Type",
	Default = "EggOne",
	Options = {"EggOne", "EggTwo", "EggThree", "EggFour", "EggFive", "EggSix", "EggSeven", "EggEight", "EggNine", "EggTen", "EggEleven", "EggTwelve", "EggThirteen"},
	Callback = function(Value)
		autohatchtype = Value
	end    
})

section2:AddButton({
	Name = "Give Thanos Egg",
	Callback = function()
        local args = {
            [1] = "ThanosEgg"
            }
                game:GetService("ReplicatedStorage").Remotes.CanBuyEgg:InvokeServer(unpack(args))
  	end    
})

section2:AddButton({
	Name = "Give Sonic Egg",
	Callback = function()
        local args = {
            [1] = "SonicEgg"
            }
                game:GetService("ReplicatedStorage").Remotes.CanBuyEgg:InvokeServer(unpack(args))
  	end    
})

section2:AddButton({
	Name = "Give Reverse Flash Egg",
	Callback = function()
        local args = {
            [1] = "ReverseFlashEgg"
            }
                game:GetService("ReplicatedStorage").Remotes.CanBuyEgg:InvokeServer(unpack(args))
  	end    
})

section3:AddButton({
	Name = "Win Race",
	Callback = function()
      		race()
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