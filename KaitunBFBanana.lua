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
-- 🌟 Executor Status UI by Oliver
-- Hiển thị thông tin executor gọn đẹp (chỉ để vui, không can thiệp game)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.Name = "ExecutorStatusUI"

-- 📦 UI khung chính
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 230, 0, 120)
Frame.Position = UDim2.new(1, -250, 1, -140)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.25
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0, 0)
Frame.ClipsDescendants = true
Frame.Visible = false
Frame.ZIndex = 2

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1.5
UIStroke.Color = Color3.fromRGB(255, 200, 60)
UIStroke.Parent = Frame

-- 🔤 Hàm tạo dòng có icon
local function createLine(parent, text, y, iconId)
	local icon = Instance.new("ImageLabel")
	icon.Parent = parent
	icon.BackgroundTransparency = 1
	icon.Image = "rbxassetid://" .. iconId
	icon.Size = UDim2.new(0, 16, 0, 16)
	icon.Position = UDim2.new(0, 10, 0, y + 2)
	icon.ImageColor3 = Color3.fromRGB(255, 200, 60)
	icon.Visible = false

	local label = Instance.new("TextLabel")
	label.Parent = parent
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1, -40, 0, 20)
	label.Position = UDim2.new(0, 35, 0, y)
	label.Font = Enum.Font.GothamSemibold
	label.TextSize = 14
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Text = text
	label.Visible = false

	return icon, label
end

-- 🧾 Các dòng hiển thị
local title = Instance.new("TextLabel")
title.Parent = Frame
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -20, 0, 20)
title.Position = UDim2.new(0, 10, 0, 8)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 200, 60)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Text = "Executor Status"
title.Visible = false

local icon1, status = createLine(Frame, "Status: Checking...", 35, 6035047409) -- icon ⚙️
local icon2, mode = createLine(Frame, "Mode: Loading...", 55, 6034767619)     -- icon 🧩
local icon3, safety = createLine(Frame, "Security: Analyzing...", 75, 6035047401) -- icon 🛡️

-- ✨ Hàm hiệu ứng fade
local function fade(obj, show)
	local goal = {TextTransparency = show and 0 or 1, ImageTransparency = show and 0 or 1}
	local tween = TweenService:Create(obj, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), goal)
	tween:Play()
end

-- 🕓 Hiệu ứng khởi động
task.wait(1)
Frame.Visible = true
TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.15}):Play()

task.wait(0.2)
title.Visible = true
fade(title, true)

for _, obj in ipairs({icon1, status, icon2, mode, icon3, safety}) do
	task.wait(0.25)
	obj.Visible = true
	fade(obj, true)
end

-- 🌀 Cập nhật trạng thái động
task.wait(1)
status.Text = "Status: Undetected ✅"
mode.Text = "Mode: Activating Safe Mode..."
task.wait(1.3)
mode.Text = "Mode: ⚠️ Not sure if safe near players"
task.wait(1)
safety.Text = "Security: Protected ✓"

-- 💥 Rung nhẹ khi hoàn tất
for i = 1, 3 do
	TweenService:Create(Frame, TweenInfo.new(0.05), {Position = Frame.Position + UDim2.new(0, 3, 0, 0)}):Play()
	task.wait(0.05)
	TweenService:Create(Frame, TweenInfo.new(0.05), {Position = Frame.Position - UDim2.new(0, 6, 0, 0)}):Play()
	task.wait(0.05)
end
TweenService:Create(Frame, TweenInfo.new(0.1), {Position = Frame.Position + UDim2.new(0, 3, 0, 0)}):Play()

print("✅ UI Loaded Successfully")


