local UGINITY = {}

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Enhanced Animation Properties
local tweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local fastTween = TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local pageTransition = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local smoothTween = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

-- Main GUI Setup
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "UGINITY_HUB"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Enhanced Floating Circle Button
local openBtn = Instance.new("ImageButton", screenGui)
openBtn.Size = UDim2.new(0, 70, 0, 70)
openBtn.Position = UDim2.new(0, 25, 0.5, -35)
openBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
openBtn.BorderSizePixel = 0
openBtn.Image = ""
openBtn.Draggable = true
openBtn.Active = true
openBtn.ZIndex = 1000

-- Perfect circle
local btnCorner = Instance.new("UICorner", openBtn)
btnCorner.CornerRadius = UDim.new(1, 0)

-- Enhanced gradient
local gradient = Instance.new("UIGradient", openBtn)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 28, 28)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 8))
}
gradient.Rotation = 145

-- Glowing border effect
local stroke = Instance.new("UIStroke", openBtn)
stroke.Color = Color3.fromRGB(60, 60, 60)
stroke.Thickness = 2
stroke.Transparency = 0.3

-- Button text
local btnText = Instance.new("TextLabel", openBtn)
btnText.Size = UDim2.new(1, 0, 1, 0)
btnText.Text = "U"
btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
btnText.TextScaled = true
btnText.Font = Enum.Font.GothamBold
btnText.BackgroundTransparency = 1

-- Enhanced Main UI Frame
local Main = Instance.new("Frame", screenGui)
Main.Size = UDim2.new(0, 520, 0, 340)
Main.Position = UDim2.new(0.5, -260, 0.5, -170)
Main.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
Main.BorderSizePixel = 0
Main.Visible = false
Main.ClipsDescendants = true
Main.ZIndex = 10
Main.Active = true
Main.Draggable = true

-- Enhanced rounded corners
local mainCorner = Instance.new("UICorner", Main)
mainCorner.CornerRadius = UDim.new(0, 12)

-- Glowing border
local mainStroke = Instance.new("UIStroke", Main)
mainStroke.Color = Color3.fromRGB(40, 40, 40)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.2

-- Drop shadow effect
local shadow = Instance.new("Frame", Main)
shadow.Size = UDim2.new(1, 8, 1, 8)
shadow.Position = UDim2.new(0, -4, 0, -4)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.7
shadow.ZIndex = -1
local shadowCorner = Instance.new("UICorner", shadow)
shadowCorner.CornerRadius = UDim.new(0, 16)

-- Enhanced Top Bar with colored dots
local topBar = Instance.new("Frame", Main)
topBar.Size = UDim2.new(1, 0, 0, 36)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
topBar.BorderSizePixel = 0

local topBarCorner = Instance.new("UICorner", topBar)
topBarCorner.CornerRadius = UDim.new(0, 12)

-- Colored Traffic Light Dots (macOS style)
local dotsFrame = Instance.new("Frame", topBar)
dotsFrame.Size = UDim2.new(0, 60, 0, 20)
dotsFrame.Position = UDim2.new(0, 12, 0.5, -10)
dotsFrame.BackgroundTransparency = 1

-- Black dot
local blackDot = Instance.new("Frame", dotsFrame)
blackDot.Size = UDim2.new(0, 12, 0, 12)
blackDot.Position = UDim2.new(0, 0, 0.5, -6)
blackDot.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
blackDot.BorderSizePixel = 0
local blackCorner = Instance.new("UICorner", blackDot)
blackCorner.CornerRadius = UDim.new(1, 0)

-- Blue dot
local blueDot = Instance.new("Frame", dotsFrame)
blueDot.Size = UDim2.new(0, 12, 0, 12)
blueDot.Position = UDim2.new(0, 20, 0.5, -6)
blueDot.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
blueDot.BorderSizePixel = 0
local blueCorner = Instance.new("UICorner", blueDot)
blueCorner.CornerRadius = UDim.new(1, 0)

-- Red dot
local redDot = Instance.new("Frame", dotsFrame)
redDot.Size = UDim2.new(0, 12, 0, 12)
redDot.Position = UDim2.new(0, 40, 0.5, -6)
redDot.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
redDot.BorderSizePixel = 0
local redCorner = Instance.new("UICorner", redDot)
redCorner.CornerRadius = UDim.new(1, 0)

