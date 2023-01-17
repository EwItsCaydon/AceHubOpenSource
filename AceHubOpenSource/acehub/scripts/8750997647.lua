



local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Tapping Legends X 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub", IntroEnabled=false})

local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab4 = Window:MakeTab({Name = "Auto Upgrade", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab2 = Window:MakeTab({Name = "Pets/Eggs", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})

local section = tab:AddSection({Name = "Autofarm"})
local section2 = tab2:AddSection({Name = "Hatch"})
local section6 = tab2:AddSection({Name = "Pet"})
local section3 = tab:AddSection({Name = "Drops"})
local section4 = tab3:AddSection({Name = "Misc"})
local section5 = tab4:AddSection({Name = "Auto Extract"})
local section7 = tab4:AddSection({Name = "Auto Ruby Upgrade"})


local autotap = false
local autorebirth = false
local autohatch = false
local eggtype= 'Forest Egg'
local eggamount = 1
local dropzone = 'Forest'
local autodrops = false
local hatchdelay = 1
local autoequipbest = false
local autotapdelay = 0.1
local autoextracttaps = false
local autoextractrubies = false
local autoupgradetapmultiplier = false
local autoupgrademorerebirths = false
local autoupgradepetstorage = false
local autoupgradewalkspeed = false
local autoupgradecriticalchances = false
local autoupgradeautoclickermultiplier = false
local autoupgrademaxtapcombo = false
local autoupgradebetterpetstats = false
local autoupgradedoublevialtime = false



section:AddToggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autotap = true
            while autotap == true do
                game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
                wait(autotapdelay)
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


section:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autorebirth = true
            while autorebirth == true do
                wait(1)
                local args = {
                    [1] = 1
                }
                game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(unpack(args))
            end
        else
            autorebirth = false
        end
	end    
})

section5:AddToggle({
	Name = "Auto Extract Taps",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoextracttaps = true
            while autoextracttaps == true do
                wait(1)
                    local args = {
                    [1] = 1
                }
                game:GetService("ReplicatedStorage").Remotes.Extract:FireServer(unpack(args))

            end
        else
            autoextracttaps = false
        end
	end    
})

section5:AddToggle({
	Name = "Auto Extract Rubies",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoextractrubies = true
            while autoextractrubies == true do
                wait(1)
                    local args = {
                    [1] = 2
                }
                game:GetService("ReplicatedStorage").Remotes.Extract:FireServer(unpack(args))

            end
        else
            autoextractrubies = false
        end
	end    
})

section7:AddToggle({
	Name = "Auto Upgrade Tap Multiplier",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradetapmultiplier = true
            while autoupgradetapmultiplier == true do
                wait(1)
                    local args = {
                    [1] = "Ruby",
                    [2] = "TapMultiplier"
                }
                game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgradetapmultiplier = false
        end
	end    
})

section7:AddButton({
	Name = "Buy Free Auto Clicker",
	Callback = function()
        local args = {
            [1] = "Ruby",
            [2] = "FreeAutoClicker"
        }
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
  	end    
})

section7:AddToggle({
	Name = "Auto Upgrade More Rebirths",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgrademorerebirths = true
            while autoupgrademorerebirths == true do
                wait(1)
                    local args = {
                        [1] = "Ruby",
                        [2] = "RebirthsUpgrade"
                    }
                    game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgrademorerebirths = false
        end
	end    
})

section7:AddToggle({
	Name = "Auto Upgrade Pet Storage",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradepetstorage = true
            while autoupgradepetstorage == true do
                wait(1)
                    local args = {
                        [1] = "Ruby",
                        [2] = "PetStorage"
                    }
                    game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgradepetstorage = false
        end
	end    
})

section7:AddToggle({
	Name = "Auto Upgrade Faster Walk",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradewalkspeed = true
            while autoupgradewalkspeed == true do
                wait(1)
                    local args = {
                        [1] = "Ruby",
                        [2] = "WalkSpeed"
                    }
                    game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgradewalkspeed = false
        end
	end    
})

section7:AddToggle({
	Name = "Auto Upgrade Critical Chances",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradecriticalchances = true
            while autoupgradecriticalchances == true do
                wait(1)
                    local args = {
                        [1] = "Ruby",
                        [2] = "CriticalChances"
                    }
                    game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgradecriticalchances = false
        end
	end    
})

