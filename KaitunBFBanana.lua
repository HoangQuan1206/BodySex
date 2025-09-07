repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- CONFIG GIỮ NGUYÊN
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
        ["Hop Server If Have Player Near"] = true, 
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

-- LOAD SCRIPT CHÍNH
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()

-- HÀM GỬI WEBHOOK
local function sendWebhookLog(eventType)
    if not getgenv().SettingFarm["Webhook"]["Enabled"] then return end

    local HttpService = game:GetService("HttpService")
    local url = getgenv().SettingFarm["Webhook"]["WebhookUrl"]

    local data = {
        ["embeds"] = {{
            ["title"] = "Banana Hub - Script Kaitun Blox Fruit (Notification) 🍌",
            ["description"] = "**Người chơi:** " .. game.Players.LocalPlayer.Name ..
                              "\n**Server ID:** " .. game.JobId ..
                              "\n**Sự kiện:** " .. eventType,
            ["color"] = 13882329, -- nâu da người (#D2A679)
            ["footer"] = {
                ["text"] = "Gửi lúc"
            },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }

    local jsonData = HttpService:JSONEncode(data)
    pcall(function()
        http_request({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = jsonData
        })
    end)
end

-- GỬI LOG KHI JOIN
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    sendWebhookLog("Người chơi đã vào game ✅")
end)

-- CODE CRAFT ITEM
local remote2 = game:GetService("ReplicatedStorage").Remotes.CommF_
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft")
local items = {"ToothNecklace", "TerrorJaw", "SharkAnchor"}

remote2:InvokeServer("BuySharkmanKarate", true) -- buy shark anchor
remote2:InvokeServer("BuySharkmanKarate")

task.spawn(function()
    while true do
        local success, err = pcall(function()
            for _, item in ipairs(items) do
                remote:InvokeServer("Craft", item, {})
                task.wait(5)
            end
        end)
        if not success then warn(err) end
    end
end)

-- AUTO REJOIN + GỬI LOG
local errorMSG = {
    "you were kicked", "disconnected", "lost connection", "267", "279","769"
}
task.spawn(function()
    while task.wait(1) do
        local promptGui = game.CoreGui:FindFirstChild("RobloxPromptGui")
        if promptGui then
            for _, v in ipairs(promptGui:GetDescendants()) do
                if v:IsA("TextLabel") and v.Text and v.Text ~= "" then
                    local txt = string.lower(v.Text)
                    for _, msg in ipairs(errorMSG) do
                        if string.find(txt, msg, 1, true) then
                            sendWebhookLog("Người chơi bị disconnect 🔄, đang rejoin...")
                            local success, err = pcall(function()
                                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                            end)
                            return
                        end
                    end
                end
            end
        end
    end
end)
