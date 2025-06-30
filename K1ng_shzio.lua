-- PROFESSIONAL UGINITY UI with Customization and Themes
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Configuration
local THEMES = {
    Dark = {
        background = Color3.fromRGB(15, 15, 20),
        panel = Color3.fromRGB(25, 25, 35),
        accent = Color3.fromRGB(100, 100, 150),
        text = Color3.fromRGB(255, 255, 255),
        secondary = Color3.fromRGB(180, 180, 180)
    },
    Light = {
        background = Color3.fromRGB(240, 240, 245),
        panel = Color3.fromRGB(255, 255, 255),
        accent = Color3.fromRGB(70, 130, 180),
        text = Color3.fromRGB(30, 30, 30),
        secondary = Color3.fromRGB(100, 100, 100)
    },
    Red = {
        background = Color3.fromRGB(20, 10, 10),
        panel = Color3.fromRGB(40, 20, 20),
        accent = Color3.fromRGB(200, 50, 50),
        text = Color3.fromRGB(255, 220, 220),
        secondary = Color3.fromRGB(180, 120, 120)
    },
    Blue = {
        background = Color3.fromRGB(10, 15, 25),
        panel = Color3.fromRGB(20, 30, 50),
        accent = Color3.fromRGB(50, 150, 255),
        text = Color3.fromRGB(220, 240, 255),
        secondary = Color3.fromRGB(120, 180, 220)
    }
}

local TEXT_COLORS = {
    White = Color3.fromRGB(255, 255, 255),
    Red = Color3.fromRGB(255, 100, 100),
    Blue = Color3.fromRGB(100, 150, 255),
    Green = Color3.fromRGB(100, 255, 150),
    Purple = Color3.fromRGB(200, 100, 255),
    Gold = Color3.fromRGB(255, 215, 0),
    Cyan = Color3.fromRGB(0, 255, 255),
    Pink = Color3.fromRGB(255, 105, 180)
}

-- Current settings
local currentTheme = "Dark"
local currentTextColor = "White"
local currentTab = "Welcome"

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "UGINITY_Professional"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

-- Main Container
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(0, 800, 0, 600)
mainContainer.Position = UDim2.new(0.5, -400, 0.5, -300)
mainContainer.BackgroundColor3 = THEMES[currentTheme].background
mainContainer.BorderSizePixel = 0
mainContainer.Parent = gui

-- Add corner radius
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainContainer

-- Add shadow effect
local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(1, 6, 1, 6)
shadow.Position = UDim2.new(0, -3, 0, -3)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.5
shadow.ZIndex = mainContainer.ZIndex - 1
shadow.Parent = gui

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 12)
shadowCorner.Parent = shadow

-- Header Panel
local headerPanel = Instance.new("Frame")
headerPanel.Size = UDim2.new(1, 0, 0, 80)
headerPanel.Position = UDim2.new(0, 0, 0, 0)
headerPanel.BackgroundColor3 = THEMES[currentTheme].panel
headerPanel.BorderSizePixel = 0
headerPanel.Parent = mainContainer

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = headerPanel

