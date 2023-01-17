

--Hub
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Tower of Hell 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Main", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Main"})
local tab2 = Window:MakeTab({Name = "Local Player", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Local Player"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section3 = tab3:AddSection({Name = "Misc"})

--Variables
function godmode()
    game.Players.LocalPlayer.Character.KillScript:Destroy()
 end
 hookfunction(godmode, function()
    game.Players.LocalPlayer.Character.KillScript:Destroy()
 end)

 local Plr = game:GetService("Players").LocalPlayer
 local Mouse = Plr:GetMouse()
 
 function ctrltp()
 Mouse.Button1Down:connect(function()
 if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
 if not Mouse.Target then return end
 Plr.Character:MoveTo(Mouse.Hit.p)
    end)
end

 function givetools()
    for i, v in pairs (game:GetService("ReplicatedStorage").Gear:GetChildren()) do
        if v:IsA("Tool") then
        Tools = v:Clone()
        Tools.Parent = game:GetService("Players").LocalPlayer:FindFirstChild("Backpack")
        end
    end
end

--Script
section:AddButton({
	Name = "GodMode",
	Callback = function()
      		godmode()
end    
})

section:AddButton({
	Name = "Ctrl Teleport",
	Callback = function()
      		ctrltp()
  	end    
})

section:AddButton({
	Name = "Give All Tools",
	Callback = function()
      		givetools()
  	end    
})

section:AddButton({
	Name = "Teleport To Finish",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
        wait(.15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.tower.sections.finish.exit.ParticleBrick.CFrame
  	end    
})

section2:AddSlider({
	Name = "WalkSpeed",
	Min = 5,
	Max = 250,
	Default = 16,
	Color = Color3.fromRGB(31,145,3),
	Increment = 5,
	ValueName = "WalkSpeed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

section2:AddSlider({
	Name = "JumpPower",
	Min = 5,
	Max = 250,
	Default = 50,
	Color = Color3.fromRGB(31,145,3),
	Increment = 5,
	ValueName = "JumpPower",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
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