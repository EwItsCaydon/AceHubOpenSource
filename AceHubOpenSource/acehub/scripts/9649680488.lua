

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Backrooms Race Clicker 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Auto Farm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto Farm"})
local tab2 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab2:AddSection({Name = "Misc"})


--Variables
local autofarm = false
local humanoid = game.Players.LocalPlayer.Character.Humanoid



--Script
section:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autofarm = true
            while autofarm == true do
                game.workspace.Gravity = 0
                while autofarm == false do
                    game.workspace.Gravity = 196.2  
                    break
                end
            for i,v in pairs(game:GetService("Workspace").Racetracks:GetDescendants()) do
                if v.Name == "End" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait()
            end
        end
    end
else
    autofarm = false  
    game.workspace.Gravity = 196.2  
    game.Players.LocalPlayer.Character.Head:Destroy()
    end
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