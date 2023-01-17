

--Hub
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Stone Miner Simulator 2 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})


local tab = Window:MakeTab({Name = "Main", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section2 = tab:AddSection({Name = "Main"})
local tab2 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section4 = tab2:AddSection({Name = "Misc"})
local section3 = tab2:AddSection({Name = "Discord/Credits"})

--Variables
local autosell = false
local autospike = false
local autoupspike = false
local autoupcapacity = false
local autoselltp = nil
local selldelay = nil


--Script
section2:AddToggle({
	Name = "Auto Sell",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autosell = true
            while autosell == true do
                autoselltp = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(114.358414, 192.792007, 173.320297, -0.983725667, 0, -0.179677501, 0, 1, 0, 0.179677501, 0, -0.983725667)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = autoselltp
                wait(selldelay)
            end
    else
        autosell = false
	end
end    
})

section2:AddSlider({
	Name = "Auto Sell Delay",
	Min = 10,
	Max = 120,
	Default = 20,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "seconds",
	Callback = function(Value)
		selldelay = Value
	end    
})

section2:AddToggle({
	Name = "Auto Buy Spikes",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autospike = true
            while autospike == true do
                wait(1)
                local args = {
                    [1] = "up_power_button",
                    [2] = {
                    ["1"] = 1
                    }
                }
                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
            end
    else
        autospike = false
	end
end    
})

section2:AddToggle({
	Name = "Auto Upgarde Spike Size",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupspike = true
            while autoupspike == true do
                wait(1)
                local args = {
                    [1] = "up_cd_button",
                    [2] = {
                    ["1"] = 1
                    }
                }
                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
            end
    else
        autoupspike = false
	end
end    
})

section2:AddToggle({
	Name = "Auto Upgarde Capacity",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoupcapacity = true
            while autoupcapacity == true do
                wait(1)
                local args = {
                    [1] = "up_capacity_button",
                    [2] = {
                    ["1"] = 1
                    }
                }
                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

            end
    else
        autoupcapacity = false
	end
end    
})

section4:AddButton({
	Name = "Claim All Codes",
	Callback = function()
        for x = 1, 7 do
            local A_1 = "get_seven_day_reward"
            local A_2 = {["1"] = x}
            local Event = game:GetService("ReplicatedStorage").RemoteFunction
            Event:InvokeServer(A_1, A_2) 
            wait()
        end
        
        for _, v in pairs(game:GetService("Workspace").Code:GetChildren()) do
            local A_1 = "redeem_code"
            local A_2 = {
                ["1"] = v.SurfaceGui.TextLabel.Text
            }
            local Event = game:GetService("ReplicatedStorage").RemoteFunction
            Event:InvokeServer(A_1, A_2)
        end
        
        for _, v in pairs(game:GetService("Workspace").Code2:GetChildren()) do
            local A_1 = "redeem_code" 
            local A_2 = { 
                ["1"] = v.SurfaceGui.TextLabel.Text
            }
            local Event = game:GetService("ReplicatedStorage").RemoteFunction
            Event:InvokeServer(A_1, A_2)
        end
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