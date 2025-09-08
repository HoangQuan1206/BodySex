repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
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
(getgenv()).key = "MARU79NRSUSKX74PPXMOSB64NG";
(getgenv()).id = "949271381030350858";
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruComkak/main/PCBit.lua"))()

-- =========================
-- HÀM GỬI REQUEST (tương thích nhiều executor)
-- =========================
local HttpService = game:GetService("HttpService")

local function sendRawRequest(url, body)
    local headers = { ["Content-Type"] = "application/json" }
    -- Thử các hàm request của executor phổ biến
    if syn and syn.request then
        return syn.request({ Url = url, Method = "POST", Headers = headers, Body = body })
    elseif http and http.request then
        return http.request({ Url = url, Method = "POST", Headers = headers, Body = body })
    elseif http_request then
        return http_request({ Url = url, Method = "POST", Headers = headers, Body = body })
    elseif request then
        return request({ Url = url, Method = "POST", Headers = headers, Body = body })
    else
        -- Fallback: dùng HttpService:PostAsync (cần Enable HTTP Requests nếu chạy trong Studio)
        return HttpService:PostAsync(url, body, Enum.HttpContentType.ApplicationJson)
    end
end

-- =========================
-- HÀM GỬI WEBHOOK (lấy URL từ config)
-- =========================
local function sendWebhook(eventType, customDescription)
    -- Lấy webhook URL từ config (không sửa config)
    if not getgenv().SettingFarm or not getgenv().SettingFarm["Webhook"] then return end
    local webhookCfg = getgenv().SettingFarm["Webhook"]
    if not webhookCfg["Enabled"] then return end
    local url = tostring(webhookCfg["WebhookUrl"] or "")
    if url == "" then return end

    local playerName = (game.Players.LocalPlayer and game.Players.LocalPlayer.Name) or "Unknown"
    local serverId = game.JobId or "Unknown"

    local description = customDescription or ("**Người chơi:** " .. playerName .. "\n**Server ID:** " .. serverId .. "\n**Sự kiện:** " .. eventType)

    local embed = {
        title = "Banana Hub - Script Kaitun Blox Fruit (Notification) 🍌",
        description = description,
        color = 13882329, -- nâu da người (#D2A679)
        footer = { text = "Thông báo tự động từ Banana Hub" },
        timestamp = DateTime.now():ToIsoDate()
    }

    local payload = {
        username = "Banana Hub",
        embeds = { embed }
    }

    local ok, err = pcall(function()
        local body = HttpService:JSONEncode(payload)
        sendRawRequest(url, body)
    end)
    if not ok then
        warn("[Webhook] Gửi thất bại:", err)
    end
end

-- =========================
-- GỬI LOG KHI JOIN
-- =========================
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    sendWebhook("Người chơi đã vào game ✅")
end)

-- =========================
-- GỬI LOG KHI TELEPORT/REJOIN (OnTeleport started)
-- =========================
-- (Event OnTeleport tồn tại trên LocalPlayer trong môi trường client)
if game.Players.LocalPlayer and game.Players.LocalPlayer.OnTeleport then
    game.Players.LocalPlayer.OnTeleport:Connect(function(state)
        if state == Enum.TeleportState.Started then
            sendWebhook("Đang rejoin sang server khác (Teleport Started)")
        end
    end)
end

-- =========================
-- EXTRAS FIXES: MUA + CRAFT
-- =========================
local remote2_ok, remote2 = pcall(function()
    return game:GetService("ReplicatedStorage").Remotes.CommF_
end)
local remote_ok, remote = pcall(function()
    return game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft")
end)

local items = {"ToothNecklace", "TerrorJaw", "SharkAnchor"}

if remote2_ok and remote2 then
    pcall(function() remote2:InvokeServer("BuySharkmanKarate", true) end)
    pcall(function() remote2:InvokeServer("BuySharkmanKarate") end)
end

if remote_ok and remote then
    task.spawn(function()
        while true do
            local success, err = pcall(function()
                for _, item in ipairs(items) do
                    pcall(function() remote:InvokeServer("Craft", item, {}) end)
                    task.wait(5)
                end
            end)
            if not success then
                warn("[Craft] Lỗi:", err)
            end
            task.wait(1)
        end
    end)
end

-- =========================
-- AUTO REJOIN KHI DISCONNECT (và gửi webhook trước khi rejoin)
-- =========================
local errorMSG = { "you were kicked", "disconnected", "lost connection", "267", "279", "769" }
task.spawn(function()
    while task.wait(1) do
        local promptGui = game.CoreGui:FindFirstChild("RobloxPromptGui")
        if promptGui then
            for _, v in ipairs(promptGui:GetDescendants()) do
                if v:IsA("TextLabel") and v.Text and v.Text ~= "" then
                    local txt = string.lower(v.Text)
                    for _, msg in ipairs(errorMSG) do
                        if string.find(txt, msg, 1, true) then
                            -- gửi webhook báo disconnect
                            sendWebhook("Mất kết nối / Bị kick 🔌")
                            -- cố gắng rejoin
                            local ok, err = pcall(function()
                                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                            end)
                            if not ok then
                                warn("[Rejoin] Teleport lỗi:", err)
                            end
                            return
                        end
                    end
                end
            end
        end
    end
end)

-- =========================
-- VÒNG LẶP: GỬI THÔNG BÁO CỐ ĐỊNH MỖI 1 PHÚT
-- =========================
task.spawn(function()
    -- đợi game load chắc chắn rồi mới bắt đầu vòng
    repeat task.wait() until game:IsLoaded()
    while true do
        -- Nội dung cố định + icon
        local desc = "⚙️ Config Script này được làm bởi **Phan Hoàng Quân** 🛠️"
        sendWebhook("Thông báo định kỳ (1 phút)", desc)
        task.wait(60) -- 60 giây
    end
end)
