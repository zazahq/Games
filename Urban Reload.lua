

local repo = "https://raw.githubusercontent.com/SETHHHX/Zex-Ui-Lib/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "Lunar",
    Subtitle = "Urban Reload!",
    Footer = "ZEX HUB",
    Icon = 99631978572502,
    NotifySide = "Right",
    ShowCustomCursor = false,
    DisableSearch = true,
    DisableNotificationBell = true,
    Center = true,
    AutoShow = true,
    Closable = true,
    Minimizable = true,
    MobileToggleIcon = 99631978572502,
    MobileToggleSize = 54,
    ShowMobileButtons = true,
    Snow = true,
    SnowCount = 28,
})

-------------------------------------------------
-- TABS
-------------------------------------------------
local Tabs = {
    Main = Window:AddTab("Main", "crosshair"),
    Visuals = Window:AddTab("Visuals", "eye"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-------------------------------------------------
-- MAIN TAB
-------------------------------------------------
local CombatBox = Tabs.Main:AddGroupbox({
    Side = "Left",
    Name = "Combat",
    IconName = "swords",
})

CombatBox:AddToggle("NoRecoil", {
    Text = "No Recoil",
    Default = false,
    Tooltip = "Removes camera shake / recoil",
})

CombatBox:AddToggle("NoSpread", {
    Text = "No Spread",
    Default = false,
    Tooltip = "Removes bullet bloom / spread",
})

local AimbotBox = Tabs.Main:AddGroupbox({
    Side = "Right",
    Name = "Aimbot",
    IconName = "target",
})

AimbotBox:AddToggle("AimbotEnabled", {
    Text = "Enable Aimbot",
    Default = false,
})

AimbotBox:AddToggle("AimbotToggleMode", {
    Text = "Toggle Mode",
    Default = false,
    Tooltip = "Click once to lock, click again to unlock",
})

AimbotBox:AddToggle("AimbotSticky", {
    Text = "Sticky Aim",
    Default = true,
    Tooltip = "Keeps locking the same target",
})

AimbotBox:AddToggle("AimbotTeamCheck", {
    Text = "Team Check",
    Default = false,
})

AimbotBox:AddToggle("AimbotVisibleCheck", {
    Text = "Visible Check",
    Default = false,
})

AimbotBox:AddDropdown("AimbotPart", {
    Values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"},
    Default = 1,
    Text = "Target Part",
})

AimbotBox:AddSlider("AimbotFOV", {
    Text = "FOV",
    Default = 120,
    Min = 10,
    Max = 400,
    Rounding = 0,
})

AimbotBox:AddToggle("ShowFOV", {
    Text = "Show FOV",
    Default = false,
})

AimbotBox:AddToggle("AimbotSmooth", {
    Text = "Smooth Aim",
    Default = true,
})

AimbotBox:AddSlider("AimbotSmoothness", {
    Text = "Smoothness",
    Default = 0.18,
    Min = 0.01,
    Max = 1,
    Rounding = 2,
})

AimbotBox:AddSlider("AimbotPrediction", {
    Text = "Prediction",
    Default = 0.12,
    Min = 0,
    Max = 0.5,
    Rounding = 2,
})

AimbotBox:AddLabel("Aimbot Key"):AddKeyPicker("AimbotKey", {
    Default = "MB2",
    Mode = "Toggle",
    Text = "Aimbot Key",
})

-------------------------------------------------
-- VISUALS TAB
-------------------------------------------------
local ESPBox = Tabs.Visuals:AddGroupbox({
    Side = "Left",
    Name = "ESP",
    IconName = "users",
})

ESPBox:AddToggle("ESPEnabled", {
    Text = "Enable ESP",
    Default = false,
})

ESPBox:AddToggle("ESPBox", {
    Text = "Box",
    Default = true,
})

ESPBox:AddToggle("ESPName", {
    Text = "Name",
    Default = true,
})

ESPBox:AddToggle("ESPHealth", {
    Text = "Health Bar",
    Default = true,
})

ESPBox:AddToggle("ESPDistance", {
    Text = "Distance",
    Default = true,
})

ESPBox:AddToggle("ESPTracer", {
    Text = "Tracer",
    Default = false,
})

ESPBox:AddToggle("ESPTeamCheck", {
    Text = "Team Check",
    Default = true,
})

ESPBox:AddSlider("ESPMaxDistance", {
    Text = "Max Distance",
    Default = 1500,
    Min = 100,
    Max = 5000,
    Rounding = 0,
})

local ColorBox = Tabs.Visuals:AddGroupbox({
    Side = "Right",
    Name = "Colors",
    IconName = "palette",
})

ColorBox:AddLabel("Enemy Color"):AddColorPicker("EnemyColor", {
    Default = Color3.fromRGB(255, 70, 70),
    Title = "Enemy",
})

ColorBox:AddLabel("Team Color"):AddColorPicker("TeamColor", {
    Default = Color3.fromRGB(70, 255, 120),
    Title = "Team",
})

ColorBox:AddLabel("Box Color"):AddColorPicker("BoxColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Box",
})

ColorBox:AddLabel("Name Color"):AddColorPicker("NameColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Name",
})

