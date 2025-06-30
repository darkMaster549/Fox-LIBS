local UGINITY = {}

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Animation Properties
local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local fastTween = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local pageTransition = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- Main GUI Setup
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "UGINITY_HUB"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Floating Circle Button
local openBtn = Instance.new("ImageButton", screenGui)
openBtn.Size = UDim2.new(0, 65, 0, 65)
openBtn.Position = UDim2.new(0, 25, 0.5, -32)
openBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
openBtn.BorderSizePixel = 0
openBtn.Image = ""
openBtn.Draggable = true
openBtn.Active = true
openBtn.ZIndex = 1000

-- Perfect circle
local btnCorner = Instance.new("UICorner", openBtn)
btnCorner.CornerRadius = UDim.new(1, 0)

-- Subtle gradient
local gradient = Instance.new("UIGradient", openBtn)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10))
}
gradient.Rotation = 135

-- Clean border
local stroke = Instance.new("UIStroke", openBtn)
stroke.Color = Color3.fromRGB(45, 45, 45)
stroke.Thickness = 1.5

-- Button text
local btnText = Instance.new("TextLabel", openBtn)
btnText.Size = UDim2.new(1, 0, 1, 0)
btnText.Text = "U"
btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
btnText.TextScaled = true
btnText.Font = Enum.Font.GothamBold
btnText.BackgroundTransparency = 1

-- Main UI Frame - Cleaner design
local Main = Instance.new("Frame", screenGui)
Main.Size = UDim2.new(0, 500, 0, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Main.BorderSizePixel = 0
Main.Visible = false
Main.ClipsDescendants = true
Main.ZIndex = 10
Main.Active = true
Main.Draggable = true

-- Rounded corners
local mainCorner = Instance.new("UICorner", Main)
mainCorner.CornerRadius = UDim.new(0, 10)

-- Subtle border
local mainStroke = Instance.new("UIStroke", Main)
mainStroke.Color = Color3.fromRGB(35, 35, 35)
mainStroke.Thickness = 1

-- Clean Top Bar
local topBar = Instance.new("Frame", Main)
topBar.Size = UDim2.new(1, 0, 0, 32)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
topBar.BorderSizePixel = 0

local topBarCorner = Instance.new("UICorner", topBar)
topBarCorner.CornerRadius = UDim.new(0, 10)

-- Title - Clean and minimal
local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -70, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.Text = "UGINITY"
title.TextColor3 = Color3.fromRGB(240, 240, 240)
title.Font = Enum.Font.GothamSemibold
title.TextSize = 14
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- Close button - Minimalist
local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -30, 0, 2)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.BackgroundTransparency = 1

-- Sidebar - Cleaner tabs
local TabFrame = Instance.new("Frame", Main)
TabFrame.Size = UDim2.new(0, 120, 1, -37)
TabFrame.Position = UDim2.new(0, 5, 0, 35)
TabFrame.BackgroundTransparency = 1

local TabList = Instance.new("UIListLayout", TabFrame)
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Padding = UDim.new(0, 3)
TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local tabPadding = Instance.new("UIPadding", TabFrame)
tabPadding.PaddingTop = UDim.new(0, 5)

-- Content Area - Clean container
local ContentFrame = Instance.new("Frame", Main)
ContentFrame.Size = UDim2.new(1, -135, 1, -42)
ContentFrame.Position = UDim2.new(0, 130, 0, 37)
ContentFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
ContentFrame.BorderSizePixel = 0
ContentFrame.ClipsDescendants = true

local contentCorner = Instance.new("UICorner", ContentFrame)
contentCorner.CornerRadius = UDim.new(0, 8)

-- Hover animations
local function animateHover(element, hoverProps, normalProps)
    element.MouseEnter:Connect(function()
        local tween = TweenService:Create(element, fastTween, hoverProps)
        tween:Play()
    end)
    
    element.MouseLeave:Connect(function()
        local tween = TweenService:Create(element, fastTween, normalProps)
        tween:Play()
    end)
end

-- Close button hover
animateHover(closeBtn, 
    {TextColor3 = Color3.fromRGB(255, 100, 100)}, 
    {TextColor3 = Color3.fromRGB(200, 200, 200)}
)

-- Tab Creation with smooth transitions
local activeTab = nil
local pages = {}

