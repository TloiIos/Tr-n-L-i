local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- =============================================
-- KEY SYSTEM SIMPLIFIED (Chỉ Nhập Key)
-- =============================================

local HttpService = game:GetService("HttpService")
local Player = game:GetService("Players").LocalPlayer

local FIREBASE_URL = "https://aurora-sever-default-rtdb.asia-southeast1.firebasedatabase.app/keys/keys.json"

--========================
-- GET KEY DATABASE
--========================

local function GetKeyDatabase()

    local success, response = pcall(function()
        return game:HttpGet(FIREBASE_URL)
    end)

    if success and response and response ~= "null" then
        return HttpService:JSONDecode(response)
    end

    return {}
end

--========================
-- GET REMOTE KEYS
--========================

local function GetRemoteKeys()

    local data = GetKeyDatabase()
    local keys = {}

    for key, info in pairs(data) do

        if info.status == "Active" then
            table.insert(keys, key)
        end
    end

    return keys
end

--========================
-- AUTO LOAD SAVED KEY
--========================

local SavedKey = nil

pcall(function()

    if isfile("AuroraKey.txt") then

        SavedKey = readfile("AuroraKey.txt")

    end
end)

--========================
-- LOAD RAYFIELD
--========================

local Rayfield = loadstring(
    game:HttpGet('https://sirius.menu/rayfield')
)()

local Window = Rayfield:CreateWindow({

    Name = "Aurora Elite V50",

    LoadingTitle = "💠 AURORA PREMIUM SYSTEM",

    LoadingSubtitle = "by Thành Lợi Dev",

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AuroraHub"
    },

    KeySystem = true,

    KeySettings = {

        Title = "🔑 NHẬP KEY",

        Subtitle = "Xin chào: " .. Player.Name,

        Note = "Telegram: t.me/thanhloidev",

        FileName = "AuroraKey",

        SaveKey = false,

        GrabKeyFromSite = false,

        Key = GetRemoteKeys()
    },

    Theme = "AmberGlow"
})

--========================
-- SAVE KEY
--========================

pcall(function()

    local enteredKey = Rayfield.Key

    if enteredKey and enteredKey ~= "" then

        writefile("AuroraKey.txt", enteredKey)

    end
end)

--========================
-- NOTIFY
--========================

Rayfield:Notify({

    Title = "✅ ĐĂNG NHẬP THÀNH CÔNG",

    Content = "Welcome " .. Player.Name,

    Duration = 5
})
print("✅ Aurora Elite V50 Loaded Successfully!")
-- //====================================================
-- // SIÊU BẢO VỆ: CHẶN KICK & ANTI-BAC (FIX LỖI 267)
-- //====================================================
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local remoteName = tostring(self)

    if not checkcaller() then
        -- 1. Chặn tất cả Remote báo cáo (Fix lỗi Bytecode & Flag)
        if (method == "FireServer" or method == "InvokeServer") and 
           (remoteName:find("BAC") or remoteName:find("Alpha") or remoteName:find("Anticheat") or 
            remoteName:find("Check") or remoteName:find("Detect") or remoteName:find("Flag")) then
            
            warn("🛡️ [AURORA PROTECT] Đã chặn báo cáo: " .. remoteName)
            return nil
        end

        -- 2. AUTO UNBAN: Chặn lệnh Kick trực tiếp từ Server (Fix Lỗi 267)
        if method == "Kick" or method == "kick" then
            Rayfield:Notify({
                Title = "🛡️ CẢNH BÁO NGUY HIỂM",
                Content = "Hệ thống BAC Alpha-3B vừa cố gắng Kick bạn nhưng đã bị chặn đứng!",
                Duration = 10,
                Image = 4483362458
            })
            return nil
        end
    end

    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

-- //====================================================
-- // HỆ THỐNG QUÉT & VÔ HIỆU HÓA ANTICHEAT NGẦM
-- //====================================================
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("LocalScript") then
                    local name = v.Name:lower()
                    if name:find("bac") or name:find("anticheat") or name:find("guard") then
                        if not v.Disabled then 
                            v.Disabled = true 
                            warn("🛡️ Đã vô hiệu hóa script quét: " .. v.Name)
                        end
                    end
                end
            end
        end)
    end
end)

Rayfield:Notify({
    Title = "✅ KÍCH HOẠT THÀNH CÔNG",
    Content = "Chế độ Ultra Bypass đã hoạt động. Chúc bạn chơi game vui vẻ!",
    Duration = 5
})
-- [[ KHỞI TẠO BIẾN TOÀN CỤC ]]
_G.Skeleton_Enabled = false
_G.HealthBar_ESP = false
_G.Distance_ESP = false
_G.NameESP_Enabled = false
_G.Aimbot_Enabled = false
_G.Aimbot_FOV = 250
_G.Aim_Smoothness = 0.5 
_G.BoxESP_Active = false
_G.Tracers_Enabled = false
_G.Fly = false
_G.Crosshair_Size = 10
_G.FlySpeed = 15
_G.FlyHeight = 0
_G.AntiFlash_Enabled = false
_G.SilentAim_Enabled = false
_G.SilentAim_HitChance = 100  -- % trúng (có thể chỉnh 80-100)
_G.SilentAim_Part = "Head"    -- Head hoặc HumanoidRootPart
_G.ShowEnemyCount = false
_G.AntiSmoke_Enabled = false
_G.NameESP_Enabled = false
_G.Wallhack_Enabled = false
_G.NameSize = 14
_G.Noclip_Enabled = false
_G.TriggerBot_Enabled = false
_G.TriggerBot_Delay = 0.01 -- Độ trễ trước khi bắn (giây)
_G.NameColor = Color3.fromRGB(255, 255, 255)
_G.InfAmmo = true
_G.FastReload = true
_G.NoSpread = true
_G.SilentAim_NoHook = true
_G.HitChance = 100
_G.MobileFly = false
 _G.MobileFlySpeed = 10
 _G.NoRecoil_Enabled = false
 _G.FastFire = false
 _G.RapidFire_Enabled = false
_G.RapidFire_Delay = 0.035
_G.BoxType = 1           -- 1: Corner Box | 2: Full Box | 3: Top + Bottom Line
_G.AimbotMode = 1        -- 1: AimFOV | 2: Aim360 | 3: Aim180
_G.AimFire_Enabled = false   -- Chỉ aim khi đang bắn
_G.AutoAimShoot_Enabled = false -- Auto ADS + bắn (kiểu BloxStrike)
_G.AutoAimShoot_Delay = 0.1 
_G.WeaponESP_Enabled = false
_G.Radar_Enabled = false -- Mặc định tắt
_G.TPToEnemy_VIP = false
_G.TPSpeed = 0.25
_G.TPDistance = -3
_G.TPDelay = 12
_G.TeamCheck = true
_G.TPMode = "Behind"
_G.TracerStyle = "Center"
_G.AntiBan_Master = true       -- Tổng hợp bảo vệ
_G.AntiRubberband = true      -- Chống kéo lại
_G.AntiStateBan = true        -- Chống ban do trạng thái "Bay"
_G.NetworkOwner_Bypass = true
_G.BunnyHop_Enabled = false
_G.BunnyHop_Speed = 1.4      -- Tốc độ nhảy (càng cao càng nhanh)
_G.Strafe_Enabled = true
_G.Strafe_Strength = 35      -- Độ mạnh lượn trái phải
_G.StreamMode = false
_G.FastDash = false
_G.DashSpeed = 15
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

--// SETTINGS
_G.NoSmoke = false
_G.NoFlash = false
local LastToggle = 0
local CurrentX = 0
local CurrentY = 0
local FOVSlider
local Cache = {}
local HorizontalLine = Drawing.new("Line") -- Fix lỗi nil line
local VerticalLine = Drawing.new("Line")
local isRespawning = false
local isShooting = false
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local StatusLabel = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")

