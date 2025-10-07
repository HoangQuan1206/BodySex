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
-- ⚡ Executor Info UI | Fixed Version ⚡
-- By Mario, edited for better layout

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local InfoText = Instance.new("TextLabel")
local StatusText = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")

-- 🟨 Main Frame
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Size = UDim2.new(0, 400, 0, 140)
MainFrame.Position = UDim2.new(0.5, -200, 0.8, 0)
MainFrame.BackgroundTransparency = 0.25

-- 🟨 Outline (vàng)
local Outline = Instance.new("UIStroke")
Outline.Thickness = 3
Outline.Color = Color3.fromRGB(255, 200, 60)
Outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Outline.Parent = MainFrame

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = MainFrame

-- ⚡ Title
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Text = "⚡ Executor Info | By Mario ⚡"
Title.Font = Enum.Font.GothamBold -- có thể đổi sang Nunito nếu thích
Title.TextColor3 = Color3.fromRGB(255, 200, 60)
Title.TextSize = 22
Title.Position = UDim2.new(0, 15, 0, 10)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- 📋 Info Text
InfoText.Parent = MainFrame
InfoText.BackgroundTransparency = 1
InfoText.Text = "Initializing Executor Info...\nLoading modules...\nExecutor: Potassium"
InfoText.Font = Enum.Font.GothamMedium
InfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoText.TextSize = 18
InfoText.Position = UDim2.new(0, 15, 0, 45)
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.TextYAlignment = Enum.TextYAlignment.Top

-- ✅ Status Text
StatusText.Parent = MainFrame
StatusText.BackgroundTransparency = 1
StatusText.Text = "Status: ✅ Undetected | 🟡 Safe Mode ON 🔒"
StatusText.Font = Enum.Font.GothamMedium
StatusText.TextColor3 = Color3.fromRGB(60, 255, 100)
StatusText.TextSize = 17
StatusText.Position = UDim2.new(0, 15, 0, 105)
StatusText.TextXAlignment = Enum.TextXAlignment.Left

-- ✨ Giả lập loading (ví dụ)
task.wait(3)
InfoText.Text = "Executor: Potassium\nMode: 🟡 Safe Mode ON 🔒"

print("✅ Executor Info UI Loaded Successfully")
