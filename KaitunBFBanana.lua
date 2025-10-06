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
-- Executor Info UI - Terminal Style (PlayerGui version) - By Mario (simulator)
-- Dán và chạy trong executor. Mô phỏng; không chứa exploit.

-- -- Config --
local SIMULATED_EXECUTOR_NAME = "Potassium" -- đổi nếu muốn

-- start
print("[Mario UI] Script started")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- wait localplayer
if not LocalPlayer then
    -- nếu chạy trong môi trường không có LocalPlayer (ví dụ chạy server), báo lỗi
    warn("[Mario UI] No LocalPlayer found. This script must be run on client (LocalPlayer).")
    return
end

-- đảm bảo PlayerGui tồn tại
local pg = LocalPlayer:WaitForChild("PlayerGui", 5)
if not pg then
    warn("[Mario UI] PlayerGui not found.")
    return
end

-- Kiểm tra duplicate
if pg:FindFirstChild("ExecutorUI_Mario_Terminal") then
    warn("[Mario UI] ExecutorUI_Mario_Terminal already exists in PlayerGui. Abort.")
    return
end

-- Tạo ScreenGui trong PlayerGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ExecutorUI_Mario_Terminal"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = pg

print("[Mario UI] ScreenGui parented to PlayerGui")

-- Main frame
local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 340, 0, 110)
Frame.Position = UDim2.new(1, -360, 1, -130) -- góc phải dưới, an toàn
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.BackgroundTransparency = 1 -- fade-in
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.ZIndex = 999

-- Corner & stroke (neon)
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(255, 200, 60)

-- Fade-in background
task.spawn(function()
    local steps = 16
    for i = 1, steps do
        Frame.BackgroundTransparency = 1 - (i / steps) * 0.85
        task.wait(0.02)
    end
    print("[Mario UI] Fade-in complete")
end)

-- Container for text
local TextHolder = Instance.new("Frame", Frame)
TextHolder.Name = "TextHolder"
TextHolder.BackgroundTransparency = 1
TextHolder.Size = UDim2.new(1, -12, 1, -12)
TextHolder.Position = UDim2.new(0, 6, 0, 6)

-- Title
local Title = Instance.new("TextLabel", TextHolder)
Title.Name = "Title"
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 24)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "⚡ Executor Info | By Mario ⚡"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Lines frame
local LinesFrame = Instance.new("Frame", TextHolder)
LinesFrame.Name = "LinesFrame"
LinesFrame.BackgroundTransparency = 1
LinesFrame.Position = UDim2.new(0, 0, 0, 28)
LinesFrame.Size = UDim2.new(1, 0, 1, -28)

-- Watermark
local Water = Instance.new("TextLabel", Frame)
Water.Name = "Watermark"
Water.BackgroundTransparency = 1
Water.Size = UDim2.new(0, 200, 0, 18)
Water.Position = UDim2.new(0, 8, 1, -22)
Water.Font = Enum.Font.SourceSans
Water.Text = "Script by Mario"
Water.TextColor3 = Color3.fromRGB(150, 150, 150)
Water.TextSize = 14
Water.TextXAlignment = Enum.TextXAlignment.Left

-- Lines to show
local lines = {
    "Initializing Executor Info...",
    "Loading modules...",
    ("Executor: %s"):format(SIMULATED_EXECUTOR_NAME),
    "Status: Undetected — Safe Mode On (Anti Kick & Anti Ban Active)",
    "Check complete. UI will remain on-screen."
}

local function makeLine(parent, y)
    local lbl = Instance.new("TextLabel", parent)
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.Position = UDim2.new(0, 0, 0, y)
    lbl.Font = Enum.Font.SourceSans
    lbl.Text = ""
    lbl.TextColor3 = Color3.fromRGB(200, 255, 200)
    lbl.TextSize = 16
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextScaled = false
    return lbl
end

local labelList = {}
for i = 1, #lines do
    labelList[i] = makeLine(LinesFrame, (i-1) * 20)
end

-- typing effect
task.spawn(function()
    task.wait(0.35)
    for i, txt in ipairs(lines) do
        for j = 1, #txt do
            labelList[i].Text = string.sub(txt, 1, j) .. "_"
            task.wait(0.012 + (j/#txt)*0.006)
        end
        labelList[i].Text = txt
        if i == 3 then task.wait(0.35) elseif i == 4 then task.wait(0.7) else task.wait(0.25) end
    end
    labelList[4].TextColor3 = Color3.fromRGB(160, 255, 160)
    print("[Mario UI] Typing effect complete")
end)

-- neon color cycle
task.spawn(function()
    local hue = 0
    while task.wait(0.04) do
        hue = (hue + 0.006) % 1
        UIStroke.Color = Color3.fromHSV(hue, 0.9, 1)
    end
end)

-- anti-duplicate: if removed, restore
ScreenGui.DescendantRemoving:Connect(function(obj)
    if obj == Frame then
        task.spawn(function()
            task.wait(0.08)
            if not ScreenGui:FindFirstChild("MainFrame") then
                local clone = Frame:Clone()
                clone.Parent = ScreenGui
                warn("[Mario UI] UI removed -> restored (simulator).")
            end
        end)
    end
end)

-- draggable
local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end
makeDraggable(Frame)

print("[Mario UI] UI created successfully and should be visible on screen.")
