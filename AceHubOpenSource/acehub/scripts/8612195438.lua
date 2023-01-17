


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Clicker Party Simulator 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local section2 = tab:AddSection({Name = "Auto Rebirth"})
local tab2 = Window:MakeTab({Name = "Auto Upgrade", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab2:AddSection({Name = "Auto Upgrade"})
local tab3 = Window:MakeTab({Name = "Auto Hatch", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab3:AddSection({Name = "Auto Hatch"})
local tab4 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section6 = tab4:AddSection({Name = "Misc"})
local section5 = tab4:AddSection({Name = "Credits/Discord"})


--Variables
local autotap = false
local autorebirth = false
local rebirthamount = 1
local autotapdelay = 0.1
local autoupgradeclicks = false
local autoupgradegems = false
local autoupgradespeed = false
local autoupgradejump = false
local autoupgradebuttons = false
local autoupgradeautoclick = false
local autoupgradeinventory = false
local autoupgradeluck = false
local autoupgradepetequip = false
local autoupgradeinstantgolden = false
local autoupgrademaxlevel = false
local autoupgradexp = false
local autohatch = false
local autohatchtype = nil


--Script
section:AddToggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autotap = true 
            while autotap == true do
                wait(autotapdelay)
                local args = {
                [1] = "e"
                }
            game:GetService("ReplicatedStorage").Click:FireServer(unpack(args))
	end
else
        autotap = false
    end
end    
})

section:AddSlider({
	Name = "Auto Tap Delay",
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

section2:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autorebirth = true 
            while autorebirth == true do
                wait(1)
            local args = {
                [1] = rebirthamount,
                [2] = "a"
            }
        game:GetService("ReplicatedStorage").Rebirth:FireServer(unpack(args))
	end
else
        autorebirth = false
    end
end    
})

section2:AddDropdown({
	Name = "Rebirth Amount",
	Default = "1",
	Options = {"1", "5", "10", "50", "100"},
	Callback = function(Value)
		rebirthamount = Value
	end    
})

section3:AddToggle({
	Name = "Auto Upgrade Clicks",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradeclicks = true 
            while autoupgradeclicks == true do
                wait(1)
            local args = {
                [1] = "Clicks"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradeclicks = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Gems",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradegems = true 
            while autoupgradegems == true do
                wait(1)
            local args = {
                [1] = "Gems"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradegems = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Speed",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradespeed = true 
            while autoupgradespeed == true do
                wait(1)
            local args = {
                [1] = "Speed"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradespeed = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Jump",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradejump = true 
            while autoupgradejump == true do
                wait(1)
            local args = {
                [1] = "Jump"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradejump = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Buttons",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradebuttons = true 
            while autoupgradebuttons == true do
                wait(1)
            local args = {
                [1] = "Buttons"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradebuttons = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Auto Click",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradeautoclick = true 
            while autoupgradeautoclick == true do
                wait(1)
            local args = {
                [1] = "AutoClick"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradeautoclick = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Inventory",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradeinventory = true 
            while autoupgradeinventory == true do
                wait(1)
            local args = {
                [1] = "Inventory"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradeinventory = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Luck",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradeluck = true 
            while autoupgradeluck == true do
                wait(1)
            local args = {
                [1] = "Luck"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradeluck = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Pet Equip",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradepetequip = true 
            while autoupgradepetequip == true do
                wait(1)
            local args = {
                [1] = "PetEquip"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradepetequip = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Instant Golden",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradeinstantgolden = true 
            while autoupgradeinstantgolden == true do
                wait(1)
            local args = {
                [1] = "PetEquip"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradeinstantgolden = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade Max Level",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgrademaxlevel = true 
            while autoupgrademaxlevel == true do
                wait(1)
            local args = {
                [1] = "MaxLevel"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgrademaxlevel = false
    end
end    
})

section3:AddToggle({
	Name = "Auto Upgrade XP",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradexp = true 
            while autoupgradexp == true do
                wait(1)
            local args = {
                [1] = "XP"
            }
        game:GetService("ReplicatedStorage").Upgrade:FireServer(unpack(args))
	end
else
    autoupgradexp = false
    end
end    
})

section4:AddToggle({
	Name = "Auto Hatch (Must Be Near Egg)",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autohatch = true
            while autohatch == true do
                wait()
            local args = {
                [1] = autohatchtype,
                [2] = "Normal",
                [3] = "asdgouhsaiugdhasoiudghodsagfasdgdsaoughsadoug"
            }
        game:GetService("ReplicatedStorage").HatchEvents.Hatch:FireServer(unpack(args))

	end
else
    autohatch = false
    end
end    
})

section4:AddTextbox({
	Name = "Auto Hatch Egg Type",
	Default = "Insert Egg Type (Cap Sensitive)",
	TextDisappear = true,
	Callback = function(Value)
		autohatchtype = Value
	end	  
})

section6:AddButton({
	Name = "Redeem Hidden Code",
	Callback = function()
            local args = {
            [1] = "Flare>Cam"
        }
    game:GetService("ReplicatedStorage").CheckCode:FireServer(unpack(args))
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