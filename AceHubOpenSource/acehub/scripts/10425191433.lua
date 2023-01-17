
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Trick Shot Simulator 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})

local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Auto Upgrade", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Auto Upgrade"})
local section3 = tab:AddSection({Name = "Auto Rebirth"})
local tab3 = Window:MakeTab({Name = "Auto Unbox", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab3:AddSection({Name = "Auto Unbox"})
local tab4 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section5 = tab4:AddSection({Name = "Misc"})


--Variables
local autofarm = false
local autofarmtpset = nil
local autofarmdistance = 1
local setgoal = nil
local autoupgradedistance = false
local autoupgradewalkspeed = false
local autoupgradeitemspeed = false
local autoupgradedelay = 1
local autorebirth = false
local autorebirthdelay = nil
local autounbox = false
local autounboxdelay = nil


--Script

section:AddToggle({
	Name = "Auto Trick Shot",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autofarm = true
            while autofarm == true do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = autofarmtpset
                    local args = {
                        [1] = setgoal
                    }
                    game:GetService("ReplicatedStorage").TShots.TShots3D.Default.Remotes.SetGoal:InvokeServer(unpack(args))
                        for _, v in pairs(game:GetService("Workspace").Tools:GetChildren()) do
                            local args = {
                                [1] = {
                                    [1] = v.Name
                                },
                                [2] = {
                                    ["touched"] = {
                                        [1] = v.Name
                                    },
                                    ["distance"] = autofarmdistance
                                }
                            }
                            game:GetService("ReplicatedStorage").TShots.Actions.Default.Remotes.Finish:InvokeServer(unpack(args))
                                local args = {
                                    [1] = {
                                        [1] = v.Name
                                    },
                                    [2] = {
                                        ["touched"] = {},
                                        ["distance"] = autofarmdistance
                                    }
                                }
                                game:GetService("ReplicatedStorage").TShots.Actions.Default.Remotes.Finish:InvokeServer(unpack(args))
                    v:Destroy()
                end
            end 
        else
            autofarm = false
        end
    end
})

section:AddDropdown({
	Name = "Auto Trick Shot Type",
	Default = "Select Type",
	Options = {"Table", "Ring", "Soccer Goal", "Grill"},
	Callback = function(Value)
	if Value == "Table" then
        setgoal = "1"
        autofarmtpset = CFrame.new(-330.300629, -69.5711746, 50.2156639, 0.321990728, -4.87116445e-08, -0.946742833, -1.20908883e-08, 1, -5.55639801e-08, 0.946742833, 2.93380484e-08, 0.321990728)
	end
    if Value == "Ring" then
        setgoal = "4"
        autofarmtpset = CFrame.new(-241.194, -68.650856, -53.0229836, 0.922540903, -2.81087882e-08, -0.385899276, 4.83496159e-08, 1, 4.27461586e-08, 0.385899276, -5.80931641e-08, 0.922540903)
	end  
    if Value == "Soccer Goal" then
        setgoal = "3"
        autofarmtpset = CFrame.new(-316.666016, -72.2023849, -53.4447899, 0.179772809, 5.67778224e-09, -0.983708143, -5.75511905e-08, 1, -4.74567274e-09, 0.983708143, 5.74667176e-08, 0.179772809)
	end
    if Value == "Grill" then
        setgoal = "2"
        autofarmtpset = CFrame.new(-252.289307, -67.9212265, 47.1273155, -0.990168273, 7.63937713e-09, -0.139881432, 8.03363065e-09, 1, -2.25382979e-09, 0.139881432, -3.35542638e-09, -0.990168273)
	end    
end
})

section:AddTextbox({
	Name = "[OP] Auto Trick Shot Distance (Enter Number)",
	Default = "3",
	TextDisappear = false,
	Callback = function(Value)
		autofarmdistance = Value
	end	  
})

section3:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autorebirth = true
            while autorebirth == true do
                game:GetService("ReplicatedStorage").Rebirths.Core.Default.Remotes.Rebirth:InvokeServer() 
            wait(autorebirthdelay)
        end 
else
    autorebirth = false
    end
end    
})

section3:AddSlider({
	Name = "Auto Rebirth Delay",
	Min = 1,
	Max = 60,
	Default = 10,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autorebirthdelay = Value
	end    
})

section2:AddToggle({
	Name = "Auto Upgrade Distance",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradedistance = true
            while autoupgradedistance == true do
                local args = {
                    [1] = "shootDistance"
                }
                game:GetService("ReplicatedStorage").Upgrades.Core.Default.Remotes.Upgrade:InvokeServer(unpack(args))
            wait(autoupgradedelay)
        end 
else
    autoupgradedistance = false
    end
end    
})