-- Dot hover animations
local function animateDot(dot, hoverColor, normalColor)
    local button = Instance.new("TextButton", dot)
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Text = ""
    button.BackgroundTransparency = 1
    
    button.MouseEnter:Connect(function()
        TweenService:Create(dot, fastTween, {
            BackgroundColor3 = hoverColor,
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(dot.Position.X.Scale, dot.Position.X.Offset - 1, 0.5, -7)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(dot, fastTween, {
            BackgroundColor3 = normalColor,
            Size = UDim2.new(0, 12, 0, 12),
            Position = UDim2.new(dot.Position.X.Scale, dot.Position.X.Offset + 1, 0.5, -6)
        }):Play()
    end)
end

animateDot(blackDot, Color3.fromRGB(70, 70, 70), Color3.fromRGB(45, 45, 45))
animateDot(blueDot, Color3.fromRGB(30, 140, 255), Color3.fromRGB(0, 120, 255))
animateDot(redDot, Color3.fromRGB(255, 80, 80), Color3.fromRGB(255, 60, 60))

-- Enhanced Title
local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -150, 1, 0)
title.Position = UDim2.new(0, 80, 0, 0)
title.Text = "UGINITY"
title.TextColor3 = Color3.fromRGB(250, 250, 250)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- Enhanced Close button
local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -34, 0, 2)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.BackgroundTransparency = 1

local closeBtnCorner = Instance.new("UICorner", closeBtn)
closeBtnCorner.CornerRadius = UDim.new(0, 6)

-- Enhanced Sidebar
local TabFrame = Instance.new("Frame", Main)
TabFrame.Size = UDim2.new(0, 130, 1, -42)
TabFrame.Position = UDim2.new(0, 6, 0, 40)
TabFrame.BackgroundTransparency = 1

local TabList = Instance.new("UIListLayout", TabFrame)
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Padding = UDim.new(0, 4)
TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local tabPadding = Instance.new("UIPadding", TabFrame)
tabPadding.PaddingTop = UDim.new(0, 6)

-- Enhanced Content Area
local ContentFrame = Instance.new("Frame", Main)
ContentFrame.Size = UDim2.new(1, -145, 1, -48)
ContentFrame.Position = UDim2.new(0, 140, 0, 42)
ContentFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
ContentFrame.BorderSizePixel = 0
ContentFrame.ClipsDescendants = true

local contentCorner = Instance.new("UICorner", ContentFrame)
contentCorner.CornerRadius = UDim.new(0, 10)

-- Enhanced hover animations
local function animateHover(element, hoverProps, normalProps)
    element.MouseEnter:Connect(function()
        local tween = TweenService:Create(element, smoothTween, hoverProps)
        tween:Play()
    end)
    
    element.MouseLeave:Connect(function()
        local tween = TweenService:Create(element, smoothTween, normalProps)
        tween:Play()
    end)
end

-- Enhanced close button hover
animateHover(closeBtn, 
    {
        TextColor3 = Color3.fromRGB(255, 100, 100),
        BackgroundTransparency = 0.8,
        BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    }, 
    {
        TextColor3 = Color3.fromRGB(200, 200, 200),
        BackgroundTransparency = 1
    }
)

-- Enhanced Tab Creation
local activeTab = nil
local pages = {}

