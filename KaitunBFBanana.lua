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
--// ⚡ Executor Info UI v3 - By Mario ⚡
--// Features:
--// ✅ Dòng trạng thái tự đổi
--// ✅ Bảo vệ UI (auto restore)
--// ✅ Logo “By Mario”
--// ✅ Viền neon xoay màu
--// ✅ Hiệu ứng fade-in mượt mà

-- Nếu UI đã có thì không tạo thêm
if game.CoreGui:FindFirstChild("ExecutorUI_Mario") then
    warn("⚠️ UI đã tồn tại, không cần load lại!")
    return
end

-- Hàm phát hiện Executor
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
ScreenGui.Name = "ExecutorUI_Mario"

local Frame = Instance.new("Frame", ScreenGui)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 1 -- bắt đầu mờ
Frame.Size = UDim2.new(0, 280, 0, 80)
Frame.Position = UDim2.new(1, -300, 1, -100)
Frame.BorderSizePixel = 0
Frame.Active = true

-- Hiệu ứng fade-in mượt
task.spawn(function()
    for i = 1, 20 do
        Frame.BackgroundTransparency = 1 - (i * 0.04)
        task.wait(0.03)
    end
end)

-- Bo góc + viền neon đổi màu
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Thickness = 3

task.spawn(function()
    local hue = 0
    while task.wait(0.05) do
        hue = (hue + 0.01) % 1
        UIStroke.Color = Color3.fromHSV(hue, 1, 1)
    end
end)

-- Logo “By Mario”
local Title = Instance.new("TextLabel", Frame)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.Font = Enum.Font.SourceSansBold
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextStrokeTransparency = 0.7
Title.TextScaled = true
Title.Text = "⚡ Executor Info | By Mario ⚡"

-- Dòng Executor
local ExecutorLabel = Instance.new("TextLabel", Frame)
ExecutorLabel.BackgroundTransparency = 1
ExecutorLabel.Position = UDim2.new(0, 0, 0.3, 0)
ExecutorLabel.Size = UDim2.new(1, 0, 0.35, 0)
ExecutorLabel.Font = Enum.Font.SourceSansBold
ExecutorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecutorLabel.TextScaled = true
ExecutorLabel.Text = "Executor: " .. detectExecutor()

-- Dòng Status
local StatusLabel = Instance.new("TextLabel", Frame)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.65, 0)
StatusLabel.Size = UDim2.new(1, 0, 0.35, 0)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.TextColor3 = Color3.fromRGB(200, 255, 200)
StatusLabel.TextScaled = true
StatusLabel.Text = "Status: Loading..."

-- Bo chữ
for _, label in ipairs({Title, ExecutorLabel, StatusLabel}) do
    local stroke = Instance.new("UIStroke", label)
    stroke.Thickness = 1.2
    stroke.Color = Color3.fromRGB(0, 0, 0)
end

-- Tự đổi status mỗi 5s
task.spawn(function()
    local messages = {
        "Status: Ready ✅",
        "Status: Checking Executor 🔍",
        "Status: Running Smoothly ⚙️",
        "Status: Monitoring 🧠",
        "Status: Safe Mode On 🔒"
    }
    local i = 1
    while task.wait(5) do
        i = (i % #messages) + 1
        ExecutorLabel.Text = "Executor: " .. detectExecutor()
        StatusLabel.Text = messages[i]
    end
end)

-- Bảo vệ UI không bị xóa
ScreenGui.DescendantRemoving:Connect(function(obj)
    if obj == Frame then
        local clone = Frame:Clone()
        clone.Parent = ScreenGui
        warn("⚠️ UI bị xoá - Hệ thống đã tự phục hồi!")
    end
end)






