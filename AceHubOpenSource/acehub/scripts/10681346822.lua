


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Roblox every second +1 Jump Power 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Main", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Main"})
local tab2 = Window:MakeTab({Name = "Teleports", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Teleports"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab3:AddSection({Name = "Misc"})


--Variables
local autowin = false
local autowindelay = nil



--Script
section:AddToggle({
	Name = "Auto Farm Wins",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autowin = true
            while autowin == true do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(33.0871353, 2254.72314, 108.211151, -0.0714402944, 0.99733907, 0.0145290075, 0.00452222163, -0.0142422142, 0.999888361, 0.997434616, 0.0714980215, -0.00349272019)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-50.3422318, 2623.09961, 26.4913368, 2.24113464e-05, -0.25886941, -0.965912342, -1, -2.24113464e-05, -1.719594e-05, -1.719594e-05, 0.965912342, -0.25886941)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6010.625, 2255.09985, 106.5, 0, 1, -0, -1, 0, 0, 0, 0, 1)
                wait(autowindelay)
            end
        else
            autowin = false
        end
    end
})

section:AddSlider({
	Name = "Auto Farm Wins Delay",
	Min = 1,
	Max = 10,
	Default = 2,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autowindelay = Value
	end    
})

section:AddButton({
	Name = "Give All Tools",
	Callback = function()
      		for i,v in pairs(game:GetService("ReplicatedStorage").ToolEvents:GetChildren()) do
                v:FireServer()
        end
  	end    
})

section:AddButton({
	Name = "Remove Level Barriers",
	Callback = function()
        game:GetService("Workspace").Firstlevel:Destroy()
        game:GetService("Workspace").Secondlevel:Destroy()
        game:GetService("Workspace").Thirdlevel:Destroy()
        game:GetService("Workspace").Fourthlevel:Destroy()
  	end    
})

section2:AddButton({
	Name = "Spawn",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(23.5, 61.0075188, -141.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
  	end    
})

section2:AddButton({
	Name = "Moon",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-120.64727, 1180.69165, -258.155731, 0.402058154, -6.83916355e-08, 0.915614128, -4.54099958e-09, 1, 7.66888348e-08, -0.915614128, -3.49911744e-08, 0.402058154)
  	end    
})

section2:AddButton({
	Name = "Top Of Original Tower",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.63325667, 2257.90698, 107.389511, -0.121008411, 2.65506728e-08, -0.992651463, 9.64534266e-08, 1, 1.49891459e-08, 0.992651463, -9.39308222e-08, -0.121008411)
  	end    
})

section2:AddButton({
	Name = "Top Of Halloween Tower",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-46.8582802, 2625.00684, 13.2312183, -0.982125878, 4.17287893e-08, 0.188225418, 3.15339648e-08, 1, -5.71573509e-08, -0.188225418, -5.02002173e-08, -0.982125878)
  	end    
})

section2:AddButton({
	Name = "Top Of Dark Tower",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5980.54785, 2257.75684, 105.649086, 0.941753566, 6.09773068e-08, -0.336303771, -6.29411829e-08, 1, 5.0615605e-09, 0.336303771, 1.6400616e-08, 0.941753566)
  	end    
})

section3:AddButton({
	Name = "Infinity Yield",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
	end
})

section3:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section3:AddParagraph("Credits","!EwItsCaydon<3#0001") 