function UGINITY:CreateTab(name, icon)
    local tabBtn = Instance.new("TextButton", TabFrame)
    tabBtn.Text = name
    tabBtn.Size = UDim2.new(1, -8, 0, 38)
    tabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    tabBtn.TextColor3 = Color3.fromRGB(170, 170, 170)
    tabBtn.Font = Enum.Font.GothamSemibold
    tabBtn.TextSize = 13
    tabBtn.BorderSizePixel = 0
    
    local tabCorner = Instance.new("UICorner", tabBtn)
    tabCorner.CornerRadius = UDim.new(0, 8)

    -- Tab glow effect
    local tabStroke = Instance.new("UIStroke", tabBtn)
    tabStroke.Color = Color3.fromRGB(30, 30, 30)
    tabStroke.Thickness = 1
    tabStroke.Transparency = 0.5

    -- Create enhanced page
    local pageContainer = Instance.new("Frame", ContentFrame)
    pageContainer.Size = UDim2.new(1, 0, 1, 0)
    pageContainer.Position = UDim2.new(0, 0, 0, 0)
    pageContainer.BackgroundTransparency = 1
    pageContainer.Visible = false
    pageContainer.ClipsDescendants = true

    local page = Instance.new("ScrollingFrame", pageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.Position = UDim2.new(0, 0, 0, 0)
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 6
    page.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    page.BorderSizePixel = 0

    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local pagePadding = Instance.new("UIPadding", page)
    pagePadding.PaddingTop = UDim.new(0, 10)
    pagePadding.PaddingLeft = UDim.new(0, 10)
    pagePadding.PaddingRight = UDim.new(0, 10)
    pagePadding.PaddingBottom = UDim.new(0, 10)

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)

    pages[tabBtn] = pageContainer

    -- Enhanced tab hover
    animateHover(tabBtn, 
        {
            BackgroundColor3 = Color3.fromRGB(35, 35, 35),
            TextColor3 = Color3.fromRGB(200, 200, 200)
        }, 
        {
            BackgroundColor3 = Color3.fromRGB(20, 20, 20),
            TextColor3 = Color3.fromRGB(170, 170, 170)
        }
    )

    -- Enhanced tab switching
    tabBtn.MouseButton1Click:Connect(function()
        if activeTab == tabBtn then return end
        
        if activeTab then
            local prevPage = pages[activeTab]
            local prevTabTween = TweenService:Create(activeTab, pageTransition, {
                BackgroundColor3 = Color3.fromRGB(20, 20, 20),
                TextColor3 = Color3.fromRGB(170, 170, 170)
            })
            prevTabTween:Play()
            
            local slideOut = TweenService:Create(prevPage, pageTransition, {
                Position = UDim2.new(-1, 0, 0, 0)
            })
            slideOut:Play()
            slideOut.Completed:Connect(function()
                prevPage.Visible = false
                prevPage.Position = UDim2.new(1, 0, 0, 0)
            end)
        end
        
        local activeTabTween = TweenService:Create(tabBtn, pageTransition, {
            BackgroundColor3 = Color3.fromRGB(0, 120, 255),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
        activeTabTween:Play()
        
        pageContainer.Visible = true
        pageContainer.Position = UDim2.new(1, 0, 0, 0)
        local slideIn = TweenService:Create(pageContainer, pageTransition, {
            Position = UDim2.new(0, 0, 0, 0)
        })
        slideIn:Play()
        
        activeTab = tabBtn
    end)

    return page
end

-- Enhanced UI Elements with better styling
function UGINITY:CreateLabel(tab, text, color)
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1, -20, 0, 32)
    frame.BackgroundTransparency = 1

    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.Text = text
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = color or Color3.fromRGB(220, 220, 220)
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextSize = 14
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    return lbl
end

function UGINITY:CreateButton(tab, text, callback)
    local btn = Instance.new("TextButton", tab)
    btn.Text = text
    btn.Size = UDim2.new(1, -20, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.TextColor3 = Color3.fromRGB(250, 250, 250)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 8)
    
    local btnStroke = Instance.new("UIStroke", btn)
    btnStroke.Color = Color3.fromRGB(40, 40, 40)
    btnStroke.Thickness = 1
    btnStroke.Transparency = 0.7
    
    animateHover(btn, 
        {
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }, 
        {
            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
            TextColor3 = Color3.fromRGB(250, 250, 250)
        }
    )
    
    btn.MouseButton1Click:Connect(function()
        local clickTween = TweenService:Create(btn, TweenInfo.new(0.08), {
            Size = UDim2.new(1, -22, 0, 34)
        })
        clickTween:Play()
        clickTween.Completed:Connect(function()
            local backTween = TweenService:Create(btn, TweenInfo.new(0.08), {
                Size = UDim2.new(1, -20, 0, 36)
            })
            backTween:Play()
        end)
        pcall(callback)
    end)
    
    return btn
end

function UGINITY:CreateToggle(tab, text, default, callback)
    local toggled = default
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1, -20, 0, 36)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    frame.BorderSizePixel = 0
    
    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 8)
    
    local frameStroke = Instance.new("UIStroke", frame)
    frameStroke.Color = Color3.fromRGB(35, 35, 35)
    frameStroke.Thickness = 1
    frameStroke.Transparency = 0.6

    local toggleFrame = Instance.new("Frame", frame)
    toggleFrame.Size = UDim2.new(0, 48, 0, 22)
    toggleFrame.Position = UDim2.new(1, -52, 0.5, -11)
    toggleFrame.BackgroundColor3 = toggled and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(45, 45, 45)
    toggleFrame.BorderSizePixel = 0
    
    local toggleCorner = Instance.new("UICorner", toggleFrame)
    toggleCorner.CornerRadius = UDim.new(1, 0)

    local toggleButton = Instance.new("Frame", toggleFrame)
    toggleButton.Size = UDim2.new(0, 18, 0, 18)
    toggleButton.Position = toggled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.BorderSizePixel = 0
    
    local buttonCorner = Instance.new("UICorner", toggleButton)
    buttonCorner.CornerRadius = UDim.new(1, 0)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Text = text
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    local clickBtn = Instance.new("TextButton", frame)
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.Text = ""
    clickBtn.BackgroundTransparency = 1

    clickBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        
        local colorTween = TweenService:Create(toggleFrame, tweenInfo, {
            BackgroundColor3 = toggled and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(45, 45, 45)
        })
        local positionTween = TweenService:Create(toggleButton, tweenInfo, {
            Position = toggled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        })
        
        colorTween:Play()
        positionTween:Play()
        pcall(callback, toggled)
    end)
    
    return frame
