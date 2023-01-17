

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/crazycaydon/modded_orion/main/modded_orion.lua')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Race Clicker", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local section3 = tab:AddSection({Name = "Auto Click"})
local section5 = tab:AddSection({Name = "Auto Rebirth"})
local tab3 = Window:MakeTab({Name = "Auto Pet/Hatch", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab3:AddSection({Name = "Auto Pet"})
local tab2 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Misc"})
local section6 = tab3:AddSection({Name = "Auto Hatch"})


--Variables
local autofarm = false
local farmdelay = nil
local autoclick = false
local autoclickdelay = nil
local autobest = false
local autocraft = false
local autorebirth = false
local rebirthdelay = nil
local autohatch = false
local autohatchdelay = nil
local autohatchtype = nil


--Script
section:AddToggle({
	Name = "Realistic Auto Farm 🎁",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autofarm = true
            while autofarm == true do
                local args = {[1] = true}
                game:GetService("ReplicatedStorage").Packages.Knit.Services.AFKService.RF.SetState:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.PlayerGui.TimerUI.RaceTimer.Visible == true then
            if autofarm == false then
                game.Players.LocalPlayer.Character.Head:Destroy()
                break 
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(-10000, 0, 0)
        end
        wait(farmdelay)
    end
else
    autofarm = false  
    game.workspace.Gravity = 196.2  
    game.Players.LocalPlayer.Character.Head:Destroy()
    end
end
})

section:AddToggle({
	Name = "Fast Auto Farm",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autofarm = true
            while autofarm == true do
                local args = {[1] = true}
                game:GetService("ReplicatedStorage").Packages.Knit.Services.AFKService.RF.SetState:InvokeServer(unpack(args))
                if game.Players.LocalPlayer.PlayerGui.TimerUI.RaceTimer.Visible == true then
            if autofarm == false then
                game.Players.LocalPlayer.Character.Head:Destroy()
                break 
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(-200000, 0, 0)
        end
        wait(farmdelay)
    end
else
    autofarm = false  
    game.workspace.Gravity = 196.2  
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end 
end
})

section:AddSlider({
	Name = "Auto Farm Delay",
	Min = 0.1,
	Max = 5,
	Default = 0.1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.1,
	ValueName = "Seconds",
	Callback = function(Value)
		farmdelay = Value
	end    
})

section3:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoclick = true 
            while autoclick == true do
        if game.Players.LocalPlayer.PlayerGui.TimerUI.RaceTimer.Visible == false then
            game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickService.RF.Click:InvokeServer()
        end
        wait(autoclickdelay)
    end
else
    autoclick = false
        end
    end 
})

section3:AddSlider({
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

section4:AddToggle({
	Name = "Auto Equip Best",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autobest = true 
            while autobest == true do
            game:GetService("ReplicatedStorage").Packages.Knit.Services.PetsService.RF.EquipBest:InvokeServer()
        wait(5)
    end
else
    autobest = false
        end
    end 
})

section4:AddToggle({
	Name = "Auto Craft All",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autocraft = true 
            while autocraft == true do
            game:GetService("ReplicatedStorage").Packages.Knit.Services.PetsService.RF.CraftAll:InvokeServer()
        wait(5)
	end
else
    autocraft = false
        end
    end 
})

section5:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autorebirth = true 
            while autorebirth == true do
                game:GetService("ReplicatedStorage").Packages.Knit.Services.RebirthService.RF.Rebirth:InvokeServer()
        wait(rebirthdelay)
	end
else
    autorebirth = false
        end
    end 
})

section5:AddSlider({
	Name = "Auto Rebirth Delay",
	Min = 20,
	Max = 420,
	Default = 30,
	Color = Color3.fromRGB(31,145,3),
	Increment = 5,
	ValueName = "Seconds",
	Callback = function(Value)
		rebirthdelay = Value
	end    
})

section6:AddDropdown({
	Name = "Egg Type",
	Default = "Select Type",
	Options = {"5 Wins", "25 Wins", "175 Wins", "1k Wins", "10k Wins", "75k Wins", "250k Wins", "1M Wins", "2.5M Wins", "5M Wins"},
	Callback = function(Value)
	if Value == "5 Wins" then
        autohatchtype = "Starter01"
	end    
    if Value == "25 Wins" then
        autohatchtype = "Starter02"
    end  
    if Value == "175 Wins" then
        autohatchtype = "Starter03"
    end  
    if Value == "1k Wins" then
        autohatchtype = "Starter04"
    end
    if Value == "10k Wins" then
        autohatchtype = "Pro01"
    end  
    if Value == "75k Wins" then
        autohatchtype = "Pro02"
    end  
    if Value == "250k Wins" then
        autohatchtype = "Pro03"
    end  
    if Value == "1M Wins" then
        autohatchtype = "Pro04"
    end
    if Value == "2.5M Wins" then
        autohatchtype = "Space01"
    end
    if Value == "5M Wins" then
        autohatchtype = "Ocean01"
    end
end
})

section6:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autohatch = true 
            while autohatch == true do
                local args = {
                    [1] = autohatchtype,
                    [2] = "1",
                    [3] = {}
                }
            game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.Open:InvokeServer(unpack(args))
        wait(autohatchdelay)
	end
else
    autohatch = false
        end
    end 
})

section6:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 1,
	Max = 10,
	Default = 3,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autohatchdelay = Value
	end    
})

section2:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section2:AddParagraph("Credits","!EwItsCaydon<3#0001") 