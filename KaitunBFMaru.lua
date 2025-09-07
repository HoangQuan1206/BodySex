repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

-- =========================
-- CONFIG MARU HUB
-- =========================
_G.Team = "Pirate" -- Marine / Pirate
getgenv().Script_Mode = "Kaitun_Script"
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
        [2] = "Dragon-Dragon",        
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

-- =========================
-- KEY + SCRIPT LOADER
-- =========================
getgenv().Key = "MARU-MD69-7DZER-ALWX-0ZPRY-K4ZU"
getgenv().id = "949271381030350858"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()

-- =========================
-- WEBHOOK MARU HUB
-- =========================
local HttpService = game:GetService("HttpService")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1411194628006219776/16nlkh3LpQruj5D25URDUIsABPZnVTNa44YoycfwM-wIMNParpTuf7lHzb2r4wmhX8JH"

local function sendRawRequest(url, body)
    local headers = { ["Content-Type"] = "application/json" }
    if syn and syn.request then
        return syn.request({ Url = url, Method = "POST", Headers = headers, Body = body })
    elseif http and http.request then
        return http.request({ Url = url, Method = "POST", Headers = headers, Body = body })
    elseif http_request then
        return http_request({ Url = url, Method = "POST", Headers = headers, Body = body })
    elseif request then
        return request({ Url = url, Method = "POST", Headers = headers, Body = body })
    else
        return HttpService:PostAsync(url, body, Enum.HttpContentType.ApplicationJson)
    end
end

local function sendWebhook(title, description, color)
    local embed = {
        title = title,
        description = description,
        color = color or 13882329, -- màu nâu da người
        footer = { text = "Webhook từ Maru Hub" },
        timestamp = DateTime.now():ToIsoDate()
    }
    local payload = {
        username = "Maru Hub Webhook",
        embeds = { embed }
    }
    local ok, err = pcall(function()
        sendRawRequest(WEBHOOK_URL, HttpService:JSONEncode(payload))
    end)
    if not ok then warn("[Webhook] Lỗi:", err) end
end

-- Join game
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    local player = game.Players.LocalPlayer
    sendWebhook("Maru Hub ✅", "**Người chơi:** " .. player.Name .. "\n**Server ID:** " .. game.JobId)
end)

-- Rejoin (teleport)
if game.Players.LocalPlayer and game.Players.LocalPlayer.OnTeleport then
    game.Players.LocalPlayer.OnTeleport:Connect(function(state)
        if state == Enum.TeleportState.Started then
            sendWebhook("Maru Hub 🔄", "Người chơi đang rejoin sang server khác...")
        end
    end)
end

-- Spam mỗi 1 phút
task.spawn(function()
    while task.wait(60) do
        sendWebhook("⏱️ Maru Hub Auto", "Script này được làm bởi **Phan Hoàng Quân** 🛠️")
    end
end)
