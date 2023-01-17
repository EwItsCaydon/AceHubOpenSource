


--Hub
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Anime Race Clicker 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Auto Hero", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Auto Hero"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab3:AddSection({Name = "Misc"})
local section4 = tab2:AddSection({Name = "Auto Equip"})


--Variables
local autoclick = false
local autofarm = false
local autohatch = false
local hatchtype = 1
local autohatchlocation = nil
local autofarmdelay = 1
local autohatchdelay = 1
local autobest = false
local worldselect = 1
local showfuseui = false


--Script
section:AddToggle({
    Name = "Auto Click",
    Default = false,
    Callback = function(Value)
        if Value == true then
            autoclick = true
            while autoclick == true do
                wait()
                if game:GetService("Workspace").GPI.World1.StartBlock.CanCollide == true then
               game:GetService("ReplicatedStorage").Knit.Services.ClickerService.RF.PlayerClick:InvokeServer()
            end
        end
    else
        autoclick = false
        end 
    end    
})

section:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(Value)
    if Value == true then
        autofarm = true 
        while autofarm == true do
            wait()
        while game:GetService("Workspace").GPI.World1.StartBlock.CanCollide == false do
            for i,v in pairs(game:GetService("Workspace").Runtime.RaceChunk:GetChildren()) do
                if v.Name == "Checkpoint" then
                    if autofarm == false then
                        game.Players.LocalPlayer.Character.Head:Destroy()
                        break 
                    end
                    if game:GetService("Workspace").GPI.World1.StartBlock.CanCollide == true then
                        game.Players.LocalPlayer.Character.Head:Destroy()
                        break 
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,5,50)
                    wait(autofarmdelay)
                end
            end
        end
    end
    else
    autofarm = false
    end
end
})

section:AddSlider({
	Name = "Auto Farm Delay",
	Min = 1,
	Max = 5,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autofarmdelay = Value
	end    
})

section2:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autohatch = true
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = autohatchlocation
            while autohatch == true do
                wait(autohatchdelay)
                local args = {
                [1] = autohatchtype,
                [2] = 1,
                [3] = {}
            }
            game:GetService("ReplicatedStorage").Knit.Services.StarEggService.RF.OpenEggs:InvokeServer(unpack(args))
        end 
    else
        autohatch = false
	end
end    
})

