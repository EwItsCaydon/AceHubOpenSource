

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 AceHub - Swim Race Clicker 🎁", HidePremium = false, IntroEnabled = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Click"})
local section2 = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Auto Pet/Hatch", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab2:AddSection({Name = "Auto Hatch"})
local section4 = tab2:AddSection({Name = "Auto Pet"})
local tab3 = Window:MakeTab({Name = "Auto Prestige", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section5 = tab3:AddSection({Name = "Auto Prestige"})
local tab4 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section6 = tab4:AddSection({Name = "Misc"})

--Variables
local autoclick = false
local autoclickdelay = nil
local autofarm = false
local autofarmdelay = nil
local autofarmfast = false
local tpset = nil
local autohatch = false
local hatchdelay = nil
local autobest = false
local autocraft = false
local prestigedelay = nil
local autoprestige = false
local autofarmfast2 = false
local autofarm2 = false

--Script
section:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoclick = true
            while autoclick == true do
                game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickingService.RF.Click:InvokeServer()
                wait(autoclickdelay)
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
		autoclickdelay = Value
	end    
})

section2:AddToggle({
	Name = "World 1 Auto Farm Each Stage",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autofarm = true
            while autofarm == true do
                while autofarm == false do
                    game.Players.LocalPlayer.Character.Head:Destroy()
                    break
                end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.7499771, 13.4490957, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(399.75, 14.4547005, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1299.75, 12.2546682, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2799.74976, 12.2546759, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5049.75, 12.8546743, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8799.75, 12.8546743, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16299.75, 12.8546743, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(31299.75, 13.1546698, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(61299.75, 12.3546743, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113799.75, 12.6546698, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188799.75, 13.5546713, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(301299.75, 11.7546759, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(436299.75, 12.6546698, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(616299.75, 11.7546759, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(.5)
                    game.Players.LocalPlayer.Character.Head:Destroy()
                wait(6)
    end
        else
            autofarm = false
            game.Players.LocalPlayer.Character.Head:Destroy()
        end
    end
})

section2:AddToggle({
	Name = "World 2 Auto Farm Each Stage",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autofarm2 = true
            while autofarm2 == true do
                while autofarm2 == false do
                    game.Players.LocalPlayer.Character.Head:Destroy()
                    break
                end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.7499771, 13.4490957, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(399.75, 14.4546652, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1299.75, 12.2546682, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2799.74976, 12.2546759, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5049.75, 12.8546743, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8799.75, 12.8546743, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16299.75, 12.8546743, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(31299.75, 13.1546698, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(61299.75, 12.3546743, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113799.75, 12.6546698, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188799.75, 13.5546713, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(301299.75, 11.7546759, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(436299.75, 12.6546698, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(autofarmdelay)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(616299.75, 11.7546759, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(.5)
                    game.Players.LocalPlayer.Character.Head:Destroy()
                wait(6)
    end
        else
            autofarm2 = false
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end
})

section2:AddToggle({
	Name = "World 1 Auto Farm Straight To End [Reccomended]",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autofarmfast = true
            while autofarmfast == true do
                if autofarmfast == false then
                    break
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(616299.75, 11.7546759, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                wait(autofarmdelay)
            end
        else
            autofarmfast = false
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end
})

section2:AddToggle({
	Name = "World 2 Auto Farm Straight To End [Reccomended]",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autofarmfast2 = true
            while autofarmfast2 == true do
                if autofarmfast2 == false then
                    break
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(616299.75, 11.7546759, 4096, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                wait(autofarmdelay)
            end
        else
            autofarmfast2 = false
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end
})

section2:AddSlider({
	Name = "Auto Farm Delay",
	Min = 0.1,
	Max = 10,
	Default = 0.5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.1,
	ValueName = "Seconds",
	Callback = function(Value)
		autofarmdelay = Value
	end    
})

section3:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autohatch = true
            while autohatch == true do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpset
                local args = {
                    [1] = hatchtype,
                    [2] = "Single"
                }
                game:GetService("ReplicatedStorage").RemoteEvents.EggOpened:InvokeServer(unpack(args))
                wait(hatchdelay)
            end
        else
            autohatch = false
        end
    end
})

section3:AddDropdown({
	Name = "Auto Hatch Type",
	Default = "Select Type",
	Options = {"Beach", "Volcano", "IceCream", "Toy", "Desert", "Atlantis", "GemCavern", "Dojo"},
	Callback = function(Value)
		hatchtype = Value
        if Value == "Beach" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-99.1422348, -0.276918411, 37.7124023, -0.0392816067, 0, 0.99922812, 0, 1, 0, -0.99922812, 0, -0.0392816067)
            tpset = CFrame.new(-99.1422348, -0.276918411, 37.7124023, -0.0392816067, 0, 0.99922812, 0, 1, 0, -0.99922812, 0, -0.0392816067)
	    end    
        if Value == "Volcano" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-112.64222, -0.276918411, 37.6124115, -0.0392816067, 0, 0.99922812, 0, 1, 0, -0.99922812, 0, -0.0392816067)
            tpset = CFrame.new(-112.64222, -0.276918411, 37.6124115, -0.0392816067, 0, 0.99922812, 0, 1, 0, -0.99922812, 0, -0.0392816067)
	    end  
        if Value == "IceCream" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-125.895531, -0.276918411, 37.7968102, -0.0392816067, 0, 0.99922812, 0, 1, 0, -0.99922812, 0, -0.0392816067)
            tpset = CFrame.new(-125.895531, -0.276918411, 37.7968102, -0.0392816067, 0, 0.99922812, 0, 1, 0, -0.99922812, 0, -0.0392816067)
	    end
        if Value == "Toy" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-139.052673, -0.601411819, 38.3754578, -0.0479967594, 0, 0.998847485, 0, 1, 0, -0.998847485, 0, -0.0479967594)
            tpset = CFrame.new(-139.052673, -0.601411819, 38.3754578, -0.0479967594, 0, 0.998847485, 0, 1, 0, -0.998847485, 0, -0.0479967594)
	    end
        if Value == "Desert" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-145.261414, -1.17691851, 4163.67969, -0.457844615, 0, 0.889032245, 0, 1, 0, -0.889032245, 0, -0.457844615)
            tpset = CFrame.new(-145.261414, -1.17691851, 4163.67969, -0.457844615, 0, 0.889032245, 0, 1, 0, -0.889032245, 0, -0.457844615)
	    end
        if Value == "Atlantis" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-167.094345, -0.877162457, 4165.68701, 0.577178597, 0, 0.816617966, 0, 1, 0, -0.816617966, 0, 0.577178597)
            tpset = CFrame.new(-167.094345, -0.877162457, 4165.68701, 0.577178597, 0, 0.816617966, 0, 1, 0, -0.816617966, 0, 0.577178597)
	    end
        if Value == "GemCavern" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-149.231812, -0.976918221, 4050.39014, 0.0392816663, -0, -0.99922812, 0, 1, -0, 0.99922812, 0, 0.0392816663)
            tpset = CFrame.new(-149.231812, -0.976918221, 4050.39014, 0.0392816663, -0, -0.99922812, 0, 1, -0, 0.99922812, 0, 0.0392816663)
	    end
        if Value == "Dojo" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-131.06543, -0.876918793, 4054.06079, -0.612221479, 0, -0.790686309, 0, 1, 0, 0.790686309, 0, -0.612221479)
            tpset = CFrame.new(-131.06543, -0.876918793, 4054.06079, -0.612221479, 0, -0.790686309, 0, 1, 0, 0.790686309, 0, -0.612221479)
	    end
    end
})

section3:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 1,
	Max = 10,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		hatchdelay = Value
	end    
})

section4:AddToggle({
	Name = "Auto Equip Best",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autobest = true
            while autobest == true do
                local args = {
                    [1] = "EquipBest",
                    [2] = {
                        ["PetID"] = 265979
                    }
                }
                game:GetService("ReplicatedStorage").RemoteEvents.PetActionRequest:InvokeServer(unpack(args))
                wait(2)
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
                local args = {
                    [1] = "CraftAll",
                    [2] = {
                        ["PetID"] = 0
                    }
                }
                game:GetService("ReplicatedStorage").RemoteEvents.PetActionRequest:InvokeServer(unpack(args))
                wait(3)
            end
        else
            autocraft = false
        end
    end
})

section5:AddToggle({
	Name = "Auto Prestige",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autoprestige = true
            while autoprestige == true do
                game:GetService("ReplicatedStorage").ShenoyEvents.Prestige:FireServer()
                wait(prestigedelay)
            end
        else
            autoprestige = false
        end
    end
})

section5:AddSlider({
	Name = "Auto Prestige Delay",
	Min = 3,
	Max = 30,
	Default = 5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 10,
	ValueName = "Seconds",
	Callback = function(Value)
		prestigedelay = Value
	end    
})

section6:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section6:AddParagraph("Credits","!EwItsCaydon<3#0001") 