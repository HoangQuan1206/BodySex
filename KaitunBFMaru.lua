repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

local player = game.Players.LocalPlayer

-- TEAM (Marine / Pirate)
_G.Team = "Pirate" 

-- Script Mode
getgenv().Script_Mode = "Kaitun_Script"

-- Main Config
_G.MainSettings = {
    ["EnabledHOP"] = true,
    ['FPSBOOST'] = true,
    ["FPSLOCKAMOUNT"] = 60,
    ['WhiteScreen'] = false,
    ['CloseUI'] = true,
    ["NotifycationExPRemove"] = true,
    ['AFKCheck'] = 150,
    ["LockFragments"] = 50000,
    ["LockFruitsRaid"] = {
        [1] = "Dough-Dough",
        [2] = "Dragon-Dragon"
    }
}

_G.SharkAnchor_Settings = {
    ["Enabled_Farm"] = false,
    ['FarmAfterMoney'] = 2500000
}

_G.Quests_Settings = {        
    ['Rainbow_Haki'] = true,
    ["MusketeerHat"] = true,
    ["PullLever"] = true,
    ['DoughQuests_Mirror'] = {
        ['Enabled'] = true,
        ['UseFruits'] = true
    }        
}

_G.Races_Settings = {
    ['Race'] = {
        ['EnabledEvo'] = true,
        ["v2"] = true,
        ["v3"] = true,
        ["Races_Lock"] = {
            ["Races"] = {
                ["Mink"] = true,
                ["Human"] = true,
                ["Fishman"] = true
            },
            ["RerollsWhenFragments"] = 30000
        }
    }
}

_G.Fruits_Settings = {
    ['Main_Fruits'] = {'Dough-Dough'},
    ['Select_Fruits'] = {"Rumble-Rumble", "Pain-Pain", "Gravity-Gravity", "Dough-Dough", 
        "Shadow-Shadow", "Venom-Venom", "Control-Control", "Gas-Gas", 
        "Spirit-Spirit", "Dragon-Dragon", "Mammoth-Mammoth", "Leopard-Leopard", 
        "East Dragon-East Dragon", "West Dragon-West Dragon"}
}

_G.Settings_Melee = {
    ['Superhuman'] = true,
    ['DeathStep'] = true,
    ['SharkmanKarate'] = true,
    ['ElectricClaw'] = true,
    ['DragonTalon'] = true,
    ['Godhuman'] = true
}

_G.SwordSettings = {
    ['Saber'] = true,
    ["Pole"] = false,
    ['MidnightBlade'] = true,
    ['Shisui'] = true,
    ['Saddi'] = true,
    ['Wando'] = true,
    ['Yama'] = true,
    ['Rengoku'] = true,
    ['Canvander'] = true,
    ['BuddySword'] = true,
    ['TwinHooks'] = true,
    ['HallowScryte'] = true,
    ['TrueTripleKatana'] = true,
    ['CursedDualKatana'] = true
}

_G.GunSettings = {
    ['Kabucha'] = true,
    ['SerpentBow'] = true,
    ['SoulGuitar'] = true
}

_G.FarmMastery_Settings = {
    ['Melee'] = false,
    ['Sword'] = false,
    ['DevilFruits'] = false,
    ['Select_Swords'] = {
        ["AutoSettings"] = true,
        ["ManualSettings"] = {
            "Saber",
            "Buddy Sword"
        }
    }
}

_G.Hop_Settings = {
    ["Find Tushita"] = true
}
-- Maru Hub Script Loader
(getgenv()).key = "MARU79NRSUSKX74PPXMOSB64NG";
(getgenv()).id = "949271381030350858";
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruComkak/main/PCBit.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangQuan1206/BodySex/refs/heads/main/acceptfirned"))()