-- Header gradient
local headerGradient = Instance.new("UIGradient")
headerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, THEMES[currentTheme].panel),
    ColorSequenceKeypoint.new(1, THEMES[currentTheme].accent)
}
headerGradient.Rotation = 45
headerGradient.Parent = headerPanel

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 300, 1, 0)
title.Position = UDim2.new(0, 20, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🌜 UGINITY PROFESSIONAL 🌙"
title.Font = Enum.Font.GothamBold
title.TextColor3 = THEMES[currentTheme].text
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = headerPanel

-- Settings Panel
local settingsPanel = Instance.new("Frame")
settingsPanel.Size = UDim2.new(0, 250, 0, 60)
settingsPanel.Position = UDim2.new(1, -270, 0, 10)
settingsPanel.BackgroundTransparency = 1
settingsPanel.Parent = headerPanel

-- Theme Dropdown
local themeFrame = Instance.new("Frame")
themeFrame.Size = UDim2.new(0, 120, 0, 25)
themeFrame.Position = UDim2.new(0, 0, 0, 0)
themeFrame.BackgroundColor3 = THEMES[currentTheme].background
themeFrame.BorderSizePixel = 0
themeFrame.Parent = settingsPanel

local themeCorner = Instance.new("UICorner")
themeCorner.CornerRadius = UDim.new(0, 6)
themeCorner.Parent = themeFrame

local themeButton = Instance.new("TextButton")
themeButton.Size = UDim2.new(1, 0, 1, 0)
themeButton.BackgroundTransparency = 1
themeButton.Text = "Theme: " .. currentTheme
themeButton.Font = Enum.Font.Gotham
themeButton.TextColor3 = THEMES[currentTheme].text
themeButton.TextSize = 12
themeButton.Parent = themeFrame

-- Color Dropdown
local colorFrame = Instance.new("Frame")
colorFrame.Size = UDim2.new(0, 120, 0, 25)
colorFrame.Position = UDim2.new(0, 0, 0, 30)
colorFrame.BackgroundColor3 = THEMES[currentTheme].background
colorFrame.BorderSizePixel = 0
colorFrame.Parent = settingsPanel

local colorCorner = Instance.new("UICorner")
colorCorner.CornerRadius = UDim.new(0, 6)
colorCorner.Parent = colorFrame

local colorButton = Instance.new("TextButton")
colorButton.Size = UDim2.new(1, 0, 1, 0)
colorButton.BackgroundTransparency = 1
colorButton.Text = "Color: " .. currentTextColor
colorButton.Font = Enum.Font.Gotham
colorButton.TextColor3 = THEMES[currentTheme].text
colorButton.TextSize = 12
colorButton.Parent = colorFrame

-- Tab Navigation
local tabPanel = Instance.new("Frame")
tabPanel.Size = UDim2.new(1, 0, 0, 50)
tabPanel.Position = UDim2.new(0, 0, 0, 80)
tabPanel.BackgroundColor3 = THEMES[currentTheme].panel
tabPanel.BorderSizePixel = 0
tabPanel.Parent = mainContainer

local tabs = {"Welcome", "Settings", "About"}
local tabButtons = {}

for i, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, 150, 1, 0)
    tabButton.Position = UDim2.new(0, (i-1) * 160 + 20, 0, 0)
    tabButton.BackgroundColor3 = currentTab == tabName and THEMES[currentTheme].accent or Color3.fromRGB(0, 0, 0)
    tabButton.BackgroundTransparency = currentTab == tabName and 0.2 or 1
    tabButton.BorderSizePixel = 0
    tabButton.Text = tabName
    tabButton.Font = Enum.Font.GothamSemibold
    tabButton.TextColor3 = THEMES[currentTheme].text
    tabButton.TextSize = 14
    tabButton.Parent = tabPanel
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tabButton
    
    tabButtons[tabName] = tabButton
end

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -40, 1, -170)
contentArea.Position = UDim2.new(0, 20, 0, 140)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainContainer

-- Welcome Tab Content
local welcomeContent = Instance.new("Frame")
welcomeContent.Size = UDim2.new(1, 0, 1, 0)
welcomeContent.BackgroundTransparency = 1
welcomeContent.Visible = currentTab == "Welcome"
welcomeContent.Parent = contentArea

-- Main UGINITY Display
local uginityDisplay = Instance.new("Frame")
uginityDisplay.Size = UDim2.new(1, 0, 0, 200)
uginityDisplay.Position = UDim2.new(0, 0, 0.5, -100)
uginityDisplay.BackgroundTransparency = 1
uginityDisplay.Parent = welcomeContent

-- UGINITY Text with professional styling
local uginityText = Instance.new("TextLabel")
uginityText.Size = UDim2.new(0, 600, 0, 80)
uginityText.Position = UDim2.new(0.5, -300, 0.5, -40)
uginityText.BackgroundTransparency = 1
uginityText.Text = "🌜 UGINITY WELCOME 🌙"
uginityText.Font = Enum.Font.GothamBold
uginityText.TextColor3 = TEXT_COLORS[currentTextColor]
uginityText.TextSize = 42
uginityText.TextStrokeTransparency = 0.5
uginityText.TextStrokeColor3 = THEMES[currentTheme].background
uginityText.Parent = uginityDisplay

-- Animated background elements
local bgElements = Instance.new("Frame")
bgElements.Size = UDim2.new(1, 0, 1, 0)
bgElements.BackgroundTransparency = 1
bgElements.Parent = welcomeContent