section2:AddDropdown({
	Name = "Auto Hatch Type",
	Default = "Star1",
	Options = {"Star1", "Star2", "Star3", "Star4", "Star5", "Star6", "Star7", "Star8", "Star9", "Star10", "Star11", "Star12", "Star13", "Star14", "Star15", "Star16", "Star17", "Star18", "Star19", "Star20", "Star21", "Star22", "Star23", "Star24"},
	Callback = function(Value)
		autohatchtype = Value
        if Value == "Star1" then
            autohatchlocation = CFrame.new(-0.506210685, 4.22069263, -51.970314, -0.999934196, 0.00442438433, 0.0106317755, 0.00139070337, 0.962886035, -0.269904792, -0.0114313513, -0.269872129, -0.962828755)
        end 
        if Value == "Star2" then
            autohatchlocation = CFrame.new(30.9505997, 4.19013977, -52.2943993, -0.0106028318, 0.00441551208, -0.999934077, 0.269948721, 0.962873697, 0.00138945878, 0.962816358, -0.269916177, -0.0114011765)
        end 
        if Value == "Star3" then
            autohatchlocation = CFrame.new(219.550522, 4.22069263, -51.970314, -0.999934196, 0.00442438433, 0.0106317755, 0.00139070337, 0.962886035, -0.269904792, -0.0114313513, -0.269872129, -0.962828755)
        end 
        if Value == "Star4" then
            autohatchlocation = CFrame.new(249.00589, 4.22069263, -52.1527977, -0.999934196, 0.00442438433, 0.0106317755, 0.00139070337, 0.962886035, -0.269904792, -0.0114313513, -0.269872129, -0.962828755)
        end 
        if Value == "Star5" then
            autohatchlocation = CFrame.new(482.913574, 3.85485768, -48.9530563, -0.999934196, 0.00442438433, 0.0106317755, 0.00139070337, 0.962886035, -0.269904792, -0.0114313513, -0.269872129, -0.962828755)
        end 
        if Value == "Star6" then
            autohatchlocation = CFrame.new(512.368896, 3.85485768, -49.1355438, -0.999934196, 0.00442438433, 0.0106317755, 0.00139070337, 0.962886035, -0.269904792, -0.0114313513, -0.269872129, -0.962828755)
        end
        if Value == "Star7" then
            autohatchlocation = CFrame.new(729.272888, 3.82987666, -48.2759514, -0.0106028318, 0.00441551208, -0.999934077, 0.269948721, 0.962873697, 0.00138945878, 0.962816358, -0.269916177, -0.0114011765)
        end
        if Value == "Star8" then
            autohatchlocation = CFrame.new(758.728149, 3.8298769, -48.4584312, -0.0106028318, 0.00441551208, -0.999934077, 0.269948721, 0.962873697, 0.00138945878, 0.962816358, -0.269916177, -0.0114011765)
        end
        if Value == "Star9" then
            autohatchlocation = CFrame.new(992.066467, 3.4648366, -45.2656784, -0.0106028318, 0.00441551208, -0.999934077, 0.269948721, 0.962873697, 0.00138945878, 0.962816358, -0.269916177, -0.0114011765)
        end
        if Value == "Star10" then
            autohatchlocation = CFrame.new(1023.55817, 3.53772688, -48.5712433, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
        if Value == "Star11" then
            autohatchlocation = CFrame.new(1236.17566, 2.50577307, -48.3770065, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
        if Value == "Star12" then
            autohatchlocation = CFrame.new(1265.63257, 3.53772378, -48.5712395, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
        if Value == "Star13" then
            autohatchlocation = CFrame.new(1486.37097, 3.11447048, -47.6060715, -0.0106028318, 0.00441551208, -0.999934077, 0.269948721, 0.962873697, 0.00138945878, 0.962816358, -0.269916177, -0.0114011765)
        end
        if Value == "Star14" then
            autohatchlocation = CFrame.new(1517.86218, 3.18737078, -50.9116402, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
        if Value == "Star15" then
            autohatchlocation = CFrame.new(1718.81995, 1.98654985, -48.0780487, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
        if Value == "Star16" then
            autohatchlocation = CFrame.new(1748.27539, 1.98655915, -48.2605476, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
        if Value == "Star17" then
            autohatchlocation = CFrame.new(2005.47644, 2.10016751, -48.0780449, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
        if Value == "Star18" then
            autohatchlocation = CFrame.new(2032.89722, 3.05924034, -45.1492004, -0.0106028318, 0.00441551208, -0.999934077, 0.269948721, 0.962873697, 0.00138945878, 0.962816358, -0.269916177, -0.0114011765)
        end
        if Value == "Star19" then
            autohatchlocation = CFrame.new(2225.09961, 2.90611053, -42.3878479, -0.999934196, 0.00442438433, 0.0106317755, 0.00139070337, 0.962886035, -0.269904792, -0.0114313513, -0.269872129, -0.962828755)
        end
        if Value == "Star20" then
            autohatchlocation = CFrame.new(2254.55493, 2.90611053, -42.5703354, -0.999934196, 0.00442438433, 0.0106317755, 0.00139070337, 0.962886035, -0.269904792, -0.0114313513, -0.269872129, -0.962828755)
        end
        if Value == "Star21" then
            autohatchlocation = CFrame.new(2473.34253, 2.8811264, -42.575264, -0.0106028318, 0.00441551208, -0.999934077, 0.269948721, 0.962873697, 0.00138945878, 0.962816358, -0.269916177, -0.0114011765)
        end
        if Value == "Star22" then
            autohatchlocation = CFrame.new(2504.8335, 2.95404339, -45.8808441, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
        if Value == "Star23" then
            autohatchlocation = CFrame.new(2742.82349, 2.90611053, -42.3878479, -0.999934196, 0.00442438433, 0.0106317755, 0.00139070337, 0.962886035, -0.269904792, -0.0114313513, -0.269872129, -0.962828755)
        end
        if Value == "Star24" then
            autohatchlocation = CFrame.new(2772.31714, 2.95404696, -45.8808708, 0.00146454573, -0.999933243, -0.0114669036, 0.999933243, 0.00133287907, 0.011482955, -0.0114669036, -0.011482955, 0.999868333)
        end
    end
})

section2:AddSlider({
	Name = "Auto Hatch Delay",
	Min = 1,
	Max = 5,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autohatchdelay = Value
	end    
})

section4:AddToggle({
	Name = "Auto Equip Best",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autobest = true
            while autobest == true do
        wait(2)
            game:GetService("ReplicatedStorage").Knit.Services.PetInventoryService.RF.EquipBest:InvokeServer()
	end
else
    autobest = false
    end
end
})

section3:AddButton({
	Name = "Teleport To Fusing Machine",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").GPI.World6.FusingMachine.CFrame
  	end    
})

section3:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section3:AddParagraph("Credits","!EwItsCaydon<3#0001/imandrewyo#3433") 