ScreenGui.Name = "MiniTP_Status"
ScreenGui.Parent = game:GetService("CoreGui") 
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(1, -160, 1, -70)
MainFrame.Size = UDim2.new(0, 150, 0, 60)
MainFrame.Active = true
MainFrame.Draggable = true 

Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0.4, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "TELEPORT VIP"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

StatusLabel.Parent = MainFrame
StatusLabel.Position = UDim2.new(0, 0, 0.4, 0)
StatusLabel.Size = UDim2.new(1, 0, 0.6, 0)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = "STATUS: OFF"
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.TextSize = 18

local function UpdateUI()
    if _G.TPToEnemy_VIP then
        StatusLabel.Text = "STATUS: ON"
        StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
    else
        StatusLabel.Text = "STATUS: OFF"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end

local Scanner = { EnemyFolder = nil }
function Scanner:GetFolder()
    pcall(function()
        local groups = {"Terrorists", "Counter-Terrorists", "T", "CT", "Police", "Criminals"}
        for _, n in pairs(groups) do
            local f = workspace:FindFirstChild(n, true)
            if f and (f:IsA("Folder") or f:IsA("Model")) then
                if not LocalPlayer.Character or not LocalPlayer.Character:IsDescendantOf(f) then
                    self.EnemyFolder = f
                end
            end
        end
    end)
end

function Scanner:IsEnemy(p)
    local char = p.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not p or p == LocalPlayer or not char or not hum or hum.Health <= 0 then return false end
    if self.EnemyFolder and char:IsDescendantOf(self.EnemyFolder) then return true end
    return p.TeamColor ~= LocalPlayer.TeamColor
end

-- [[ HÀM DRAWING ]]
local function CreateDrawing(class, props)
    local success, drawing = pcall(function()
        local d = Drawing.new(class)
        
        -- Default values theo loại
        if class == "Text" then
            d.Text = " "
            d.Size = 14
            d.Center = true
            d.Outline = true
            d.Font = 2
            d.Visible = false
        elseif class == "Line" then
            d.Thickness = 1.5
            d.Transparency = 1
            d.Visible = false
        elseif class == "Square" then
            d.Thickness = 1.5
            d.Filled = false
            d.Transparency = 1
            d.Visible = false
        end
        
        -- Áp dụng props người dùng truyền vào
        if props then
            for property, value in pairs(props) do
                pcall(function()
                    d[property] = value
                end)
            end
        end
        
        return d
    end)
    
    if not success then
        warn("[CreateDrawing] Lỗi tạo Drawing:", class)
        return nil
    end
    
    return drawing
end

local function CreateESP(p)
    if Cache[p] then return end
    
    Cache[p] = {
        Box = CreateDrawing("Square", {Thickness = 1.5, Filled = false, Color = Color3.new(1,1,1)}),
        
        Corners = {
            CreateDrawing("Line"), CreateDrawing("Line"),
            CreateDrawing("Line"), CreateDrawing("Line"),
            CreateDrawing("Line"), CreateDrawing("Line"),
            CreateDrawing("Line"), CreateDrawing("Line")
        },
        
        Line = CreateDrawing("Line", {Thickness = 2, Color = Color3.new(1,1,1)}),           -- Tracers
        TopLine = CreateDrawing("Line", {Thickness = 1.5, Color = Color3.new(1,1,1)}),      -- Box Type 3
        BottomLine = CreateDrawing("Line", {Thickness = 1.5, Color = Color3.new(1,1,1)}),
        
        WeaponText = CreateDrawing("Text", {Size = 13, Center = true, Outline = true, Color = Color3.fromRGB(255, 140, 0)}),
        NameTag = CreateDrawing("Text", {Size = 14, Center = true, Outline = true, Color = Color3.new(1,1,1)}),
        DistanceText = CreateDrawing("Text", {Size = 13, Center = true, Outline = true, Color = Color3.new(1,1,1)}),
        
        HealthBarOutline = CreateDrawing("Square", {Thickness = 1, Filled = false, Color = Color3.new(0,0,0)}),
        HealthBar = CreateDrawing("Square", {Thickness = 1, Filled = true}),
        
        AlertText = CreateDrawing("Text", {Size = 16, Center = true, Outline = true, Color = Color3.fromRGB(255, 0, 0)})
    }
    
    -- Skeleton
    Cache[p].Skeleton = {}
    for i = 1, 12 do
        Cache[p].Skeleton[i] = CreateDrawing("Line", {Thickness = 1.5})
    end
end


local function SetVisible(vis, bool)
    if not vis then return end
    pcall(function()
        if vis.Box then vis.Box.Visible = bool end
        if vis.Line then vis.Line.Visible = bool end
        if vis.TopLine then vis.TopLine.Visible = bool end
        if vis.BottomLine then vis.BottomLine.Visible = bool end
        if vis.WeaponText then vis.WeaponText.Visible = bool end
        if vis.NameTag then vis.NameTag.Visible = bool end
        if vis.DistanceText then vis.DistanceText.Visible = bool end
        if vis.HealthBar then vis.HealthBar.Visible = bool end
        if vis.HealthBarOutline then vis.HealthBarOutline.Visible = bool end
        if vis.AlertText then vis.AlertText.Visible = bool end

        if vis.Corners then
            for _, c in pairs(vis.Corners) do if c then c.Visible = bool end end
        end
        if vis.Skeleton then
            for _, b in pairs(vis.Skeleton) do if b then b.Visible = bool end end
        end
    end)
end

-- ==================== RADAR SYSTEM GUI ====================
local RadarFrame = Instance.new("Frame")
local RadarCorner = Instance.new("UICorner")
local RadarCenter = Instance.new("Frame") -- Điểm trung tâm (người chơi)
local RadarTitle = Instance.new("TextLabel")

RadarFrame.Name = "Radar"
RadarFrame.Parent = Rayfield.Gui
RadarFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
RadarFrame.BackgroundTransparency = 0.5
RadarFrame.Position = UDim2.new(0, 20, 0, 250) -- Vị trí trên màn hình
RadarFrame.Size = UDim2.new(0, 150, 0, 150) -- Kích thước bảng radar
RadarFrame.Visible = true

RadarCorner.CornerRadius = UDim.new(1, 0) -- Làm radar hình tròn
RadarCorner.Parent = RadarFrame

RadarTitle.Parent = RadarFrame
RadarTitle.Text = "RADAR"
RadarTitle.Size = UDim2.new(1, 0, 0, 20)
RadarTitle.BackgroundTransparency = 1
RadarTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
RadarTitle.TextSize = 10
RadarTitle.Font = Enum.Font.Code

RadarCenter.Name = "CenterPoint"
RadarCenter.Parent = RadarFrame
RadarCenter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadarCenter.Position = UDim2.new(0.5, -2, 0.5, -2)
RadarCenter.Size = UDim2.new(0, 4, 0, 4) -- Chấm nhỏ ở giữa

local RadarDots = {} -- Lưu trữ các chấm kẻ địch

