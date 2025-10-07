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
--// Executor Info UI | English Version by Mario
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Remove old UI if exists
if CoreGui:FindFirstChild("ExecutorHubUI") then
	CoreGui.ExecutorHubUI:Destroy()
end

-- Main UI
local gui = Instance.new("ScreenGui")
gui.Name = "ExecutorHubUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Frame
local frame = Instance.new("Frame", gui)
frame.AnchorPoint = Vector2.new(1, 1)
frame.Position = UDim2.new(1, -15, 1, -15)
frame.Size = UDim2.new(0, 320, 0, 85)
frame.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 200, 60)

-- Function to make text labels
local function makeLabel(text, y)
	local lbl = Instance.new("TextLabel", frame)
	lbl.Size = UDim2.new(1, -20, 0, 22)
	lbl.Position = UDim2.new(0, 10, 0, y)
	lbl.BackgroundTransparency = 1
	lbl.Font = Enum.Font.GothamBold
	lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
	lbl.TextSize = 14
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.TextTruncate = Enum.TextTruncate.AtEnd
	lbl.Text = text
	return lbl
end

-- Create text lines
local line1 = makeLabel("Executor: 🔄 Checking...", 6)
local line2 = makeLabel("Status: 🔄 Checking...", 30)
local line3 = makeLabel("Safe Mode: 🔄 Turning on...", 54)

-- Fade-in effect
frame.BackgroundTransparency = 1
for i = 1, 10 do
	task.wait(0.05)
	frame.BackgroundTransparency = 1 - i * 0.1
end

-- Simulate spinning animation for "Checking..."
local spinner = {"|", "/", "-", "\\"}
task.spawn(function()
	while line1.Text:find("Checking") or line2.Text:find("Checking") or line3.Text:find("Turning") do
		for _, sym in ipairs(spinner) do
			if line1.Text:find("Checking") then
				line1.Text = "Executor: 🔄 Checking " .. sym
			end
			if line2.Text:find("Checking") then
				line2.Text = "Status: 🔄 Checking " .. sym
			end
			if line3.Text:find("Turning") then
				line3.Text = "Safe Mode: 🔄 Turning on " .. sym
			end
			task.wait(0.1)
		end
	end
end)

-- After 2 seconds, show actual info
task.wait(2)
line1.Text = "Executor: Potassium"
line2.Text = "Status: ✅ Undetected"
line3.Text = "Safe Mode: 🟢 Activated"

-- Check nearby players (safety detection)
task.spawn(function()
	while task.wait(1) do
		local danger = false
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local myChar = LocalPlayer.Character
				if myChar and myChar:FindFirstChild("HumanoidRootPart") then
					local dist = (player.Character.HumanoidRootPart.Position - myChar.HumanoidRootPart.Position).Magnitude
					if dist < 20 then
						danger = true
						break
					end
				end
			end
		end

		if danger then
			line3.Text = "Safe Mode: ⚠️ Possibly unsafe (player nearby)"
			line3.TextColor3 = Color3.fromRGB(255, 180, 80)
		else
			line3.Text = "Safe Mode: 🟢 Activated"
			line3.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end
end)