ColorBox:AddLabel("FOV Color"):AddColorPicker("FOVColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "FOV Circle",
})

-------------------------------------------------
-- UI SETTINGS
-------------------------------------------------
local MenuGroup = Tabs["UI Settings"]:AddGroupbox({
    Side = "Left",
    Name = "Menu",
    IconName = "wrench"
})

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(value)
        Library.KeybindFrame.Visible = value
    end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = Library.ShowCustomCursor,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})
MenuGroup:AddToggle("AlwaysOnTop", {
    Text = "Always On Top",
    Default = Window.AlwaysOnTop,
    Callback = function(Value)
        Window:SetAlwaysOnTop(Value)
    end,
})
MenuGroup:AddToggle("SnowEffect", {
    Text = "Snow Background",
    Default = true,
    Tooltip = "Falling snowflakes behind the UI",
    Callback = function(Value)
        if Window.SetSnowEnabled then
            Window:SetSnowEnabled(Value)
        end
    end,
})
MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end,
})
MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Text = "DPI Scale",
    Callback = function(Value)
        Value = tostring(Value or "100%"):gsub("%%", "")
        local DPI = tonumber(Value) or 100
        Library:SetDPIScale(DPI)
    end,
})

do
    local dpiValue = Options.DPIDropdown and Options.DPIDropdown.Value
    if typeof(dpiValue) == "table" then
        for k, v in dpiValue do
            if v == true then
                dpiValue = k
                break
            elseif typeof(k) == "number" then
                dpiValue = v
                break
            end
        end
    end
    if typeof(dpiValue) == "string" then
        local cleaned = dpiValue:gsub("%%", "")
        Library:SetDPIScale(tonumber(cleaned) or 100)
    elseif typeof(dpiValue) == "number" then
        Library:SetDPIScale(dpiValue)
    end
end

MenuGroup:AddSlider("UICornerSlider", {
    Text = "Corner Radius",
    Default = Library.CornerRadius,
    Min = 0,
    Max = 20,
    Rounding = 0,
    Callback = function(value)
        Window:SetCornerRadius(value)
    end
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = true,
    Text = "Menu keybind"
})