local function GetJoints(char)
    if char:FindFirstChild("UpperTorso") then
        return {
            {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
            {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"},
            {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"},
            {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"},
            {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}
        }
    else
        return {
            {"Head", "Torso"}, {"Torso", "Left Arm"}, {"Torso", "Right Arm"},
            {"Torso", "Left Leg"}, {"Torso", "Right Leg"}
        }
    end
end

-- ==================== CẬP NHẬT RADAR ====================
local function UpdateRadar(p, char, root)
    if not _G.Radar_Enabled then 
        if RadarDots[p] then RadarDots[p].Visible = false end
        return 
    end

    if not RadarDots[p] then
        local dot = Instance.new("Frame")
        dot.Name = p.Name .. "_Dot"
        dot.Parent = RadarFrame
        dot.Size = UDim2.new(0, 4, 0, 4)
        dot.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ cho địch
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        RadarDots[p] = dot
    end

    local dot = RadarDots[p]
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    
    if myRoot and root and Scanner:IsEnemy(p) then
        -- Tính toán khoảng cách tương đối
        local relPos = Camera.CFrame:PointToObjectSpace(root.Position)
        local distance = Vector2.new(relPos.X, relPos.Z)
        local radarScale = 2 -- Độ nhạy của radar

        local posX = 0.5 + (distance.X / (RadarFrame.Size.X.Offset * radarScale))
        local posY = 0.5 + (distance.Y / (RadarFrame.Size.Y.Offset * radarScale))

        -- Giới hạn chấm nằm trong vòng tròn radar
        if posX >= 0 and posX <= 1 and posY >= 0 and posY <= 1 then
            dot.Visible = true
            dot.Position = UDim2.new(posX, -2, posY, -2)
        else
            dot.Visible = false
        end
    else
        dot.Visible = false
    end
end

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1.5
FOVCircle.NumSides = 100
FOVCircle.Filled = false
FOVCircle.Visible = false
FOVCircle.Color = Color3.fromRGB(0, 136, 204)

local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Exclude

-- Ít điểm hơn nhưng vẫn detect tốt
local Offsets = {
    Vector3.new(0, 0, 0),
    Vector3.new(0.28, 0, 0),
    Vector3.new(-0.28, 0, 0),
    Vector3.new(0, 0.28, 0),
    Vector3.new(0, -0.28, 0),
}

local function IsPartVisible(part, character)
    if not _G.WallCheck then
        return true
    end

    local origin = Camera.CFrame.Position

    -- Update filter thôi, không tạo mới
    RayParams.FilterDescendantsInstances = {
        LocalPlayer.Character,
        character,
        Camera
    }

    local partPos = part.Position

    for i = 1, #Offsets do
        local point = partPos + Offsets[i]

        local ray = workspace:Raycast(
            origin,
            point - origin,
            RayParams
        )

        -- Không hit gì => visible
        if not ray then
            return true
        end

        -- Hit đúng enemy
        if ray.Instance and ray.Instance:IsDescendantOf(character) then
            return true
        end
    end

    return false
end

-- [[ FIX NOCLIP - KHÔNG CHẾT KHI XUYÊN TƯỜNG ]]
RunService.Stepped:Connect(function()

    local mousePos = UserInputService:GetMouseLocation()
    local Center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    local enemyCount = 0
    local myChar = LocalPlayer.Character
    local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
    local Alive = myChar and myHum and myHum.Health > 0 and myChar:FindFirstChild("Head")
   local ClosestMag = (_G.AimbotMode == 1) and (_G.Aimbot_FOV or 250) or math.huge
    if _G.Aimbot_Enabled and _G.AimbotMode == 1 then
        FOVCircle.Visible = true
        FOVCircle.Radius = _G.Aimbot_FOV or 100
        FOVCircle.Position = mousePos
    else
        FOVCircle.Visible = false
    end

    if not Alive then
        for _, p in pairs(Players:GetPlayers()) do
            if Cache[p] then SetVisible(Cache[p], false) end
        end
        return
    end

    local BestTarget = nil
    local ClosestMag = _G.Aimbot_FOV or 300
    local isShooting = false -- dùng cho AimFire

    Scanner:GetFolder()

    -- Crosshair
    if _G.Aimbot_Enabled then
        local sz = _G.Crosshair_Size or 10
        HorizontalLine.Visible, VerticalLine.Visible = true, true
        HorizontalLine.From = Vector2.new(Center.X - sz, Center.Y)
        HorizontalLine.To = Vector2.new(Center.X + sz, Center.Y)
        VerticalLine.From = Vector2.new(Center.X, Center.Y - sz)
        VerticalLine.To = Vector2.new(Center.X, Center.Y + sz)
    else
        HorizontalLine.Visible, VerticalLine.Visible = false, false
    end
         local anyNear = false
   for _, p in pairs(Players:GetPlayers()) do
        if p == LocalPlayer then continue end
        
        if char and root then
            UpdateRadar(p, char, root)
        end

        if not Cache[p] then 
            CreateESP(p) 
            continue 
        end
        
        local vis = Cache[p]
        if not vis.AlertText or not vis.Box then continue end
     
        local char = p.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local head = char and char:FindFirstChild("Head")
        local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("LowerTorso"))
        
        if not Scanner:IsEnemy(p) or not char or not hum or hum.Health <= 0 then
            SetVisible(vis, false)
            continue
        end

        local head = char:FindFirstChild("Head")
        local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("LowerTorso")

        if head and root then
            local headPos, headOnScreen = Camera:WorldToViewportPoint(head.Position)
            local rootPos, rootOnScreen = Camera:WorldToViewportPoint(root.Position)
            local dist = (Camera.CFrame.Position - head.Position).Magnitude
                
           if headOnScreen or _G.AimbotMode == 2 then
                enemyCount = enemyCount + 1
                
                local isVisible = true
                pcall(function()
                    local params = RaycastParams.new()
                    params.FilterDescendantsInstances = {myChar, char}
                    params.FilterType = Enum.RaycastFilterType.Exclude
                    local ray = workspace:Raycast(Camera.CFrame.Position, (head.Position - Camera.CFrame.Position).Unit * dist, params)
                    if ray then isVisible = false end
                end)
                
                 -- GẮN HÀM CHECK TẠI ĐÂY
                local color = isVisible and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
             
               local top = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 2.5, 0))
                local bottom = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
                local h = math.abs(top.Y - bottom.Y)
                local w = h / 2.2
                local x = top.X - w/2
                local y = top.Y

                if _G.BoxESP_Active then
    
    -- Xử lý Corner Box (Type 1)
    if _G.BoxType == 1 then
        vis.Box.Visible = false
        if vis.TopLine then vis.TopLine.Visible = false end
        if vis.BottomLine then vis.BottomLine.Visible = false end
        
        local lineLen = w / 4
        for i = 1, 8 do
            vis.Corners[i].Visible = true
            vis.Corners[i].Color = color
        end
        vis.Corners[1].From = Vector2.new(x, y); vis.Corners[1].To = Vector2.new(x + lineLen, y)
        vis.Corners[2].From = Vector2.new(x, y); vis.Corners[2].To = Vector2.new(x, y + lineLen)
        vis.Corners[3].From = Vector2.new(x + w, y); vis.Corners[3].To = Vector2.new(x + w - lineLen, y)
        vis.Corners[4].From = Vector2.new(x + w, y); vis.Corners[4].To = Vector2.new(x + w, y + lineLen)
        vis.Corners[5].From = Vector2.new(x, y + h); vis.Corners[5].To = Vector2.new(x + lineLen, y + h)
        vis.Corners[6].From = Vector2.new(x, y + h); vis.Corners[6].To = Vector2.new(x, y + h - lineLen)
        vis.Corners[7].From = Vector2.new(x + w, y + h); vis.Corners[7].To = Vector2.new(x + w - lineLen, y + h)
        vis.Corners[8].From = Vector2.new(x + w, y + h); vis.Corners[8].To = Vector2.new(x + w, y + h - lineLen)

    -- Xử lý Full Box (Type 2)
    elseif _G.BoxType == 2 then
        for i = 1, 8 do vis.Corners[i].Visible = false end
        if vis.TopLine then vis.TopLine.Visible = false end
        if vis.BottomLine then vis.BottomLine.Visible = false end
        
        vis.Box.Visible = true
        vis.Box.Color = color
        vis.Box.Position = Vector2.new(x, y)
        vis.Box.Size = Vector2.new(w, h)

    -- Xử lý Top/Bottom Line (Type 3)
    elseif _G.BoxType == 3 then
        for i = 1, 8 do vis.Corners[i].Visible = false end
        vis.Box.Visible = false
        
        if vis.TopLine and vis.BottomLine then
            vis.TopLine.Visible = true
            vis.TopLine.Color = color
            vis.TopLine.From = Vector2.new(x, y)
            vis.TopLine.To = Vector2.new(x + w, y)
            
            vis.BottomLine.Visible = true
            vis.BottomLine.Color = color
            vis.BottomLine.From = Vector2.new(x, y + h)
            vis.BottomLine.To = Vector2.new(x + w, y + h)
        end
    end
else
    -- Nếu tắt BoxESP, chỉ tắt các Drawing liên quan đến Box
    vis.Box.Visible = false
    for i = 1, 8 do vis.Corners[i].Visible = false end
    if vis.TopLine then vis.TopLine.Visible = false end
    if vis.BottomLine then vis.BottomLine.Visible = false end
end

                                 -- ==================== TRACERS (Nhiều Kiểu) ====================
                if _G.Tracers_Enabled then
                    vis.Line.Visible = true
                    vis.Line.Color = color
                    vis.Line.Thickness = 1.8
                    vis.Line.Transparency = 0.65

                    local startPos

                    if _G.TracerStyle == "Center" then
                        startPos = Vector2.new(Center.X, Center.Y)

                    elseif _G.TracerStyle == "Bottom" then
                        startPos = Vector2.new(Center.X, Camera.ViewportSize.Y - 10)

                    elseif _G.TracerStyle == "Top" then
                        startPos = Vector2.new(Center.X, 30)

                    elseif _G.TracerStyle == "Mouse" then
                        startPos = mousePos

                    elseif _G.TracerStyle == "Dynamic" then
                        -- Tự động chọn cạnh gần nhất
                        local screenCenter = Vector2.new(Center.X, Center.Y)
                        local toHead = Vector2.new(headPos.X, headPos.Y)
                        local distToCenter = (toHead - screenCenter).Magnitude
                        
                        if headPos.Y < Center.Y - 100 then
                            startPos = Vector2.new(Center.X, 30)           -- Top
                        elseif headPos.Y > Center.Y + 100 then
                            startPos = Vector2.new(Center.X, Camera.ViewportSize.Y - 10) -- Bottom
                        else
                            startPos = Vector2.new(Center.X, Center.Y)     -- Center
                        end
                    end

                    vis.Line.From = startPos
                    vis.Line.To = Vector2.new(headPos.X, headPos.Y)

                else
                    vis.Line.Visible = false
                end

              if _G.HealthBar_ESP then
                    vis.HealthBarOutline.Visible = true
                    vis.HealthBarOutline.Position = Vector2.new(x - 6, y)
                    vis.HealthBarOutline.Size = Vector2.new(4, h)
                    local hp = hum.Health / hum.MaxHealth
                    vis.HealthBar.Visible = true
                    vis.HealthBar.Position = Vector2.new(x - 6, y + h * (1 - hp))
                    vis.HealthBar.Size = Vector2.new(4, h * hp)
                    vis.HealthBar.Color = Color3.fromHSV(hp * 0.3, 1, 1)
                else
                    vis.HealthBar.Visible = false
                    vis.HealthBarOutline.Visible = false
                end

                -- [ NAME ESP - ĐÃ FIX BIẾN TOP.X ]
                if _G.NameESP_Enabled then
                    vis.NameTag.Visible = true
                    vis.NameTag.Text = p.Name:upper()
                    vis.NameTag.Position = Vector2.new(top.X, y - 20)
                    vis.NameTag.Size = _G.NameSize or 14
                    vis.NameTag.Color = _G.NameColor or Color3.fromRGB(255, 255, 255)
                else
                    vis.NameTag.Visible = false
                end

                -- Distance ESP
                if _G.Distance_ESP then
                    vis.DistanceText.Visible = true
                    vis.DistanceText.Text = string.format("[%dm]", math.floor(dist))
                    vis.DistanceText.Position = Vector2.new(top.X, bottom.Y + 5)
                else
                    vis.DistanceText.Visible = false
                end

                                -- ==================== WEAPON ESP (TÊN SÚNG) ====================
                                -- ==================== WEAPON ESP (TÊN SÚNG) ====================
              -- ==================== WEAPON ESP ====================
                if _G.WeaponESP_Enabled then
                    local weaponName = "Fist"
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        weaponName = tool.Name
                    else
                        for _, obj in pairs(char:GetChildren()) do
                            if obj:IsA("Tool") or obj:FindFirstChild("Handle") then
                                weaponName = obj.Name; break
                            end
                        end
                    end
                    vis.WeaponText.Visible = true
                    vis.WeaponText.Text = "[" .. weaponName .. "]"
                    vis.WeaponText.Position = Vector2.new(top.X, bottom.Y + 22)
                else
                    if vis.WeaponText then vis.WeaponText.Visible = false end
                end

                -- ==================== ALERT SYSTEM (FIXED) ====================
               -- ==================== ALERT SYSTEM (PRO) ====================
-- ==================== HỆ THỐNG CẢNH BÁO CHUẨN (FIXED) ====================

-- Kiểm tra sinh tồn của cả bạn và địch để tự động xóa thông báo
local enemyHum = char:FindFirstChildOfClass("Humanoid")
local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

if enemyHum and enemyHum.Health > 0 and myHum and myHum.Health > 0 then
    if headOnScreen then
        local firing = false
        local tool = char:FindFirstChildOfClass("Tool")
        
        -- Nhận diện địch đang bắn qua âm thanh/hiệu ứng
        if tool then
            for _, v in pairs(tool:GetDescendants()) do
                if (v:IsA("Sound") and v.IsPlaying) or (v:IsA("ParticleEmitter") and v.Enabled) then
                    firing = true; break
                end
            end
        end

        -- Xử lý vị trí cố định trên đầu địch
        local alertPos = Vector2.new(top.X, y - 45) -- Luôn cách đỉnh đầu một khoảng cố định

        if firing then
            vis.AlertText.Visible = true
            vis.AlertText.Text = "⚠️ ĐANG BẮN! ⚠️"
            vis.AlertText.Color = Color3.fromRGB(255, 0, 0)
            vis.AlertText.Position = alertPos 

            -- Âm thanh cảnh báo khi bị tấn công (giới hạn 0.5s để tránh rè)
            if tick() - (vis.LastSoundTime or 0) > 0.5 then 
                local s = Instance.new("Sound", workspace)
                s.SoundId = "rbxassetid://5215612838"; s.Volume = 0.6; s:Play()
                game:GetService("Debris"):AddItem(s, 1)
                vis.LastSoundTime = tick()
            end

        elseif dist < 60 then 
            vis.AlertText.Visible = true
            vis.AlertText.Text = "ĐỊCH Ở GẦN ("..math.floor(dist).."m)"
            vis.AlertText.Color = Color3.fromRGB(255, 255, 0)
            vis.AlertText.Position = alertPos

            -- Âm thanh Ping nhẹ khi địch lại gần
            if tick() - (vis.LastSoundTime or 0) > 2 then 
                local s = Instance.new("Sound", workspace)
                s.SoundId = "rbxassetid://4590662766"; s.Volume = 9.0; s:Play()
                game:GetService("Debris"):AddItem(s, 1)
                vis.LastSoundTime = tick()
            end
        end
    end
else
    -- Tự động ẩn hoàn toàn khi đối tượng không còn tồn tại hoặc đã chết
    vis.AlertText.Visible = false
end


                -- Wallhack logic
                              -- Wallhack / Chams (Highlight)
                if _G.Wallhack_Enabled and char then
                    local highlight = char:FindFirstChild("Aurora_Highlight")
                    if not highlight then
                        highlight = Instance.new("Highlight")
                        highlight.Name = "Aurora_Highlight"
                        highlight.Parent = char
                        highlight.FillTransparency = 0.8
                        highlight.OutlineTransparency = 0
                        highlight.OutlineColor = Color3.fromRGB(0, 255, 255)
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    end
                    highlight.Enabled = true
                else
                    local highlight = char:FindFirstChild("Aurora_Highlight")
                    if highlight then 
                        highlight:Destroy() 
                    end
                end
                             -- Skeleton
                if _G.Skeleton_Enabled then
                    local joints = GetJoints(char)
                    for i, bone in ipairs(vis.Skeleton) do
                        local data = joints[i]
                        if data then
                            local p1 = char:FindFirstChild(data[1])
                            local p2 = char:FindFirstChild(data[2])
                            if p1 and p2 then
                                local v1 = Camera:WorldToViewportPoint(p1.Position)
                                local v2 = Camera:WorldToViewportPoint(p2.Position)
                                if v1.Z > 0 and v2.Z > 0 then
                                    bone.Visible = true
                                    bone.From = Vector2.new(v1.X, v1.Y)
                                    bone.To = Vector2.new(v2.X, v2.Y)
                                    bone.Color = color
                                    bone.Thickness = 1.5
                                    if data[1] == "Head" or data[2] == "Head" then
                                        bone.Thickness = 6
                                    end
                                else
                                    bone.Visible = false
                                end
                            else
                                bone.Visible = false
                            end
                        else
                            bone.Visible = false
                        end
                    end
                else
                    for _, b in pairs(vis.Skeleton) do
                        b.Visible = false
                    end
                end

        if _G.Aimbot_Enabled and isVisible then
                    local mag = (Vector2.new(headPos.X, headPos.Y) - mousePos).Magnitude
                    if _G.AimbotMode == 1 then -- FOV
                        if headOnScreen and mag < ClosestMag then
                            BestTarget = head; ClosestMag = mag
                        end
                    elseif _G.AimbotMode == 2 then -- 360
                        if mag < ClosestMag then
                            BestTarget = head; ClosestMag = mag
                        end
                    elseif _G.AimbotMode == 3 then -- 180
                        local rel = Camera.CFrame:PointToObjectSpace(head.Position)
                        if rel.Z < 0 and mag < ClosestMag then
                            BestTarget = head; ClosestMag = mag
                        end
                    end
                end
            else
                SetVisible(vis, false)
            end
        else
            if Cache[p] then SetVisible(Cache[p], false) end
        end
    end

    -- ==================== AIMFIRE + AUTO AIM & SHOOT ====================
    local shouldAim = _G.Aimbot_Enabled and BestTarget

    if _G.AimFire_Enabled then
        shouldAim = shouldAim and (isShooting or (mouse1click and true)) -- chỉ aim khi đang bắn
    end

    if Alive and shouldAim then
        local tPos = Camera:WorldToViewportPoint(BestTarget.Position)
        if tPos.Z > 0 then
            local dx = tPos.X - mousePos.X
            local dy = tPos.Y - mousePos.Y
            local smoothness = _G.Aim_Smoothness or 0.2
            if mousemoverel then
                mousemoverel(dx * (1 - smoothness), dy * (1 - smoothness))
            end
        end
    end

    -- Auto Aim + Shoot (BloxStrike style)
    if _G.AutoAimShoot_Enabled and BestTarget then
        -- Auto ADS (Right Click)
        if rightmousepress then rightmousepress() end
        task.wait(_G.AutoAimShoot_Delay)

        -- Auto Shoot
        if mouse1press then 
            mouse1press() 
            task.wait(0.05)
            if mouse1release then mouse1release() end
        end
    end


local Camera = workspace.CurrentCamera

if not EnemyCountDraw then
    EnemyCountDraw = Drawing.new("Text")

    EnemyCountDraw.Size = 22
    EnemyCountDraw.Center = true
    EnemyCountDraw.Outline = true
    EnemyCountDraw.Font = 2

    -- SET POSITION 1 LẦN
    local vp = Camera.ViewportSize
    EnemyCountDraw.Position = Vector2.new(vp.X / 2, 40)
end

-- UPDATE TEXT ONLY
if _G.ShowEnemyCount then
    EnemyCountDraw.Visible = true

    EnemyCountDraw.Text =
        enemyCount > 0 and ("ENEMIES: "..enemyCount) or "CLEAR"

    EnemyCountDraw.Color =
        enemyCount > 0
        and Color3.fromRGB(255,70,70)
        or Color3.fromRGB(0,255,120)

else
    EnemyCountDraw.Visible = false
end


 if BestTarget and _G.Aimbot_Enabled then

        local targetPos, onScreen =
            Camera:WorldToViewportPoint(BestTarget.Position)

        if onScreen then

            local dx = targetPos.X - mousePos.X
            local dy = targetPos.Y - mousePos.Y

            -- DEADZONE CHỐNG RUNG
            if math.abs(dx) <= 1.2 then
                dx = 0
            end

            if math.abs(dy) <= 1.2 then
                dy = 0
            end

            -- SMOOTH
            local smooth =
                math.clamp(_G.Aim_Smoothness or 0.18, 0.02, 1)

            local targetX = dx * smooth
            local targetY = dy * smooth

            -- LERP chống giật
            CurrentX = CurrentX + (targetX - CurrentX) * 0.28
            CurrentY = CurrentY + (targetY - CurrentY) * 0.28

            -- Clamp chống snap mạnh
            CurrentX = math.clamp(CurrentX, -35, 35)
            CurrentY = math.clamp(CurrentY, -35, 35)

            -- Chỉ move khi đủ lớn
            if math.abs(CurrentX) > 0.05
            or math.abs(CurrentY) > 0.05 then

                if mousemoverel then
                    mousemoverel(CurrentX, CurrentY)
                end
            end
        end
    end
end)



-- ==================== FAST FIRE (TĂNG TỐC ĐỘ BẮN) ====================
local fastFireConnection = nil

local function EnableFastFire()
    if fastFireConnection then return end

    fastFireConnection = RunService.Heartbeat:Connect(function()
        if not _G.FastFire_Enabled then
            if fastFireConnection then
                fastFireConnection:Disconnect()
                fastFireConnection = nil
            end
            return
        end

        local character = LocalPlayer.Character
        if not character then return end

        local tool = character:FindFirstChildOfClass("Tool")
        if not tool then return end

        -- Tìm và chỉnh tất cả giá trị liên quan đến tốc độ bắn
        for _, obj in pairs(tool:GetDescendants()) do
            if obj:IsA("NumberValue") or obj:IsA("IntValue") then
                local name = obj.Name:lower()
                if name:find("firerate") or name:find("rate") or name:find("cooldown") or 
                   name:find("delay") or name:find("speed") or name:find("shootinterval") or 
                   name:find("reloadtime") then
                    
                    -- Giới hạn tối thiểu để tránh crash
                    if obj.Value > 0.08 then
                        obj.Value = math.max(0.03, _G.FastFire_Speed or 0.05)
                    end
                end
            end

            -- Chỉnh Attribute (nhiều game Blox Strike dùng cái này)
            if obj:GetAttribute("FireRate") or obj:GetAttribute("Rate") then
                obj:SetAttribute("FireRate", math.max(0.03, _G.FastFire_Speed or 0.05))
            end
        end

        -- Một số script súng dùng tên phổ biến
        pcall(function()
            local handle = tool:FindFirstChild("Handle") or tool:FindFirstChild("GunHandle")
            if handle then
                for _, v in pairs(handle:GetDescendants()) do
                    if v:IsA("NumberValue") and v.Value > 0.1 then
                        if v.Name:lower():find("delay") or v.Name:lower():find("rate") then
                            v.Value = _G.FastFire_Speed or 0.05
                        end
                    end
                end
            end
        end)
    end)
end

local function UnlockSkins()
    -- Quét toàn bộ kho đồ để mở khóa skin (Client-Side)
    pcall(function()
        for _, v in pairs(game:GetDescendants()) do
            -- Mở khóa các giá trị sở hữu
            if v:IsA("ValueBase") and (v.Name:find("Skin") or v.Name:find("Owned")) then
                v.Value = true
            end
            -- Mở khóa trong Attribute nếu game dùng hệ thống mới
            if v:IsA("Folder") and (v.Name == "Skins" or v.Name == "SkinsInventory") then
                for _, skin in pairs(v:GetChildren()) do
                    skin:SetAttribute("Unlocked", true)
                end
            end
        end
    end)
end

local function ApplyRandomSkin()
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        
        -- Danh sách skin mẫu (Lợi có thể thêm tên skin thật vào đây)
        local skins = {"Gold", "Diamond", "Galaxy", "Dragon", "Cyberpunk", "Neon", "Ruby"}
        local randomSkinName = skins[math.random(1, #skins)]

        for _, folder in pairs(game:GetDescendants()) do
            if folder:IsA("Folder") and (folder.Name == "Skins" or folder.Name == "SkinsInventory") then
                -- Đảm bảo skin đã được mở khóa trước khi trang bị
                for _, skin in pairs(folder:GetChildren()) do
                    if skin:IsA("BoolValue") then skin.Value = true end
                end
                
                -- Tìm giá trị đang trang bị để thay đổi
                local equippedVal = folder:FindFirstChild("EquippedSkin") or folder:FindFirstChild("Equipped")
                if equippedVal then
                    equippedVal.Value = randomSkinName
                    warn("🎨 Aurora Elite: Random Skin -> " .. randomSkinName)
                end
            end
        end
    end)
end



local Combat = Window:CreateTab("Combat", 4483345998)

-- 1. KHAI BÁO BIẾN TRƯỚC (QUAN TRỌNG)

Combat:CreateToggle({
    Name = "Aimbot Enabled", 
    CurrentValue = false, 
    Callback = function(v) _G.Aimbot_Enabled = v end
})

local function CreateFOVSlider()
    if FOVSlider then return end

    FOVSlider = Combat:CreateSlider({
        Name = "Aimbot Radius (FOV)",
        Range = {50, 1200},
        Increment = 10,
        CurrentValue = _G.Aimbot_FOV,
        Callback = function(v)
            _G.Aimbot_FOV = v
        end
    })
end

local function RemoveFOVSlider()
    if FOVSlider and FOVSlider.Destroy then
        FOVSlider:Destroy()
        FOVSlider = nil
    end
end

-- Tạo sẵn slider khi mở script
CreateFOVSlider()

Combat:CreateDropdown({
    Name = "Aimbot Mode",
    Options = {"Aim FOV", "Aim 360°", "Aim 180°"},
    CurrentOption = {"Aim FOV"},

    Callback = function(option)
        local mode = option[1]

        if mode == "Aim FOV" then
            _G.AimbotMode = 1
            CreateFOVSlider()

        elseif mode == "Aim 360°" then
            _G.AimbotMode = 2
            RemoveFOVSlider()

        elseif mode == "Aim 180°" then
            _G.AimbotMode = 3
            RemoveFOVSlider()
        end
    end
})

Combat:CreateToggle({Name = "Aim Only When Firing (AimFire)", CurrentValue = false, Callback = function(v) _G.AimFire_Enabled = v end})
Combat:CreateToggle({Name = "Auto Aim + Shoot", CurrentValue = false, Callback = function(v) _G.AutoAimShoot_Enabled = v end})

Combat:CreateSlider({Name = "Aim Smoothness", Range = {0, 0.95}, Increment = 0.01, CurrentValue = 0.4, Callback = function(v) _G.Aim_Smoothness = v end})
Combat:CreateSlider({Name = "Auto Aim Shoot Delay", Range = {0.05, 0.4}, Increment = 0.01, CurrentValue = 0.12, Callback = function(v) _G.AutoAimShoot_Delay = v end})

Combat:CreateToggle({
    Name = "Wall Check (Visible Only)",
    CurrentValue = true,
    Callback = function(v) _G.WallCheck = v end
})

-- ==================== VISUALS TAB ====================
local Visual = Window:CreateTab("Visuals", 4483345998)
Visual:CreateSection("Box ESP")
Visual:CreateToggle({Name = "Box ESP", CurrentValue = false, Callback = function(v) _G.BoxESP_Active = v end})

Visual:CreateDropdown({
    Name = "Box Style",
    Options = {"Corner Box", "Full Box", "Top & Bottom Line"},
    CurrentOption = {"Corner Box"},
    Callback = function(option)
        if option[1] == "Corner Box" then _G.BoxType = 1
        elseif option[1] == "Full Box" then _G.BoxType = 2
        elseif option[1] == "Top & Bottom Line" then _G.BoxType = 3 end
    end
})
Visual:CreateSection("Line ESP")
Visual:CreateToggle({Name = "Line", CurrentValue = false, Callback = function(v) _G.Tracers_Enabled = v end})
Visual:CreateDropdown({
    Name = "Line Style",
    Options = {"Center", "Bottom", "Top", "Mouse", "Dynamic"},
    CurrentOption = {"Center"},
    Callback = function(option)
        _G.TracerStyle = option[1]
    end
})
Visual:CreateToggle({Name = "Skeleton ESP", CurrentValue = false, Callback = function(v) _G.Skeleton_Enabled = v end})
Visual:CreateToggle({Name = "Health Bar", CurrentValue = false, Callback = function(v) _G.HealthBar_ESP = v end})
Visual:CreateToggle({Name = "Name ESP", CurrentValue = false, Callback = function(v) _G.NameESP_Enabled = v end})
Visual:CreateToggle({Name = "Distance Info", CurrentValue = false, Callback = function(v) _G.Distance_ESP = v end})
Visual:CreateToggle({Name = "Show Enemy Count", CurrentValue = false, Callback = function(v) _G.ShowEnemyCount = v end})
Visual:CreateToggle({Name = "Wallhack (Chams)", CurrentValue = false, Callback = function(v) _G.Wallhack_Enabled = v end})

-- ==================== MOVEMENT TAB ====================
local Movement = Window:CreateTab("Movement ⚡", 4483345998)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(2) -- Chờ game load súng xong
    ApplyRandomSkin()
end)

Movement:CreateSection("Gun Modifications")
Movement:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Callback = function(v) _G.NoRecoil_Enabled = v end
})
RunService.RenderStepped:Connect(function()
    if not (_G.NoRecoil_Enabled or _G.NoSpread_Enabled) then return end

    local char = LocalPlayer.Character
    if not char then return end

    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then return end

    for _, v in pairs(tool:GetDescendants()) do
        if _G.NoRecoil_Enabled then
            if v.Name:lower():find("recoil") or v.Name:lower():find("kick") or v.Name == "CameraRecoil" then
                pcall(function() v.Value = 0 end)
            end
        end

        if _G.NoSpread_Enabled then
            if v.Name:lower():find("spread") or v.Name:lower():find("accuracy") or v.Name == "Spread" then
                pcall(function() v.Value = 0 end)
            end
        end
    end
end)
Movement:CreateToggle({
    Name = "Anti Flash",
    CurrentValue = false,

    Callback = function(v)

        _G.AntiFlash_Enabled = v

        -- TẮT -> bật lại effect
        if not v then

            for _, obj in ipairs(game:GetDescendants()) do

                pcall(function()

                    if obj:IsA("ParticleEmitter")
                    or obj:IsA("Smoke")
                    or obj:IsA("BlurEffect")
                    or obj:IsA("BloomEffect")
                    or obj:IsA("ColorCorrectionEffect") then

                        obj.Enabled = true

                    end

                    if obj:IsA("Frame")
                    or obj:IsA("ImageLabel")
                    or obj:IsA("TextLabel") then

                        obj.Visible = true

                    end
                end)
            end
        end
    end
})

