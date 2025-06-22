-- ThurX Hub | Brookhaven RP 🏡
-- Feito por ThurXx07 & Samy
-- Coloque este LocalScript em StarterPlayerScripts ou StarterGui

-- CONFIG
local AMOLED = Color3.fromRGB(0,0,0)
local FOSCO = Color3.fromRGB(10,10,10)
local WHITE = Color3.fromRGB(255,255,255)
local PURPLE = Color3.fromRGB(127,0,255)
local GREY = Color3.fromRGB(120,120,120)
local BARWHITE = Color3.fromRGB(235,235,235)

local ANIMATIONS = {
    {Name="Vampiro", Id="507770239"},
    {Name="Levitar", Id="507766666"},
    {Name="Zumbi", Id="507766388"},
}

local TROLL_MSGS = {
    "[servidor] Samy e thur que manda no chat kkkj",
    "[servidor] Samy&thur by hackead server",
    "[servidor] O chat do servidor violou algumas mensagem pesso que tomem cuidado, algum de vocês serão punido severamente.",
    "🧛 Ative o modo vampiro com o ThurX Hub!",
    "🔥 ThurX Hub dominando Brookhaven RP 🏡",
    "😈 Samy & Thur no controle do RP 😈",
    "💬 Essa dança? Claro que veio do ThurX!",
}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- UICorner Helper
local function roundify(gui, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 10)
    c.Parent = gui
end

-- LOADING SCREEN
local gui = Instance.new("ScreenGui")
gui.Name = "ThurXHub"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local loadFrame = Instance.new("Frame")
loadFrame.Size = UDim2.new(0, 360, 0, 130)
loadFrame.Position = UDim2.new(0.5, -180, 0.5, -65)
loadFrame.BackgroundColor3 = AMOLED
loadFrame.BorderSizePixel = 0
loadFrame.Parent = gui
roundify(loadFrame, 14)

local loadingTexts = {
    "Aplicando botões...",
    "Injetando animações...",
    "Carregando módulo de troll...",
    "Estilizando layout AMOLED...",
    "Finalizando..."
}

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1,0,0,35)
loadTitle.Position = UDim2.new(0,0,0,12)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "ThurX Hub"
loadTitle.TextColor3 = PURPLE
loadTitle.Font = Enum.Font.GothamBold
loadTitle.TextSize = 24
loadTitle.Parent = loadFrame

local loadSub = Instance.new("TextLabel")
loadSub.Size = UDim2.new(1,0,0,24)
loadSub.Position = UDim2.new(0,0,0,50)
loadSub.BackgroundTransparency = 1
loadSub.Text = "Iniciando..."
loadSub.TextColor3 = WHITE
loadSub.Font = Enum.Font.Gotham
loadSub.TextSize = 16
loadSub.Parent = loadFrame

local loadBarBG = Instance.new("Frame")
loadBarBG.Size = UDim2.new(0.8, 0, 0, 16)
loadBarBG.Position = UDim2.new(0.1, 0, 1, -36)
loadBarBG.BackgroundColor3 = BARWHITE
loadBarBG.BorderSizePixel = 0
loadBarBG.Parent = loadFrame
roundify(loadBarBG, 8)

local loadBar = Instance.new("Frame")
loadBar.Size = UDim2.new(0, 0, 1, 0)
loadBar.Position = UDim2.new(0,0,0,0)
loadBar.BackgroundColor3 = PURPLE
loadBar.BorderSizePixel = 0
loadBar.Parent = loadBarBG
roundify(loadBar, 8)

-- Loading Animation + Text
for i=1,#loadingTexts do
    TweenService:Create(loadBar, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size=UDim2.new(i/#loadingTexts,0,1,0)}):Play()
    loadSub.Text = loadingTexts[i]
    wait(1.5)
end
loadSub.Text = "Pronto!"
TweenService:Create(loadBar, TweenInfo.new(0.6), {Size=UDim2.new(1,0,1,0)}):Play()
wait(0.9)
loadFrame.Visible = false

-- BOTÃO FLUTUANTE "T 神"
local tBtn = Instance.new("ImageButton")
tBtn.Size = UDim2.new(0, 66, 0, 66)
tBtn.Position = UDim2.new(0, 16, 0.5, -33)
tBtn.BackgroundColor3 = AMOLED
tBtn.AutoButtonColor = true
tBtn.Parent = gui
roundify(tBtn, 33)

local tLabel = Instance.new("TextLabel")
tLabel.Size = UDim2.new(1,0,1,0)
tLabel.BackgroundTransparency = 1
tLabel.Text = "T 神"
tLabel.Font = Enum.Font.GothamBlack
tLabel.TextColor3 = PURPLE
tLabel.TextSize = 34
tLabel.Parent = tBtn

-- MENU PRINCIPAL
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 500, 0, 368)
menu.Position = UDim2.new(0.5, -250, 0.5, -184)
menu.BackgroundColor3 = AMOLED
menu.Visible = false
menu.Active = true
menu.Draggable = true
menu.Parent = gui
roundify(menu, 18)

-- Barra Superior
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,44)
topBar.BackgroundColor3 = AMOLED
topBar.BorderSizePixel = 0
topBar.Parent = menu
roundify(topBar, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-110,1,0)
title.Position = UDim2.new(0,8
