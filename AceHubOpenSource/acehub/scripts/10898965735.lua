

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 AceHub - Mine Racer 🎁", HidePremium = false, IntroEnabled = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Auto Upgrade", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Auto Upgrade"})
local tab3 = Window:MakeTab({Name = "Auto Hatch", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab3:AddSection({Name = "Auto Hatch"})
local tab4 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab4:AddSection({Name = "Misc"})


--Variables
local automine = false
local autojoin = false
local pickaxecooldown = false
local blockpower = false
local upgradedelay = nil
local autoobbyeasy = false
local obbyeasyprox = nil
local autohatch = false
local autohatchtype = nil
local autohatchdelay = nil


--Script
section:AddToggle({
	Name = "Auto Mine",
	Default = false,
	Callback = function(Value)
        if Value == true then
            automine = true
            while automine == true do
                if game:GetService("ReplicatedStorage").Game.State.Value == "GAME" then
                local args = {
                    [1] = "Mine"
                }
                game:GetService("ReplicatedStorage").Remotes.mineEvent:FireServer(unpack(args))
            end
                wait(.1)
            end
        else
            automine = false
        end
    end
})

section:AddToggle({
	Name = "Auto Join",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autojoin = true
            while autojoin == true do
                if game:GetService("ReplicatedStorage").Game.State ~= "GAME" then
                    game:GetService("ReplicatedStorage").Remotes.joinEvent:FireServer("Join")
                end
                wait(3)
            end
        else
            autojoin = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Upgrade Pickaxe Cooldown",
	Default = false,
	Callback = function(Value)
        if Value == true then
            pickaxecooldown = true
            while pickaxecooldown == true do
                game:GetService("ReplicatedStorage").Remotes.upgradeEvent:FireServer("Cooldown")
                wait(upgradedelay)
            end
        else
            pickaxecooldown = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Upgrade Block Power",
	Default = false,
	Callback = function(Value)
        if Value == true then
            blockpower = true
            while blockpower == true do
                game:GetService("ReplicatedStorage").Remotes.upgradeEvent:FireServer("Dig")
                wait(upgradedelay)
            end
        else
            blockpower = false
        end
    end
})

section2:AddSlider({
	Name = "Auto Upgrade Delay",
	Min = 4,
	Max = 60,
	Default = 8,
	Color = Color3.fromRGB(31,145,3),
	Increment = 2,
	ValueName = "Seconds",
	Callback = function(Value)
		upgradedelay = Value
	end    
})

section3:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autohatch = true
            while autohatch == true do
                    game:GetService("ReplicatedStorage").Remotes.requestEgg:FireServer("Open",workspace.Eggs[autohatchtype])
                wait(autohatchdelay)
            end
        else
            autohatch = false
        end
    end
})

section3:AddDropdown({
	Name = "Auto Hatch Type",
	Default = "Select Type",
	Options = {"650 Egg", "5K Egg", "25K Egg", "100K Egg", "1.8B Egg", "2.5B Egg", "750M Egg", "55M Egg", "6M Egg", "750K Egg"},
	Callback = function(Value)
        if Value == "650 Egg" then
            autohatchtype = "0"
        end
        if Value == "50K Egg" then
            autohatchtype = "1"
        end
        if Value == "25K Egg" then
            autohatchtype = "2"
        end
        if Value == "100K Egg" then
            autohatchtype = "3"
        end
        if Value == "1.8B Egg" then
            autohatchtype = "8"
        end
        if Value == "2.5B Egg" then
            autohatchtype = "9"
        end
        if Value == "750M Egg" then
            autohatchtype = "7"
        end
        if Value == "55M Egg" then
            autohatchtype = "6"
        end
        if Value == "6M Egg" then
            autohatchtype = "5"
        end
        if Value == "750K Egg" then
            autohatchtype = "4"
        end
    end
})

section3:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 2,
	Max = 10,
	Default = 2,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autohatchdelay = Value
	end    
})

section4:AddButton({
	Name = "Anti-Afk",
	Callback = function()
    repeat wait() until game:IsLoaded() 
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
  	end    
})

section4:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section4:AddParagraph("Credits","!EwItsCaydon<3#0001") 