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

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Anime Evolution Simulator 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Auto Upgrade", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Auto Upgrade"})
local tab3 = Window:MakeTab({Name = "Auto Boost", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab3:AddSection({Name = "Auto Boost"})
local tab4 = Window:MakeTab({Name = "Auto Perk", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab4:AddSection({Name = "Auto Perk"})
local tab5 = Window:MakeTab({Name = "Auto Hatch", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section5 = tab5:AddSection({Name = "Auto Perk"})
local tab6 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section6 = tab6:AddSection({Name = "Misc"})


--Variables
local autoclick = false
local autorankup = false
local autocollectcoins = false
local autoupgradeaura = false
local autoclickdelay = nil
local autoupgradeweapon = false
local upgradedelay = nil
local auto2xluckboost = false
local boostdelay = nil
local auto2xcoinboost = false
local auto2xpowerboost = false
local auto2xdamageboost = false
local autoberserkperk = false
local autolightspeedperk = false
local autokayokenperk = false
local autostrongestpunchperk = false
local autoblackholeperk = false
local autoswordmasterperk = false
local autotimestopperk = false
local perkdelay = nil
local autohatch = false
local autohatchdelay = nil
local autohatchtype = nil


--Script
section:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoclick = true
            while autoclick == true do
                local args = {
                    [1] = {
                        [1] = "PowerTrain"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(autoclickdelay)
            end
        else
            autoclick = false
        end
    end
})

section:AddSlider({
	Name = "Auto Click Delay",
	Min = 0.1,
	Max = 1,
	Default = 0.1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.1,
	ValueName = "Seconds",
	Callback = function(Value)
		autoclickdelay = Value
	end    
})

section:AddToggle({
	Name = "Auto Rank Up",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autorankup = true
            while autorankup == true do
                local args = {
                    [1] = {
                        [1] = "RankUp"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(1)
            end
        else
            autorankup = false
        end
    end
})

section:AddToggle({
	Name = "Auto Collect Coins",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autocollectcoins = true
            while autocollectcoins == true do
                wait(1)
            for i,v in pairs(game:GetService("Workspace")["__DROPS"]:GetChildren()) do
                local args = {
                    [1] = {
                        [1] = "DropCollect",
                        [2] = v.Name
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                v:Destroy()
                end 
            end
        else
            autocollectcoins = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Upgrade Aura",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgradeaura = true
            while autoupgradeaura == true do
                local args = {
                    [1] = {
                        [1] = "Aura"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(upgradedelay)
            end
        else
            autoupgradeaura = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Upgrade Weapon",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgradeweapon = true
            while autoupgradeweapon == true do
                local args = {
                    [1] = {
                        [1] = "Weapon"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(upgradedelay)
            end
        else
            autoupgradeweapon = false
        end
    end
})

section2:AddSlider({
	Name = "Auto Upgrade Delay",
	Min = 1,
	Max = 30,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		upgradedelay = Value
	end    
})

section3:AddToggle({
	Name = "Auto Use 2x Lucky Fighters Boost",
	Default = false,
	Callback = function(Value)
        if Value == true then
            auto2xluckboost = true
            while auto2xluckboost == true do
                local args = {
                    [1] = {
                        [1] = "BoostUse",
                        [2] = "x2 Lucky"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(boostdelay)
            end
        else
            auto2xluckboost = false
        end
    end
})

section3:AddToggle({
	Name = "Auto Use 2x Coins Boost",
	Default = false,
	Callback = function(Value)
        if Value == true then
            auto2xcoinboost = true
            while auto2xcoinboost == true do
                local args = {
                    [1] = {
                        [1] = "BoostUse",
                        [2] = "x2 Coins"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(boostdelay)
            end
        else
            auto2xcoinboost = false
        end
    end
})

section3:AddToggle({
	Name = "Auto Use 2x Power Boost",
	Default = false,
	Callback = function(Value)
        if Value == true then
            auto2xpowerboost = true
            while auto2xpowerboost == true do
                local args = {
                    [1] = {
                        [1] = "BoostUse",
                        [2] = "x2 Power"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(boostdelay)
            end
        else
            auto2xpowerboost = false
        end
    end
})

section3:AddToggle({
	Name = "Auto Use 2x Damage Boost",
	Default = false,
	Callback = function(Value)
        if Value == true then
            auto2xdamageboost = true
            while auto2xdamageboost == true do
                local args = {
                    [1] = {
                        [1] = "BoostUse",
                        [2] = "x2 Damage"
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(boostdelay)
            end
        else
            auto2xdamageboost = false
        end
    end
})

section3:AddSlider({
	Name = "Auto Boost Delay",
	Min = 1,
	Max = 30,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		boostdelay = Value
	end    
})

section4:AddToggle({
	Name = "Auto Use Berserk Perk",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoberserkperk = true
            while autoberserkperk == true do
                local args = {
                    [1] = {
                        [1] = "SkillUse",
                        [2] = 1
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(perkdelay)
            end
        else
            autoberserkperk = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Use Light Speed Perk",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autolightspeedperk = true
            while autolightspeedperk == true do
                local args = {
                    [1] = {
                        [1] = "SkillUse",
                        [2] = 2
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(perkdelay)
            end
        else
            autolightspeedperk = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Use Kayoken Perk",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autokayokenperk = true
            while autokayokenperk == true do
                local args = {
                    [1] = {
                        [1] = "SkillUse",
                        [2] = 3
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(perkdelay)
            end
        else
            autokayokenperk = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Use Strongest Punch Perk",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autostrongestpunchperk = true
            while autostrongestpunchperk == true do
                local args = {
                    [1] = {
                        [1] = "SkillUse",
                        [2] = 4
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(perkdelay)
            end
        else
            autostrongestpunchperk = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Use Black Hole Perk",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoblackholeperk = true
            while autoblackholeperk == true do
                local args = {
                    [1] = {
                        [1] = "SkillUse",
                        [2] = 5
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(perkdelay)
            end
        else
            autoblackholeperk = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Use Sword Master Perk",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoswordmasterperk = true
            while autoswordmasterperk == true do
                local args = {
                    [1] = {
                        [1] = "SkillUse",
                        [2] = 6
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(perkdelay)
            end
        else
            autoswordmasterperk = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Use Time Stop Perk",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autotimestopperk = true
            while autotimestopperk == true do
                local args = {
                    [1] = {
                        [1] = "SkillUse",
                        [2] = 7
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(perkdelay)
            end
        else
            autotimestopperk = false
        end
    end
})

section4:AddSlider({
	Name = "Auto Boost Delay",
	Min = 5,
	Max = 60,
	Default = 5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 5,
	ValueName = "Seconds",
	Callback = function(Value)
		perkdelay = Value
	end    
})

section5:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autohatch = true
            while autohatch == true do
                local args = {
                    [1] = {
                        [1] = "BuyTier",
                        [2] = workspace.__WORKSPACE.FightersPoint:FindFirstChild(autohatchtype),
                        [3] = "E",
                        [4] = {}
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Client:FireServer(unpack(args))
                wait(autohatchdelay)
            end
        else
            autohatch = false
        end
    end
})

section5:AddDropdown({
	Name = "Auto Hatch Type",
	Default = "Select Type",
	Options = {"Narutye", "Ooy Piece", "Draygon Bool", "Attack On", "Slayer Demons", "One Punchy", "Faty", "Hunters", "My Hero", "Tokoyo Ghost", "Jujutsu Kase", "Slime Tensy", "Ragnarok", "Tokyio Revengers", "Back Clover", "Clover Church", "Sword Alt", "Training Area", "Blechi", "JouJo Adventures", "Dungeon", "Mob Pchaicho", "TGOH", "Reset Zero", "Force Fire"},
	Callback = function(Value)
        autohatchtype = Value
    end
})

section5:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 1,
	Max = 30,
	Default = 3,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autohatchdelay = Value
	end    
})

section6:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section6:AddParagraph("Credits","!EwItsCaydon<3#0001") 