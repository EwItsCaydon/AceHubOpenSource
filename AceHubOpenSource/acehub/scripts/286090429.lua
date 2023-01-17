

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Arsenal 🎁", HidePremium = false, SaveConfig = false, IntroText="GalaxyHub"})

local tab2 = Window:MakeTab({Name = "Aimbot", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab3 = Window:MakeTab({Name = "ESP", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab = Window:MakeTab({Name = "Mods", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab4 = Window:MakeTab({Name = "Credits", PremiumOnly = false, Icon = "rbxassetid://4483345998"})

local section = tab:AddSection({Name = "Buttons"})
local section2 = tab:AddSection({Name = "Toggle"})
local section3 = tab2:AddSection({Name = "Aimbot"})
local section4 = tab4:AddSection({Name = "Credits"})
local section5 = tab3:AddSection({Name = "ESP"})


loadstring(game:HttpGet("https://pastebin.com/raw/QWyqDv7u"))()

Options.Enabled = false
Options.TeamCheck = true


section:AddButton({
	Name = "Fast Fire Rate",
	Callback = function()
        for i,v in pairs(Game:GetService("ReplicatedStorage").Weapons:GetDescendants()) do
            if v.Name == "FireRate" then
                v.Value = 0.05
            end
        end
        OrionLib:MakeNotification({
            Name = "Fire rate set to 0.05!",
            Content = "Fire rate is now fast.",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
  	end    
})


section:AddButton({
	Name = "Remove Reload Time",
	Callback = function()
        for i,v in pairs(Game:GetService("ReplicatedStorage").Weapons:GetDescendants()) do
            if v.Name == "ReloadTime" then
                v.Value = 0
            end
        end
        OrionLib:MakeNotification({
            Name = "Reload time removed",
            Content = "Removed reload time sucessfully.",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
  	end    
})



section2:AddToggle({
	Name = "Automatic Weapon",
	Default = false,
	Callback = function(Value)
        if Value == true then
            for i,v in pairs(Game:GetService("ReplicatedStorage").Weapons:GetDescendants()) do
                if v.Name == "Auto" then
                    v.Value = true
                end
            end
            OrionLib:MakeNotification({
                Name = "Automatic Set True!",
                Content = "All weapons are automatic now.",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            for i,v in pairs(Game:GetService("ReplicatedStorage").Weapons:GetDescendants()) do
                if v.Name == "Auto" then
                    v.Value = false
                end
            end
            OrionLib:MakeNotification({
                Name = "Automatic Set False!",
                Content = "All weapons are manual now.",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
	end    
})



section:AddButton({
	Name = "Max Ammo",
	Callback = function()
        for i,v in pairs(Game:GetService("ReplicatedStorage").Weapons:GetDescendants()) do
            if v.Name == "Ammo" then
                if v.ClassName == "IntValue" then
                   v.RobloxLocked = true
                    v.Value = 999
                end
            end
        end
        OrionLib:MakeNotification({
            Name = "Max Ammo Added",
            Content = "All weapons now have maximum ammo",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
  	end
})


section3:AddToggle({
	Name = "Aimbot",
	Default = false,
	Callback = function(Value)
        if Value == true then
            Options.Enabled = true
            OrionLib:MakeNotification({
                Name = "Aimbot Enabled!",
                Content = "Aimbot turned on sucessfully.",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            Options.Enabled = false
            OrionLib:MakeNotification({
                Name = "Aimbot Disabled!",
                Content = "Aimbot turned off sucessfully.",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
	end    
})


section3:AddToggle({
	Name = "Smoothness",
	Default = false,
	Callback = function(Value)
        if Value == true then
            Options.Smoothness = true
            OrionLib:MakeNotification({
                Name = "Smoothness Enabled!",
                Content = "Enabled smoothness sucessfully.",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            Options.Smoothness = false
            OrionLib:MakeNotification({
                Name = "Smoothness Disabled!",
                Content = "Disabled smoothness sucessfully.",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
	end    
})


section3:AddSlider({
	Name = "FOV",
	Min = 10,
	Max = 250,
	Default = 15,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "FOV",
	Callback = function(Value)
		Options.FOV = Value
	end    
})


section3:AddDropdown({
	Name = "Aim Part",
	Default = "Head",
	Options = {"Head", "LowerTorso"},
	Callback = function(Value)
		Options.AimPart = Value
        OrionLib:MakeNotification({
            Name = "Aimpart Changed!",
            Content = "Aimpart has been changed to " .. Value .. "!",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
	end    
})


section4:AddParagraph("Credits","imandrewyo#3433 / !Nova#6926")
section4:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})


getgenv().cham = false
getgenv().nameESP = false
getgenv().boxESP = false
getgenv().esp_loaded = false
getgenv().Visibility = false


section5:AddToggle({
    Name = "ESP",
    Default = getgenv().Visibility,
    Callback = function(Value)
        if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
        getgenv().Visibility = Value
    end   
})

section5:AddToggle({
    Name = "Boxes",
    Default = getgenv().Visibility,
    Callback = function(Value)
        if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
        getgenv().boxESP = Value
    end   
})


section5:AddToggle({
    Name = "Names",
    Default = getgenv().Visibility,
    Callback = function(Value)
        if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
        getgenv().nameESP = Value
    end   
})


section5:AddToggle({
    Name = "Use Team Color",
    Default = false,
    Callback = function(Value)
        getgenv().useTeamColor = Value
    end
})