Movement:CreateToggle({
    Name = "Anti Smoke",
    CurrentValue = false,

    Callback = function(v)

        _G.AntiSmoke_Enabled = v

    end
})

--// LOOP
task.spawn(function()

    while task.wait(1) do

        --====================================================--
        -- ANTI SMOKE
        --====================================================--
        if _G.AntiSmoke_Enabled then

            for _, v in ipairs(workspace:GetDescendants()) do

                local name = v.Name:lower()

                -- particles
                if v:IsA("ParticleEmitter")
                or v:IsA("Smoke")
                or v:IsA("Fire") then

                    if name:find("smoke")
                    or name:find("fog")
                    or name:find("gas")
                    or name:find("mist") then

                        pcall(function()

                            v.Enabled = false

                            if v:IsA("ParticleEmitter") then
                                v.Rate = 0
                            end

                            if v:IsA("Smoke") then
                                v.Opacity = 0
                            end

                        end)
                    end
                end

                -- smoke parts
                if v:IsA("BasePart") then

                    if name:find("smoke")
                    or name:find("fog")
                    or name:find("gas") then

                        pcall(function()

                            v.Transparency = 1
                            v.CanCollide = false

                        end)
                    end
                end
            end
        end

        --====================================================--
        -- ANTI FLASH
        --====================================================--
        if _G.AntiFlash_Enabled then

            -- lighting effects
            for _, v in ipairs(Lighting:GetDescendants()) do

                if v:IsA("BlurEffect")
                or v:IsA("BloomEffect")
                or v:IsA("ColorCorrectionEffect")
                or v:IsA("SunRaysEffect") then

                    pcall(function()

                        v.Enabled = false

                    end)
                end
            end

            -- remove ALL flash gui
            for _, gui in ipairs(game:GetDescendants()) do

                if gui:IsA("Frame")
                or gui:IsA("ImageLabel")
                or gui:IsA("TextLabel") then

                    local name = gui.Name:lower()

                    if name:find("flash")
                    or name:find("blind")
                    or name:find("white")
                    or name:find("stun") then

                        pcall(function()

                            gui.Visible = false

                            if gui:IsA("Frame") then
                                gui.BackgroundTransparency = 1
                            end

                            if gui:IsA("ImageLabel") then
                                gui.ImageTransparency = 1
                            end

                        end)
                    end

                    -- FULLSCREEN WHITE GUI
                    pcall(function()

                        local size = gui.AbsoluteSize

                        if size.X > 300
                        and size.Y > 200 then

                            if gui:IsA("Frame") then

                                if gui.BackgroundColor3 ==
                                    Color3.new(1,1,1) then

                                    gui.Visible = false
                                    gui.BackgroundTransparency = 1

                                end
                            end
                        end
                    end)
                end
            end

            -- reset lighting
            Lighting.ExposureCompensation = 0
            Lighting.FogEnd = 100000
            Lighting.Brightness = 2

        end
    end
end)
Movement:CreateSection("Bunny Hop ")

