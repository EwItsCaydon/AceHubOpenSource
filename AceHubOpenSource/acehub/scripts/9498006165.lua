

--Hub
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Tapping Simulator 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Auto Rebirth", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab:AddSection({Name = "Delay"})
local tab3 = Window:MakeTab({Name = "Auto Upgrade", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab3:AddSection({Name = "Auto Upgrade"})
local tab4 = Window:MakeTab({Name = "Auto Egg", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section5 = tab4:AddSection({Name = "Auto Egg"})
local section6 = tab2:AddSection({Name = "Rebirth"})
local tab6 = Window:MakeTab({Name = "Boosts", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section8 = tab6:AddSection({Name = "Boosts"})
local tab5 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section7 = tab5:AddSection({Name = "Misc"})


--Variables
local autotap = false
local claimrr = false
local autorebirth = false
local autotapdelay = 0
local claimrrdelay = 0
local autorebirthdelay = 0
local autoupgraderbuttons = false
local autoupgradejumps = false
local autoupgradegem = false
local autoupgardestorage = false
local rebirthamount = 1
local autoeggtype = Starter
local eggtypevalue = game:GetService("Workspace").Shops:GetChildren()
local autoegg = false
local auto3xtapboost = false
local auto2xluckboost = false
local auto3xluckboost = false


--Script
section:AddToggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autotap = true
            while autotap == true do
            wait(autotapdelay)
                game:GetService("ReplicatedStorage").Events.Tap:FireServer()
            end
        else
            autotap = false
        end     
	end    
})

section:AddToggle({
	Name = "Auto Claim Random Rewards",
	Default = false,
	Callback = function(Value)
		if Value == true then
            claimrr = true
            while claimrr == true do
            wait(claimrrdelay)
                game:GetService("ReplicatedStorage").Events.ClaimRandomReward:FireServer()
            end
        else
            claimrr = false
        end     
	end    
})

section6:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autorebirth = true
            while autorebirth == true do
            wait(autorebirthdelay)
            local args = {
                [1] = rebirthamount
            }
                game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))            
            end
        else
            autorebirth = false
        end     
	end    
})

section6:AddTextbox({
	Name = "Auto Rebirth Amount",
	Default = "1",
	TextDisappear = false,
	Callback = function(Value)
		rebirthamount = Value
	end	  
})

section2:AddSlider({
	Name = "Auto Tap Delay",
	Min = 0.01,
	Max = 1,
	Default = 0.01,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "seconds",
	Callback = function(Value)
		autotapdelay = Value
	end    
})

section2:AddSlider({
	Name = "Auto Claim Random Rewards Delay",
	Min = 0.01,
	Max = 5,
	Default = 0.01,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "seconds",
	Callback = function(Value)
		claimrrdelay = Value
	end    
})

section6:AddSlider({
	Name = "Auto Rebirth Delay",
	Min = 0.01,
	Max = 5,
	Default = 0.01,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "seconds",
	Callback = function(Value)
		autorebirthdelay = Value
	end    
})

section3:AddToggle({
	Name = "Auto Upgrade Rebirth Buttons",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgraderbuttons = true
            while autoupgraderbuttons == true do
            wait()
            local args = {
                [1] = "rebirthUpgrades"
            }
                game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args))
            end
        else
            autoupgraderbuttons = false
        end     
	end    
})

section3:AddToggle({
	Name = "Auto Upgrade Jumps",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradejumps = true
            while autoupgradejumps == true do
            wait()
                local args = {
                    [1] = "jumps"
                }
                    game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args))
            end
        else
            autoupgradejumps = false
        end     
	end    
})

section3:AddToggle({
	Name = "Auto Upgrade Gem Multiplier",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradegem = true
            while autoupgradegem == true do
            wait()
                local args = {
                    [1] = "gemMultiplierUpgrade"
                }
                game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args))
            end
        else
            autoupgradegem = false
        end     
	end    
})

section3:AddToggle({
	Name = "Auto Upgrade Storage",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgardestorage = true
            while autoupgardestorage == true do
            wait()
                local args = {
                    [1] = "storageUpgrade"
                }
                game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args))

            end
        else
            autoupgardestorage = false
        end     
	end    
})

section5:AddToggle({
	Name = "Auto Egg Hatch",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoegg = true
            while autoegg == true do
            wait()
                local args = {
                    [1] = {},
                    [2] = eggtype,
                    [3] = 1
                }
                    game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))
            end
        else
            autoegg = false
        end     
	end    
})

section5:AddDropdown({
	Name = "Egg Type",
	Default = "Starter",
	Options = {"Starter", "Coral Egg", "Jungle Egg", "Bee Egg", "Swamp Egg", "Snow Egg", "Desert Egg", "Death Egg", "Forest Egg", "Dominus Egg", "Wood Egg", "Mine Egg", "Beach Egg", "Dark Egg", "Cloud Egg", "Magma Egg", "Fire Egg", "Molten Egg", "Underworl Egg", "Blue Magma Egg", "Red Magma Egg", "Secret Magma Egg", "Purple Magma Egg", "Yellow Magma Egg", "55M Egg", "Candy Egg", "Flora Egg", "Holy Wood Egg", "Holy Bee Egg", "Holy Egg", "Castle Egg", "Festival Egg", "50M2 Egg", "Japan Egg", "Station Egg", "Robo Egg", "Alien Egg", "Frost Alien Egg", "Toxic Alien Egg", "65M Egg", "Orange Egg", "Ghoul Egg", "Scrapyard Egg", "65M Egg", "Blood Egg", "Water Egg", "Ultra Water Egg", "Deep Ocean Egg"},
	Callback = function(Value)
		eggtype = Value
	end    
})

section8:AddToggle({
	Name = "Auto Use 3x Tap Boosts",
	Default = false,
	Callback = function(Value)
		if Value == true then
            auto3xtapboost = true
            while auto3xtapboost == true do
            wait(3)
                local args = {
                    [1] = "tripleTaps"
                }
                game:GetService("ReplicatedStorage").Events.UseBoost:FireServer(unpack(args))
            end
        else
            auto3xtapboost = false
        end     
	end    
})

section8:AddToggle({
	Name = "Auto Use 2x Luck Boosts",
	Default = false,
	Callback = function(Value)
		if Value == true then
            auto2xluckboost = true
            while auto2xluckboost == true do
            wait(3)
                local args = {
                    [1] = "doubleLuck"
                }
                game:GetService("ReplicatedStorage").Events.UseBoost:FireServer(unpack(args))
            end
        else
            auto2xluckboost = false
        end     
	end    
})

section8:AddToggle({
	Name = "Auto Use 3x Luck Boosts",
	Default = false,
	Callback = function(Value)
		if Value == true then
            auto3xluckboost = true
            while auto3xluckboost == true do
            wait(3)
                local args = {
                    [1] = "tripleLuck"
                }
                game:GetService("ReplicatedStorage").Events.UseBoost:FireServer(unpack(args))
            end
        else
            auto3xluckboost = false
        end     
	end    
})

section7:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section7:AddParagraph("Credits","!EwItsCaydon<3#0001")