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
-- // Hop Server by Mario (UI Enhanced)
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local PlaceId = game.PlaceId
local Player = Players.LocalPlayer

-- // Get available servers
function GetServers()
    local url = ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(PlaceId)
    local Servers = {}
    local success, response = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)

    if success and response and response.data then
        for _, server in ipairs(response.data) do
            if server.playing < server.maxPlayers then
                table.insert(Servers, server.id)
            end
        end
    end

    return Servers
end

-- // Hop to random server
function HopServer()
    local Servers = GetServers()
    if #Servers > 0 then
        local RandomServer = Servers[math.random(1, #Servers)]
        TeleportService:TeleportToPlaceInstance(PlaceId, RandomServer, Player)
    else
        warn("⚠️ No available servers found. Try again later.")
    end
end

-- // UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "HopServerUI"

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 60, 0, 60)
Frame.Position = UDim2.new(1, -80, 1, -100)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.2
Frame.Parent = ScreenGui
Frame.Name = "HopButtonFrame"
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.ClipsDescendants = true
Frame.Active = true

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 50)

local Icon = Instance.new("TextLabel")
Icon.Parent = Frame
Icon.Size = UDim2.new(1, 0, 1, 0)
Icon.BackgroundTransparency = 1
Icon.Text = "🌍"
Icon.Font = Enum.Font.GothamBold
Icon.TextScaled = true
Icon.TextColor3 = Color3.fromRGB(255, 255, 255)

-- // Loading Spinner
local Spinner = Instance.new("ImageLabel")
Spinner.Parent = Frame
Spinner.Image = "rbxassetid://3926307971" -- Roblox loading spinner icon
Spinner.ImageRectOffset = Vector2.new(628, 420)
Spinner.ImageRectSize = Vector2.new(48, 48)
Spinner.BackgroundTransparency = 1
Spinner.AnchorPoint = Vector2.new(0.5, 0.5)
Spinner.Position = UDim2.new(0.5, 0, 0.5, 0)
Spinner.Size = UDim2.new(0, 35, 0, 35)
Spinner.Visible = false

-- // Invisible button
local Button = Instance.new("TextButton")
Button.Parent = Frame
Button.Size = UDim2.new(1, 0, 1, 0)
Button.BackgroundTransparency = 1
Button.Text = ""

-- // Click event
Button.MouseButton1Click:Connect(function()
    Icon.Visible = false
    Spinner.Visible = true

    -- Rotation animation
    local Rotating = true
    task.spawn(function()
        while Rotating and Spinner do
            Spinner.Rotation = Spinner.Rotation + 10
            task.wait(0.02)
        end
    end)

    task.wait(0.8)
    Icon.Text = "🌍"
    Rotating = false
    HopServer()
end)

    task.wait(0.8)
    Icon.Text = "🌍"
    Rotating = false
    HopServer()
end)