Movement:CreateToggle({
    Name = "Auto Bunny Hop + Strafe",
    CurrentValue = false,
    Callback = function(v)
        _G.BunnyHop_Enabled = v
    end
})

Movement:CreateSlider({
    Name = "Bunny Hop Speed",
    Range = {1, 2.5},
    Increment = 0.1,
    CurrentValue = 1.4,
    Callback = function(v) _G.BunnyHop_Speed = v end
})

Movement:CreateSlider({
    Name = "Strafe Strength",
    Range = {10, 60},
    Increment = 5,
    CurrentValue = 35,
    Callback = function(v) _G.Strafe_Strength = v end
})

-- ==================== AUTO BUNNY HOP + STRAFE (PRO) ====================
local strafeDirection = 1

RunService.RenderStepped:Connect(function()
    if not _G.BunnyHop_Enabled then return end

    local char = LocalPlayer.Character
    if not char then return end

    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")

    if not hum or not hrp then return end

    -- ==================== AUTO BUNNY HOP ====================
    if hum:GetState() == Enum.HumanoidStateType.Landed or 
       hum:GetState() == Enum.HumanoidStateType.Running then
        hum.Jump = true
    end

    -- ==================== AUTO STRAFE ====================
    if _G.Strafe_Enabled and hum:GetState() == Enum.HumanoidStateType.Jumping then
        local moveDir = hum.MoveDirection
        local cameraCFrame = Camera.CFrame

        -- Tính vector strafe
        local rightVector = cameraCFrame.RightVector * _G.Strafe_Strength * strafeDirection
        local forwardVector = cameraCFrame.LookVector * 8

        -- Áp dụng lực
        hrp.AssemblyLinearVelocity = Vector3.new(
            rightVector.X + moveDir.X * 20,
            hrp.AssemblyLinearVelocity.Y,
            rightVector.Z + moveDir.Z * 20
        )

        -- Đổi hướng strafe ngẫu nhiên
        if math.random(1, 12) == 1 then
            strafeDirection = strafeDirection * -1
        end
    end
end)

