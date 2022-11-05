if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

repeat wait() until game:GetService("Players")

if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
    
wait(1)

do
    local ui = game.CoreGui:FindFirstChild("UlLib")
    if ui then
        ui:Destroy()
    end
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )
        local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local Header = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Pofilename = Instance.new("TextLabel")
local Playername = Instance.new("TextLabel")
local ImageButton = Instance.new("ImageButton")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local Namehub = Instance.new("TextLabel")
local Time = Instance.new("TextLabel")
local PingFps = Instance.new("TextLabel")
local BXHUB = Instance.new("ScreenGui")

BXHUB.Name = "UlLib"
BXHUB.Parent = game.CoreGui
BXHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Header.Name = "Header"
Header.Parent = BXHUB
Header.BackgroundColor3 = Color3.fromRGB(3, 19, 28)
Header.BorderSizePixel = 0
Header.Position = UDim2.new(0.35, 0, 0.011, 0)
Header.Size = UDim2.new(0, 0, 0, 0)

Header:TweenSize(UDim2.new(0, 510, 0, 60),"Out","Quad",0.2,true)

local uihide = false
local bind = Enum.KeyCode.RightControl
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == bind then
        if uihide == false then
            uihide = true
            Header:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true)
            wait(0.2)
            Header.Visible = false
        else
            uihide = false
            Header:TweenSize(UDim2.new(0, 510, 0, 60),"Out","Quad",0.2,true)
            Header.Visible = true
        end
    end
end)

ImageLabel.Parent = Header
ImageLabel.BackgroundColor3 = Color3.fromRGB(3, 19, 28)
ImageLabel.Position = UDim2.new(0.0254901964, 0, 0.116666667, 0)
ImageLabel.Size = UDim2.new(0, 45, 0, 45)
ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = ImageLabel

Pofilename.Name = "Pofilename"
Pofilename.Parent = Header
Pofilename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pofilename.BackgroundTransparency = 1.000
Pofilename.BorderColor3 = Color3.fromRGB(27, 42, 53)
Pofilename.BorderSizePixel = 0
Pofilename.Position = UDim2.new(0.12, 0, 0.116666667, 0)
Pofilename.Size = UDim2.new(0, 114, 0, 30)
Pofilename.Font = Enum.Font.SourceSans
Pofilename.Text = ""..game.Players.LocalPlayer.DisplayName..""
Pofilename.TextColor3 = Color3.fromRGB(0, 255, 170)
Pofilename.TextScaled = true
Pofilename.TextSize = 14.000
Pofilename.TextWrapped = true
Pofilename.TextXAlignment = Enum.TextXAlignment.Left

Playername.Name = "Playername"
Playername.Parent = Header
Playername.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Playername.BackgroundTransparency = 1.000
Playername.BorderColor3 = Color3.fromRGB(27, 42, 53)
Playername.BorderSizePixel = 0
Playername.Position = UDim2.new(0.12, 0, 0.53, 0)
Playername.Size = UDim2.new(0, 98, 0, 18)
Playername.Font = Enum.Font.SourceSans
Playername.Text = ""..game.Players.LocalPlayer.Name..""
Playername.TextColor3 = Color3.fromRGB(0, 255, 170)
Playername.TextScaled = true
Playername.TextSize = 14.000
Playername.TextWrapped = true
Playername.TextXAlignment = Enum.TextXAlignment.Left

ImageButton.Parent = Header
ImageButton.BackgroundColor3 = Color3.fromRGB(3, 19, 28)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.421229342, 0, 0.0336664915, 0)
ImageButton.Size = UDim2.new(0, 55, 0, 55)
ImageButton.ZIndex = 999
ImageButton.Image = "http://www.roblox.com/asset/?id=11028788337"

UICorner_2.CornerRadius = UDim.new(0, 50)
UICorner_2.Parent = ImageButton

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = Header


Namehub.Name = "Namehub"
Namehub.Parent = Header
Namehub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Namehub.BackgroundTransparency = 1.000
Namehub.BorderSizePixel = 0
Namehub.Position = UDim2.new(0.731372595, 0, -0.266666651, 0)
Namehub.Size = UDim2.new(0, 200, 0, 50)
Namehub.Font = Enum.Font.SourceSans
Namehub.Text = "B2X.HUB"
Namehub.TextColor3 = Color3.fromRGB(0, 255, 170)
Namehub.TextSize = 15.000

local SelectMenu = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Menu = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Cadit = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local Setting = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

SelectMenu.Name = "SelectMenu"
SelectMenu.Parent = BXHUB
SelectMenu.BackgroundColor3 = Color3.fromRGB(3, 19, 28)
SelectMenu.Position = UDim2.new(0.35, 0, -0.2, 0)
SelectMenu.Size = UDim2.new(0, 510, 0, 170)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = SelectMenu

Menu.Name = "Menu"
Menu.Parent = SelectMenu
Menu.BackgroundColor3 = Color3.fromRGB(10, 33, 42)
Menu.Position = UDim2.new(0.0235294122, 0, 0.701960742, 0)
Menu.Size = UDim2.new(0, 486, 0, 36)
Menu.Font = Enum.Font.SourceSans
Menu.Text = "Menu"
Menu.TextColor3 = Color3.fromRGB(0, 255, 170)
Menu.TextSize = 21.000

UICorner_2.CornerRadius = UDim.new(0, 10)
UICorner_2.Parent = Menu

Cadit.Name = "Cadit"
Cadit.Parent = SelectMenu
Cadit.BackgroundColor3 = Color3.fromRGB(10, 33, 42)
Cadit.Position = UDim2.new(0.0235294122, 0, 0.153938174, 0)
Cadit.Size = UDim2.new(0, 486, 0, 36)
Cadit.Font = Enum.Font.SourceSans
Cadit.Text = "Cadit"
Cadit.TextColor3 = Color3.fromRGB(0, 255, 170)
Cadit.TextSize = 21.000

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = Cadit

