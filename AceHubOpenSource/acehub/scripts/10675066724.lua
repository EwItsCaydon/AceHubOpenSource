


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Slime Tower Tycoon 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub", IntroEnabled=true})


local tab = Window:MakeTab({Name = "Autofarm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab3 = Window:MakeTab({Name = "Options", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab4 = Window:MakeTab({Name = "Teleports", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab2 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})

local section = tab:AddSection({Name = "Autofarm"})
local section2 = tab:AddSection({Name = "Upgrades"})
local section3 = tab2:AddSection({Name = "Misc"})
local section5 = tab2:AddSection({Name = "Credits"})
local section4 = tab3:AddSection({Name = "Settings"})
local section6 = tab4:AddSection({Name = "Teleports"})


--Variables
local autopickup = false
local autodeposit = false
local autobuy = false
local automerge = false
local cspeed = false
local collectdelay = 1
local depositdelay = 1
local buyamount = 1
local autoobby = false
local autoobbytpdelay = 1
local autocollectpumpkins = false
local pumpkinselect = nil


section:AddToggle({
	Name = "Auto Collect",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autopickup = true

            while autopickup == true do
                local args = {
                    [1] = math.huge
                }

                game:GetService("ReplicatedStorage").GTycoonClient.Remotes.GrabDrops:FireServer(unpack(args))
                for i,v in pairs(game:GetService("Workspace").Drops:GetChildren()) do
                    v:Destroy()
                end
                wait(collectdelay)
            end
        else
            autopickup = false
        end
	end    
})

section:AddToggle({
	Name = "Auto Obby",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoobby = true
            while autoobby == true do
                wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint1.CFrame
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint2.CFrame
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint3.CFrame
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint4.CFrame
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint5.CFrame
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint6.CFrame
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint7.CFrame
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint8.CFrame * CFrame.new(0,10,0)
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint9.CFrame
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint10.CFrame * CFrame.new(25,15,10)
                wait(autoobbytpdelay)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyCheckpoints.ObbyCheckpoint11.CFrame
                wait(autoobbytpdelay)                
                game:GetService("ReplicatedStorage").GTycoonClient.Remotes.FinishObby:FireServer()
                wait(.01)
                game:GetService("ReplicatedStorage").GTycoonClient.Remotes.FinishObby:FireServer()
                wait(.01)
                game:GetService("ReplicatedStorage").GTycoonClient.Remotes.FinishObby:FireServer()
                wait(autoobbytpdelay)
            end
        else
            autoobby = false
            OrionLib:MakeNotification({
                Name = "Auto Obby Disabled",
                Content = "Auto Obby Has Been Disabled, Finishing This Run.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
	end
})


section:AddToggle({
	Name = "Auto Deposit",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autodeposit = true
            while autodeposit == true do
                game:GetService("ReplicatedStorage").GTycoonClient.Remotes.DepositDrops:FireServer()
                wait(depositdelay)
            end
        else
            autodeposit = false
        end
	end
})

section:AddToggle({
	Name = "Auto Collect Purple Pumpkins",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autocollectpumpkins = true
            while autocollectpumpkins == true do
                pumpkinselect = game:GetService("Workspace"):FindFirstChild("Pumpkin_Scavenger"):FindFirstChild("JackO'Lantern")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pumpkinselect.CFrame * CFrame.new(0,5,0)
                fireproximityprompt(pumpkinselect.ProximityPrompt)
                wait(1.5)
            end
        else
            autocollectpumpkins = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Buy Slimes",
	Default = false,
	Callback = function(Value)
        if Value == true then
            autobuy = true
            while autobuy == true do
                local args = {
                    [1] = buyamount
                }
                game:GetService("ReplicatedStorage").GTycoonClient.Remotes.BuyDropper:FireServer(unpack(args))
                wait(1)
            end
        else
            autobuy = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Merge",
	Default = false,
	Callback = function(Value)
        if Value == true then
            automerge = true
            while automerge == true do
                game:GetService("ReplicatedStorage").GTycoonClient.Remotes.MergeDroppers:FireServer()
                wait(1)
            end
        else
            automerge = false
        end
    end
})

section2:AddToggle({
	Name = "Auto Cauldron Rate",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cspeed = true
            while cspeed == true do
                local args = {
                    [1] = 1
                }
                game:GetService("ReplicatedStorage").GTycoonClient.Remotes.BuySpeed:FireServer(unpack(args))
                wait(1)
            end
        else
            cspeed = false
        end
    end
})

section3:AddButton({
	Name = "AntiAfk",
	Callback = function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
		OrionLib:MakeNotification({
			Name = "AntiAfk",
			Content = "AntiAfk Enabled!",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
  	end    
})

section5:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})
section5:AddParagraph("Credits","!EwItsCaydon<3#0001 / imandrewyo#3433")



section4:AddSlider({
	Name = "Pickup Delay",
	Min = 0.5,
	Max = 20,
	Default = 0.5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.5,
	ValueName = "Seconds",
	Callback = function(Value)
		collectdelay=Value
	end    
})


section4:AddSlider({
	Name = "Deposit Delay",
	Min = 0.5,
	Max = 20,
	Default = 0.5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.5,
	ValueName = "Seconds",
	Callback = function(Value)
		depositdelay=Value
	end    
})


section4:AddSlider({
	Name = "Buy Slime Amount",
	Min = 1,
	Max = 50,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		buyamount=Value
	end    
})

section4:AddSlider({
	Name = "Auto Obby Teleport Delay",
	Min = 1,
	Max = 5,
	Default = 1,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
		autoobbytpdelay = Value
	end    
})

tab4:AddButton({
	Name = "Top Of Obby",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObbyButton.Button.Glow.CFrame * CFrame.new(0,5,0)
  	end    
})

tab4:AddButton({
	Name = "Hall Of Fame",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WorldDecor.Leader.Part.CFrame * CFrame.new(0,10,50)
	end    
})

tab4:AddButton({
	Name = "Halloween Event World",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").HalloweenPortal.Collider.CFrame  	
	end    
})

tab4:AddButton({
	Name = "Dungeon Realms World",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Portal.CFrame  	
	end    
})