Movement:CreateSection("Dash Fast")

Movement:CreateToggle({
    Name = "Lướt Nhanh (Fast Dash)",
    CurrentValue = false,
    Callback = function(v) _G.FastDash = v end
})

Movement:CreateSlider({
    Name = "Độ dài bước lướt",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 30,
    Callback = function(v) _G.DashPower = v end
})
-- [[ FAST DASH GROUND MODE - BY THANH LOI DEV ]]
-- [[ FAST DASH ANTI-CLIP MODE - BY THANH LOI DEV ]]
RunService.RenderStepped:Connect(function()
    if not _G.FastDash or isRespawning then return end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    if hrp and hum and hum.Health > 0 then
        local dashSpeed = (_G.DashPower or 30) / 10
        local moveDir = Vector3.zero

        local camLook = Camera.CFrame.LookVector
        camLook = Vector3.new(camLook.X, 0, camLook.Z).Unit

        -- Kiểm tra phím W (thường hoặc hoa)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir += camLook
        end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit
            
            -- TÍNH TOÁN VỊ TRÍ MỚI TRÊN TRỤC XZ
            local nextPos = hrp.Position + (moveDir * dashSpeed)

            -- KỸ THUẬT CHỐNG LỌT ĐẤT: Dò tìm mặt sàn bên dưới nextPos
            local rayOrigin = nextPos + Vector3.new(0, 2, 0) -- Bắt đầu dò từ trên cao 2m
            local rayDirection = Vector3.new(0, -10, 0) -- Dò xuống dưới 10m
            
            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {char}
            raycastParams.FilterType = Enum.RaycastFilterType.Exclude

            local rayResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
            
            local finalY = hrp.Position.Y -- Mặc định giữ nguyên Y cũ nếu không thấy đất
            if rayResult then
                -- Nếu tìm thấy sàn, đặt chân Lợi cách mặt sàn đúng chiều cao của nhân vật
                finalY = rayResult.Position.Y + 3.0 -- 3.0 là độ cao chuẩn từ sàn đến HRP
            end

            local targetPos = Vector3.new(nextPos.X, finalY, nextPos.Z)

            -- Lướt mượt với Lerp 0.35 của Lợi
            hrp.CFrame = hrp.CFrame:Lerp(
                CFrame.new(targetPos, targetPos + camLook), 
                0.35
            )

            -- ÉP VẬN TỐC = 0 ĐỂ CHỐNG RƠI TỰ DO KHI LƯỚT
            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        end
    end
end)
Movement:CreateSection("Teleport VIP")