section7:AddToggle({
	Name = "Auto Upgrade Auto Clicker Multiplier",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradeautoclickermultiplier = true
            while autoupgradeautoclickermultiplier == true do
                wait(1)
                    local args = {
                        [1] = "Ruby",
                        [2] = "AutoClickerMultiplier"
                    }
                    game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgradeautoclickermultiplier = false
        end
	end    
})

section7:AddToggle({
	Name = "Auto Upgrade Max Tap Combo",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgrademaxtapcombo = true
            while autoupgrademaxtapcombo == true do
                wait(1)
                    local args = {
                        [1] = "Ruby",
                        [2] = "MaxCombo"
                    }
                    game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgrademaxtapcombo = false
        end
	end    
})

section7:AddButton({
	Name = "Buy Achievement Luck",
	Callback = function()
        local args = {
            [1] = "Ruby",
            [2] = "AchievementLuck"
        }
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
  	end    
})

section7:AddButton({
	Name = "Buy Re-Enchant",
	Callback = function()
        local args = {
            [1] = "Ruby",
            [2] = "ReEnchant"
        }
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
  	end    
})

section7:AddToggle({
	Name = "Auto Upgrade Better Pet Stats",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradebetterpetstats = true
            while autoupgradebetterpetstats == true do
                wait(1)
                    local args = {
                        [1] = "Ruby",
                        [2] = "BetterPetStats"
                    }
                    game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgradebetterpetstats = false
        end
	end    
})

section7:AddToggle({
	Name = "Auto Upgrade Double Vial Time",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupgradedoublevialtime = true
            while autoupgradedoublevialtime == true do
                wait(1)
                    local args = {
                        [1] = "Ruby",
                        [2] = "DoubleVial"
                    }
                    game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(args))
            end
        else
            autoupgradedoublevialtime = false
        end
	end    
})



section2:AddTextbox({
	Name = "Egg Type",
	Default = "Forest Egg",
	TextDisappear = false,
	Callback = function(Value)
		eggtype = tonumber(Value)
	end	  
})


section2:AddDropdown({
	Name = "Hatch Amount",
	Default = "1",
	Options = {"1", "2", "3"},
	Callback = function(Value)
		eggamount=tonumber(Value)
	end    
})


section2:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 0.5,
	Max = 30,
	Default = 5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.5,
	ValueName = "Seconds",
	Callback = function(Value)
		
	end    
})

section2:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autohatch = true
            while autohatch == true do
                wait(2)
                local args = {
                    [1] = eggtype,
                    [2] = eggamount
                }
                game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(unpack(args))
            end
        else
            autohatch = false
        end
	end    
})

section6:AddToggle({
	Name = "Auto Equip Best",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoequipbest = true
            while autoequipbest == true do
                game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
                wait(1)
            end
        else
            autoequipbest = false
        end
	end
})



section3:AddDropdown({
	Name = "Zone",
	Default = "Forest",
	Options = {"Forest", "Desert", "Winter", "Lava", "Aqua", "Sakura", "Mines", "Galaxy", "Heaven", "Hell", "Tech", "Steampunk", "Swamp", "Candy", "Magic", "Fantasy", "Toy", "Retro", "Lab", "Temple", "Farm"},
	Callback = function(Value)
		dropzone=Value
	end    
})


section3:AddToggle({
	Name = "Autofarm Drops",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autodrops = true
            while autodrops == true do
                local drops=game:GetService("Workspace").Drops:FindFirstChild(dropzone):GetChildren()
                local randomdrop = drops[math.random(1, #drops)]
                

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (randomdrop.Circle.CFrame + Vector3.new(0,5,0))
                local args = {
                    [1] = randomdrop.Name
                }
                while game:GetService("Workspace").Drops:FindFirstChild(dropzone):FindFirstChild(randomdrop.Name) do
                    game:GetService("ReplicatedStorage").Remotes.Tap:FireServer(unpack(args))
                    wait(0.05)
                end
                wait(1)
            end
        else
            autodrops = false
        end
	end
})


section4:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section4:AddParagraph("Credits","!EwItsCaydon<3#0001/imandrewyo#3433")