TextLabel.Parent = SelectMenu
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 509, 0, 18)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Select Menu"
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Setting.Name = "Setting"
Setting.Parent = SelectMenu
Setting.BackgroundColor3 = Color3.fromRGB(10, 33, 42)
Setting.Position = UDim2.new(0.0235294122, 0, 0.430774331, 0)
Setting.Size = UDim2.new(0, 486, 0, 36)
Setting.Font = Enum.Font.SourceSans
Setting.Text = "Setting"
Setting.TextColor3 = Color3.fromRGB(0, 255, 170)
Setting.TextSize = 21.000
Setting.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 10)
UICorner_4.Parent = Setting

local isdropping = false

ImageButton.MouseButton1Click:Connect(function()
    if isdropping == false then
        isdropping = true
        TweenService:Create(
            Header,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.35, 0, 0.18, 0)}
        ):Play()
        TweenService:Create(
            SelectMenu,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.35, 0, 0.011, 0)}
        ):Play()
        TweenService:Create(
            ImageButton,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Rotation = 45}
        ):Play()
    else
        isdropping = false
        TweenService:Create(
            Header,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.35, 0, 0.011, 0)}
        ):Play()
        TweenService:Create(
            SelectMenu,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.35, 0, -0.2, 0)}
        ):Play()
        TweenService:Create(
            ImageButton,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Rotation = 0}
        ):Play()
    end
end)

Menu.MouseButton1Click:Connect(function()
    TweenService:Create(
        Header,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.35, 0, 0.011, 0)}
    ):Play()
    TweenService:Create(
        SelectMenu,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.35, 0, -0.2, 0)}
    ):Play()
    TweenService:Create(
        ImageButton,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Rotation = 0}
    ):Play()
end)

function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60

    Time.Name = "Time"
    Time.Parent = Header
    Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Time.BackgroundTransparency = 1.000
    Time.BorderSizePixel = 0
    Time.Position = UDim2.new(0.59, 0, 0.416666657, 0)
    Time.Size = UDim2.new(0, 200, 0, 50)
    Time.Font = Enum.Font.SourceSans
    Time.Text = Hour.." Hour "..Minute.." Minute "..Second.." Second"
    Time.TextColor3 = Color3.fromRGB(0, 255, 170)
    Time.TextSize = 14.000
    Time.TextXAlignment = Enum.TextXAlignment.Right
end

function UpdatePing()
    local frames = 0
    game:GetService("RunService").RenderStepped:Connect(function()
        frames = frames + 1
    end)

    while wait(1) do
        PingFps.Name = "PingFps"
        PingFps.Parent = Header
        PingFps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PingFps.BackgroundTransparency = 1.000
        PingFps.BorderSizePixel = 0
        PingFps.Position = UDim2.new(0.59, 0, 0.0666666701, 0)
        PingFps.Size = UDim2.new(0, 200, 0, 50)
        PingFps.Font = Enum.Font.SourceSans
        PingFps.Text = (math.floor(game.Players.LocalPlayer:GetNetworkPing()*1000)).." MS | "..frames .. " FPS"
        PingFps.TextColor3 = Color3.fromRGB(0, 255, 170)
        PingFps.TextSize = 30.000
        PingFps.TextXAlignment = Enum.TextXAlignment.Right
        frames = 0
    end
end

spawn(function()
    while task.wait() do
        pcall(function()
            UpdatePing()
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            UpdateTime()
        end)
    end
end)

local library = {}
    