function UGINITY:CreateTab(name, icon)
    local tabBtn = Instance.new("TextButton", TabFrame)
    tabBtn.Text = name
    tabBtn.Size = UDim2.new(1, -10, 0, 36)
    tabBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    tabBtn.TextColor3 = Color3.fromRGB(160, 160, 160)
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.TextSize = 12
    tabBtn.BorderSizePixel = 0
    
    local tabCorner = Instance.new("UICorner", tabBtn)
    tabCorner.CornerRadius = UDim.new(0, 6)

    -- Create page with slide animation support
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
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
    page.BorderSizePixel = 0

    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local pagePadding = Instance.new("UIPadding", page)
    pagePadding.PaddingTop = UDim.new(0, 8)
    pagePadding.PaddingLeft = UDim.new(0, 8)
    pagePadding.PaddingRight = UDim.new(0, 8)
    pagePadding.PaddingBottom = UDim.new(0, 8)

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 16)
    end)

    -- Store page reference
    pages[tabBtn] = pageContainer

    -- Tab hover effect
    animateHover(tabBtn, 
        {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, 
        {BackgroundColor3 = Color3.fromRGB(22, 22, 22)}
    )

    -- Smooth tab switching with page transitions
    tabBtn.MouseButton1Click:Connect(function()
        if activeTab == tabBtn then return end
        
        -- Animate previous tab out
        if activeTab then
            local prevPage = pages[activeTab]
            local prevTabTween = TweenService:Create(activeTab, pageTransition, {
                BackgroundColor3 = Color3.fromRGB(22, 22, 22),
                TextColor3 = Color3.fromRGB(160, 160, 160)
            })
            prevTabTween:Play()
            
            -- Slide out animation
            local slideOut = TweenService:Create(prevPage, pageTransition, {
                Position = UDim2.new(-1, 0, 0, 0)
            })
            slideOut:Play()
            slideOut.Completed:Connect(function()
                prevPage.Visible = false
                prevPage.Position = UDim2.new(1, 0, 0, 0) -- Reset for next slide in
            end)
        end
        
        -- Animate current tab in
        local activeTabTween = TweenService:Create(tabBtn, pageTransition, {
            BackgroundColor3 = Color3.fromRGB(40, 120, 255),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
        activeTabTween:Play()
        
        -- Slide in animation
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

-- Clean UI Elements
function UGINITY:CreateLabel(tab, text, color)
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1, -16, 0, 28)
    frame.BackgroundTransparency = 1

    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.Text = text
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = color or Color3.fromRGB(210, 210, 210)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    return lbl
end

function UGINITY:CreateButton(tab, text, callback)
    local btn = Instance.new("TextButton", tab)
    btn.Text = text
    btn.Size = UDim2.new(1, -16, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 13
    btn.BorderSizePixel = 0
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 6)
    
    animateHover(btn, 
        {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, 
        {BackgroundColor3 = Color3.fromRGB(28, 28, 28)}
    )
    
    btn.MouseButton1Click:Connect(function()
        -- Smooth click animation
        local clickTween = TweenService:Create(btn, TweenInfo.new(0.1), {
            Size = UDim2.new(1, -18, 0, 32)
        })
        clickTween:Play()
        clickTween.Completed:Connect(function()
            local backTween = TweenService:Create(btn, TweenInfo.new(0.1), {
                Size = UDim2.new(1, -16, 0, 34)
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
    frame.Size = UDim2.new(1, -16, 0, 32)
    frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    frame.BorderSizePixel = 0
    
    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 6)

    local toggleFrame = Instance.new("Frame", frame)
    toggleFrame.Size = UDim2.new(0, 44, 0, 20)
    toggleFrame.Position = UDim2.new(1, -48, 0.5, -10)
    toggleFrame.BackgroundColor3 = toggled and Color3.fromRGB(40, 120, 255) or Color3.fromRGB(50, 50, 50)
    toggleFrame.BorderSizePixel = 0
    
    local toggleCorner = Instance.new("UICorner", toggleFrame)
    toggleCorner.CornerRadius = UDim.new(1, 0)

    local toggleButton = Instance.new("Frame", toggleFrame)
    toggleButton.Size = UDim2.new(0, 16, 0, 16)
    toggleButton.Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.BorderSizePixel = 0
    
    local buttonCorner = Instance.new("UICorner", toggleButton)
    buttonCorner.CornerRadius = UDim.new(1, 0)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -54, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.Text = text
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(210, 210, 210)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left

    local clickBtn = Instance.new("TextButton", frame)
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.Text = ""
    clickBtn.BackgroundTransparency = 1

    clickBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        
        local colorTween = TweenService:Create(toggleFrame, tweenInfo, {
            BackgroundColor3 = toggled and Color3.fromRGB(40, 120, 255) or Color3.fromRGB(50, 50, 50)
        })
        local positionTween = TweenService:Create(toggleButton, tweenInfo, {
            Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        })
        
        colorTween:Play()
        positionTween:Play()
        pcall(callback, toggled)
    end)
    
    return frame
end

function UGINITY:CreateSlider(tab, name, min, max, default, callback)
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1, -16, 0, 44)
    frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    frame.BorderSizePixel = 0
    
    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 6)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -8, 0, 18)
    label.Position = UDim2.new(0, 8, 0, 4)
    label.Text = name .. ": " .. default
    label.TextColor3 = Color3.fromRGB(210, 210, 210)
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left

    local sliderTrack = Instance.new("Frame", frame)
    sliderTrack.Size = UDim2.new(1, -16, 0, 4)
    sliderTrack.Position = UDim2.new(0, 8, 0, 26)
    sliderTrack.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    sliderTrack.BorderSizePixel = 0
    
    local trackCorner = Instance.new("UICorner", sliderTrack)
    trackCorner.CornerRadius = UDim.new(1, 0)

    local sliderFill = Instance.new("Frame", sliderTrack)
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(40, 120, 255)
    sliderFill.BorderSizePixel = 0
    
    local fillCorner = Instance.new("UICorner", sliderFill)
    fillCorner.CornerRadius = UDim.new(1, 0)

    local sliderButton = Instance.new("Frame", sliderTrack)
    sliderButton.Size = UDim2.new(0, 12, 0, 12)
    sliderButton.Position = UDim2.new((default - min) / (max - min), -6, 0.5, -6)
    sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderButton.BorderSizePixel = 0
    
    local buttonCorner = Instance.new("UICorner", sliderButton)
    buttonCorner.CornerRadius = UDim.new(1, 0)

    local dragging = false
    local connection

    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            -- Scale up animation
            TweenService:Create(sliderButton, fastTween, {Size = UDim2.new(0, 16, 0, 16)}):Play()
            
            connection = UIS.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    local scale = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    local value = math.floor(min + (max - min) * scale)
                    
                    sliderFill.Size = UDim2.new(scale, 0, 1, 0)
                    sliderButton.Position = UDim2.new(scale, -8, 0.5, -8)
                    label.Text = name .. ": " .. value
                    pcall(callback, value)
                end
            end)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            -- Scale down animation
            TweenService:Create(sliderButton, fastTween, {
                Size = UDim2.new(0, 12, 0, 12),
                Position = UDim2.new(sliderButton.Position.X.Scale, -6, 0.5, -6)
            }):Play()
            
            if connection then
                connection:Disconnect()
            end
        end
    end)
    
    return frame
end

-- Smooth GUI Toggle
local isOpen = false

local function toggleGUI()
    isOpen = not isOpen
    
    if isOpen then
        Main.Visible = true
        Main.Size = UDim2.new(0, 0, 0, 0)
        Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        -- Smooth scale in
        local openTween = TweenService:Create(Main, tweenInfo, {
            Size = UDim2.new(0, 500, 0, 320),
            Position = UDim2.new(0.5, -250, 0.5, -160)
        })
        openTween:Play()
        
        -- Button color change
        TweenService:Create(btnText, tweenInfo, {
            TextColor3 = Color3.fromRGB(40, 120, 255)
        }):Play()
    else
        -- Smooth scale out  
        local closeTween = TweenService:Create(Main, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        closeTween:Play()
        
        closeTween.Completed:Connect(function()
            Main.Visible = false
        end)
        
        -- Reset button color
        TweenService:Create(btnText, tweenInfo, {
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
    end
end

-- Button connections
openBtn.MouseButton1Click:Connect(toggleGUI)
closeBtn.MouseButton1Click:Connect(toggleGUI)

-- Subtle floating animation
local floatTween = TweenService:Create(openBtn, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Position = UDim2.new(0, 25, 0.5, -28)
})
floatTween:Play()

return UGINITY
