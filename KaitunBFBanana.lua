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
-- // Hop Server Premium v2 by Mario
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

local PlaceId = game.PlaceId
local Player = Players.LocalPlayer
getgenv().LastServer = getgenv().LastServer or nil

-- // Lấy danh sách server
function GetServers()
    local url = ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(PlaceId)
    local Servers = {}
    local success, response = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)

    if success and response and response.data then
        for _, server in ipairs(response.data) do
            if server.playing < server.maxPlayers and server.id ~= getgenv().LastServer then
                table.insert(Servers, server.id)
            end
        end
    end

    return Servers
end

-- // Hop sang server khác
function HopServer()
    local Servers = GetServers()
    if #Servers > 0 then
        local RandomServer = Servers[math.random(1, #Servers)]
        getgenv().LastServer = RandomServer
        TeleportService:TeleportToPlaceInstance(PlaceId, RandomServer, Player)
    else
        warn("⚠️ Không tìm thấy server khả dụng, thử lại sau.")
    end
end

-- // UI nhỏ góc phải
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "HopServerUI"
local Frame = Instance.new("Frame", ScreenGui)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Size = UDim2.new(0, 170, 0, 45)
Frame.Position = UDim2.new(1, -180, 1, -70)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 0

local Text = Instance.new("TextLabel", Frame)
Text.Size = UDim2.new(1, 0, 1, 0)
Text.Text = "🌍 Hop Server - by Mario"
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.Font = Enum.Font.GothamBold
Text.TextScaled = true
Text.BackgroundTransparency = 1

local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(1, 0, 1, 0)
Button.BackgroundTransparency = 1
Button.Text = ""

-- // Hiệu ứng Hover (sáng nhẹ khi trỏ chuột vào)
Button.MouseEnter:Connect(function()
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 20)
end)
Button.MouseLeave:Connect(function()
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
end)

-- // Thông báo nhỏ (toast)
local function Toast(message)
    local ToastFrame = Instance.new("Frame", ScreenGui)
    ToastFrame.Size = UDim2.new(0, 250, 0, 35)
    ToastFrame.Position = UDim2.new(1, -270, 1, -120)
    ToastFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ToastFrame.BorderSizePixel = 0
    ToastFrame.BackgroundTransparency = 0.1

    local TextLabel = Instance.new("TextLabel", ToastFrame)
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.TextSize = 13
    TextLabel.TextColor3 = Color3.fromRGB(255, 200, 60)
    TextLabel.Text = message

    game:GetService("TweenService"):Create(ToastFrame, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
    task.wait(2)
    game:GetService("TweenService"):Create(ToastFrame, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
    task.wait(0.6)
    ToastFrame:Destroy()
end

-- // Ping kiểm tra để auto hop
task.spawn(function()
    while task.wait(10) do
        local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        if ping > 300 then
            Toast("⚠️ High ping detected ("..math.floor(ping).."ms)! Hopping...")
            task.wait(1)
            HopServer()
        end
    end
end)

-- // Nút click hop thủ công
Button.MouseButton1Click:Connect(function()
    Text.Text = "⏳ Switching server..."
    Toast("🌍 Searching for new server...")
    task.wait(1.5)
    HopServer()
end)
