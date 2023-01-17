


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Rebirth Champions X 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Auto Pet", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab5 = Window:MakeTab({Name = "Auto Rebirth", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section6 = tab5:AddSection({Name = "Auto Rebirth"})
local section2 = tab2:AddSection({Name = "Auto Pet"})
local section3 = tab2:AddSection({Name = "Auto Hatch"})
local tab3 = Window:MakeTab({Name = "Auto Potion", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab3:AddSection({Name = "Auto Potion"})
local tab4 = Window:MakeTab({Name = "Auto Upgrade", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section5 = tab4:AddSection({Name = "Auto Upgrade"})
local tab6 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section7 = tab6:AddSection({Name = "Misc"})

--Variables
local autoclick = false
local worldboostloop = false
local autotapdelay = 0.1
local autocraft = false
local autocraftdelay = 1
local autohatch = false
local autohatchdelay = 0.5
local autohatchamount = "Single"
local autohatchtype = "Select Egg Type"
local autopotion2xclicks = false
local autopotion2xgems = false
local autopotion2xluck = false
local autopotiondelay = nil
local autopotion2xrebirths = false
local autopotion2xpetxp = false
local autopotion2xhatchspeed = false
local autopotionamount = nil
local autoupgradeclickmultiplier = false
local autoupgradewalkspeed = false
local autoupgradepetstorage = false
local autoupgradeluckmultiplier = false
local autoupgradegemsmultiplier = false
local autoupgraderebirthbuttons = false
local autoupgradefreeautoclicker = false
local autoupgradedelay = nil
local autorebirth = false
local autorebirthdelay = nil
local autorebirthamount = 1



--Script
section:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoclick = true
            while autoclick == true do
            game:GetService("ReplicatedStorage").Events.Click3:FireServer()
                wait(autotapdelay)
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
		autotapdelay = Value
	end    
})

section:AddToggle({
	Name = "[OP] World Boost Loop (250,000x)",
	Default = false,
	Callback = function(Value)
        if Value == true then
            worldboostloop = true
            while worldboostloop == true do
                local args = {
                    [1] = "Fantasy"
                }
            game:GetService("ReplicatedStorage").Events.WorldBoost:FireServer(unpack(args))
                wait(1)
            end
        else
            worldboostloop = false
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
                local args = {
                    [1] = autorebirthamount
                }
                game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
                wait(autorebirthdelay)
            end
        else
            autorebirth = false
        end
    end
})

section6:AddSlider({
	Name = "Auto Rebirth Button (Must Own Selected Button)",
	Min = 1,
	Max = 75,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		autorebirthamount = Value
	end    
})

section6:AddSlider({
	Name = "Auto Rebirth Delay",
	Min = 5,
	Max = 60,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 5,
	ValueName = "Seconds",
	Callback = function(Value)
		autorebirthdelay = Value
	end    
})

section2:AddToggle({
	Name = "Auto Craft All",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autocraft = true
            while autocraft == true do
                local args = {
                    [1] = "CraftAll",
                    [2] = {}
                }
                game:GetService("ReplicatedStorage").Functions.Request:InvokeServer(unpack(args))
                wait(autocraftdelay)
            end
        else
            autocraft = false
        end
    end
})

section2:AddSlider({
	Name = "Auto Craft All Delay",
	Min = 1,
	Max = 10,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autocraftdelay = Value
	end    
})

section3:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autohatch = true
            while autohatch == true do
                local args = {
                    [1] = autohatchtype,
                    [2] = autohatchamount
                }
            game:GetService("ReplicatedStorage").Functions.Unbox:InvokeServer(unpack(args))
                wait(autohatchdelay)
            end
        else
            autohatch = false
        end
    end
})

section3:AddDropdown({
	Name = "Auto Hatch Egg Type",
	Default = "Select Egg",
	Options = {"Basic", "King", "Forest", "Beach", "Winter", "Desert", "Volcano", "Lava", "Mythic", "Magma", "Atlantis", "Hell", "Moon", "Cyber", "Magic", "Heaven", "Nuclear", "Void", "Spooky", "Cave", "Steampunk", "Water", "Mars", "Space", "Shadow", "Galaxy Forest", "Neow", "Destrusction", "SpaceLab", "Alien", "Fanasty", "Sun", "Saturn", "Hacker", "Black Hole", "Aqua", "Axolotl", "Underwater Lab", "Pixel", "Ghost", "Evil", "90M"},
	Callback = function(Value)
		autohatchtype = Value
	end    
})

section3:AddDropdown({
	Name = "Auto Hatch Amount",
	Default = "Single",
	Options = {"Single", "Triple"},
	Callback = function(Value)
		autohatchamount = Value
	end    
})




section3:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 0.5,
	Max = 5,
	Default = 0.5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.5,
	ValueName = "Seconds",
	Callback = function(Value)
		autohatchdelay = Value
	end    
})

