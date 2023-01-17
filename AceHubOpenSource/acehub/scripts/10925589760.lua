


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Merge Simulator 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm ", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Merge"})
local section4 = tab:AddSection({Name = "Auto Click"})
local tab2 = Window:MakeTab({Name = "Auto Upgrade ", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Auto Cash Upgrade"})
local section8 = tab2:AddSection({Name = "Auto Gem Upgrade"})
local section3 = tab:AddSection({Name = "Auto Rebirth"})
local section5 = tab:AddSection({Name = "Auto Obby"})
local tab3 = Window:MakeTab({Name = "Auto Hatch", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section6 = tab3:AddSection({Name = "Auto Hatch"})
local tab4 = Window:MakeTab({Name = "Misc ", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section7 = tab4:AddSection({Name = "Misc"})

--Variables
local automerge = false
local autofarmdelay = nil
local player = game:GetService("Players").LocalPlayer
local autofrenzy = false
local automergedelay = nil
local autoupspawntier = false
local upgradedelay = nil
local autoupmaxblocks = false
local autoupspawnrate = false
local plot = game:GetService("Workspace").Plots:FindFirstChild(player.Name)
local autorebirth = false
local autorebirthdelay = nil
local autoclickblocks = false
local autoclickblocksdelay = nil
local autohatchdelay = nil
local autocashmultiplier = false
local autowalkspeed = false
local autogems = false
local gemupgradedelay = nil
local autohatch = false


--Script
section:AddToggle({
	Name = "Auto Merge",
	Default = false,
	Callback = function(Value)
        if Value == true then
            automerge = true
            while automerge == true do
                for i,v in pairs(plot.Blocks:GetChildren()) do
					v.CFrame = CFrame.new(plot.Main.Position.X + 5, plot.Main.Position.Y + 5, plot.Main.Position.Z + 5)
                end
                wait(automergedelay)
            end
        else
            automerge = false
        end
    end
})

section:AddSlider({
	Name = "Auto Merge Delay",
	Min = 1,
	Max = 30,
	Default = 2,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		automergedelay = Value
	end    
})

section4:AddToggle({
	Name = "Auto Click Blocks",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoclickblocks = true
            while autoclickblocks == true do
                for i,v in pairs(plot.Blocks:GetChildren()) do
					game:GetService("ReplicatedStorage").Functions.Tap:FireServer(v)
                end
                wait(autoclickblocksdelay)
            end
        else
            autoclickblocks = false
        end
    end
})

section4:AddSlider({
	Name = "Auto Click Blocks Delay",
	Min = 0.1,
	Max = 30,
	Default = 0.1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autoclickblocksdelay = Value
	end    
})

section5:AddToggle({
	Name = "Auto Obby",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autofrenzy = true
            while autofrenzy == true do
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").Obby.Finish,1)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").Obby.Finish,0)               
                wait(61)
            end
        else
            autofrenzy = false
        end
    end
})

section3:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autorebirth = true
            while autorebirth == true do
                game:GetService("ReplicatedStorage").Functions.Rebirth:InvokeServer()
                wait(autorebirthdelay)
            end
        else
            autorebirth = false
        end
    end
})

section3:AddSlider({
	Name = "Auto Rebirth Delay",
	Min = 5,
	Max = 60,
	Default = 10,
	Color = Color3.fromRGB(31,145,3),
	Increment = 5,
	ValueName = "Seconds",
	Callback = function(Value)
		autorebirthdelay = Value
	end    
})

section2:AddToggle({
	Name = "Auto Upgarde Spawn Tier",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupspawntier = true
            while autoupspawntier == true do
				firesignal(player.PlayerGui.World.Wall.Upgrades.SpawnTier.Buy.Activated)
                wait(upgradedelay)
            end
        else
            autoupspawntier = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Upgrade Max Blocks",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupmaxblocks = true
            while autoupmaxblocks == true do
				firesignal(player.PlayerGui.World.Wall.Upgrades.MaxBlocks.Buy.Activated)
                wait(upgradedelay)
            end
        else
            autoupmaxblocks = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Upgrade Spawnrate",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoupspawnrate = true
            while autoupspawnrate == true do
                firesignal(player.PlayerGui.World.Wall.Upgrades.Cooldown.Buy.Activated)
                wait(upgradedelay)
            end
        else
            autoupspawnrate = false
        end
    end
})

section2:AddSlider({
	Name = "Auto Cash Upgrade Delay",
	Min = 1,
	Max = 30,
	Default = 3,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		upgradedelay = Value
	end    
})

section8:AddToggle({
	Name = "Auto Upgrade +10% Cash",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autocashmultiplier = true
            while autocashmultiplier == true do
                firesignal(player.PlayerGui.World.Wall.Rebirths.Shop.Options.CashMultiplier.Icon.Activated)
                wait(gemupgradedelay)
            end
        else
            autocashmultiplier = false
        end
    end
})

section8:AddToggle({
	Name = "Auto Upgrade +10% Speed",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autowalkspeed = true
            while autowalkspeed == true do
                firesignal(player.PlayerGui.World.Wall.Rebirths.Shop.Options.Walkspeed.Icon.Activated)
                wait(gemupgradedelay)
            end
        else
            autowalkspeed = false
        end
    end
})

section8:AddToggle({
	Name = "Auto Upgrade +10% Gems",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autogems = true
            while autogems == true do
                firesignal(player.PlayerGui.World.Wall.Rebirths.Shop.Options.GemsMultiplier.Icon.Activated)
                wait(gemupgradedelay)
            end
        else
            autogems = false
        end
    end
})

section8:AddSlider({
	Name = "Auto Gem Upgrade Delay",
	Min = 1,
	Max = 30,
	Default = 3,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		gemupgradedelay = Value
	end    
})

section6:AddToggle({
	Name = "Auto Hatch [Basic Egg]",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autohatch = true
            while autohatch == true do
                firesignal(player.PlayerGui.World["Basic Egg"].pcButtons["1"].Activated)
                wait(.5)
                firesignal(player.PlayerGui.World["Basic Egg"].pcButtons["3"].Activated)
                wait(autohatchdelay)
            end
        else
            autohatch = false
        end
    end
})

section6:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 10,
	Max = 30,
	Default = 10,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autohatchdelay = Value
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