MenuGroup:AddButton("Unload", function()
    Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

if SaveManager.Ignore then
    for _, Key in {
        "BackgroundColor", "MainColor", "AccentColor", "OutlineColor",
        "FontColor", "FontFace", "BackgroundImage",
        "ThemeManager_ThemeList", "ThemeManager_CustomThemeList",
        "ThemeManager_CustomThemeName", "ThemeManager_ThemeJSON",
    } do
        SaveManager.Ignore[Key] = nil
    end
end

SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("ZexHub")
SaveManager:SetFolder("ZexHub/WeaponClient")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

task.defer(function()
    local dpiValue = Options.DPIDropdown and Options.DPIDropdown.Value
    if typeof(dpiValue) == "table" then
        for k, v in dpiValue do
            if v == true then
                dpiValue = k
                break
            elseif typeof(k) == "number" then
                dpiValue = v
                break
            end
        end
    end
    if typeof(dpiValue) == "string" then
        local cleaned = dpiValue:gsub("%%", "")
        Library:SetDPIScale(tonumber(cleaned) or 100)
    elseif typeof(dpiValue) == "number" then
        Library:SetDPIScale(dpiValue)
    end

    if Window.SetSnowEnabled then
        local snowOn = true
        if Toggles and Toggles.SnowEffect then
            snowOn = Toggles.SnowEffect.Value == true
        end
        Window:SetSnowEnabled(false)
        task.wait()
        Window:SetSnowEnabled(snowOn)
    end
end)

-------------------------------------------------
-- LOGIC
-------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local ClientState, Config
pcall(function()
    ClientState = require(ReplicatedStorage.Weapons.ClientState)
    Config = require(ReplicatedStorage.Weapons.Config)
end)

-- No Recoil + No Spread
local function applyCombat()
    if not ClientState or not Config then return end

    if Toggles.NoSpread and Toggles.NoSpread.Value then
        Config.Global.BloomScale = 0
        ClientState.SpreadMultiplier = 0
    end

    if Toggles.NoRecoil and Toggles.NoRecoil.Value then
        local key = ClientState.RecoilKey and ClientState.RecoilKey()
        if key then
            rawset(ClientState, key, function() end)
        end
        ClientState.ScopeShake = nil
    end
end

RunService:BindToRenderStep("ZexNoRecoil", Enum.RenderPriority.Camera.Value + 10, function()
    if Toggles.NoRecoil and Toggles.NoRecoil.Value then
        local cam = workspace.CurrentCamera
        if cam then
            local cf = cam.CFrame
            cam.CFrame = CFrame.lookAt(cf.Position, cf.Position + cf.LookVector)
        end
    end
    applyCombat()
end)

-- FOV + Aimbot
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 64
FOVCircle.Filled = false
FOVCircle.Visible = false

local currentTarget = nil
local toggleActive = false
local savedCameraCF = nil
local isAiming = false

local function isValidTarget(part)
    if not part or not part.Parent then return false end
    local char = part.Parent
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return false end
    return true
end

local function getClosest()
    if Toggles.AimbotSticky.Value and currentTarget and isValidTarget(currentTarget) then
        return currentTarget
    end

    local closest, best = nil, Options.AimbotFOV.Value
    local mouse = UserInputService:GetMouseLocation()
    local origin = Camera.CFrame.Position

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr == LocalPlayer then continue end
        if Toggles.AimbotTeamCheck.Value and plr.Team == LocalPlayer.Team then continue end

        local char = plr.Character
        if not char then continue end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then continue end

        local part = char:FindFirstChild(Options.AimbotPart.Value) or char:FindFirstChild("Head")
        if not part then continue end

        local pos = part.Position
        if Options.AimbotPrediction.Value > 0 then
            pos = pos + (part.AssemblyLinearVelocity or Vector3.zero) * Options.AimbotPrediction.Value
        end

        local screen, onScreen = Camera:WorldToViewportPoint(pos)
        if not onScreen then continue end

        local dist = (Vector2.new(screen.X, screen.Y) - mouse).Magnitude
        if dist < best then
            if Toggles.AimbotVisibleCheck.Value then
                local params = RaycastParams.new()
                params.FilterType = Enum.RaycastFilterType.Exclude
                params.FilterDescendantsInstances = {LocalPlayer.Character}
                local hit = workspace:Raycast(origin, (pos - origin).Unit * (pos - origin).Magnitude, params)
                if hit and not hit.Instance:IsDescendantOf(char) then continue end
            end
            closest = part
            best = dist
        end
    end

    currentTarget = closest
    return closest
end

Options.AimbotKey:OnClick(function()
    if Toggles.AimbotToggleMode.Value then
        toggleActive = not toggleActive
        if not toggleActive then
            currentTarget = nil
            isAiming = false
        end
    end
end)

-- Main aimbot loop - high priority so it overrides camera input
RunService:BindToRenderStep("ZexAimbot", Enum.RenderPriority.Camera.Value + 5, function()
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Radius = Options.AimbotFOV.Value
    FOVCircle.Visible = Toggles.ShowFOV.Value and Toggles.AimbotEnabled.Value
    FOVCircle.Color = Options.FOVColor.Value

    local shouldAim = false
    if Toggles.AimbotEnabled.Value then
        if Toggles.AimbotToggleMode.Value then
            shouldAim = toggleActive
        else
            shouldAim = Options.AimbotKey:GetState()
        end
    end

    if shouldAim then
        if not isAiming then
            -- just started aiming, save current camera
            savedCameraCF = Camera.CFrame
            isAiming = true
        end

        local target = getClosest()
        if target then
            local goalPos = target.Position
            if Options.AimbotPrediction.Value > 0 then
                goalPos = goalPos + (target.AssemblyLinearVelocity or Vector3.zero) * Options.AimbotPrediction.Value
            end

            local camPos = Camera.CFrame.Position
            local newCF = CFrame.lookAt(camPos, goalPos)

            if Toggles.AimbotSmooth.Value then
                Camera.CFrame = Camera.CFrame:Lerp(newCF, Options.AimbotSmoothness.Value)
            else
                Camera.CFrame = newCF
            end
        end
    else
        if isAiming then
            -- just stopped aiming
            isAiming = false
            currentTarget = nil
            -- do NOT force savedCameraCF, let the game take control again naturally
        end
    end
end)

-- ESP
local ESPObjects = {}

local function createESP(plr)
    if ESPObjects[plr] then return end

    local box = Drawing.new("Square")
    box.Thickness = 1
    box.Filled = false
    box.Visible = false

    local name = Drawing.new("Text")
    name.Size = 13
    name.Center = true
    name.Outline = true
    name.Visible = false

    local health = Drawing.new("Line")
    health.Thickness = 2
    health.Visible = false

    local tracer = Drawing.new("Line")
    tracer.Thickness = 1
    tracer.Visible = false

    local dist = Drawing.new("Text")
    dist.Size = 12
    dist.Center = true
    dist.Outline = true
    dist.Visible = false

    ESPObjects[plr] = {
        Box = box,
        Name = name,
        Health = health,
        Tracer = tracer,
        Dist = dist
    }
end

local function removeESP(plr)
    if ESPObjects[plr] then
        for _, v in pairs(ESPObjects[plr]) do
            pcall(function() v:Remove() end)
        end
        ESPObjects[plr] = nil
    end
end

Players.PlayerAdded:Connect(createESP)
Players.PlayerRemoving:Connect(removeESP)

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        createESP(plr)
    end
end

RunService.RenderStepped:Connect(function()
    if not Toggles.ESPEnabled.Value then
        for _, data in pairs(ESPObjects) do
            for _, v in pairs(data) do
                v.Visible = false
            end
        end
        return
    end

    for plr, data in pairs(ESPObjects) do
        local char = plr.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local root = char and char:FindFirstChild("HumanoidRootPart")

        if not (char and hum and root and hum.Health > 0) then
            for _, v in pairs(data) do v.Visible = false end
            continue
        end

        if Toggles.ESPTeamCheck.Value and plr.Team == LocalPlayer.Team then
            for _, v in pairs(data) do v.Visible = false end
            continue
        end

        local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
        local distance = (root.Position - Camera.CFrame.Position).Magnitude

        if not onScreen or distance > Options.ESPMaxDistance.Value then
            for _, v in pairs(data) do v.Visible = false end
            continue
        end

        local size = char:GetExtentsSize()
        local top = Camera:WorldToViewportPoint(root.Position + Vector3.new(0, size.Y/2, 0))
        local bottom = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, size.Y/2, 0))
        local height = math.abs(top.Y - bottom.Y)
        local width = height / 1.8

        local isEnemy = plr.Team ~= LocalPlayer.Team
        local color = isEnemy and Options.EnemyColor.Value or Options.TeamColor.Value

        if Toggles.ESPBox.Value then
            data.Box.Size = Vector2.new(width, height)
            data.Box.Position = Vector2.new(pos.X - width/2, pos.Y - height/2)
            data.Box.Color = Options.BoxColor.Value
            data.Box.Visible = true
        else
            data.Box.Visible = false
        end

        if Toggles.ESPName.Value then
            data.Name.Text = plr.DisplayName or plr.Name
            data.Name.Position = Vector2.new(pos.X, pos.Y - height/2 - 16)
            data.Name.Color = Options.NameColor.Value
            data.Name.Visible = true
        else
            data.Name.Visible = false
        end

        if Toggles.ESPHealth.Value then
            local pct = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
            data.Health.From = Vector2.new(pos.X - width/2 - 5, pos.Y + height/2)
            data.Health.To = Vector2.new(pos.X - width/2 - 5, pos.Y + height/2 - height * pct)
            data.Health.Color = Color3.fromRGB(255 * (1 - pct), 255 * pct, 0)
            data.Health.Visible = true
        else
            data.Health.Visible = false
        end

        if Toggles.ESPDistance.Value then
            data.Dist.Text = math.floor(distance) .. "m"
            data.Dist.Position = Vector2.new(pos.X, pos.Y + height/2 + 4)
            data.Dist.Color = Color3.fromRGB(200, 200, 200)
            data.Dist.Visible = true
        else
            data.Dist.Visible = false
        end

        if Toggles.ESPTracer.Value then
            data.Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
            data.Tracer.To = Vector2.new(pos.X, pos.Y)
            data.Tracer.Color = color
            data.Tracer.Visible = true
        else
            data.Tracer.Visible = false
        end
    end
end)

Library:Notify({
    Title = "ZEX HUB",
    Description = "Loaded",
    Time = 3,
})