section4:AddToggle({
	Name = "Auto Potion 2x Clicks",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autopotion2xclicks = true
            while autopotion2xclicks == true do
                local args = {
                    [1] = "x2Clicks",
                    [2] = autopotionamount
                }

                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                wait(autopotiondelay)
            end
        else
            autopotion2xclicks = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Potion 2x Gems",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autopotion2xgems = true
            while autopotion2xgems == true do
                local args = {
                    [1] = "x2Gems",
                    [2] = autopotionamount
                }
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                wait(autopotiondelay)
            end
        else
            autopotion2xgems = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Potion 2x Luck",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autopotion2xluck = true
            while autopotion2xluck == true do
                local args = {
                    [1] = "x2Luck",
                    [2] = autopotionamount
                }
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                wait(autopotiondelay)
            end
        else
            autopotion2xluck = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Potion 2x Rebirths",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autopotion2xrebirths = true
            while autopotion2xrebirths == true do
                local args = {
                    [1] = "x2Rebiths",
                    [2] = autopotionamount
                }
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                wait(autopotiondelay)
            end
        else
            autopotion2xrebirths = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Potion 2x Pet XP",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autopotion2xpetxp = true
            while autopotion2xpetxp == true do
                local args = {
                    [1] = "x2PetXP",
                    [2] = autopotionamount
                }
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                wait(autopotiondelay)
            end
        else
            autopotion2xpetxp = false
        end
    end
})

section4:AddToggle({
	Name = "Auto Potion 2x Hatch Speed",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autopotion2xhatchspeed = true
            while autopotion2xhatchspeed == true do
                local args = {
                    [1] = "x2HatchSpeed",
                    [2] = autopotionamount
                }
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                wait(autopotiondelay)
            end
        else
            autopotion2xhatchspeed = false
        end
    end
})

section4:AddDropdown({
	Name = "Auto Potion Multiplier",
	Default = 1,
	Options = {1, 10, 100},
	Callback = function(Value)
		autopotionamount = Value
	end    
})

section4:AddSlider({
	Name = "Auto Potion Delay",
	Min = 1,
	Max = 60,
	Default = 10,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autopotiondelay = Value
	end    
})

section5:AddButton({
	Name = "Buy Free Auto Clicker",
	Callback = function()
        local args = {
            [1] = "FreeAutoClicker"
        }
        game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
  	end    
})

section5:AddButton({
	Name = "Buy +1 Pet Equip (Can Be Done 2 Times)",
	Callback = function()
        local args = {
            [1] = "PetEquip"
        }
        game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
  	end    
})

section5:AddToggle({
	Name = "Auto Upgrade Click Multiplier",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgradeclickmultiplier = true
            while autoupgradeclickmultiplier == true do
                local args = {
                    [1] = "ClickMultiplier"
                }
                game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
                wait(autoupgradedelay)
            end
        else
            autoupgradeclickmultiplier = false
        end
    end
})

section5:AddToggle({
	Name = "Auto Upgrade Walk Speed",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgradewalkspeed = true
            while autoupgradewalkspeed == true do
                local args = {
                    [1] = "WalkSpeed"
                }
                game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
                wait(autoupgradedelay)
            end
        else
            autoupgradewalkspeed = false
        end
    end
})

section5:AddToggle({
	Name = "Auto Upgrade Pet Storage",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgradepetstorage = true
            while autoupgradepetstorage == true do
                local args = {
                    [1] = "PetStorage"
                }
                game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
                wait(autoupgradedelay)
            end
        else
            autoupgradepetstorage = false
        end
    end
})

section5:AddToggle({
	Name = "Auto Upgrade Pet Storage",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgradeluckmultiplier = true
            while autoupgradeluckmultiplier == true do
                local args = {
                    [1] = "LuckMultiplier"
                }
                game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
                wait(autoupgradedelay)
            end
        else
            autoupgradeluckmultiplier = false
        end
    end
})

section5:AddToggle({
	Name = "Auto Upgrade Gems Multiplier",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgradegemsmultiplier = true
            while autoupgradegemsmultiplier == true do
                local args = {
                    [1] = "GemsMultiplier"
                }
                game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
                wait(autoupgradedelay)
            end
        else
            autoupgradegemsmultiplier = false
        end
    end
})

section5:AddToggle({
	Name = "Auto Upgrade Rebirth Buttons",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgraderebirthbuttons = true
            while autoupgraderebirthbuttons == true do
                local args = {
                    [1] = "RebirthButtons"
                }
                game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
                wait(autoupgradedelay)
            end
        else
            autoupgraderebirthbuttons = false
        end
    end
})

section5:AddToggle({
	Name = "Auto Upgrade Free Faster Auto Clicker",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupgradefreeautoclicker = true
            while autoupgradefreeautoclicker == true do
                local args = {
                    [1] = "FasterFreeAutoClicker"
                }
                game:GetService("ReplicatedStorage").Functions.Upgrade:InvokeServer(unpack(args))
                wait(autoupgradedelay)
            end
        else
            autoupgradefreeautoclicker = false
        end
    end
})

section5:AddSlider({
	Name = "Auto Upgrade Delay",
	Min = 1,
	Max = 60,
	Default = 5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autoupgradedelay = Value
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