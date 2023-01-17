local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
if _G.keyss == nil then
   game.Players.LocalPlayer:Kick("nice try")
end

function checkauth()
    local Response = httprequest({
        Url = "http://acehub.pro/api/checkauth",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            key=_G.keyss,
            userid=tostring(game.Players.LocalPlayer.UserId),
            gameid=tostring(game.PlaceId)
        })
    })
    if Response.Body == nil then
        game.Players.LocalPlayer:Kick("Cant reach API or Key Error")
    else if Response.Body == "authenticated" then
        wait()
    else
        game.Players.LocalPlayer:Kick("Expired or invalid key!")
        end
    end
end

checkauth()



local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🎄 Ace Hub - Word Bomb 🎁", HidePremium = false, SaveConfig = false, IntroText="AceHub"})
local tab = Window:MakeTab({Name = "Typing", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local tab3 = Window:MakeTab({Name = "Misc", PremiumOnly = false, Icon = "rbxassetid://4483345998"})
local section = tab:AddSection({Name = "Auto"})
local section2 = tab:AddSection({Name = "Delays"})
local section3 = tab3:AddSection({Name = "Misc"})

--Keys
local keys = {
	["A"] = 0x41,
	["B"] = 0x42,
	["C"] = 0x43,
	["D"] = 0x44,
	["E"] = 0x45,
	["F"] = 0x46,
	["G"] = 0x47,
	["H"] = 0x48,
	["I"] = 0x49,
	["J"] = 0x4A,
	["K"] = 0x4B,
	["L"] = 0x4C,
	["M"] = 0x4D,
	["N"] = 0x4E,
	["O"] = 0x4F,
	["P"] = 0x50,
	["Q"] = 0x51,
	["R"] = 0x52,
	["S"] = 0x53,
	["T"] = 0x54,
	["U"] = 0x55,
	["V"] = 0x56,
	["W"] = 0x57,
	["X"] = 0x58,
	["Y"] = 0x59,
	["Z"] = 0x5A,
	["-"] = 0xBD,
	["'"] = 0xDE
}

--Vars
local usedWords = {}
local autoplay = false
local WordList =  loadstring(game:HttpGet("https://gist.githubusercontent.com/raw/6f3d37a9f5068a0fc2203ac77077ce06/", true))()
local startdelay = 0.1

--Functions
function FindLetters()
    for _,v in pairs(getgc()) do
        if type(v) == "function" and not is_synapse_function(v) and islclosure(v) and debug.getinfo(v).name == "updateInfoFrame" then
            for __,vv in pairs(debug.getupvalues(v)) do
                if type(vv) == "table" and vv.Prompt ~= nil then
                    Word = vv.Prompt
                end
            end
        end
    end
    return Word
end

function MyTurn()
    for _,v in pairs(getgc()) do
        if type(v) == "function" and not is_synapse_function(v) and islclosure(v) and debug.getinfo(v).name == "updateInfoFrame" then
            for __,vv in pairs(debug.getupvalues(v)) do
                if type(vv) == "table" and vv.PlayerID ~= nil then
                    Id = vv.PlayerID
                end
            end
        end
    end
    return Id
end

local function Used(Word)
    for i,v in pairs(usedWords) do
        if v == Word then return true end
    end
    return false
end

local function FindWord(l)
    local word
    for i,v in pairs(WordList) do
        if string.find(v, string.lower(l)) and not Used(string.upper(v)) and v ~= nil then
            word = string.upper(v)
        end
    end
    return word
end

function TableLength(Table)
  local A=0
  for i,v in pairs(Table) do A=A+1 end
  return A
end

function TypeAnswer()
    wait(tonumber(startdelay))
    local A = false
    if A == false then
        A = true
        local Word = FindWord(FindLetters())
        if Word and Word ~= "nil" then
           for v in string.gmatch(Word,".") do
             keypress(keys[v])
             wait(tonumber(typedelay))
         end
         table.insert(usedWords,Word)
         wait(tonumber(startdelay))
         keypress(0x0D)
         A = false
      end
   end         
end

--Script
section:AddToggle({
	Name = "Auto Grind",
	Default = false,
	Callback = function(Value)
		if Value == true then
            autoplay = true

            while autoplay == true do
                wait(1)
                if MyTurn() == game:GetService("Players").LocalPlayer.UserId then
                    TypeAnswer()
                end
            end
        else
            autoplay = false
        end
	end    
})

section:AddDropdown({
	Name = "Word List",
	Default = "Realistic",
	Options = {"Realistic", "Trolling"},
	Callback = function(Value)
		if Value == "Trolling" then
            WordList = loadstring(game:HttpGet("https://gist.githubusercontent.com/raw/71101a9a7e1513e9b603339f6530b615/", true))()
        end
        if Value == "Realistic" then
            WordList =  loadstring(game:HttpGet("https://gist.githubusercontent.com/raw/6f3d37a9f5068a0fc2203ac77077ce06/", true))()
        end
	end    
})
--Delays
section2:AddSlider({
	Name = "Start Delay",
	Min = 0.01,
	Max = 0.4,
	Default = 0.01,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.01,
	ValueName = "seconds",
	Callback = function(Value)
		startdelay = tonumber(Value)
	end    
})

section2:AddSlider({
	Name = "Typing Delay",
	Min = 0.01,
	Max = 0.4,
	Default = 0.01,
	Color = Color3.fromRGB(31,145,3),
	Increment = 0.01,
	ValueName = "seconds",
	Callback = function(Value)
		typedelay = tonumber(Value)
	end    
})

--Misc
section3:AddButton({
	Name = "Join Discord",
	Callback = function()
        local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        Module.Join("robloxcheats")
  	end
})

section3:AddParagraph("Credits","imandrewyo#3433")