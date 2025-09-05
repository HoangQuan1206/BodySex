repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "fce29705ab1438631ae8d43c"
    getgenv().SettingFarm ={
        ["Hide UI"] = true,
        ["Reset Teleport"] = {
            ["Enabled"] = false,
            ["Delay Reset"] = 3,
            ["Item Dont Reset"] = {
                ["Fruit"] = {
                    ["Enabled"] = true,
                    ["All Fruit"] = true, 
                    ["Select Fruit"] = {
                        ["Enabled"] = false,
                        ["Fruit"] = {},
                    },
                },
            },
        },
        ["White Screen"] = false,
        ["Lock Fps"] = {
            ["Enabled"] = true,
            ["FPS"] = 10,
        },
        ["Get Items"] = {
            ["Saber"] = true,
            ["Godhuman"] =  true,
            ["Skull Guitar"] = true,
            ["Mirror Fractal"] = true,
            ["Cursed Dual Katana"] = true,
            ["Upgrade Race V2-V3"] = true,
            ["Auto Pull Lever"] = false,
            ["Shark Anchor"] = true,
        },
        ["Get Rare Items"] = {
            ["Rengoku"] = false,
            ["Dragon Trident"] = false, 
            ["Pole (1st Form)"] = false,
            ["Gravity Blade"]  = false,
        },
        ["Farm Fragments"] = {
            ["Enabled"]  = false,
            ["Fragment"] = 50000,
        },
        ["Auto Chat"] = {
            ["Enabled"] = false,
            ["Text"] = "SirMadri - Dominando o mercado.",
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
            ["Fruit"] = {},
        },
        ["Lock Fruit"] = {},
        ["Webhook"] = {
            ["Enabled"] = false,
            ["WebhookUrl"] = "",
        }
    }
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()

-- extras fixes, do not touch (you can verify for yourself)

local remote2 = game:GetService("ReplicatedStorage").Remotes.CommF_
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft")
local items = {"ToothNecklace", "TerrorJaw", "SharkAnchor"}

remote2:InvokeServer("BuySharkmanKarate", true) -- buy shark anchor
remote2:InvokeServer("BuySharkmanKarate")

task.spawn(function()
    while true do
        local success, err = pcall(function()
            for _, item in ipairs(items) do
                remote:InvokeServer("Craft", item, {})
                task.wait(5)
            end
        end)
        if not success then warn(err) end
    end
end)

local errorMSG = { -- rejoin for disconnects
    "you were kicked", "disconnected", "lost connection", "267", "279",
}
task.spawn(function()
    while task.wait(1) do
        local promptGui = game.CoreGui:FindFirstChild("RobloxPromptGui")
        if promptGui then
            for _, v in ipairs(promptGui:GetDescendants()) do
                if v:IsA("TextLabel") and v.Text and v.Text ~= "" then
                    local txt = string.lower(v.Text)
                    for _, msg in ipairs(errorMSG) do
                        if string.find(txt, msg, 1, true) then
                            local success, err = pcall(function()
                                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                            end)
                            return
                        end
                    end
                end
            end
        end
    end
end)
