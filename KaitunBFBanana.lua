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

-- =========================
-- HÀM GỬI WEBHOOK (dùng embed Banana Config)
-- =========================
local function sendBananaConfig()
    if not getgenv().SettingFarm or not getgenv().SettingFarm["Webhook"] then return end
    local webhookCfg = getgenv().SettingFarm["Webhook"]
    if not webhookCfg["Enabled"] then return end
    local url = tostring(webhookCfg["WebhookUrl"] or "")
    if url == "" then return end

    local player = game.Players.LocalPlayer
    local data = player:WaitForChild("Data")

    -- Stats
    local statsText = string.format(
        "**Username:** %s (ID: %s)\n**Level:** %s\n**Beli:** %s\n**Fragments:** %s\n**Race:** %s",
        player.Name,
        tostring(player.UserId),
        tostring(data.Level.Value),
        tostring(data.Beli.Value),
        tostring(data.Fragments.Value),
        tostring(data.Race.Value)
    )

    -- Items cần check
    local wantedItems = {
        "Cursed Dual Katana",
        "Yama",
        "Tushita",
        "Shark Anchor",
        "Skull Guitar",
        "Valkyrie Helm",
        "God Human"
    }
    local backpack = player.Backpack
    local character = player.Character or player.CharacterAdded:Wait()
    local itemsList = {}
    for _, item in ipairs(wantedItems) do
        local hasItem = backpack:FindFirstChild(item) or character:FindFirstChild(item)
        if hasItem then
            table.insert(itemsList, "🟢 " .. item)
        else
            table.insert(itemsList, "🔴 " .. item)
        end
    end
    local itemsText = table.concat(itemsList, "\n")

    -- Fruits (Inventory)
    local fruitPrices = {
        ["Rocket-Rocket"] = 5000, ["Spin-Spin"] = 7500, ["Chop-Chop"] = 30000, ["Spring-Spring"] = 60000,
        ["Bomb-Bomb"] = 80000, ["Smoke-Smoke"] = 100000, ["Spike-Spike"] = 180000, ["Flame-Flame"] = 250000,
        ["Falcon-Falcon"] = 300000, ["Ice-Ice"] = 350000, ["Sand-Sand"] = 420000, ["Dark-Dark"] = 500000,
        ["Diamond-Diamond"] = 600000, ["Light-Light"] = 650000, ["Rubber-Rubber"] = 750000,
        ["Barrier-Barrier"] = 800000, ["Ghost-Ghost"] = 850000, ["Magma-Magma"] = 950000,
        ["Quake-Quake"] = 1000000, ["Human-Human: Buddha"] = 1200000, ["Love-Love"] = 1300000,
        ["Spider-Spider"] = 1500000, ["Sound-Sound"] = 1700000, ["Phoenix-Phoenix"] = 1800000,
        ["Portal-Portal"] = 1900000, ["Rumble-Rumble"] = 2100000, ["Pain-Pain"] = 2300000,
        ["Gravity-Gravity"] = 2500000, ["Dough-Dough"] = 2800000, ["Shadow-Shadow"] = 2900000,
        ["Venom-Venom"] = 3000000, ["Control-Control"] = 3200000, ["Gas-Gas"] = 3200000,
        ["Spirit-Spirit"] = 3400000, ["Dragon-Dragon"] = 3500000, ["Leopard-Leopard"] = 5000000
    }

    local fruitsList = {}
    local inv = game:GetService("ReplicatedStorage"):WaitForChild("Remotes").CommF_
    local ok, res = pcall(function()
        return inv:InvokeServer("getInventoryFruits")
    end)
    if ok and res then
        for _, v in pairs(res) do
            local fruitName = v.Name
            local price = fruitPrices[fruitName] or "???"
            table.insert(fruitsList, fruitName .. " (" .. price .. " Beli)")
        end
    end
    if #fruitsList == 0 then
        fruitsList = { "🔴 Không có fruit nào trong rương" }
    end
    local fruitsText = table.concat(fruitsList, "\n")

    -- Embed
    local embed = {
        title = "🍌 Banana Config",
        color = 65280,
        fields = {
            { name = "Items", value = itemsText, inline = false },
            { name = "Fruits", value = fruitsText, inline = false },
            { name = "Stats", value = statsText, inline = false },
        },
        footer = { text = "Cập nhật lúc: " .. os.date("%H:%M:%S") },
        timestamp = DateTime.now():ToIsoDate()
    }

    local payload = {
        username = "Banana Hub",
        embeds = { embed }
    }

    local body = HttpService:JSONEncode(payload)
    sendRawRequest(url, body)
end

-- =========================
-- GỬI LOG KHI JOIN
-- =========================
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    sendBananaConfig()
end)

-- =========================
-- AUTO UPDATE MỖI 1 PHÚT
-- =========================
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    while true do
        sendBananaConfig()
        task.wait(60)
    end
end)