function library:AddWindow(keybind)
    local bind = Enum.KeyCode.RightShift or keybind
    local currenttab = ""
    local ff = false

    local Libery = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Category = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")

    Libery.Name = "Libery"
    Libery.Parent = BXHUB
    Libery.BackgroundColor3 = Color3.fromRGB(3, 19, 28)
    Libery.Position = UDim2.new(0.35, 0, -0.9, 0)
    Libery.Size = UDim2.new(0, 510, 0, 552)
    Libery.Visible = true

    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Libery

    Category.Name = "Category"
    Category.Parent = Libery
    Category.BackgroundColor3 = Color3.fromRGB(10, 33, 42)
    Category.Position = UDim2.new(0.0254901964, 0, 0.027591981, 0)
    Category.Size = UDim2.new(0, 482, 0, 37)

    UICorner_3.CornerRadius = UDim.new(0, 10)
    UICorner_3.Parent = Category

    local ScrollPage = Instance.new("ScrollingFrame")
    ScrollPage.Name = "ScrollPage"
    ScrollPage.Parent = Category
    ScrollPage.Active = true
    ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollPage.BackgroundTransparency = 1.000
    ScrollPage.BorderSizePixel = 0
    ScrollPage.Size = UDim2.new(0, 481, 0, 37)
    ScrollPage.CanvasSize = UDim2.new(2, 0, 0, 0)
    ScrollPage.ScrollBarThickness = 0
    ScrollPage.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

    local PageList = Instance.new("UIListLayout")
    PageList.Name = "PageList"
    PageList.Parent = ScrollPage
    PageList.FillDirection = Enum.FillDirection.Horizontal
    PageList.SortOrder = Enum.SortOrder.LayoutOrder
    PageList.Padding = UDim.new(0, 5)

    local PagePadding = Instance.new("UIPadding")
    PagePadding.Name = "PagePadding"
    PagePadding.Parent = ScrollPage
    PagePadding.PaddingTop = UDim.new(0, 5)
    PagePadding.PaddingLeft = UDim.new(0, 10)

    local TabFolder = Instance.new("Folder")
    TabFolder.Name = "TabFolder"
    TabFolder.Parent = Libery

    MakeDraggable(Libery, Libery)

    local Ismenuopen = false

    Menu.MouseButton1Click:Connect(function()
        if Ismenuopen == false then
            Ismenuopen = true
            TweenService:Create(
                Libery,
                TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = UDim2.new(0.35, 0, 0.3, 0)}
            ):Play()
        else
            Ismenuopen = false
            TweenService:Create(
                Libery,
                TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = UDim2.new(0.35, 0, -0.9, 0)}
            ):Play()
        end
    end)

    local UIHIDE = false

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == bind then
            if UIHIDE == false then
                UIHIDE = true
                TweenService:Create(
                    Libery,
                    TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Position = UDim2.new(0.35, 0, -0.9, 0)}
                ):Play()
            else
                UIHIDE = false
                TweenService:Create(
                    Libery,
                    TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Position = UDim2.new(0.35, 0, 0.3, 0)}
                ):Play()
            end
        end
    end)

    local uicategory = {}

    function uicategory:AddCategory(text,image)
        local Image = image or 6023426915

        local Tabbutton = Instance.new("TextButton")
        Tabbutton.Name = "Tabbutton"
        Tabbutton.Parent = ScrollPage
        Tabbutton.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
        Tabbutton.Position = UDim2.new(0.00849256944, 0, 0.135135129, 0)
        Tabbutton.Size = UDim2.new(0, 129, 0, 27)
        Tabbutton.Font = Enum.Font.SourceSans
        Tabbutton.Text = text
        Tabbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tabbutton.TextSize = 19.000
        Tabbutton.TextXAlignment = Enum.TextXAlignment.Right

        local TabPadding = Instance.new("UIPadding")
        TabPadding.Parent = Tabbutton
        TabPadding.PaddingRight = UDim.new(0, 10)

        local TabImage = Instance.new("ImageLabel")
        TabImage.Name = "TabImage"
        TabImage.Parent = Tabbutton
        TabImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabImage.BackgroundTransparency = 1.000
        TabImage.Position = UDim2.new(0, 10, 0, 5)
        TabImage.Size = UDim2.new(0, 20, 0, 20)
        TabImage.Image = "rbxassetid://"..tostring(Image)

        local UICorner_4 = Instance.new("UICorner")
        UICorner_4.Parent = Tabbutton

        local Window = Instance.new("Frame")
        Window.Name = "Window"
        Window.Parent = TabFolder
        Window.BackgroundColor3 = Color3.fromRGB(10, 33, 42)
        Window.Position = UDim2.new(0.0241763853, 0, 0.118171692, 0)
        Window.Size = UDim2.new(0, 482, 0, 471)
        Window.Visible = false

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 10)
        UICorner.Parent = Window

        local Scrollingwindowleft = Instance.new("ScrollingFrame")
        Scrollingwindowleft.Name = "Scrollingwindowleft"
        Scrollingwindowleft.Parent = Window
        Scrollingwindowleft.Active = true
        Scrollingwindowleft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Scrollingwindowleft.BackgroundTransparency = 1.000
        Scrollingwindowleft.BorderSizePixel = 0
        Scrollingwindowleft.Position = UDim2.new(0.0179484915, 0, 0.0166204814, 0)
        Scrollingwindowleft.Size = UDim2.new(0, 230, 0, 454)
        Scrollingwindowleft.ScrollBarThickness = 0

        local Scrollingwindowright = Instance.new("ScrollingFrame")
        Scrollingwindowright.Name = "Scrollingwindowright"
        Scrollingwindowright.Parent = Window
        Scrollingwindowright.Active = true
        Scrollingwindowright.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Scrollingwindowright.BackgroundTransparency = 1.000
        Scrollingwindowright.BorderSizePixel = 0
        Scrollingwindowright.Position = UDim2.new(0.519999981, 0, 0.0170000009, 0)
        Scrollingwindowright.Size = UDim2.new(0, 230, 0, 454)
        Scrollingwindowright.ScrollBarThickness = 0
        Scrollingwindowright.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

        local TabListLeft = Instance.new("UIListLayout")
        TabListLeft.Name = "TabListLeft"
        TabListLeft.Parent = Scrollingwindowleft
        TabListLeft.SortOrder = Enum.SortOrder.LayoutOrder
        TabListLeft.Padding = UDim.new(0, 5)

        local TabPaddingLeft = Instance.new("UIPadding")
        TabPaddingLeft.Name = "TabPadding"
        TabPaddingLeft.Parent = Scrollingwindowleft
        TabPaddingLeft.PaddingLeft = UDim.new(0, 5)
        TabPaddingLeft.PaddingTop = UDim.new(0, 5)

        local TabListRight = Instance.new("UIListLayout")
        TabListRight.Name = "TabListRight"
        TabListRight.Parent = Scrollingwindowright
        TabListRight.SortOrder = Enum.SortOrder.LayoutOrder
        TabListRight.Padding = UDim.new(0, 5)

        local TabPaddingRight = Instance.new("UIPadding")
        TabPaddingRight.Name = "TabPaddingRight"
        TabPaddingRight.Parent = Scrollingwindowright
        TabPaddingRight.PaddingRight = UDim.new(0, 5)
        TabPaddingRight.PaddingTop = UDim.new(0, 5)

        Tabbutton.MouseButton1Click:Connect(function()
            currenttab = Window.Name
            for i,v in next, TabFolder:GetChildren() do 
                if v.Name == "Window" then
                    v.Visible = false
                end
            end
            Window.Visible = true

            for i,v in next, ScrollPage:GetChildren() do 
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end
                TweenService:Create(
                    Tabbutton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(0, 255, 170)}
                ):Play()
            end
        end)

        if ff == false then
            TweenService:Create(
                Tabbutton,
                TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(0, 255, 170)}
            ):Play()
            for i,v in next, TabFolder:GetChildren() do 
                if v.Name == "Window" then
                    v.Visible = false
                end
                Window.Visible = true
            end
            ff = true
        end

        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                ScrollPage.CanvasSize = UDim2.new(0,PageList.AbsoluteContentSize.X+20,0,0)
                Scrollingwindowleft.CanvasSize = UDim2.new(0,0,0,TabListLeft.AbsoluteContentSize.Y+10)
                Scrollingwindowright.CanvasSize = UDim2.new(0,0,0,TabListRight.AbsoluteContentSize.Y+10)
            end)
        end)

        local main = {}
    
        function main:AddButtonLeft(text,callback)
            local Button = Instance.new("TextButton")

            Button.Name = "Button"
            Button.Parent = Scrollingwindowleft
            Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Button.BackgroundTransparency = 0.1
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 212, 0, 30)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(225, 225, 225)
            Button.TextSize = 11.000
            Button.TextWrapped = true
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.CornerRadius = UDim.new(0, 5)
            ButtonCorner.Parent = Button
            
            Button.MouseEnter:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(0, 255, 170)}
                ):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
            end)
            
            Button.MouseButton1Click:Connect(function()
                callback()
                Button.TextSize = 0
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                    {TextSize = 11}
                ):Play()
            end)
        end

        function main:AddButtonRight(text,callback)
            local Button = Instance.new("TextButton")

            Button.Name = "Button"
            Button.Parent = Scrollingwindowright
            Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Button.BackgroundTransparency = 0.1
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 212, 0, 30)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(225, 225, 225)
            Button.TextSize = 11.000
            Button.TextWrapped = true
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.CornerRadius = UDim.new(0, 5)
            ButtonCorner.Parent = Button
            
            Button.MouseEnter:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(0, 255, 170)}
                ):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
            end)
            
            Button.MouseButton1Click:Connect(function()
                callback()
                Button.TextSize = 0
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                    {TextSize = 11}
                ):Play()
            end)
        end

        function main:AddToggleLeft(text,config,callback)
            local ToggleImage = Instance.new("Frame")
            
            local Toggle = Instance.new("TextButton")
            Toggle.Name = "Toggle"
            Toggle.Parent = Scrollingwindowleft
            Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Toggle.BackgroundTransparency = 0.1
            Toggle.BorderSizePixel = 0
            Toggle.AutoButtonColor = false
            Toggle.Size = UDim2.new(0, 212, 0, 30)
            Toggle.Font = Enum.Font.SourceSans
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.TextSize = 14.000
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.Name = "ToggleCorner"
            ToggleCorner.CornerRadius = UDim.new(0, 5)
            ToggleCorner.Parent = Toggle

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "ToggleLabel"
            ToggleLabel.Parent = Toggle
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.BackgroundTransparency = 1.000
            ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
            ToggleLabel.Size = UDim2.new(0, 200, 0, 30)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            ToggleLabel.TextSize = 11.000
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = Toggle
            ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
            ToggleImage.Position = UDim2.new(0, 180, 0, 5)
            ToggleImage.BorderSizePixel = 0
            ToggleImage.Size = UDim2.new(0, 20, 0, 20)
            local ToggleImageCorner = Instance.new("UICorner")
            ToggleImageCorner.Name = "ToggleImageCorner"
            ToggleImageCorner.CornerRadius = UDim.new(0, 5)
            ToggleImageCorner.Parent = ToggleImage

            local ToggleImage2 = Instance.new("Frame")
            ToggleImage2.Name = "ToggleImage2"
            ToggleImage2.Parent = ToggleImage
            ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
            ToggleImage2.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
            ToggleImage2.Visible = false

            local ToggleImage2Corner = Instance.new("UICorner")
            ToggleImage2Corner.Name = "ToggleImageCorner"
            ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
            ToggleImage2Corner.Parent = ToggleImage2
            
            Toggle.MouseEnter:Connect(function()
                TweenService:Create(
                    ToggleLabel,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(0, 255, 170)}
                ):Play()
            end)

            Toggle.MouseLeave:Connect(function()
                TweenService:Create(
                    ToggleLabel,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
            end)
            if config == nil then config = false end
            local toggled = config or false
            Toggle.MouseButton1Click:Connect(function()
                if toggled == false then
                    toggled = true
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                else
                    toggled = false
                    ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                    wait(0.1)
                    ToggleImage2.Visible = false
                end
                callback(toggled)
            end)
            
            if config == true then
                ToggleImage2.Visible = true
                ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                toggled = true
                callback(toggled)
            end
        end

        function main:AddToggleRight(text,config,callback)
            local ToggleImage = Instance.new("Frame")
            
            local Toggle = Instance.new("TextButton")
            Toggle.Name = "Toggle"
            Toggle.Parent = Scrollingwindowright
            Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Toggle.BackgroundTransparency = 0.1
            Toggle.BorderSizePixel = 0
            Toggle.AutoButtonColor = false
            Toggle.Size = UDim2.new(0, 212, 0, 30)
            Toggle.Font = Enum.Font.SourceSans
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.TextSize = 14.000
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.Name = "ToggleCorner"
            ToggleCorner.CornerRadius = UDim.new(0, 5)
            ToggleCorner.Parent = Toggle

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "ToggleLabel"
            ToggleLabel.Parent = Toggle
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.BackgroundTransparency = 1.000
            ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
            ToggleLabel.Size = UDim2.new(0, 200, 0, 30)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            ToggleLabel.TextSize = 11.000
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = Toggle
            ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
            ToggleImage.Position = UDim2.new(0, 180, 0, 5)
            ToggleImage.BorderSizePixel = 0
            ToggleImage.Size = UDim2.new(0, 20, 0, 20)
            local ToggleImageCorner = Instance.new("UICorner")
            ToggleImageCorner.Name = "ToggleImageCorner"
            ToggleImageCorner.CornerRadius = UDim.new(0, 5)
            ToggleImageCorner.Parent = ToggleImage

            local ToggleImage2 = Instance.new("Frame")
            ToggleImage2.Name = "ToggleImage2"
            ToggleImage2.Parent = ToggleImage
            ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
            ToggleImage2.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
            ToggleImage2.Visible = false

            local ToggleImage2Corner = Instance.new("UICorner")
            ToggleImage2Corner.Name = "ToggleImageCorner"
            ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
            ToggleImage2Corner.Parent = ToggleImage2
            
            Toggle.MouseEnter:Connect(function()
                TweenService:Create(
                    ToggleLabel,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(0, 255, 170)}
                ):Play()
            end)

            Toggle.MouseLeave:Connect(function()
                TweenService:Create(
                    ToggleLabel,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
            end)
            if config == nil then config = false end
            local toggled = config or false
            Toggle.MouseButton1Click:Connect(function()
                if toggled == false then
                    toggled = true
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                else
                    toggled = false
                    ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                    wait(0.1)
                    ToggleImage2.Visible = false
                end
                callback(toggled)
            end)
            
            if config == true then
                ToggleImage2.Visible = true
                ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                toggled = true
                callback(toggled)
            end
        end

        function main:AddTextboxLeft(text,holder,disappear,callback)
             local Textboxx = Instance.new("Frame")
            local TextboxxCorner = Instance.new("UICorner")
            local TextboxTitle = Instance.new("TextLabel")
            local Textbox = Instance.new("TextBox")
            local TextboxCorner = Instance.new("UICorner")

            Textboxx.Name = "Textboxx"
            Textboxx.Parent = Scrollingwindowleft
            Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Textboxx.Size = UDim2.new(0, 212, 0, 30)

            TextboxxCorner.CornerRadius = UDim.new(0, 5)
            TextboxxCorner.Name = "TextboxxCorner"
            TextboxxCorner.Parent = Textboxx

            TextboxTitle.Name = "TextboxTitle"
            TextboxTitle.Parent = Textboxx
            TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.BackgroundTransparency = 1.000
            TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
            TextboxTitle.Size = UDim2.new(0, 50, 0, 30)
            TextboxTitle.Font = Enum.Font.Gotham
            TextboxTitle.Text = text
            TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextboxTitle.TextSize = 11.000
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

            Textbox.Name = "Textbox"
            Textbox.Parent = Textboxx
            Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            Textbox.Position = UDim2.new(0, 150, 0, 5)
            Textbox.Size = UDim2.new(0, 50, 0, 20)
            Textbox.Font = Enum.Font.Gotham
            Textbox.Text = holder
            Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
            Textbox.TextSize = 11.000

            Textbox.FocusLost:Connect(function()
                if #Textbox.Text > 0 then
                    callback(Textbox.Text)
                end
                if disappear then
                    Textbox.Text = ""
                else
                    Textbox.Text = holder
                end
            end)

            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.CornerRadius = UDim.new(0, 5)
            TextboxCorner.Parent = Textbox
        end

        function main:AddTextboxRight(text,holder,disappear,callback)
            local Textboxx = Instance.new("Frame")
            local TextboxxCorner = Instance.new("UICorner")
            local TextboxTitle = Instance.new("TextLabel")
            local Textbox = Instance.new("TextBox")
            local TextboxCorner = Instance.new("UICorner")

            Textboxx.Name = "Textboxx"
            Textboxx.Parent = Scrollingwindowright
            Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Textboxx.Size = UDim2.new(0, 212, 0, 30)

            TextboxxCorner.CornerRadius = UDim.new(0, 5)
            TextboxxCorner.Name = "TextboxxCorner"
            TextboxxCorner.Parent = Textboxx

            TextboxTitle.Name = "TextboxTitle"
            TextboxTitle.Parent = Textboxx
            TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.BackgroundTransparency = 1.000
            TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
            TextboxTitle.Size = UDim2.new(0, 50, 0, 30)
            TextboxTitle.Font = Enum.Font.Gotham
            TextboxTitle.Text = text
            TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextboxTitle.TextSize = 11.000
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

            Textbox.Name = "Textbox"
            Textbox.Parent = Textboxx
            Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            Textbox.Position = UDim2.new(0, 150, 0, 5)
            Textbox.Size = UDim2.new(0, 50, 0, 20)
            Textbox.Font = Enum.Font.Gotham
            Textbox.Text = holder
            Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
            Textbox.TextSize = 11.000

            Textbox.FocusLost:Connect(function()
                if #Textbox.Text > 0 then
                    callback(Textbox.Text)
                end
                if disappear then
                    Textbox.Text = ""
                else
                    Textbox.Text = holder
                end
            end)

            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.CornerRadius = UDim.new(0, 5)
            TextboxCorner.Parent = Textbox
        end

        function main:AddDropdownLeft(text,table,callback)
            local Dropdown = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local DropButton = Instance.new("TextButton")
            local Droptitle = Instance.new("TextLabel")
            local DropScroll = Instance.new("ScrollingFrame")
            local DropdownList = Instance.new("UIListLayout")
            local DropdownPadding = Instance.new("UIPadding")
            local DropImage = Instance.new("ImageLabel")
            
            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Scrollingwindowleft
            Dropdown.Active = true
            Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Dropdown.ClipsDescendants = true
            Dropdown.Size = UDim2.new(0, 212, 0, 30)
            
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Dropdown
            
            DropButton.Name = "DropButton"
            DropButton.Parent = Dropdown
            DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropButton.BackgroundTransparency = 1.000
            DropButton.Size = UDim2.new(0, 212, 0, 30)
            DropButton.Font = Enum.Font.SourceSans
            DropButton.Text = ""
            DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropButton.TextSize = 14.000
            
            Droptitle.Name = "Droptitle"
            Droptitle.Parent = Dropdown
            Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Droptitle.BackgroundTransparency = 1.000
            Droptitle.Position = UDim2.new(0.05, 0, 0, 0)
            Droptitle.Size = UDim2.new(0, 410, 0, 30)
            Droptitle.Font = Enum.Font.Gotham
            Droptitle.Text = text.." : "
            Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            Droptitle.TextSize = 11.000
            Droptitle.TextXAlignment = Enum.TextXAlignment.Left

            DropImage.Name = "DropImage"
            DropImage.Parent = Dropdown
            DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropImage.BackgroundTransparency = 1.000
            DropImage.Position = UDim2.new(0, 425, 0, 5)
            DropImage.Rotation = 0
            DropImage.Size = UDim2.new(0, 20, 0, 20)
            DropImage.Image = "rbxassetid://5012539403"
            
            DropScroll.Name = "DropScroll"
            DropScroll.Parent = Droptitle
            DropScroll.Active = true
            DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropScroll.BackgroundTransparency = 1.000
            DropScroll.BorderSizePixel = 0
            DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
            DropScroll.Size = UDim2.new(0, 212, 0, 70)
            DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
            DropScroll.ScrollBarThickness = 2
            
            DropdownList.Name = "DropdownList"
            DropdownList.Parent = DropScroll
            DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
            DropdownList.Padding = UDim.new(0, 5)
            
            DropdownPadding.Name = "DropdownPadding"
            DropdownPadding.Parent = DropScroll
            DropdownPadding.PaddingTop = UDim.new(0, 5)

            local isdropping = false

            for i,v in next,table do
                local DropButton2 = Instance.new("TextButton")

                DropButton2.Name = "DropButton2"
                DropButton2.Parent = DropScroll
                DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton2.BackgroundTransparency = 1.000
                DropButton2.Size = UDim2.new(0, 212, 0, 30)
                DropButton2.AutoButtonColor = false
                DropButton2.Font = Enum.Font.Gotham
                DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                DropButton2.TextSize = 11.000
                DropButton2.Text = tostring(v)

                DropButton2.MouseEnter:Connect(function()
                    TweenService:Create(
                        DropButton2,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(0, 255, 170)}
                    ):Play()
                end)
                DropButton2.MouseLeave:Connect(function()
                    TweenService:Create(
                        DropButton2,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)

                DropButton2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 212, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    Droptitle.Text =  text.." : "..tostring(v)
                    callback(v)
                    isdropping = not isdropping
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end)
            end

            DropButton.MouseButton1Click:Connect(function()
                if isdropping == false then
                    isdropping = true
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 212, 0, 100)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = -180}
                    ):Play()
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                else
                    isdropping = false
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 212, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end
            end)
            DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)

            local drop = {}

            function drop:Clear()
                Droptitle.Text = tostring(text).." :"
                TweenService:Create(
                    Dropdown,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 212, 0, 30)} 
                ):Play()
                isdropping = false
                for i, v in next, DropScroll:GetChildren() do
                    if v:IsA("TextButton") then
                        v:Destroy()
                    end
                end
            end
            function drop:Add(t)
                local DropButton2 = Instance.new("TextButton")

                DropButton2.Name = "DropButton2"
                DropButton2.Parent = DropScroll
                DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton2.BackgroundTransparency = 1.000
                DropButton2.Size = UDim2.new(0, 212, 0, 30)
                DropButton2.AutoButtonColor = false
                DropButton2.Font = Enum.Font.Gotham
                DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                DropButton2.TextSize = 11.000
                DropButton2.Text = tostring(t)

                DropButton2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 212, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    Droptitle.Text =  text.." : "..tostring(t)
                    callback(t)
                    isdropping = not isdropping
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end)
            end
            return drop
        end

        function main:AddDropdownRight(text,table,callback)
            local Dropdown = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local DropButton = Instance.new("TextButton")
            local Droptitle = Instance.new("TextLabel")
            local DropScroll = Instance.new("ScrollingFrame")
            local DropdownList = Instance.new("UIListLayout")
            local DropdownPadding = Instance.new("UIPadding")
            local DropImage = Instance.new("ImageLabel")
            
            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Scrollingwindowright
            Dropdown.Active = true
            Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Dropdown.ClipsDescendants = true
            Dropdown.Size = UDim2.new(0, 212, 0, 30)
            
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Dropdown
            
            DropButton.Name = "DropButton"
            DropButton.Parent = Dropdown
            DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropButton.BackgroundTransparency = 1.000
            DropButton.Size = UDim2.new(0, 212, 0, 30)
            DropButton.Font = Enum.Font.SourceSans
            DropButton.Text = ""
            DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropButton.TextSize = 14.000
            
            Droptitle.Name = "Droptitle"
            Droptitle.Parent = Dropdown
            Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Droptitle.BackgroundTransparency = 1.000
            Droptitle.Position = UDim2.new(0.05, 0, 0, 0)
            Droptitle.Size = UDim2.new(0, 410, 0, 30)
            Droptitle.Font = Enum.Font.Gotham
            Droptitle.Text = text.." : "
            Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            Droptitle.TextSize = 11.000
            Droptitle.TextXAlignment = Enum.TextXAlignment.Left

            DropImage.Name = "DropImage"
            DropImage.Parent = Dropdown
            DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropImage.BackgroundTransparency = 1.000
            DropImage.Position = UDim2.new(0, 425, 0, 5)
            DropImage.Rotation = 0
            DropImage.Size = UDim2.new(0, 20, 0, 20)
            DropImage.Image = "rbxassetid://5012539403"
            
            DropScroll.Name = "DropScroll"
            DropScroll.Parent = Droptitle
            DropScroll.Active = true
            DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropScroll.BackgroundTransparency = 1.000
            DropScroll.BorderSizePixel = 0
            DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
            DropScroll.Size = UDim2.new(0, 212, 0, 70)
            DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
            DropScroll.ScrollBarThickness = 2
            
            DropdownList.Name = "DropdownList"
            DropdownList.Parent = DropScroll
            DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
            DropdownList.Padding = UDim.new(0, 5)
            
            DropdownPadding.Name = "DropdownPadding"
            DropdownPadding.Parent = DropScroll
            DropdownPadding.PaddingTop = UDim.new(0, 5)

            local isdropping = false

            for i,v in next,table do
                local DropButton2 = Instance.new("TextButton")

                DropButton2.Name = "DropButton2"
                DropButton2.Parent = DropScroll
                DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton2.BackgroundTransparency = 1.000
                DropButton2.Size = UDim2.new(0, 212, 0, 30)
                DropButton2.AutoButtonColor = false
                DropButton2.Font = Enum.Font.Gotham
                DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                DropButton2.TextSize = 11.000
                DropButton2.Text = tostring(v)

                DropButton2.MouseEnter:Connect(function()
                    TweenService:Create(
                        DropButton2,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(0, 255, 170)}
                    ):Play()
                end)
                DropButton2.MouseLeave:Connect(function()
                    TweenService:Create(
                        DropButton2,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)

                DropButton2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 212, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    Droptitle.Text =  text.." : "..tostring(v)
                    callback(v)
                    isdropping = not isdropping
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end)
            end

            DropButton.MouseButton1Click:Connect(function()
                if isdropping == false then
                    isdropping = true
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 212, 0, 100)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = -180}
                    ):Play()
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                else
                    isdropping = false
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 212, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end
            end)
            DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)

            local drop = {}

            function drop:Clear()
                Droptitle.Text = tostring(text).." :"
                TweenService:Create(
                    Dropdown,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 212, 0, 30)} 
                ):Play()
                isdropping = false
                for i, v in next, DropScroll:GetChildren() do
                    if v:IsA("TextButton") then
                        v:Destroy()
                    end
                end
            end
            function drop:Add(t)
                local DropButton2 = Instance.new("TextButton")

                DropButton2.Name = "DropButton2"
                DropButton2.Parent = DropScroll
                DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton2.BackgroundTransparency = 1.000
                DropButton2.Size = UDim2.new(0, 212, 0, 30)
                DropButton2.AutoButtonColor = false
                DropButton2.Font = Enum.Font.Gotham
                DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                DropButton2.TextSize = 11.000
                DropButton2.Text = tostring(t)

                DropButton2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 212, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    Droptitle.Text =  text.." : "..tostring(t)
                    callback(t)
                    isdropping = not isdropping
                    DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                end)
            end
            return drop
        end

        function main:AddSliderLeft(text,min,max,set,callback)
            set = (math.clamp(set,min,max))
            if set > max then set = max end

            local Slider = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local SliderTitle = Instance.new("TextLabel")
            local SliderValue = Instance.new("TextLabel")
            local SliderButton = Instance.new("TextButton")
            local Bar1 = Instance.new("Frame")
            local Bar = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            local CircleBar = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local UICorner_4 = Instance.new("UICorner")

            Slider.Name = "Slider"
            Slider.Parent = Scrollingwindowleft
            Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Slider.Size = UDim2.new(0, 212, 0, 40)

            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Slider

            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = Slider
            SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
            SliderTitle.Size = UDim2.new(0, 290, 0, 20)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            SliderTitle.TextSize = 11.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

            SliderValue.Name = "SliderValue"
            SliderValue.Parent = Slider
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
            SliderValue.Size = UDim2.new(0, 40, 0, 20)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text =  tostring(set and math.floor( (set / max) * (max - min) + min) or 0)
            SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
            SliderValue.TextSize = 11.000

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = Slider
            SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton.BackgroundTransparency = 1.000
            SliderButton.Position = UDim2.new(0, 5, 0, 25)
            SliderButton.Size = UDim2.new(0, 200, 0, 5)
            SliderButton.AutoButtonColor = false
            SliderButton.Font = Enum.Font.SourceSans
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderButton.TextSize = 14.000

            Bar1.Name = "Bar1"
            Bar1.Parent = SliderButton
            Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            Bar1.Size = UDim2.new(0, 200, 0, 5)

            Bar.Name = "Bar"
            Bar.Parent = Bar1
            Bar.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            Bar.Size = UDim2.new(set/max, 0, 0, 5)

            UICorner_2.CornerRadius = UDim.new(0, 100)
            UICorner_2.Parent = Bar

            CircleBar.Name = "CircleBar"
            CircleBar.Parent = Bar
            CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CircleBar.Position = UDim2.new(1, -2, 0, -2)
            CircleBar.AnchorPoint = Vector2.new(0, 0.1)
            CircleBar.Size = UDim2.new(0, 10, 0, 10)

            UICorner_3.CornerRadius = UDim.new(0, 100)
            UICorner_3.Parent = CircleBar

            UICorner_4.CornerRadius = UDim.new(0, 100)
            UICorner_4.Parent = Bar1
            
            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")

            if Value == nil then
                Value = set
                pcall(function()
                    callback(Value)
                end)
            end
            
            SliderButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(max) - tonumber(min)) / 200) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                pcall(function()
                    callback(Value)
                end)
                Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 200), 0, 5)
                CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 190), 0, -2)
                moveconnection = mouse.Move:Connect(function()
                    SliderValue.Text = Value
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 200) * Bar.AbsoluteSize.X) + tonumber(min))
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 200), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 190), 0, -2)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 200) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 200), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 190), 0, -2)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 200) * Bar.AbsoluteSize.X) + tonumber(min))
                    SliderValue.Text = Value
                end
            end)
        end

        function main:AddSliderRight(text,min,max,set,callback)
            set = (math.clamp(set,min,max))
            if set > max then set = max end

            local Slider = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local SliderTitle = Instance.new("TextLabel")
            local SliderValue = Instance.new("TextLabel")
            local SliderButton = Instance.new("TextButton")
            local Bar1 = Instance.new("Frame")
            local Bar = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            local CircleBar = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local UICorner_4 = Instance.new("UICorner")

            Slider.Name = "Slider"
            Slider.Parent = Scrollingwindowright
            Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Slider.Size = UDim2.new(0, 212, 0, 40)

            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Slider

            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = Slider
            SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
            SliderTitle.Size = UDim2.new(0, 290, 0, 20)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            SliderTitle.TextSize = 11.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

            SliderValue.Name = "SliderValue"
            SliderValue.Parent = Slider
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0.8, 0, 0, 0)
            SliderValue.Size = UDim2.new(0, 40, 0, 20)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text =  tostring(set and math.floor( (set / max) * (max - min) + min) or 0)
            SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
            SliderValue.TextSize = 11.000

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = Slider
            SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton.BackgroundTransparency = 1.000
            SliderButton.Position = UDim2.new(0, 5, 0, 25)
            SliderButton.Size = UDim2.new(0, 200, 0, 5)
            SliderButton.AutoButtonColor = false
            SliderButton.Font = Enum.Font.SourceSans
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderButton.TextSize = 14.000

            Bar1.Name = "Bar1"
            Bar1.Parent = SliderButton
            Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            Bar1.Size = UDim2.new(0, 200, 0, 5)

            Bar.Name = "Bar"
            Bar.Parent = Bar1
            Bar.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            Bar.Size = UDim2.new(set/max, 0, 0, 5)

            UICorner_2.CornerRadius = UDim.new(0, 100)
            UICorner_2.Parent = Bar

            CircleBar.Name = "CircleBar"
            CircleBar.Parent = Bar
            CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CircleBar.Position = UDim2.new(1, -2, 0, -2)
            CircleBar.AnchorPoint = Vector2.new(0, 0.1)
            CircleBar.Size = UDim2.new(0, 10, 0, 10)

            UICorner_3.CornerRadius = UDim.new(0, 100)
            UICorner_3.Parent = CircleBar

            UICorner_4.CornerRadius = UDim.new(0, 100)
            UICorner_4.Parent = Bar1
            
            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")

            if Value == nil then
                Value = set
                pcall(function()
                    callback(Value)
                end)
            end
            
            SliderButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(max) - tonumber(min)) / 200) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                pcall(function()
                    callback(Value)
                end)
                Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 200), 0, 5)
                CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 190), 0, -2)
                moveconnection = mouse.Move:Connect(function()
                    SliderValue.Text = Value
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 200) * Bar.AbsoluteSize.X) + tonumber(min))
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 200), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 190), 0, -2)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 200) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 200), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 190), 0, -2)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 200) * Bar.AbsoluteSize.X) + tonumber(min))
                    SliderValue.Text = Value
                end
            end)
        end

        function main:AddSeperatorLeft(text)
            local Seperator = Instance.new("Frame")
            local Sep1 = Instance.new("Frame")
            local SepLabel = Instance.new("TextLabel")
            local Sep2 = Instance.new("Frame")

            Seperator.Name = "Seperator"
            Seperator.Parent = Scrollingwindowleft
            Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Seperator.BackgroundTransparency = 1.000
            Seperator.ClipsDescendants = true
            Seperator.Size = UDim2.new(0, 212, 0, 20)

            Sep1.Name = "Sep1"
            Sep1.Parent = Seperator
            Sep1.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            Sep1.BorderSizePixel = 0
            Sep1.Position = UDim2.new(0, 0, 0, 10)
            Sep1.Size = UDim2.new(0, 50, 0, 1)

            SepLabel.Name = "SepLabel"
            SepLabel.Parent = Seperator
            SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SepLabel.BackgroundTransparency = 1.000
            SepLabel.Position = UDim2.new(0, 85, 0, 0)
            SepLabel.Size = UDim2.new(0, 50, 0, 20)
            SepLabel.Font = Enum.Font.Gotham
            SepLabel.Text = text
            SepLabel.TextColor3 = Color3.fromRGB(225,225,225)
            SepLabel.TextSize = 11.000

            Sep2.Name = "Sep2"
            Sep2.Parent = Seperator
            Sep2.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            Sep2.BorderSizePixel = 0
            Sep2.Position = UDim2.new(0, 170, 0, 10)
            Sep2.Size = UDim2.new(0, 50, 0, 1)
        end

        function main:AddSeperatorRight(text)
            local Seperator = Instance.new("Frame")
            local Sep1 = Instance.new("Frame")
            local SepLabel = Instance.new("TextLabel")
            local Sep2 = Instance.new("Frame")

            Seperator.Name = "Seperator"
            Seperator.Parent = Scrollingwindowright
            Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Seperator.BackgroundTransparency = 1.000
            Seperator.ClipsDescendants = true
            Seperator.Size = UDim2.new(0, 212, 0, 20)

            Sep1.Name = "Sep1"
            Sep1.Parent = Seperator
            Sep1.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            Sep1.BorderSizePixel = 0
            Sep1.Position = UDim2.new(0, 0, 0, 10)
            Sep1.Size = UDim2.new(0, 50, 0, 1)

            SepLabel.Name = "SepLabel"
            SepLabel.Parent = Seperator
            SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SepLabel.BackgroundTransparency = 1.000
            SepLabel.Position = UDim2.new(0, 85, 0, 0)
            SepLabel.Size = UDim2.new(0, 50, 0, 20)
            SepLabel.Font = Enum.Font.Gotham
            SepLabel.Text = text
            SepLabel.TextColor3 = Color3.fromRGB(225,225,225)
            SepLabel.TextSize = 11.000

            Sep2.Name = "Sep2"
            Sep2.Parent = Seperator
            Sep2.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            Sep2.BorderSizePixel = 0
            Sep2.Position = UDim2.new(0, 170, 0, 10)
            Sep2.Size = UDim2.new(0, 50, 0, 1)
        end

        function main:AddLineLeft()
            local Line = Instance.new("Frame")
            local Linee = Instance.new("Frame")

            Line.Name = "Line"
            Line.Parent = Scrollingwindowleft
            Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Line.BackgroundTransparency = 1.000
            Line.ClipsDescendants = true
            Line.Size = UDim2.new(0, 212, 0, 20)

            Linee.Name = "Linee"
            Linee.Parent = Line
            Linee.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            Linee.BorderSizePixel = 0
            Linee.Position = UDim2.new(0, 0, 0, 10)
            Linee.Size = UDim2.new(0, 212, 0, 1)
        end

        function main:AddLineRight()
            local Line = Instance.new("Frame")
            local Linee = Instance.new("Frame")

            Line.Name = "Line"
            Line.Parent = Scrollingwindowright
            Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Line.BackgroundTransparency = 1.000
            Line.ClipsDescendants = true
            Line.Size = UDim2.new(0, 212, 0, 20)

            Linee.Name = "Linee"
            Linee.Parent = Line
            Linee.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
            Linee.BorderSizePixel = 0
            Linee.Position = UDim2.new(0, 0, 0, 10)
            Linee.Size = UDim2.new(0, 212, 0, 1)
        end

        function main:AddLabelLeft(text)
            local Label = Instance.new("TextLabel")
            local PaddingLabel = Instance.new("UIPadding")
            local labell = {}
    
            Label.Name = "Label"
            Label.Parent = Scrollingwindowleft
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.Size = UDim2.new(0, 212, 0, 20)
            Label.Font = Enum.Font.Gotham
            Label.TextColor3 = Color3.fromRGB(225, 225, 225)
            Label.TextSize = 11.000
            Label.Text = text
            Label.TextXAlignment = Enum.TextXAlignment.Left

            PaddingLabel.PaddingLeft = UDim.new(0,10)
            PaddingLabel.Parent = Label
            PaddingLabel.Name = "PaddingLabel"
    
            function labell:Set(newtext)
                Label.Text = newtext
            end

            return labell
        end

        function main:AddLabelRight(text)
            local Label = Instance.new("TextLabel")
            local PaddingLabel = Instance.new("UIPadding")
            local labell = {}
    
            Label.Name = "Label"
            Label.Parent = Scrollingwindowright
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.Size = UDim2.new(0, 212, 0, 20)
            Label.Font = Enum.Font.Gotham
            Label.TextColor3 = Color3.fromRGB(225, 225, 225)
            Label.TextSize = 11.000
            Label.Text = text
            Label.TextXAlignment = Enum.TextXAlignment.Left

            PaddingLabel.PaddingLeft = UDim.new(0,10)
            PaddingLabel.Parent = Label
            PaddingLabel.Name = "PaddingLabel"
    
            function labell:Set(newtext)
                Label.Text = newtext
            end

            return labell
        end
        return main
    end
    return uicategory
end