-- Create floating particles
local particles = {}
for i = 1, 20 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(4, 12), 0, math.random(4, 12))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = THEMES[currentTheme].accent
    particle.BackgroundTransparency = math.random(50, 80) / 100
    particle.BorderSizePixel = 0
    particle.Parent = bgElements
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(1, 0)
    particleCorner.Parent = particle
    
    table.insert(particles, particle)
end

-- Settings Tab Content
local settingsContent = Instance.new("Frame")
settingsContent.Size = UDim2.new(1, 0, 1, 0)
settingsContent.BackgroundTransparency = 1
settingsContent.Visible = currentTab == "Settings"
settingsContent.Parent = contentArea

-- About Tab Content
local aboutContent = Instance.new("Frame")
aboutContent.Size = UDim2.new(1, 0, 1, 0)
aboutContent.BackgroundTransparency = 1
aboutContent.Visible = currentTab == "About"
aboutContent.Parent = contentArea

local aboutText = Instance.new("TextLabel")
aboutText.Size = UDim2.new(1, 0, 0, 200)
aboutText.Position = UDim2.new(0, 0, 0.3, 0)
aboutText.BackgroundTransparency = 1
aboutText.Text = "UGINITY Professional UI\n\nA modern, customizable interface\nwith smooth animations and\nprofessional design.\n\nCreated with attention to detail\nand user experience."
aboutText.Font = Enum.Font.Gotham
aboutText.TextColor3 = THEMES[currentTheme].text
aboutText.TextSize = 16
aboutText.TextWrapped = true
aboutText.Parent = aboutContent

-- Functions
local function updateTheme()
    local theme = THEMES[currentTheme]
    mainContainer.BackgroundColor3 = theme.background
    headerPanel.BackgroundColor3 = theme.panel
    headerGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, theme.panel),
        ColorSequenceKeypoint.new(1, theme.accent)
    }
    title.TextColor3 = theme.text
    themeButton.Text = "Theme: " .. currentTheme
    themeButton.TextColor3 = theme.text
    themeFrame.BackgroundColor3 = theme.background
    colorButton.Text = "Color: " .. currentTextColor
    colorButton.TextColor3 = theme.text
    colorFrame.BackgroundColor3 = theme.background
    tabPanel.BackgroundColor3 = theme.panel
    aboutText.TextColor3 = theme.text
    
    -- Update tab buttons
    for tabName, button in pairs(tabButtons) do
        button.TextColor3 = theme.text
        if currentTab == tabName then
            button.BackgroundColor3 = theme.accent
            button.BackgroundTransparency = 0.2
        else
            button.BackgroundTransparency = 1
        end
    end
    
    -- Update particles
    for _, particle in pairs(particles) do
        particle.BackgroundColor3 = theme.accent
    end
end

local function updateTextColor()
    uginityText.TextColor3 = TEXT_COLORS[currentTextColor]
    uginityText.TextStrokeColor3 = THEMES[currentTheme].background
end

