




local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Mow The Lawn 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub", IntroEnabled=false})


--Autofarm
local farmtab = Window:MakeTab({Name = "Autofarm", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local eggtab = Window:MakeTab({Name = "Pets", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab4 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})


local section2 = farmtab:AddSection({Name = "Options"})
local section = farmtab:AddSection({Name = "Autofarm"})
local section4=eggtab:AddSection({Name = "Options"})
local section3=eggtab:AddSection({Name = "Hatch"})
local section6=tab4:AddSection({Name = "Misc"})

local automow=false
local autorefill=false
local zonenumber="1"
local worldnumber="1"
local eggtype=""
local eggdelay=1
local autohatch=false

section2:AddTextbox({
	Name = "Zone Number",
	Default = "1",
	TextDisappear = false,
	Callback = function(Value)
		zonenumber=Value
	end
})

section2:AddTextbox({
	Name = "World Number",
	Default = "1",
	TextDisappear = false,
	Callback = function(Value)
		worldnumber=Value
	end
})


section:AddToggle({
	Name = "Auto Mow",
	Default = false,
	Callback = function(Value)
		if Value == true then
        automow = true
            while automow == true do
                game:GetService("ReplicatedStorage").Remotes.Game.ClientMowGrass:FireServer(zonenumber)
                wait(0.01)
            end
        else
        automow = false
        end
	end    
})


section:AddToggle({
	Name = "Auto Refill Gas",
	Default = false,
	Callback = function(Value)
		if Value == true then
        autorefill = true
            while autorefill == true do
                game:GetService("ReplicatedStorage").Remotes.Game.ClientToggleUseGasStation:FireServer(workspace.Map.Zones[worldnumber][zonenumber].GasStation.GasPumps,true)
                wait(2)
            end
        else
        autorefill = false
        end
	end    
})


section4:AddTextbox({
	Name = "Egg Name",
	Default = "Ant Egg",
	TextDisappear = false,
	Callback = function(Value)
		eggtype=Value
	end
})

section4:AddSlider({
	Name = "Hatch Delay",
	Min = 0.5,
	Max = 30,
	Default = 0.5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
        eggdelay = Value
	end    
})

section3:AddToggle({
	Name = "Auto Hatch Egg",
	Default = false,
	Callback = function(Value)
		if Value == true then
        autohatch = true
            while autohatch == true do
                game:GetService("ReplicatedStorage").Remotes.Shop.ClientBuyEgg:InvokeServer(eggtype)
                wait(eggdelay)
            end
        else
        autohatch = false
        end
	end    
})


section6:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section6:AddParagraph("Credits","imandrewyo#3433")