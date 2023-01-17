local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local Window = OrionLib:MakeWindow({Name = "🎄 AceHub - Universal Scripts / Key System 🎁", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled=false})

if isfile("acehub.txt") then
	OrionLib:MakeNotification({
		Name = "Key Saved!",
		Content = "We found a saved key, you don't need to add anything into your key input!",
		Image = "rbxassetid://4483345998",
		Time = 5
	})
	_G.keyss=readfile("acehub.txt")
else
	local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
	Module.Join("robloxcheats")
end

function checkauth()
	local Response = httprequest({
		Url = "http://acehub.pro/api/authenticate",
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = game:GetService("HttpService"):JSONEncode({
				key=tostring(_G.keyss),
				userid=tostring(game.Players.LocalPlayer.UserId),
				gameid=tostring(game.PlaceId)
		})
	})
	if Response.Body == "unsupported executer" then
		OrionLib:MakeNotification({
			Name = "Unsupported Executor!",
			Content = "At the moment, our script only support KRNL and SYNX.",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
		return
	end
	if Response.Body == "key not found" then
		OrionLib:MakeNotification({
			Name = "Invalid Key!",
			Content = "We could't find a key that matched that!",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
		return
	end
	if Response.Body == "whitelist issue contact admin" then
		game.Players.LocalPlayer:Kick("Whitelist Error! Please contact an Administrator.")
		return
	end
	loadstring(Response.Body)()
end

local Tab = Window:MakeTab({Name = "Key",Icon = "rbxassetid://4483345998",PremiumOnly = false})
local Section = Tab:AddSection({Name = "Authentication"})
local Tab2 = Window:MakeTab({Name = "Games",Icon = "rbxassetid://4483345998",PremiumOnly = false})
local unitab = Window:MakeTab({Name = "Universal", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local unisection3 = unitab:AddSection({Name = "Notice"})
local unisection1 = unitab:AddSection({Name = "Local Player"})
local unisection2 = unitab:AddSection({Name = "Game"})
local unisection4 = unitab:AddSection({Name = "Other Scripts"})
local tab3 = Window:MakeTab({Name = "Credits", PremiumOnly = false, Icon = "rbxassetid://4483345998"})

Section:AddTextbox({
	Name = "Key",
	Default = _G.keyss,
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		_G.keyss=tostring(Value)
		writefile("acehub.txt", tostring(Value))
	end	  
})

Section:AddButton({
	Name = "Submit!",
	Callback = function()
      	checkauth()
  	end
})

Section:AddParagraph("Get Key","Hello!, if you would like to get a key, you must complete 3 short advertisement links that help us continue to develop AceHub further, to get your key, please join our discord server and complete the instructions!")
Section:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})
Tab2:AddParagraph("Supported Games","Arsenal\nMow The Lawn (No Longer Updating But Still Works)\nTapping Legends X\nPls Donate\nBuild A Boat For Treasure\nSlime Tower Tycoon \nRat Washing Tycoon\nTapping Simulator\nSpeed Run Simulator\nAnime Race Clicker\nTower Of Hell\nClicker Party Simulator (Temporarily Disabled)\nCollect All Pets\nStone Miner Simulator 2\nWord Bomb\nTrick Shot Simulator\nRebirth Legends X\nAnime Evolution Simulator\nRace Clicker\nRoblox But Every Seconds You Get +1 Jump Power\nMerge Simulator\nBackrooms Race Clicker\nSwim Race Clicker")

tab3:AddParagraph("Credits","!EwItsCaydon<3#0001, imandrewyo#3433") 


--Universal Variables
local noclip = false
local cameraunlock = false
local VirtualUser=game:service'VirtualUser'
local antiafk = false
local infjump = false
local Player = game:GetService("Players").LocalPlayer
local tpservice= game:GetService("TeleportService")


--Universal Scripts
unisection3:AddParagraph("Universal Scripts Notice!","These scripts are designed to work on most games therefore, anti-cheats are not bypased and any game could kick or ban you with a custom anti-cheat, use these scripts at your own risk!")

unisection1:AddSlider({
	Name = "WalkSpeed [Default 16]",
	Min = 1,
	Max = 1000,
	Default = 16,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

unisection1:AddSlider({
	Name = "JumpPower [Default 50]",
	Min = 1,
	Max = 1000,
	Default = 50,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Power",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

unisection1:AddToggle({
	Name = "Inf Jump",
	Default = false,
	Callback = function(Value)
        if Value == true then
            infjump = true
				game:GetService("UserInputService").JumpRequest:Connect(function()
					if infjump then
						Player.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
				end
			end)
        else
            infjump = false
        end
    end
})

unisection1:AddToggle({
	Name = "Unlock Camera",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cameraunlock = true
            while cameraunlock == true do
				game.Players.LocalPlayer.CameraMaxZoomDistance = math.huge
				wait()
            end
        else
            cameraunlock = false
			game.Players.LocalPlayer.CameraMaxZoomDistance = 128
        end
    end
})

unisection1:AddButton({
	Name = "Reset Character",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end
})

unisection2:AddSlider({
	Name = "Gravity [Default 196.2]",
	Min = 0,
	Max = 1000,
	Default = 196.2,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Power",
	Callback = function(Value)
		game.workspace.Gravity = Value  
	end    
})

unisection2:AddToggle({
	Name = "Anti-AFK",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cameraunlock = true
            while cameraunlock == true do
				game:service'Players'.LocalPlayer.Idled:connect(function()
					VirtualUser:CaptureController()
					VirtualUser:ClickButton2(Vector2.new())
				end)
				wait(120)
            end
        else
            cameraunlock = false
			game.Players.LocalPlayer.CameraMaxZoomDistance = 128
        end
    end
})

unisection2:AddButton({
	Name = "Rejoin Game",
	Callback = function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService'Players'.LocalPlayer)
  	end
})

unisection2:AddButton({
	Name = "Server Hop",
	Callback = function()
		tpservice:Teleport(game.PlaceId, Player)
	end
})

unisection4:AddButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end
})

unisection4:AddButton({
	Name = "Simple Spy",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
  	end
})

unisection4:AddButton({
	Name = "Dex Explorer",
	Callback = function()
		loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
  	end
})