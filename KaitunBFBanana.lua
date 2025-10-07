repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

getgenv().Key = "fce29705ab1438631ae8d43c"

getgenv().SettingFarm = {
    ["Auto Add Friend"] = {
        ["Enabled"] = true,
        ["RequestDelay"] = 1,
        ["LoopDelay"] = 15
    },
    ["Hide UI"] = true,
    ["Reset Teleport"] = {
        ["Enabled"] = false,
        ["Delay Reset"] = 3,
        ["Item Dont Reset"] = {
            ["Fruit"] = {
                ["Enabled"] = true,
                ["All Fruit"] = true,
                ["Select Fruit"] = {
                    ["Enabled"] = true,
                    ["Fruit"] = {"Magma-Magma", "Quake-Quake", "Buddha-Buddha", "Love-Love", 
                        "Spider-Spider", "Sound-Sound", "Phoenix-Phoenix", "Portal-Portal", 
                        "Rumble-Rumble", "Pain-Pain", "Gravity-Gravity", "Dough-Dough", 
                        "Shadow-Shadow", "Venom-Venom", "Control-Control", "Gas-Gas", 
                        "Spirit-Spirit", "Dragon-Dragon", "Mammoth-Mammoth", "Leopard-Leopard", 
                        "East Dragon-East Dragon", "West Dragon-West Dragon"},
                },
            },
        },
    },
    ["White Screen"] = false,
    ["Lock Fps"] = {
        ["Enabled"] = true,
        ["FPS"] = 30,
    },
    ["Get Items"] = {
        ["Saber"] = true,
        ["Godhuman"] = true,
        ["Skull Guitar"] = true,
        ["Mirror Fractal"] = true,
        ["Cursed Dual Katana"] = true,
        ["Upgrade Race V2-V3"] = true,
        ["Auto Pull Lever"] = true,
        ["Shark Anchor"] = true
    },
    ["Get Rare Items"] = {
        ["Rengoku"] = false,
        ["Dragon Trident"] = false,
        ["Pole (1st Form)"] = false,
        ["Gravity Blade"] = true,
    },
    ["Farm Fragments"] = {
        ["Enabled"] = true,
        ["Fragment"] = 50000,
    },
    ["Auto Chat"] = {
        ["Enabled"] = false,
        ["Text"] = "Config that cut tay",
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
        ["Fruit"] = {"Rumble-Rumble", "Pain-Pain", "Gravity-Gravity", "Dough-Dough", 
        "Shadow-Shadow", "Venom-Venom", "Control-Control", "Gas-Gas", 
        "Spirit-Spirit", "Dragon-Dragon", "Mammoth-Mammoth", "Leopard-Leopard", 
        "East Dragon-East Dragon", "West Dragon-West Dragon"},
    },
    ["Lock Fruit"] = {"Rumble-Rumble", "Pain-Pain", "Gravity-Gravity", "Dough-Dough", 
        "Shadow-Shadow", "Venom-Venom", "Control-Control", "Gas-Gas", 
        "Spirit-Spirit", "Dragon-Dragon", "Mammoth-Mammoth", "Leopard-Leopard", 
        "East Dragon-East Dragon", "West Dragon-West Dragon"},
    ["Webhook"] = {
        ["Enabled"] = true,
        ["WebhookUrl"] = "",
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangQuan1206/BodySex/refs/heads/main/acceptfirned"))()
-- Executor Info UI | By Mario
-- Clean & Elegant Terminal Style

local executorName = "Potassium"

local player = game:GetService("Players").LocalPlayer
local pg = player:WaitForChild("PlayerGui")

if pg:FindFirstChild("ExecutorUI_Mario") then
    pg.ExecutorUI_Mario:Destroy()
end

local ui = Instance.new("ScreenGui", pg)
ui.Name = "ExecutorUI_Mario"
ui.ResetOnSpawn = false

local frame = Instance.new("Frame", ui)
frame.Size = UDim2.new(0, 420, 0, 140)
frame.Position = UDim2.new(1, -440, 1, -150)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
frame.BackgroundTransparency = 0.08
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(255, 200, 60)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 28)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "⚡ Executor Info | By Mario ⚡"
title.TextColor3 = Color3.fromRGB(255, 215, 60)
title.TextScaled = true
title.TextXAlignment = Enum.TextXAlignment.Left

-- Lines container
local lines = Instance.new("Frame", frame)
lines.Size = UDim2.new(1, -20, 1, -50)
lines.Position = UDim2.new(0, 10, 0, 35)
lines.BackgroundTransparency = 1

local texts = {
    "Initializing Executor Info...",
    "Loading modules...",
    "Executor: " .. executorName,
    "Status: ✅ Undetected | Safe Mode ON 🔒 (Anti Kick & Anti Ban Active)"
}

local labels = {}
for i, t in ipairs(texts) do
    local l = Instance.new("TextLabel", lines)
    l.Size = UDim2.new(1, 0, 0, 22)
    l.Position = UDim2.new(0, 0, 0, (i - 1) * 24)
    l.BackgroundTransparency = 1
    l.Font = Enum.Font.Gotham
    l.TextColor3 = Color3.fromRGB(235, 235, 235)
    l.TextSize = 17
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Text = ""
    labels[i] = l
end

-- Watermark
local watermark = Instance.new("TextLabel", frame)
watermark.Size = UDim2.new(1, -20, 0, 20)
watermark.Position = UDim2.new(0, 10, 1, -24)
watermark.BackgroundTransparency = 1
watermark.Font = Enum.Font.Gotham
watermark.Text = "Script by Mario"
watermark.TextColor3 = Color3.fromRGB(150, 150, 150)
watermark.TextSize = 14
watermark.TextXAlignment = Enum.TextXAlignment.Left

-- Typing animation
task.spawn(function()
    for i, text in ipairs(texts) do
        for c = 1, #text do
            labels[i].Text = string.sub(text, 1, c)
            task.wait(0.02)
        end
        task.wait(0.25)
    end
    labels[4].TextColor3 = Color3.fromRGB(100, 255, 130)
end)

-- Fade in
frame.BackgroundTransparency = 1
for i = 1, 15 do
    frame.BackgroundTransparency = 1 - (i / 15) * 0.92
    task.wait(0.02)
end

-- Viền vàng nhẹ animate
task.spawn(function()
    while task.wait(0.05) do
        stroke.Color = Color3.fromRGB(255, 200 + math.sin(tick()*2)*20, 60)
    end
end)
