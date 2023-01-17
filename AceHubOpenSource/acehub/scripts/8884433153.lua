

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Collect All Pets! 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Coin"})
local tab2 = Window:MakeTab({Name = "Auto Buy", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Auto Buy"})
local section3 = tab:AddSection({Name = "Auto Farm"})
local tab5 = Window:MakeTab({Name = "Auto Egg", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section7 = tab5:AddSection({Name = "Auto Egg"})
local tab4 = Window:MakeTab({Name = "Teleports", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section6 = tab4:AddSection({Name = "Area Teleports"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab3:AddSection({Name = "Misc"})
local section5 = tab3:AddSection({Name = "Discord/Credits"})
local section8 = tab:AddSection({Name = "Pet Lock"})


--Variables
local autocoin = false
local lockedarea = 0
local autoclaimquest = false
local autoequipbest = false
local autobuypetequpislots = false
local autobuyspeed = false
local autobuydamage = false
local autobuydropcollection = false
local autobuydroprate = false
local autobuyshinyluck = false
local autobuybonusdropcollectionrange = false
local autobuymetallickluck = false
local coindelay = nil
local tpselect = nil
local eggtype = nil
local autohatch = false
local autohatchdelay = 1
local arealock = 0
local arealockon = false
local coins = game:GetService("Workspace").Drops:GetChildren()


--Script
section:AddToggle({
	Name = "Auto Coin",
	Default = false,
	Callback = function(Value)
		if Value == true then 
            autocoin = true 
            while autocoin == true do
                wait()
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
                for i,v in pairs(game:GetService("Workspace").Drops:GetDescendants()) do
                    if v.Name == "Base" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    end
                end
            end
            else
                autocoin = false
        end
	end    
})

section:AddSlider({
	Name = "Auto Coin Delay",
	Min = 0.1,
	Max = 5,
	Default = 0.1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.1,
	ValueName = "seconds",
	Callback = function(Value)
		coindelay = Value
	end    
})

section8:AddToggle({
	Name = "Area Pet Lock",
	Default = false,
	Callback = function(Value)
        if Value == true then
            arealockon = true 
            while arealockon == true do
                wait(1)
                local args = {
                    [1] = arealock
                } 
                game:GetService("ReplicatedStorage").Remotes.SetLockedArea:FireServer(unpack(args))
	end
else
    arealockon = false
        end
    end 
})

section8:AddDropdown({
	Name = "Pet Area Lock:",
	Default = "1",
	Options = {"None", "The Meadow", "The Forest", "The Desert", "The Artic", "The Beach", "The Mountains", "The Jungle", "The Grotto", "Mushroom Forest"},
	Callback = function(Value)
        if Value == "None" then
            arealock = 0
        end
        if Value == "The Meadow" then
            arealock = 1        
        end        
        if Value == "The Forest" then
            arealock = 2
        end        
        if Value == "The Desert" then
            arealock = 3
        end        
        if Value == "The Artic" then
            arealock = 4
        end        
        if Value == "The Beach" then
            arealock = 5
        end  
        if Value == "The Mountains" then
            arealock = 6
        end  
        if Value == "The Jungle" then
            arealock = 7
        end  
        if Value == "The Grotto" then
            arealock = 8
        end    
        if Value == "The Mushroom Forest" then
            arealock = 9
        end            
    end
})

section3:AddToggle({
	Name = "Auto Claim Quest",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autoclaimquest = true
                while autoclaimquest == true do
            wait(1)
        game:GetService("ReplicatedStorage").Remotes.ClaimQuestReward:FireServer()
	end
else
    autoclaimquest = false
        end
    end    
})

section3:AddToggle({
	Name = "Auto Equip Best",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autoequipbest = true
                while autoequipbest == true do
            wait(1)
        game:GetService("ReplicatedStorage").Remotes.EquipBest:FireServer()
    end
else
    autoequipbest = false
        end
    end    
})

section2:AddToggle({
	Name = "Auto Buy Damage",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autobuydamage = true
                while autobuydamage == true do
            wait(1)
        local args = {
            [1] = "Damage"
        }
        game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease:FireServer(unpack(args))
    end
else
    autobuydamage = false
        end
    end    
})

section2:AddToggle({
	Name = "Auto Buy Speed",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autobuyspeed = true
                while autobuyspeed == true do
                wait(1)
            local args = {
                [1] = "Speed"
            }
        game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease:FireServer(unpack(args))
    end
else
    autobuyspeed = false
        end
    end    
})

section2:AddToggle({
	Name = "Auto Buy Drop Collection Range",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autobuydropcollection = true
                while autobuydropcollection == true do
                wait(1)
        local args = {
            [1] = "DropCollectionRange"
        }
        game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease:FireServer(unpack(args))
    end
else
    autobuydropcollection = false
        end
    end    
})

section2:AddToggle({
	Name = "Auto Buy Drop Rate",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autobuydroprate = true
                while autobuydroprate == true do
                wait(1)
        local args = {
            [1] = "DropRate"
        }
        game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease:FireServer(unpack(args))
    end
else
    autobuydroprate = false
        end
    end    
})

section2:AddToggle({
	Name = "Auto Buy Shiny Luck",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autobuyshinyluck = true
                while autobuyshinyluck == true do
                wait(1)
        local args = {
            [1] = "ShinyLuck"
        }
        game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease:FireServer(unpack(args))
    end
else
    autobuyshinyluck = false
        end
    end    
})

section2:AddToggle({
	Name = "Auto Buy Bonus Drop Collection Range",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autobuybonusdropcollectionrange = true
                while autobuybonusdropcollectionrange == true do
                wait(1)
        local args = {
            [1] = "BonusDropCollectionRange"
        }
        game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease:FireServer(unpack(args))
    end
else
    autobuybonusdropcollectionrange = false
        end
    end    
})

section2:AddToggle({
	Name = "Auto Buy Metallic Luck",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autobuymetallickluck = true
                while autobuymetallickluck == true do
                wait(1)
        local args = {
            [1] = "MetallicLuck"
        }
        game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease:FireServer(unpack(args))
    end
else
    autobuymetallickluck = false
        end
    end    
})

section2:AddButton({
	Name = "Buy Pet Equip Slots",
	Callback = function()
local args = {
    [1] = 1
}
game:GetService("ReplicatedStorage").Remotes.BuyPetEquipSlot:FireServer(unpack(args))
local args = {
    [1] = 2
}
game:GetService("ReplicatedStorage").Remotes.BuyPetEquipSlot:FireServer(unpack(args))
local args = {
    [1] = 3
}
game:GetService("ReplicatedStorage").Remotes.BuyPetEquipSlot:FireServer(unpack(args))
local args = {
    [1] = 4
}
game:GetService("ReplicatedStorage").Remotes.BuyPetEquipSlot:FireServer(unpack(args))
local args = {
    [1] = 5
}
  	end    
})

section4:AddButton({
	Name = "Claim Daily Egg",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.ClaimDailyEgg:FireServer()
    end    
})

section4:AddButton({
	Name = "Claim All Hidden Eggs",
	Callback = function()
        for i,v in pairs(game:GetService("Workspace").HiddenEggs:GetChildren()) do
            wait()
            local args = {
                [1] = v.Name
            }
        game:GetService("ReplicatedStorage").Remotes.CollectHiddenEgg:FireServer(unpack(args))
            v:Destroy()
        end
    end    
})

section6:AddDropdown({
	Name = "Area Teleport",
	Default = "Main",
	Options = {"Area1", "Area2", "Area3", "Area4", "Area5", "Area6", "Area7", "Area8", "Area9", "Main"},
	Callback = function(Value)
        tpselect = Value
    if Value == "Main" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Main.CFrame
    end
    if Value == "Area1" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area1.CFrame
	end        
    if Value == "Area2" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area2.CFrame
	end        
    if Value == "Area3" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area3.CFrame
	end        
    if Value == "Area4" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area4.CFrame
	end        
    if Value == "Area5" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area5.CFrame
	end        
    if Value == "Area6" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area6.CFrame
	end        
    if Value == "Area7" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area7.CFrame
	end        
    if Value == "Area8" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area8.CFrame
	end        
    if Value == "Area9" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Areas.Area9.CFrame
	end
end    
})

section7:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
            if Value == true then
                autohatch = true
                while autohatch == true do
                wait(autohatchdelay)
            local args = {
                [1] = eggtype
            }
            game:GetService("ReplicatedStorage").Remotes.BuyEgg:FireServer(unpack(args))
        end
else
    autohatch = false
        end
    end    
})

section7:AddDropdown({
	Name = "Auto Egg Type",
	Default = "1",
	Options = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Proigious"},
	Callback = function(Value)
        if Value == "Common" then
            eggtype = 1
        end
        if Value == "Uncommon" then
            eggtype = 2        
        end        
        if Value == "Rare" then
            eggtype = 3
        end        
        if Value == "Epic" then
            eggtype = 4
        end        
        if Value == "Legendary" then
            eggtype = 5
        end        
        if Value == "Proigious" then
            eggtype = 6
        end        
    end
})

section7:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 1,
	Max = 5,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "seconds",
	Callback = function(Value)
		autohatchdelay = Value
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