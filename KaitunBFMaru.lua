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
    ['Select_Fruits'] = {"Flame-Flame", "Ice-Ice", "Quake-Quake", "Light-Light", "Dark-Dark", "Spider-Spider", "Rumble-Rumble", "Magma-Magma", "Buddha-Buddha"}
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

-- Webhook Settings
local WebhookUrl = "https://discord.com/api/webhooks/1411194628006219776/16nlkh3LpQruj5D25URDUIsABPZnVTNa44YoycfwM-wIMNParpTuf7lHzb2r4wmhX8JH"

-- Hàm gửi webhook
function SendWebhook()
    local embed = {
        ["username"] = "Maru Hub | Player Tracker",
        ["avatar_url"] = "https://i.imgur.com/uOLeB0z.png",
        ["embeds"] = {{
            ["title"] = "📊 Blox Fruits Player Info",
            ["description"] = "Config Script này được làm bởi **Phan Hoàng Quân** ✨",
            ["color"] = 16753920, -- màu cam nâu da người
            ["fields"] = {
                {["name"] = "👤 Player", ["value"] = player.Name .. " (DisplayName: " .. player.DisplayName .. ")", ["inline"] = false},
                {["name"] = "🆔 UserId", ["value"] = tostring(player.UserId), ["inline"] = true},
                {["name"] = "🏴 Team", ["value"] = _G.Team, ["inline"] = true},
                {["name"] = "🍇 Fruit", ["value"] = (player.Backpack:FindFirstChildOfClass("Tool") and player.Backpack:FindFirstChildOfClass("Tool").Name) or "Không có", ["inline"] = true},
                {["name"] = "⚔️ Sword", ["value"] = (player.Character:FindFirstChildOfClass("Tool") and player.Character:FindFirstChildOfClass("Tool").Name) or "Không cầm", ["inline"] = true},
                {["name"] = "🥊 Melee", ["value"] = "Godhuman (ví dụ, cần check API skill)", ["inline"] = true},
                {["name"] = "💎 Beli", ["value"] = tostring(player.Data and player.Data.Beli.Value or "N/A"), ["inline"] = true},
                {["name"] = "🔮 Fragments", ["value"] = tostring(player.Data and player.Data.Fragments.Value or "N/A"), ["inline"] = true},
                {["name"] = "🌊 Race", ["value"] = "Unknown (có thể add check script race)", ["inline"] = true},
                {["name"] = "📊 Level", ["value"] = tostring(player.Data and player.Data.Level.Value or "N/A"), ["inline"] = true},
                {["name"] = "📍 Location", ["value"] = tostring(player:FindFirstChild("Position") or "Không xác định"), ["inline"] = true},
                {["name"] = "⏰ Time In-Game", ["value"] = os.date("%X"), ["inline"] = false}
            },
            ["footer"] = {
                ["text"] = "Maru Hub Webhook System",
                ["icon_url"] = "https://i.imgur.com/jNNT4LE.png"
            }
        }}
    }

    syn.request({
        Url = WebhookUrl,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(embed)
    })
end

-- Spam webhook mỗi 60 giây
task.spawn(function()
    while task.wait(60) do
        pcall(SendWebhook)
    end
end)

-- Maru Hub Script Loader
getgenv().Key = "MARU-MD69-7DZER-ALWX-0ZPRY-K4ZU"
getgenv().id = "949271381030350858"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