local function switchTab(newTab)
    if currentTab == newTab then return end
    
    -- Animate out current tab
    local currentContent = currentTab == "Welcome" and welcomeContent or 
                          currentTab == "Settings" and settingsContent or aboutContent
    
    TweenService:Create(currentContent, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Position = UDim2.new(-1, 0, 0, 0)
    }):Play()
    
    wait(0.3)
    currentContent.Visible = false
    currentContent.Position = UDim2.new(1, 0, 0, 0)
    
    -- Update current tab
    currentTab = newTab
    local newContent = currentTab == "Welcome" and welcomeContent or 
                      currentTab == "Settings" and settingsContent or aboutContent
    
    newContent.Visible = true
    
    -- Animate in new tab
    TweenService:Create(newContent, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    updateTheme()
end

-- Theme dropdown functionality
local themeDropdownOpen = false
themeButton.MouseButton1Click:Connect(function()
    if themeDropdownOpen then return end
    themeDropdownOpen = true
    
    local dropdown = Instance.new("Frame")
    dropdown.Size = UDim2.new(0, 120, 0, #THEMES * 25)
    dropdown.Position = UDim2.new(0, 0, 1, 5)
    dropdown.BackgroundColor3 = THEMES[currentTheme].panel
    dropdown.BorderSizePixel = 0
    dropdown.Parent = themeFrame
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    dropdownCorner.Parent = dropdown
    
    local y = 0
    for themeName, _ in pairs(THEMES) do
        local option = Instance.new("TextButton")
        option.Size = UDim2.new(1, 0, 0, 25)
        option.Position = UDim2.new(0, 0, 0, y)
        option.BackgroundColor3 = themeName == currentTheme and THEMES[currentTheme].accent or Color3.fromRGB(0, 0, 0)
        option.BackgroundTransparency = themeName == currentTheme and 0.3 or 1
        option.BorderSizePixel = 0
        option.Text = themeName
        option.Font = Enum.Font.Gotham
        option.TextColor3 = THEMES[currentTheme].text
        option.TextSize = 12
        option.Parent = dropdown
        
        option.MouseButton1Click:Connect(function()
            currentTheme = themeName
            updateTheme()
            updateTextColor()
            dropdown:Destroy()
            themeDropdownOpen = false
        end)
        
        y = y + 25
    end
    
    spawn(function()
        wait(3)
        if dropdown.Parent then
            dropdown:Destroy()
            themeDropdownOpen = false
        end
    end)
end)

-- Color dropdown functionality
local colorDropdownOpen = false
colorButton.MouseButton1Click:Connect(function()
    if colorDropdownOpen then return end
    colorDropdownOpen = true
    
    local dropdown = Instance.new("Frame")
    dropdown.Size = UDim2.new(0, 120, 0, #TEXT_COLORS * 25)
    dropdown.Position = UDim2.new(0, 0, 1, 5)
    dropdown.BackgroundColor3 = THEMES[currentTheme].panel
    dropdown.BorderSizePixel = 0
    dropdown.Parent = colorFrame
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    dropdownCorner.Parent = dropdown
    
    local y = 0
    for colorName, colorValue in pairs(TEXT_COLORS) do
        local option = Instance.new("TextButton")
        option.Size = UDim2.new(1, 0, 0, 25)
        option.Position = UDim2.new(0, 0, 0, y)
        option.BackgroundColor3 = colorName == currentTextColor and THEMES[currentTheme].accent or Color3.fromRGB(0, 0, 0)
        option.BackgroundTransparency = colorName == currentTextColor and 0.3 or 1
        option.BorderSizePixel = 0
        option.Text = colorName
        option.Font = Enum.Font.Gotham
        option.TextColor3 = colorValue
        option.TextSize = 12
        option.Parent = dropdown
        
        option.MouseButton1Click:Connect(function()
            currentTextColor = colorName
            updateTextColor()
            updateTheme()
            dropdown:Destroy()
            colorDropdownOpen = false
        end)
        
        y = y + 25
    end
    
    spawn(function()
        wait(3)
        if dropdown.Parent then
            dropdown:Destroy()
            colorDropdownOpen = false
        end
    end)
end)

-- Tab button functionality
for tabName, button in pairs(tabButtons) do
    button.MouseButton1Click:Connect(function()
        switchTab(tabName)
    end)
end

-- Animate particles
spawn(function()
    while gui.Parent do
        for _, particle in pairs(particles) do
            if particle.Parent then
                local randomX = math.random(-100, 100) / 1000
                local randomY = math.random(-100, 100) / 1000
                
                TweenService:Create(particle, TweenInfo.new(
                    math.random(30, 60) / 10,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                ), {
                    Position = UDim2.new(
                        particle.Position.X.Scale + randomX,
                        0,
                        particle.Position.Y.Scale + randomY,
                        0
                    ),
                    BackgroundTransparency = math.random(30, 90) / 100
                }):Play()
            end
        end
        wait(2)
    end
end)

-- Pulse animation for UGINITY text
spawn(function()
    while gui.Parent do
        TweenService:Create(uginityText, TweenInfo.new(2, Enum.EasingStyle.Sine), {
            TextSize = 46
        }):Play()
        wait(2)
        TweenService:Create(uginityText, TweenInfo.new(2, Enum.EasingStyle.Sine), {
            TextSize = 42
        }):Play()
        wait(2)
    end
end)

-- Initial setup
updateTheme()
updateTextColor()

-- Entrance animation
mainContainer.Position = UDim2.new(0.5, -400, 1.5, 0)
TweenService:Create(mainContainer, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -400, 0.5, -300)
}):Play()

print("UGINITY Professional UI Loaded Successfully!")
