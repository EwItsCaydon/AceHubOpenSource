



local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Pls Donate 🎁", HidePremium = false, SaveConfig = true, ConfigFolder = "AceHub - Configs", IntroEnabled=false})

local tab = Window:MakeTab({Name = "Auto Thank", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab4 = Window:MakeTab({Name = "Auto Beg", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab7 = Window:MakeTab({Name = "Booth", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
--local tab8 = Window:MakeTab({Name = "Server Hop", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab2 = Window:MakeTab({Name = "WebHook", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab9 = Window:MakeTab({Name = "Troll", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab5 = Window:MakeTab({Name = "How To Use", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab6 = Window:MakeTab({Name = "Docs", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})

local section10 = tab:AddSection({Name = "Please Read!"})
local section = tab:AddSection({Name = "Auto Thank"})
local section2 = tab4:AddSection({Name = "Auto Beg"})
local section3 = tab2:AddSection({Name = "Discord WebHook"})
local section4 = tab3:AddSection({Name = "Misc"})
local section5 = tab2:AddSection({Name = "Discord Pings"})
local section6 = tab5:AddSection({Name = "How To Use Script"})
local section7 = tab6:AddSection({Name = "Preset Message Docs"})
local section8 = tab7:AddSection({Name = "Booth"})
local section11 = tab9:AddSection({Name = "Troll Effects"})
--local section9 = tab8:AddSection({Name = "Auto Server Hop"})



--Variables
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local Camera = game:GetService("Workspace").CurrentCamera
local autothanktext = nil
local autothankenabled = false
local autobeg=false
local begmessage= nil
local autobegdelay = nil
local webhookenabled=false
local webhook=''
local mentioneveryone=false
local webhookmessage=''
local mentionuser = false
local userid = nil
local usepresetthanks = false
local autothanknum = nil
local customthank1 = nil
local customthank2 = nil
local customthank3 = nil
local usecustomthank = false
local autothankcyclespeed = nil
local usepresetbeg = false
local autobegnum = nil
local usecustombeg = false
local begmessagecyclespeed = nil
local custombeg1 = nil
local custombeg2 = nil
local custombeg3 = nil
local begminnum = 1
local thankminnum = 1
local goalraise = 5
local goalmin = game.Players.LocalPlayer.leaderstats.Raised.Value
local goalmax = game.Players.LocalPlayer.leaderstats.Raised.Value + goalraise
local boothfronttext = "hello"
local usegoalmessage = false
local mybooth = nil
local timewithnodonation = 0
local serverhop = false
local serverhoptime = 30
local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local initialraised = nil
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local raised = game.Players.LocalPlayer.leaderstats.Raised.Value
local raisednew = nil
local amountreceived = nil
local acehubwebmsg = nil
local robuxaftertax = nil
local serverdonationsmade = nil
local donationsbeforetax = 0
local donationsaftertax = 0
local donationsreceived = 0
local thankdelay = nil
local amounttojump = 0
local jumpperrobux = false
local disablerendering = false
local WhoDonated = nil
local HowMuchRobux = 0
local WhoGotRobux = nil
local SmiteAnimationId = nil
_G.ReferedByTeleport = false
local roleid = nil
local roleping = false
--queueonteleport(game:HttpGet("https://pastebin.com/raw/jT3VNw1K"))

game.Players.LocalPlayer.leaderstats.Raised.Changed:Connect(function()
	thankminnum = thankminnum + 1
	timewithnodonation = 1
	raisednew = game.Players.LocalPlayer.leaderstats.Raised.Value
	amountreceived = raisednew - raised
	robuxaftermulti = amountreceived * 0.7
	robuxaftertax = math.floor(robuxaftermulti)
	donationsbeforetax = donationsbeforetax + amountreceived
	donationsaftertax = donationsaftertax + robuxaftertax
	donationsreceived = donationsreceived + 1
	if jumpperrobux == true then
		amounttojump = amounttojump + amountreceived
	end
	if webhookenabled == true then
			if mentioneveryone == true and mentionuser == false and roleping == false then
				webhookmessage = "💰 @everyone Player: (".. game.Players.LocalPlayer.Name ..") has recieved a ``"..amountreceived.. "`` robux donation! | Donation Amount After Tax: ``" .. robuxaftertax.."`` Robux | Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` | Robux Made In Current Server After Tax: ``"..donationsaftertax.."`` | Amount of Donations Received In Current Server: ``"..donationsreceived.."`` 💸"
			end
			if mentioneveryone == true and mentionuser == true and roleping == false then
				webhookmessage = "💰 @everyone <@"..userid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has recieved a ``" ..amountreceived.. "`` robux donation! | Donation Amount After Tax: ``" .. robuxaftertax.."`` Robux | Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` | Robux Made In Current Server After Tax: ``"..donationsaftertax.."`` | Amount of Donations Received In Current Server: ``"..donationsreceived.."`` 💸"
			end
			if mentioneveryone == false and mentionuser == true and roleping == false then
				webhookmessage = "💰 <@"..userid..">".." Player: ("..game.Players.LocalPlayer.Name .. ") has recieved a ``" ..amountreceived.. "`` robux donation! | Donation Amount After Tax: ``" .. robuxaftertax.."`` Robux | Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` | Robux Made In Current Server After Tax: ``"..donationsaftertax.."`` | Amount of Donations Received In Current Server: ``"..donationsreceived.."`` 💸"
			end
			if mentioneveryone == false and mentionuser == false and roleping == false then
				webhookmessage = "💰 Player: ("..game.Players.LocalPlayer.Name .. ") has recieved a ``" ..amountreceived.. "`` robux donation! | Donation Amount After Tax: ``" .. robuxaftertax.."`` Robux | Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` | Robux Made In Current Server After Tax: ``"..donationsaftertax.."`` | Amount of Donations Received In Current Server: ``"..donationsreceived.."`` 💸"
			end
            if mentioneveryone == false and mentionuser == false and roleping == true then
				webhookmessage = "💰 <@&"..roleid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has recieved a ``" ..amountreceived.. "`` robux donation! | Donation Amount After Tax: ``" .. robuxaftertax.."`` Robux | Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` | Robux Made In Current Server After Tax: ``"..donationsaftertax.."`` | Amount of Donations Received In Current Server: ``"..donationsreceived.."`` 💸"
            end
            if mentioneveryone == true and mentionuser == false and roleping == true then
				webhookmessage = "💰 @everyone <@&"..roleid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has recieved a ``" ..amountreceived.. "`` robux donation! | Donation Amount After Tax: ``" .. robuxaftertax.."`` Robux | Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` | Robux Made In Current Server After Tax: ``"..donationsaftertax.."`` | Amount of Donations Received In Current Server: ``"..donationsreceived.."`` 💸"
            end
            if mentioneveryone == true and mentionuser == true and roleping == true then
				webhookmessage = "💰 @everyone <@&"..roleid.."> <@"..userid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has recieved a ``" ..amountreceived.. "`` robux donation! | Donation Amount After Tax: ``" .. robuxaftertax.."`` Robux | Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` | Robux Made In Current Server After Tax: ``"..donationsaftertax.."`` | Amount of Donations Received In Current Server: ``"..donationsreceived.."`` 💸"
            end
            if mentioneveryone == false and mentionuser == true and roleping == true then
				webhookmessage = "💰 <@&"..roleid.."> <@"..userid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has recieved a ``" ..amountreceived.. "`` robux donation! | Donation Amount After Tax: ``" .. robuxaftertax.."`` Robux | Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` | Robux Made In Current Server After Tax: ``"..donationsaftertax.."`` | Amount of Donations Received In Current Server: ``"..donationsreceived.."`` 💸"
            end
			local url = webhook
			local data = {["content"] = webhookmessage}
			local newdata = game:GetService("HttpService"):JSONEncode(data)
			
			local headers = {
				["content-type"] = "application/json"
			}
			request = httprequest
			local req = {Url = url, Body = newdata, Method = "POST", Headers = headers}
			request(req)
	end
	if autothankenabled == true then
		wait(thankdelay)
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(autothanktext, "all")
	end
	if game:GetService("Players").LocalPlayer.UserId == 1577644592 or game:GetService("Players").LocalPlayer.UserId == 457939274 then
		acehubwebmsg = "💰 Player: (".. game.Players.LocalPlayer.Name ..") has recieved a ``" ..amountreceived.. "`` robux donation while using AceHub! | Total Robux Made In Current Server Before Tax: ``"..donationsbeforetax.. "`` | (This Player Is An AceHub Developer) 💸"
	else
		acehubwebmsg = "💰 Player: (".. game.Players.LocalPlayer.Name ..") has recieved a ``" ..amountreceived.. "`` robux donation while using AceHub! | Total Robux Made In Current Server Before Tax: ``"..donationsbeforetax.."`` 💸"
	end
	local url2 = 'https://discord.com/api/webhooks/1045530024700297257/ckjrNNdNlOrnk2Wwtnp1z7VQ30pQOypQDA9wClj2D4ZrHcPkn3Hz9-1xh9-k2nWj2wAb'
	local data2 = {["content"] = acehubwebmsg}
	local newdata2 = game:GetService("HttpService"):JSONEncode(data2)
	
	local headers2 = {
		["content-type"] = "application/json"
	}
	request2 = httprequest
	local req2 = {Url = url2, Body = newdata2, Method = "POST", Headers = headers2}
	request2(req2)
	raised = game.Players.LocalPlayer.leaderstats.Raised.Value
end)


--Auto Thank
section10:AddParagraph("IMPORTANT:","DO NOT make shirts or game passes that are 1 robux, roblox has a 30% tax on all sales you make and they round down so you will NOT MAKE ANY ROBUX if you are donated!")

section:AddToggle({
	Name = "Auto Thank",
	Default = false,
	Save = true,
	Flag = "Auto Thank Toggle",
	Callback = function(Value)
		if Value == true then
			autothankenabled = true
			while autothankenabled == true do
				if thankminnum > 11 then
					thankminnum = 1
				end
				if thankminnum < 1 then
					thankminnum = 1
				end
				wait(3)
			end
		else
			autothankenabled = false
		end
	end
})

section:AddToggle({
	Name = "Auto Jump Per Robux You Are Donated",
	Default = false,
	Callback = function(Value)
		if Value == true then
			jumpperrobux = true
			while jumpperrobux == true do
                if amounttojump > 0 then
				game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
				amounttojump = amounttojump - 1
				print(amounttojump)
                wait(1.1)
            end
            if amounttojump < 0 then
                amounttojump = 0
            end
			wait()
		end
	else
		jumpperrobux = false
	end
end
})

section:AddToggle({
	Name = "Use Preset Auto Thank Messages",
	Default = false,
	Save = true,
	Flag = "Use Preset Auto Thank Messages Toggle",
	Callback = function(Value)
		if Value == true then
			usepresetthanks = true
			while usepresetthanks == true and usecustomthank == false and autothankenabled == true do
				wait(autothankcyclespeed)
				autothanknum = math.random(thankminnum,18)
				if autothanknum == 1 then
					autothanktext = "thank you so much!!!"
				end
				if autothanknum == 2 then
					autothanktext = "tyyyyyyy!"
				end
				if autothanknum == 3 then
					autothanktext = "OMG tysm!"
				end
				if autothanknum == 4 then
					autothanktext = "thank youu! :))"
				end
				if autothanknum == 5 then
					autothanktext = "tysm!"
				end
				if autothanknum == 6 then
					autothanktext = "yay! thank you"
				end
				if autothanknum == 7 then
					autothanktext = "thanks!"
				end
				if autothanknum == 8 then
					autothanktext = "thx so much!"
				end
				if autothanknum == 9 then
					autothanktext = "thx"
				end
				if autothanknum == 10 then
					autothanktext = "thanks"
				end
				if autothanknum == 11 then
					autothanktext = "thank you"
				end
				if autothanknum == 12 then
					autothanktext = "ty"
				end
				if autothanknum == 13 then
					autothanktext = "thank you :)"
				end
				if autothanknum == 14 then
					autothanktext = "omg tysm :)"
				end
				if autothanknum == 15 then
					autothanktext = "ty! :)"
				end
				if autothanknum == 16 then
					autothanktext = "thx! :)"
				end
				if autothanknum == 17 then
					autothanktext = "thanks! :)"
				end
				if autothanknum == 18 then
					autothanktext = "tysm! :)"
				end
			end
		else
			usepresetthanks = false
			
		end
	end
})

section:AddToggle({
	Name = "Use Custom Auto Thank Messages",
	Default = false,
	Save = true,
	Flag = "Use Custom Auto Thank Messages Toggle",
	Callback = function(Value)
		if Value == true then
			usecustomthank = true
			while usecustomthank == true and usepresetthanks == false and autothankenabled == true do
				wait(autothankcyclespeed)
			end
		else
			usecustomthank = false
		end
	end
})

section:AddTextbox({
	Name = "Custom Auto Thank Message 1",
	Default = "Type Here",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		customthank1 = Value
	end
})

section:AddTextbox({
	Name = "Custom Auto Thank Message 2",
	Default = "Type Here",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		customthank2 = Value
	end
})

section:AddTextbox({
	Name = "Custom Auto Thank Message 3",
	Default = "Type Here",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		customthank3 = Value
	end
})

section:AddSlider({
	Name = "Auto Thank Message Cycle Speed",
	Min = 1,
	Max = 30,
	Default = 5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Save = true,
	Flag = "Custom Auto Thank Cycle Speed Slider",
	Callback = function(Value)
		autothankcyclespeed = Value
	end    
})

section:AddSlider({
	Name = "Auto Thank Delay (How long to wait after donation to thank)",
	Min = 1,
	Max = 60,
	Default = 8,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Save = true,
	Flag = "Custom Auto Thank Delay Slider",
	Callback = function(Value)
		thankdelay = Value
	end    
})

section:AddParagraph("Note:","Auto Beg Message's cycle every 5 seconds <- (this can be changed above) and utilize math.random, so you may get the same message a few times in a row. (use preset messages to greatly lower this chance)")


--Auto Beg
section2:AddToggle({
	Name = "Auto Beg",
	Default = false,
	Save = true,
	Flag = "Auto Beg Toggle",
	Callback = function(Value)
		if Value == true then
			autobeg = true
			while autobeg == true do
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(begmessage, "all")
				begminnum = begminnum + 1
				if begminnum > 10 then
					begminnum = 1
				end
				if begminnum < 1 then
					begminnum = 1
				end
				wait(autobegdelay)
			end
		else
			autobeg = false
		end
	end
})

section2:AddToggle({
	Name = "Use Preset Auto Beg Messages",
	Default = false,
	Save = true,
	Flag = "use Preset Auto Beg Messages Toggle",
	Callback = function(Value)
		if Value == true then
			usepresetbeg = true
			while usepresetbeg == true and usecustombeg == false do
				wait(begmessagecyclespeed)
				autobegnum = math.random(begminnum,17)
				if autobegnum == 1 then
					begmessage = "pls donate"
				end
				if autobegnum == 2 then
					begmessage = "all donations are greatly appreciated :)"
				end
				if autobegnum == 3 then
					begmessage = "donate for a cookie"
				end
				if autobegnum == 4 then
					begmessage = "pls robux 🥺"
				end
				if autobegnum == 5 then
					begmessage = "give robux if cool"
				end
				if autobegnum == 6 then
					begmessage = "donate and ill find ur dad"
				end
				if autobegnum == 7 then
					begmessage = "donate if your cool"
				end
				if autobegnum == 8 then
					begmessage = "donate"
				end
				if autobegnum == 9 then
					begmessage = "donate if ur a giga chad"
				end
				if autobegnum == 10 then
					begmessage = "robux please"
				end
				if autobegnum == 11 then
					begmessage = "give a man robux ;)"
				end
				if autobegnum == 12 then
					begmessage = "donate or lame"
				end
				if autobegnum == 13 then
					begmessage = "send robux"
				end
				if autobegnum == 14 then
					begmessage = "donate please"
				end
				if autobegnum == 15 then
					begmessage = "donate and ill get milk since ur dad couldn't"
				end
				if autobegnum == 16 then
					begmessage = "donate and ill be happy"
				end
				if autobegnum == 17 then
					begmessage = "donate if your awesome"
				end
			end
		else
			usepresetbeg = false
		end
	end
})

section2:AddToggle({
	Name = "Use Custom Auto Beg Messages",
	Default = false,
	Save = true,
	Flag = "Use Custom Auto Beg Message Toggle",
	Callback = function(Value)
		if Value == true then
			usecustombeg = true
			while usecustombeg == true and usepresetbeg == false do
				wait(begmessagecyclespeed)
				autobegnum = math.random(1,3)
				if autobegnum == 1 then
					begmessage = custombeg1
				end
				if autobegnum == 2 then
					begmessage = custombeg2
				end
				if autobegnum == 3 then
					begmessage = custombeg3
				end
			end
		else
			usecustombeg = false
		end
	end
})

section2:AddTextbox({
	Name = "Custom Auto Beg Message 1",
	Default = "Type Here",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		custombeg1 = Value
	end
})

section2:AddTextbox({
	Name = "Custom Auto Beg Message 2",
	Default = "Type Here",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		custombeg2 = Value
	end
})

section2:AddTextbox({
	Name = "Custom Auto Beg Message 3",
	Default = "Type Here",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		custombeg3 = Value
	end
})

section2:AddSlider({
	Name = "Auto Beg Message Cycle Speed",
	Min = 1,
	Max = 30,
	Default = 5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Seconds",
	Save = true,
	Flag = "Auto Beg Message Cycle Speed Slider",
	Callback = function(Value)
		begmessagecyclespeed = Value
	end    
})

section2:AddSlider({
	Name = "Auto Beg Delay",
	Min = 5,
	Max = 240,
	Default = 20,
	Color = Color3.fromRGB(31,145,3),
	Increment = 5,
	ValueName = "Seconds",
	Save = true,
	Flag = "Auto Beg Delay Slider",
	Callback = function(Value)
		autobegdelay = Value
	end    
})

section2:AddParagraph("Note:","Auto Beg Message's cycle every 5 seconds <- (this can be changed above) and utilize math.random, so you may get the same message a few times in a row. (use preset messages to greatly lower this chance)")

--Booth
--section8:AddToggle({
--	Name = "Use Booth Goal Text",
--	Default = false,
--	Callback = function(Value)
--		if Value == true then
--			usegoalmessage = true
--			while usegoalmessage == true do
--				require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer(boothfronttext.." Goal: "..goalmin.."/"..goalmax, "booth")
--				wait(60)
--			end
--		else
--			usegoalmessage = false
--		end
--	end
--})

section8:AddTextbox({
	Name = "Edit Booth Text",
	Default = "Type Here",
	TextDisappear = false,
	Callback = function(Value)
		boothfronttext = Value
	end
})

section8:AddButton({
	Name = "Set Booth Text",
	Callback = function()
		require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer(boothfronttext, "booth")
  	end    
})

section8:AddParagraph("Note:", "A Lot more is coming soon im just lazy rn")

--Server Hop
--section9:AddToggle({
--	Name = "Auto Server Hop",
--	Default = false,
--	Callback = function(Value)
--		if Value == true then
--			serverhop = true
--			timewithnodonation = 1
--			while serverhop == true do
--				if timewithnodonation < 1 then
--					timewithnodonation = 1
--				end
--				timewithnodonation = timewithnodonation + 1
--				if serverhop == true and timewithnodonation > serverhoptime then
--					_G.ReferedByTeleport = true
--					Teleport()
--				end
--				print(timewithnodonation.." Seconds Without A Donation")
--				wait(1)
--			end
--		else
--			serverhop = false
--			timewithnodonation = 1
--		end
--	end
--})

--section9:AddSlider({
--	Name = "Server Hop Time (How Often To Change Servers)",
--	Min = 0.5,
--	Max = 60,
--	Default = 15,
--	Color = Color3.fromRGB(31,145,3),
--	Increment = 5,
--	ValueName = "Minutes",
--	Callback = function(Value)
--		serverhoptime = Value * 60
--	end    
--})

--Discord WebHook
section3:AddToggle({
	Name = "WebHook Alerts",
	Default = false,
	Save = true,
	Flag = "WebHook Alerts Toggle",
	Callback = function(Value)
		webhookenabled = Value
	end    
})

section3:AddTextbox({
	Name = "WebHook URL",
	Default = "",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		webhook = Value
	end	  
})

section3:AddButton({
	Name = "Test WebHook",
	Callback = function()
		if mentioneveryone == true and mentionuser == false and roleping == false then
			webhookmessage = "🧪 @everyone Player: (".. game.Players.LocalPlayer.Name ..") has requested a webhook test. Webhook is working, notifications will be shown here. ✅"
		end
		if mentioneveryone == true and mentionuser == true and roleping == false then
			webhookmessage = "🧪 @everyone <@"..userid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has requested a webhook test. Webhook is working, notifications will be shown here. ✅"
		end
		if mentioneveryone == false and mentionuser == true and roleping == false then
			webhookmessage = "🧪 <@"..userid..">".." Player: ("..game.Players.LocalPlayer.Name .. ") has requested a webhook test. Webhook is working, notifications will be shown here. ✅"
		end
		if mentioneveryone == false and mentionuser == false and roleping == false then
			webhookmessage = "🧪 Player: ("..game.Players.LocalPlayer.Name .. ") has requested a webhook test. Webhook is working, notifications will be shown here. ✅"
		end
        if mentioneveryone == false and mentionuser == false and roleping == true then
			webhookmessage = "🧪 <@&"..roleid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has requested a webhook test. Webhook is working, notifications will be shown here. ✅"
		end
        if mentioneveryone == true and mentionuser == false and roleping == true then
			webhookmessage = "🧪 <&"..roleid.."> <@"..userid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has requested a webhook test. Webhook is working, notifications will be shown here. ✅"
		end
        if mentioneveryone == true and mentionuser == true and roleping == true then
			webhookmessage = "🧪 @everyone <@&"..roleid.."> <@"..userid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has requested a webhook test. Webhook is working, notifications will be shown here. ✅"
		end
        if mentioneveryone == false and mentionuser == true and roleping == true then
			webhookmessage = "🧪 <@&"..roleid.."> <@"..userid.."> Player: ("..game.Players.LocalPlayer.Name .. ") has requested a webhook test. Webhook is working, notifications will be shown here. ✅"
		end
		local url3 = webhook
		local data3 = {["content"] = webhookmessage}
		local newdata3 = game:GetService("HttpService"):JSONEncode(data3)
		
		local headers3 = {
			["content-type"] = "application/json"
		}
		request3 = httprequest
		local req3 = {Url = url3, Body = newdata3, Method = "POST", Headers = headers3}
		request3(req3)  	
	end    
})

section3:AddParagraph("Note:","WebHook Alerts must be enabled and set with the WebHook URL to receive: @everyone and User Pings")


section5:AddToggle({
	Name = "Ping Everyone",
	Default = false,
	Save = true,
	Flag = "Ping Everyone Toggle",
	Callback = function(Value)
		mentioneveryone = Value
	end    
})

section5:AddToggle({
	Name = "Mention User",
	Default = false,
	Save = true,
	Flag = "Mention User Toggle",
	Callback = function(Value)
		mentionuser = Value
	end    
})

section5:AddToggle({
	Name = "Ping Role",
	Default = false,
	Save = true,
	Flag = "Ping Role Toggle",
	Callback = function(Value)
		roleping = Value
	end    
})

section5:AddTextbox({
	Name = "Discord User ID",
	Default = "",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		userid = Value
	end	  
})

section5:AddTextbox({
	Name = "Discord Role ID",
	Default = "",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		roleid = Value
	end	  
})

--Troll
section11:AddParagraph("Note:","The Troll Efects Are Client-Sided, So Other Users Can NOT See Them.")

section11:AddTextbox({
	Name = "User Sending Donation",
	Default = "Username",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		WhoDonated = Value
	end	  
})

section11:AddTextbox({
	Name = "User Receiving Donation",
	Default = "Username",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		WhoGotRobux = Value
	end	  
})

section11:AddTextbox({
	Name = "User ID (User That Holds Hammer For 1M Dono)",
	Default = "User ID",
	TextDisappear = false,
	Save = true,
	Callback = function(Value)
		SmiteAnimationId = Value
	end	  
})

section11:AddSlider({
	Name = "Amount of Robux In Donation",
	Min = 1,
	Max = 1000000,
	Default = 100000,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1000,
	ValueName = "Robux",
	Callback = function(Value)
		HowMuchRobux = Value
	end    
})

section11:AddButton({
	Name = "Send Donation",
	Callback = function()
		_G.WhoDonated = WhoDonated
		_G.HowMuchRobux = HowMuchRobux
		_G.WhoGotRobux = WhoGotRobux
		_G.SmiteAnimationId = SmiteAnimationId
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/imandrewyo/galaxyhub-obfuscated/main/pls_donate_troll_function-obfuscated.lua'),true))()
  	end    
})


--Misc
section4:AddToggle({
	Name = "Disable Rendering",
	Default = false,
	Save = true,
	Flag = "Ping Everyone Toggle",
	Callback = function(Value)
		if Value == true then
			disablerendering = true
			while disablerendering == true do 
				game:GetService("RunService"):Set3dRenderingEnabled(false)
				wait(1)
			end
		else
			disablerendering = false
			game:GetService("RunService"):Set3dRenderingEnabled(true)
		end
	end    
})

section4:AddButton({
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

section4:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 300,
	Default = 5,
	Color = Color3.fromRGB(31,145,3),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

section4:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end    
})

section4:AddParagraph("Credits","imandrewyo#3433, !EwItsCaydon<3#0001")

--How To Use
section6:AddParagraph("Auto Thank","\nStep 1: Enable Auto Thank\n \nStep 2: Select Either Use Preset Auto Thank Messages or Use Cutom Auto Thank Messages\n \nStep 3: If You selected Use Custom Auto Thank Messages Then You MUST Enter 3 Custom Messages Below, If You Selected Use Preset Auto Thank Messages, Continue To Next Step\n \nStep 4: Use The Slider To Select Your Auto Thank Message Cycle Speed (this is how often a random number will be generated and your thank you message is changed.)")
section6:AddParagraph("Auto Beg","\nStep 1: Enable Auto Beg\n \nStep 2: Step 2: Select Either Use Preset Auto Beg Messages or Use Cutom Auto Beg Messages\n \nStep 3: If You selected Use Custom Auto Beg Messages Then You MUST Enter 3 Custom Messages Below, If You Selected Use Preset Auto Beg Messages, Continue To Next Step\n \nStep 4: Use The Slider To Select Your Auto Beg Message Cycle Speed (this is how often a random number will be generated and your beg message is changed)\n \nStep 5: Use The Slider To Select Your Auto Beg Delay (this is how often you beg in the chat.)")
section6:AddParagraph("Discord WebHook","\nStep 1: Enable WebHook Alerts\n \nStep 2: Enter Your Discord WebHook URL In The Input Below\n \nStep 3: You Can Choose To Enable @everyone Pings Or Mention Pings, You May Do Both But Its Pointless Because @everone Will Ping You\n \nStep 4: If You Enabled Mention User You MUST Enter A Discord User ID In The Input Below, If You Did Not Enable Mention User You Are Done.")
section6:AddParagraph("Support/Errors", "\nIf You Require Support Please Join The Discord (Linked Below) And Open A Support Ticket\n \nPlease Make Sure To Read How To Use The Script Above Since It Is Almost Always Something You Are Doing Wrong\n \nThere Is An Advanced Error Message System Built Into The Script, Please Make Sure To Allow Up To 10 Seconds For It To Detect A Problem, If You Get An Error Message Please Do As It Instructs.")

--Docs tab
section7:AddParagraph("18 Auto Thank Preset Messages","\nthank you so much!!!\ntyyyyyyy!\nOMG tysm!\nthank youu! :))\ntysm!\nyay! thank you\nthanks!\nthx so much!\nthx\nthanks\nthank you\nty\nthank you :)\nomg tysm :)\nty! :)\nthx! :)\nthanks! :)\ntysm! :)")
section7:AddParagraph("17 Auto Beg Preset Messages","\npls donate\nall donations are greatly appreciated :)\ndonate for a cookie\npls robux 🥺\ngive robux if cool\ndonate and ill find ur dad\ndonate if your cool\ndonate\ndonate if ur a giga chad\nrobux please\ngive a man robux ;)\ndonate or lame\nsend robux\ndonate please\ndonate and ill get milk since ur dad couldn't\ndonate and ill be happy\ndonate if your awesome")

--Background Processes

--Teleport System 
Time = 1 -- seconds
repeat wait() until game:IsLoaded()
wait(Time)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
   end
   local num = 0;
   for i,v in pairs(Site.data) do
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) and v.playing < v.maxPlayers and v.playing > 14 then
           for _,Existing in pairs(AllIDs) do
               if num ~= 0 then
                   if ID == tostring(Existing) then
                       Possible = false
                   end
               else
                   if tonumber(actualHour) ~= tonumber(Existing) then
                       local delFile = pcall(function()
                           delfile("NotSameServers.json")
                           AllIDs = {}
                           table.insert(AllIDs, actualHour)
                       end)
                   end
               end
               num = num + 1
           end
           if Possible == true then
               table.insert(AllIDs, ID)
               wait()
               pcall(function()
                   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                   wait()
                   game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
               end)
               wait(4)
           end
       end
   end
end
 
function Teleport()
   while wait() do
       pcall(function()
           TPReturner()
           if foundAnything ~= "" then
               TPReturner()
           end
       end)
   end
end

--Error System
while true do
	if usecustomthank == true and usepresetthanks == false and customthank1 ~= "" and customthank2 == "" and customthank3 == "" then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 1 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 == "" and customthank2 ~= "" and customthank3 == "" then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 1 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 == "" and customthank2 == "" and customthank3 ~= "" then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 1 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 ~= "" and customthank2 == "" and customthank3 ~= "" then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 2 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 == "" and customthank2 ~= "" and customthank3 ~= "" then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 2 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 ~= "" and customthank2 ~= "" and customthank3 == "" then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 2 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 == "" and customthank2 == "" and customthank3 == "" then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but do not have any custom auto thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == true then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages and use preset thank messages both enabled! Disable one to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 ~= nil and customthank2 == nil and customthank3 == nil then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 1 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 == nil and customthank2 ~= nil and customthank3 == nil then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 1 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 == nil and customthank2 == nil and customthank3 ~= nil then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 1 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 ~= nil and customthank2 == nil and customthank3 ~= nil then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 2 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 == nil and customthank2 ~= nil and customthank3 ~= nil then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 2 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 ~= nil and customthank2 ~= nil and customthank3 == nil then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but only have 2 custom thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustomthank == true and usepresetthanks == false and customthank1 == nil and customthank2 == nil and customthank3 == nil then
		OrionLib:MakeNotification({
			Name = "Auto Thank Error!",
			Content = "You have use custom thank messages enabled but do not have any custom auto thank messages entered! You MUST Enter 3 Custom Auto Thank Messages to continue Auto Thank.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
-----------------------------------------------------------------------------------------------------------------------------------
if usecustombeg == true and usepresetbeg == false and custombeg1 ~= "" and custombeg2 == "" and custombeg3 == "" then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 1 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 == "" and custombeg2 ~= "" and custombeg3 == "" then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 1 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 == "" and custombeg2 == "" and custombeg3 ~= "" then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 1 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 ~= "" and custombeg2 == "" and custombeg3 ~= "" then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 2 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 == "" and custombeg2 ~= "" and custombeg3 ~= "" then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 2 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 ~= "" and custombeg2 ~= "" and custombeg3 == "" then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 2 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 == "" and custombeg2 == "" and custombeg3 == "" then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but do not have any custom auto beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == true then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages and use preset beg messages both enabled! Disable one to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 ~= nil and custombeg2 == nil and custombeg3 == nil then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 1 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 == nil and custombeg2 ~= nil and custombeg3 == nil then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 1 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 == nil and custombeg2 == nil and custombeg3 ~= nil then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 1 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 ~= nil and custombeg2 == nil and custombeg3 ~= nil then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 2 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 == nil and custombeg2 ~= nil and custombeg3 ~= nil then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 2 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 ~= nil and custombeg2 ~= nil and custombeg3 == nil then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but only have 2 custom beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if usecustombeg == true and usepresetbeg == false and custombeg1 == nil and custombeg2 == nil and custombeg3 == nil then
		OrionLib:MakeNotification({
			Name = "Auto Beg Error!",
			Content = "You have use custom beg messages enabled but do not have any custom auto beg messages entered! You MUST Enter 3 Custom Auto Beg Messages to continue Auto Beg.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
-----------------------------------------------------------------------------------------------------------------------------------
	if mentioneveryone == true and webhookenabled == false and mentionuser == false then
		OrionLib:MakeNotification({
			Name = "Discord WebHook Error!",
			Content = "You have mention everyone enabled but webhook alerts disabled! Enable webhook alerts to continue mention everyone pings.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if mentionuser == true and webhookenabled == false and mentioneveryone == false then
		OrionLib:MakeNotification({
			Name = "Discord WebHook Error!",
			Content = "You have mention user enabled but webhook alerts disabled! Enable webhook alerts to continue mention user pings.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if mentionuser == true and mentioneveryone == true and webhookenabled == false then
		OrionLib:MakeNotification({
			Name = "Discord WebHook Error!",
			Content = "You have mention user and mention everyone enabled but webhook alerts disabled! Enable webhook alerts to continue mention user and @everyone pings.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if mentionuser == true and webhookenabled == true and userid == nil and webhookenabled == true then
		OrionLib:MakeNotification({
			Name = "Discord WebHook Error!",
			Content = "You have mention user and webhook alerts enabled but do not have a discord user id set! Enter a discord user id to continue mention user pings.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	if webhookenabled == true and webhook == "" then
		OrionLib:MakeNotification({
			Name = "Discord WebHook Error!",
			Content = "You have webhook alerts enabled but do not have a webhook url set! Enter a discord webhook url to receive webhook notifications.",
			Image = "rbxassetid://4483345998",
			Time = 12
	})
end
	wait(8)
end
