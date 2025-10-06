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
--[[
✨ Executor Info UI - Premium Version ✨
Features:
1️⃣ Tự phát hiện executor
2️⃣ Hiển thị giờ hiện tại
3️⃣ Auto cập nhật mỗi 5 giây
4️⃣ Viền vàng neon + Nút ẩn/hiện UI
--]]

local function detectExecutor()
    if identifyexecutor then
        return identifyexecutor()
    elseif getexecutorname then
        return getexecutorname()
    elseif KRNL_LOADED then
        return "KRNL"
    elseif syn then
        return "Synapse X"
    elseif isexecutorclosure then
        return "ScriptWare"
    elseif isfluxus_closure then
        return "Fluxus"
    else
        return "Unknown"
    end
end

-- Giao diện chính
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
local ExecutorLabel = Instance.new("TextLabel", Frame)
local TimeLabel = Instance.new("TextLabel", Frame)
local ToggleButton = Instance.new("TextButton", ScreenGui)

-- Frame chính
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.2
Frame.Size = UDim2.new(0, 260, 0, 60)
Frame.Position = UDim2.new(1, -280, 1, -80)
Frame.BorderSizePixel = 0

-- Bo góc + viền
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(255, 215, 0)

-- Hiệu ứng chuyển màu viền
task.spawn(function()
    local hue = 0
    while task.wait(0.05) do
        hue = hue + 0.01
        if hue > 1 then hue = 0 end
        UIStroke.Color = Color3.fromHSV(hue, 1, 1)
    end
end)

-- Label Executor
ExecutorLabel.BackgroundTransparency = 1
ExecutorLabel.Size = UDim2.new(1, 0, 0.5, 0)
ExecutorLabel.Font = Enum.Font.SourceSansBold
ExecutorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecutorLabel.TextScaled = true
ExecutorLabel.Text = "Executor: " .. detectExecutor()

-- Label Time
TimeLabel.BackgroundTransparency = 1
TimeLabel.Position = UDim2.new(0, 0, 0.5, 0)
TimeLabel.Size = UDim2.new(1, 0, 0.5, 0)
TimeLabel.Font = Enum.Font.SourceSans
TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeLabel.TextScaled = true
TimeLabel.Text = "Time: " .. os.date("%H:%M:%S")

-- Nút ẩn/hiện UI
ToggleButton.Text = "⚙️"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextScaled = true
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.Position = UDim2.new(1, -60, 1, -60)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local CornerBtn = Instance.new("UICorner", ToggleButton)
CornerBtn.CornerRadius = UDim.new(1, 0)

-- Bo viền nút
local BtnStroke = Instance.new("UIStroke", ToggleButton)
BtnStroke.Thickness = 2
BtnStroke.Color = Color3.fromRGB(255, 215, 0)

-- Chức năng ẩn/hiện
local visible = true
ToggleButton.MouseButton1Click:Connect(function()
    visible = not visible
    Frame.Visible = visible
end)

-- Auto cập nhật thông tin mỗi 5 giây
task.spawn(function()
    while task.wait(5) do
        ExecutorLabel.Text = "Executor: " .. detectExecutor()
        TimeLabel.Text = "Time: " .. os.date("%H:%M:%S")
    end
end)