section2:AddToggle({
	Name = "Auto Upgrade Walk Speed",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradewalkspeed = true
            while autoupgradewalkspeed == true do
                local args = {
                    [1] = "walkSpeed"
                }
                game:GetService("ReplicatedStorage").Upgrades.Core.Default.Remotes.Upgrade:InvokeServer(unpack(args))
            wait(autoupgradedelay)
        end 
else
    autoupgradewalkspeed = false
    end
end    
})

section2:AddToggle({
	Name = "Auto Upgrade Item Speed",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradeitemspeed = true
            while autoupgradeitemspeed == true do
                local args = {
                    [1] = "itemSpeed"
                }
                game:GetService("ReplicatedStorage").Upgrades.Core.Default.Remotes.Upgrade:InvokeServer(unpack(args))
            wait(autoupgradedelay)
        end 
else
    autoupgradeitemspeed = false
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
		autoupgradedelay = Value
	end    
})

section4:AddToggle({
	Name = "Auto Unbox",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autounbox = true
            while autounbox == true do
                local args = {
                    [1] = autounboxselect
                }
                game:GetService("ReplicatedStorage").Boxes.Core.Default.Remotes.Buy:InvokeServer(unpack(args))
            wait(autounboxdelay)
        end 
else
    autounbox = false
    end
end    
})

section4:AddDropdown({
	Name = "Auto Unbox Type",
	Default = "Select Type",
	Options = {"Backyard", "Playground", "School", "Furniture", "Restaurant", "Museum", "Church", "Gas Station", "Airport", "Beach"},
	Callback = function(Value)
	if Value == "Backyard" then
        autounboxselect = "1"
	end
    if Value == "Playground" then
        autounboxselect = "2"
	end  
    if Value == "School" then
        autounboxselect = "3"
	end
    if Value == "Furniture" then
        autounboxselect = "4"
	end  
    if Value == "Restaurant" then
        autounboxselect = "5"
	end
    if Value == "Museum" then
        autounboxselect = "6"
	end
    if Value == "Church" then
        autounboxselect = "7"
	end  
    if Value == "Gas Station" then
        autounboxselect = "8"
	end 
    if Value == "Airport" then
        autounboxselect = "9"
	end        
    if Value == "Beach" then
        autounboxselect = "10"
	end        
end
})

section4:AddSlider({
	Name = "Auto Unbox Delay",
	Min = 1,
	Max = 30,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autounboxdelay = Value
	end    
})

section5:AddButton({
	Name = "[OP] Max Rebirth (Rejoin To Stop)",
	Callback = function()
        while true do
            wait(1)
            for _, v in pairs(game:GetService("Workspace").Tools:GetChildren()) do
                local args = {
                    [1] = "1"
                }
                game:GetService("ReplicatedStorage").TShots.TShots3D.Default.Remotes.SetGoal:InvokeServer(unpack(args))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-330.300629, -69.5711746, 50.2156639, 0.321990728, -4.87116445e-08, -0.946742833, -1.20908883e-08, 1, -5.55639801e-08, 0.946742833, 2.93380484e-08, 0.321990728)
                local args = {
                    [1] = {
                        [1] = v.Name
                    },
                    [2] = {
                        ["touched"] = {},
                        ["distance"] = math.huge
                    }
                }
                game:GetService("ReplicatedStorage").TShots.Actions.Default.Remotes.Finish:InvokeServer(unpack(args))
                game:GetService("ReplicatedStorage").Rebirths.Core.Default.Remotes.Rebirth:InvokeServer()
                v:Destroy()
                end 
            end
  	end    
})

section5:AddButton({
	Name = "[OP] Inf Money",
	Callback = function()
            for _, v in pairs(game:GetService("Workspace").Tools:GetChildren()) do
                local args = {
                    [1] = "1"
                }
                game:GetService("ReplicatedStorage").TShots.TShots3D.Default.Remotes.SetGoal:InvokeServer(unpack(args))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-330.300629, -69.5711746, 50.2156639, 0.321990728, -4.87116445e-08, -0.946742833, -1.20908883e-08, 1, -5.55639801e-08, 0.946742833, 2.93380484e-08, 0.321990728)
                local args = {
                    [1] = {
                        [1] = v.Name
                    },
                    [2] = {
                        ["touched"] = {},
                        ["distance"] = math.huge
                    }
                }
                game:GetService("ReplicatedStorage").TShots.Actions.Default.Remotes.Finish:InvokeServer(unpack(args))
                v:Destroy()
            end 
  	end    
})

section5:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section5:AddParagraph("Credits","!EwItsCaydon<3#0001") 