local tpToggle = Movement:CreateToggle({
    Name = "Teleport VIP (V)",
    CurrentValue = false,
    Callback = function(v)
        _G.TPToEnemy_VIP = v
        UpdateUI()
    end
})

--====================================================--
-- LOGIC PHÍM V (HOA/THƯỜNG ĐỀU ĂN)
--====================================================--
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.V then
        _G.TPToEnemy_VIP = not _G.TPToEnemy_VIP
        
        -- Cập nhật đồng bộ vào Menu Toggle nếu có
        if tpToggle and tpToggle.Set then
            tpToggle:Set(_G.TPToEnemy_VIP)
        end
        
        UpdateUI()
    end
end)

--// ==================== TELEPORT VIP - AN TOÀN (KHÔNG TỰ CHẾT) ====================
local LastSpawnTime = tick()
local LastTeleportTime = tick()

LocalPlayer.CharacterAdded:Connect(function()
    LastSpawnTime = tick()
    LastTeleportTime = tick()
end)

local function GetClosestEnemy()
    local closest, shortest = nil, math.huge
    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    Scanner:GetFolder()

    for _, player in ipairs(Players:GetPlayers()) do
        if Scanner:IsEnemy(player) then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            
            if hrp and hum and hum.Health > 0 then
                local dist = (hrp.Position - myHRP.Position).Magnitude
                if dist < shortest and dist > 10 then   -- Tránh dính quá sát
                    shortest = dist
                    closest = hrp
                end
            end
        end
    end
    return closest
