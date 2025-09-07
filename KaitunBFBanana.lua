repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- =========================
-- CONFIG (GIỮ NGUYÊN)
-- =========================
getgenv().Key = "fce29705ab1438631ae8d43c"
getgenv().SettingFarm = {
    ["Hide UI"] = true,
    ["Reset Teleport"] = {
        ["Enabled"] = false,
        ["Delay Reset"] = 3,
        ["Item Dont Reset"] = {
            ["Fruit"] = {
                ["Enabled"] = true,
                ["All Fruit"] = true,
                ["Select Fruit"] = {
                    ["Enabled"] = false,
                    ["Fruit"] = {},
                },
            },
        },
    },
    ["White Screen"] = false,
    ["Lock Fps"] = {
        ["Enabled"] = true,
        ["FPS"] = 10,
    },
    ["Get Items"] = {
        ["Saber"] = true,
        ["Godhuman"] =  true,
        ["Skull Guitar"] = true,
        ["Mirror Fractal"] = true,
        ["Cursed Dual Katana"] = true,
        ["Upgrade Race V2-V3"] = true,
        ["Auto Pull Lever"] = true,
        ["Shark Anchor"] = true,
    },
    ["Get Rare Items"] = {
        ["Rengoku"] = false,
        ["Dragon Trident"] = false,
        ["Pole (1st Form)"] = false,
        ["Gravity Blade"]  = true,
    },
    ["Farm Fragments"] = {
        ["Enabled"]  = true,
        ["Fragment"] = 50000,
    },
    ["Auto Chat"] = {
        ["Enabled"] = false,
        ["Text"] = "SirMadri - Dominando o mercado.",
    },
    ["Auto Summon Rip Indra"] = true,
    ["Select Hop"] = {
        ["Hop Server If Have Player Near"] = false,
        ["Hop Find Rip Indra Get Valkyrie Helm or Get Tushita"] = true,
        ["Hop Find Dough King Get Mirror Fractal"] = true,
        ["Hop Find Raids Castle [CDK]"] = true,
        ["Hop Find Cake Queen [CDK]"] = true,
        ["Hop Find Soul Reaper [CDK]"] = true,
        ["Hop Find Darkbeard [SG]"] = true,
        ["Hop Find Mirage [ Pull Lever ]"] = true,
    },
    ["Farm Mastery"] = {
        ["Melee"] = false,
        ["Sword"] = false,
    },
    ["Buy Haki"] = {
        ["Enhancement"] = true,
        ["Skyjump"] = true,
        ["Flash Step"] = true,
        ["Observation"] = true,
    },
    ["Sniper Fruit Shop"] = {
        ["Enabled"] = true,
        ["Fruit"] = {},
    },
    ["Lock Fruit"] = {},
    ["Webhook"] = {
        ["Enabled"] = true,
        ["WebhookUrl"] = "https://discord.com/api/webhooks/1411194628006219776/16nlkh3LpQruj5D25URDUIsABPZnVTNa44YoycfwM-wIMNParpTuf7lHzb2r4wmhX8JH",
    }
}

-- =========================
-- LOAD SCRIPT CHÍNH
-- =========================
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()

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
local errorMSG = { "you were kicked", "disconnected", "lost connection", "267", "279", "769","771" }
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
