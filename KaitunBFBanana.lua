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
--// Executor Info UI | Final Version by Mario
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Xóa UI cũ nếu có
if CoreGui:FindFirstChild("ExecutorMiniUI") then
    CoreGui.ExecutorMiniUI:Destroy()
end

-- UI chính
local gui = Instance.new("ScreenGui")
gui.Name = "ExecutorMiniUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Frame chính
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 270, 0, 95)
frame.Position = UDim2.new(1, -280, 1, -115) -- góc phải dưới
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 1
frame.Parent = gui

-- Bo góc và viền vàng
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 200, 60)
stroke.Transparency = 1

-- Fade-in hiệu ứng
TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 0.05}):Play()
TweenService:Create(stroke, TweenInfo.new(0.5), {Transparency = 0}):Play()

-- Tiêu đề
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -16, 0, 22)
title.Position = UDim2.new(0, 8, 0, 5)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "⚡ Executor Info | By Mario"
title.TextColor3 = Color3.fromRGB(255, 200, 60)
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left

-- Nội dung (icon + text)
local info = Instance.new("TextLabel", frame)
info.Size = UDim2.new(1, -16, 1, -35)
info.Position = UDim2.new(0, 8, 0, 30)
info.BackgroundTransparency = 1
info.Font = Enum.Font.GothamMedium
info.TextColor3 = Color3.fromRGB(235, 235, 235)
info.TextSize = 13
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextYAlignment = Enum.TextYAlignment.Top
info.TextWrapped = true
info.Text = "Initializing Executor Info...\nLoading modules..."

-- Hiệu ứng chuyển dần text
task.wait(1)
info.Text = "💻 Executor: Potassium\n🟢 Status: ✅ Undetected\n🔒 Mode: Safe Mode ON"

-- Hiệu ứng rung nhẹ khi hoàn tất
TweenService:Create(frame, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = frame.Position + UDim2.new(0, 0, 0, -3)
}):Play()
task.wait(0.12)
TweenService:Create(frame, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(1, -280, 1, -115)
}):Play()