end

function UGINITY:CreateSlider(tab, name, min, max, default, callback)
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1, -20, 0, 48)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    frame.BorderSizePixel = 0
    
    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 8)
    
    local frameStroke = Instance.new("UIStroke", frame)
    frameStroke.Color = Color3.fromRGB(35, 35, 35)
    frameStroke.Thickness = 1
    frameStroke.Transparency = 0.6

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -12, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 6)
    label.Text = name .. ": " .. default
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 13
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left

    local sliderTrack = Instance.new("Frame", frame)
    sliderTrack.Size = UDim2.new(1, -20, 0, 6)
    sliderTrack.Position = UDim2.new(0, 10, 0, 30)
    sliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sliderTrack.BorderSizePixel = 0
    
    local trackCorner = Instance.new("UICorner", sliderTrack)
    trackCorner.CornerRadius = UDim.new(1, 0)

    local sliderFill = Instance.new("Frame", sliderTrack)
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    sliderFill.BorderSizePixel = 0
    
    local fillCorner = Instance.new("UICorner", sliderFill)
    fillCorner.CornerRadius = UDim.new(1, 0)

    local sliderButton = Instance.new("Frame", sliderTrack)
    sliderButton.Size = UDim2.new(0, 14, 0, 14)
    sliderButton.Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7)
    sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderButton.BorderSizePixel = 0
    
    local buttonCorner = Instance.new("UICorner", sliderButton)
    buttonCorner.CornerRadius = UDim.new(1, 0)

    local dragging = false
    local connection

    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            TweenService:Create(sliderButton, fastTween, {Size = UDim2.new(0, 18, 0, 18)}):Play()
            
            connection = UIS.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    local scale = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    local value = math.floor(min + (max - min) * scale)
                    
                    sliderFill.Size = UDim2.new(scale, 0, 1, 0)
                    sliderButton.Position = UDim2.new(scale, -9, 0.5, -9)
                    label.Text = name .. ": " .. value
                    pcall(callback, value)
                end
            end)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            TweenService:Create(sliderButton, fastTween, {
                Size = UDim2.new(0, 14, 0, 14),
                Position = UDim2.new(sliderButton.Position.X.Scale, -7, 0.5, -7)
            }):Play()
            
            if connection then
                connection:Disconnect()
            end
        end
    end)
    
    return frame
end

-- Enhanced GUI Toggle with smoother animations
local isOpen = false

local function toggleGUI()
    isOpen = not isOpen
    
    if isOpen then
        Main.Visible = true
        Main.Size = UDim2.new(0, 0, 0, 0)
        Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        local openTween = TweenService:Create(Main, tweenInfo, {
            Size = UDim2.new(0, 520, 0, 340),
            Position = UDim2.new(0.5, -260, 0.5, -170)
        })
        openTween:Play()
        
        TweenService:Create(btnText, tweenInfo, {
            TextColor3 = Color3.fromRGB(0, 120, 255)
        }):Play()
        
        TweenService:Create(stroke, tweenInfo, {
            Color = Color3.fromRGB(0, 120, 255),
            Transparency = 0
        }):Play()
    else
        local closeTween = TweenService:Create(Main, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        closeTween:Play()
        
        closeTween.Completed:Connect(function()
            Main.Visible = false
        end)
        
        TweenService:Create(btnText, tweenInfo, {
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        
        TweenService:Create(stroke, tweenInfo, {
            Color = Color3.fromRGB(60, 60, 60),
            Transparency = 0.3
        }):Play()
    end
end

-- Button connections
openBtn.MouseButton1Click:Connect(toggleGUI)
closeBtn.MouseButton1Click:Connect(