end

-- [[ TELEPORT VIP 8M: GHOST WHEN MOVE - SOLID WHEN STOP ]]
-- [[ TELEPORT 8M: FRONT/ABOVE MODE - NO BEHIND - BY THANH LOI ]]
-- [[ PHÂN LUỒNG TELEPORT & UPPLAYER - BY THANH LOI DEV ]]
local CurrentTarget = nil

local function ToggleGhost(state)
    local char = LocalPlayer.Character
    if not char then return end
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = not state 
        end
    end
end

RunService.RenderStepped:Connect(function()
    if not _G.TPToEnemy_VIP or (tick() - LastSpawnTime < 12) then 
        CurrentTarget = nil
        ToggleGhost(false)
        return 
    end

    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end

    if not CurrentTarget or not CurrentTarget.Parent or not CurrentTarget.Parent:FindFirstChildOfClass("Humanoid") or CurrentTarget.Parent:FindFirstChildOfClass("Humanoid").Health <= 0 then
        CurrentTarget = GetClosestEnemy()
    end

    if CurrentTarget then
        local targetPos
        
        -- PHÂN LUỒNG CHỨC NĂNG RIÊNG
        if _G.TPToEnemy_VIP then
            -- Chế độ UpPlayer: Bay lên cao 5m để trị núp
            targetPos = CurrentTarget.Position + Vector3.new(0, 5, 0)
        else
            -- Chế độ Tele Thường: Trực diện 3m (Không sau lưng)
            targetPos = CurrentTarget.Position + (CurrentTarget.CFrame.LookVector * (_G.TPDistance or 3)) + Vector3.new(0, 1.5, 0)
        end

        local targetCF = CFrame.new(targetPos, CurrentTarget.Position)
        local realDist = (myHRP.Position - CurrentTarget.Position).Magnitude
        local gapToTarget = (myHRP.Position - targetPos).Magnitude

        if realDist <= 30 then
            if gapToTarget > 1.2 then
                ToggleGhost(true) -- Xuyên tường khi đang bay
                myHRP.CFrame = myHRP.CFrame:Lerp(targetCF, _G.TPSpeed or 0.25)
            else
                ToggleGhost(false) -- Hiện hình để FIX DAME khi đã vào vị trí
                myHRP.CFrame = targetCF
                myHRP.AssemblyLinearVelocity = Vector3.new(0, -0.5, 0) -- Ép trọng lực ảo
            end
            myHRP.AssemblyAngularVelocity = Vector3.zero
        else
            CurrentTarget = nil
            ToggleGhost(false)
        end
    else
        ToggleGhost(false)
    end
end)
Movement:CreateSection("Flight Mastery")
Movement:CreateToggle({
    Name = "Bật Fly (Safe Fly)",
    CurrentValue = false,
    Callback = function(v)
        _G.Fly = v
        if v and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            _G.FlyHeight = LocalPlayer.Character.HumanoidRootPart.Position.Y
        end
    end
})
Movement:CreateSlider({
    Name = "Tốc độ bay (Speed)",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 15,
    Callback = function(v) _G.FlySpeed = v end
})

RunService.RenderStepped:Connect(function()

    if not _G.Fly or isRespawning then
        return
    end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    if hrp and hum then

        local speed = (_G.FlySpeed or 5) / 10

        local moveDir = Vector3.zero

        local camLook = Camera.CFrame.LookVector
        local camRight = Camera.CFrame.RightVector

        -- bỏ Y để aim không rung
        camLook = Vector3.new(camLook.X, 0, camLook.Z).Unit
        camRight = Vector3.new(camRight.X, 0, camRight.Z).Unit

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir += camLook
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir -= camLook
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir -= camRight
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir += camRight
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir += Vector3.new(0, 1, 0)
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveDir -= Vector3.new(0, 1, 0)
        end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit
        end

        -- Move mềm
        local targetPos =
            hrp.Position + (moveDir * speed)

        -- Lerp chống giật camera
        hrp.CFrame = hrp.CFrame:Lerp(
            CFrame.new(
                targetPos,
                targetPos + Camera.CFrame.LookVector
            ),
            0.35
        )

        -- giữ physics ổn định
        hrp.Velocity = Vector3.zero

    end
end)
Movement:CreateSection("Mobile Fly")
Movement:CreateToggle({
    Name = "Bật Fly Mobile",
    CurrentValue = false,
    Callback = function(v)
        _G.MobileFly = v
        if v and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                _G.MobileFlyHeight = hrp.Position.Y + 3
            end
        end
    end
})
Movement:CreateSlider({
    Name = "Speed Fly Mobile",
    Range = {1, 30},
    Increment = 1,
    CurrentValue = 15,
    Callback = function(v) _G.MobileFlySpeed = v end
})

LocalPlayer.CharacterAdded:Connect(function(character)

    isRespawning = true

    local hrp = character:WaitForChild("HumanoidRootPart",10)

    if hrp then
        task.wait(1)

        if _G.MobileFly then
            _G.MobileFlyHeight = hrp.Position.Y + 3
        end
    end

    isRespawning = false
end)

-- =========================================
-- MOBILE FLY LOOP
-- =========================================

RunService.RenderStepped:Connect(function()

    if not _G.MobileFly or isRespawning then

        local char = LocalPlayer.Character

        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")

            if hum and hum.PlatformStand then
                hum.PlatformStand = false
            end
        end

        return
    end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    if hrp and hum then

        local speed = (_G.MobileFlySpeed or 15) / 6

        hum.PlatformStand = true
        hrp.Velocity = Vector3.zero

        -- Mobile dùng joystick
        local moveDir = hum.MoveDirection

        -- Bay lên khi nhảy
        if hum.Jump then
            _G.MobileFlyHeight += speed * 0.8
        end

        -- Di chuyển mượt
        local targetPos = hrp.Position + (moveDir * speed)

        hrp.CFrame = CFrame.new(
            targetPos.X,
            _G.MobileFlyHeight,
            targetPos.Z
        )
    end
end)
