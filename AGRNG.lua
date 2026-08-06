getgenv().RAYFIELD_ASSET_ID = 103703910372153
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
Rayfield:LoadConfiguration()

local Window = Rayfield:CreateWindow({
   Name = "Anime Girl RNG",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Anime Girl RNG",
   LoadingSubtitle = "by Notey",
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = Enum.KeyCode.LeftAlt, -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "AGRNG1"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Tab = Window:CreateTab("Main Tab", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Main Section")

local AutoOrb = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local VirtualUser = game:GetService("VirtualUser")
local camera = workspace.CurrentCamera
local pos = camera.CFrame.Position

local Toggle = Tab:CreateToggle({
    Name = "Auto Collect Orb",
    CurrentValue = false,
    Flag = "AutoOrb", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            AutoOrb = true
        elseif not Value then
            AutoOrb = false
        end
        while AutoOrb do
                root.CFrame = CFrame.new(
                546.933899, 8626.27637, 396.582733,
                0.690339744, -5.20163717e-08, 0.723485351,
                3.59968304e-08, 1, 3.7549249e-08,
                -0.723485351, 1.21440455e-10, 0.690339744
            )
            camera.CFrame = CFrame.new(
                709.73938, 8630.31152, 616.046509,
                -0.474529266, -0.866866887, 0.152852073,
                0,            0.173648238, 0.98480773,
                -0.880239725, 0.467320085, -0.0824011713
            )
            task.wait(1)
            VirtualUser:SetKeyDown("e")
            task.wait(2)
            VirtualUser:SetKeyUp("e")
            task.wait(10)
        end
    end,
})

local Button = Tab:CreateButton({
   Name = "Open Infinite Yield",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
})

local Button = Tab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
        Rayfield:Destroy()
        end,
})
