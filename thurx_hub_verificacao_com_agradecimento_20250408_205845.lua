-- ThurX Hub | Brookhaven RP 🏡
-- Feito por ThurXx07 & Samy
-- LocalScript (StarterPlayerScripts ou StarterGui)

-- CONFIGURAÇÕES
local AMOLEDBLACK = Color3.fromRGB(0,0,0)
local WHITE = Color3.fromRGB(255,255,255)
local PURPLE = Color3.fromRGB(127,0,255)
local BARWHITE = Color3.fromRGB(240,240,240)

local ANIMATIONS = {
    {Name="Vampiro", Id="507770239"},
    {Name="Levitar", Id="507766666"},
    {Name="Zumbi", Id="507766388"},
    {Name="Ninja", Id="507777826"},
    {Name="Robô", Id="507776043"},
    {Name="Caminhada", Id="507777268"},
    {Name="Flutuante", Id="616006556"},
}

local FLOOD_MESSAGES = {
    "🧛 Ative o modo vampiro com o ThurX Hub!",
    "🔥 ThurX Hub dominando Brookhaven RP 🏡",
    "😈 Samy & Thur no controle do RP 😈",
    "💬 Essa dança? Claro que veio do ThurX!",
}

-- SERVIÇOS
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

-- FUNÇÕES ÚTEIS
local function newUICorner(parent, radius)
    local uic = Instance.new("UICorner")
    uic.CornerRadius = UDim.new(0, radius or 10)
    uic.Parent = parent
    return uic
end

local function createButton(parent, text, color, textColor, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = color or AMOLEDBLACK
    btn.Text = text
    btn.TextColor3 = textColor or WHITE
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.AutoButtonColor = true
    btn.Parent = parent
    newUICorner(btn)
    if callback then
        btn.MouseButton1Click:Connect(callback)
    end
    return btn
end

-- TELA DE CARREGAMENTO
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ThurXHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 320, 0, 120)
loadingFrame.Position = UDim2.new(0.5, -160, 0.5, -60)
loadingFrame.BackgroundColor3 = AMOLEDBLACK
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = screenGui
newUICorner(loadingFrame, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 32)
title.Position = UDim2.new(0,0,0,8)
title.BackgroundTransparency = 1
title.Text = "ThurX Hub"
title.TextColor3 = PURPLE
title.Font = Enum.Font.GothamSemibold
title.TextSize = 24
title.Parent = loadingFrame

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 24)
sub.Position = UDim2.new(0,0,0,44)
sub.BackgroundTransparency = 1
sub.Text = "Iniciando..."
sub.TextColor3 = WHITE
sub.Font = Enum.Font.Gotham
sub.TextSize = 16
sub.Parent = loadingFrame

local loadBarBG = Instance.new("Frame")
loadBarBG.Size = UDim2.new(0.8, 0, 0, 16)
loadBarBG.Position = UDim2.new(0.1, 0, 1, -36)
loadBarBG.BackgroundColor3 = BARWHITE
loadBarBG.BorderSizePixel = 0
loadBarBG.Parent = loadingFrame
newUICorner(loadBarBG, 8)

local loadBar = Instance.new("Frame")
loadBar.Size = UDim2.new(0, 0, 1, 0)
loadBar.Position = UDim2.new(0,0,0,0)
loadBar.BackgroundColor3 = PURPLE
loadBar.BorderSizePixel = 0
loadBar.Parent = loadBarBG
newUICorner(loadBar, 8)

-- Animação de carregamento
TweenService:Create(loadBar, TweenInfo.new(1.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size=UDim2.new(1,0,1,0)}):Play()
wait(1.3)
wait(0.5)
loadingFrame.Visible = false

-- BOTÃO FLUTUANTE "T"
local tBtn = Instance.new("ImageButton")
tBtn.Size = UDim2.new(0, 60, 0, 60)
tBtn.Position = UDim2.new(0, 16, 0.5, -30)
tBtn.BackgroundColor3 = AMOLEDBLACK
tBtn.AutoButtonColor = true
tBtn.Parent = screenGui
newUICorner(tBtn, 30)

local tLabel = Instance.new("TextLabel")
tLabel.Size = UDim2.new(1, 0, 1, 0)
tLabel.BackgroundTransparency = 1
tLabel.Text = "T"
tLabel.Font = Enum.Font.GothamBlack
tLabel.TextColor3 = PURPLE
tLabel.TextSize = 40
tLabel.Parent = tBtn

-- --- MENU PRINCIPAL --- --
local menuMain = Instance.new("Frame")
menuMain.Size = UDim2.new(0, 460, 0, 340)
menuMain.Position = UDim2.new(0.5, -230, 0.5, -170)
menuMain.BackgroundColor3 = AMOLEDBLACK
menuMain.Visible = false
menuMain.Parent = screenGui
menuMain.Active = true
menuMain.Draggable = true
newUICorner(menuMain, 18)

local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, -80, 0, 38)
titleBar.Position = UDim2.new(0,0,0,0)
titleBar.BackgroundTransparency = 1
titleBar.Text = "ThurX Hub | Brookhaven RP 🏡 samy&thur brm"
titleBar.TextColor3 = WHITE
titleBar.TextXAlignment = Enum.TextXAlignment.Left
titleBar.Font = Enum.Font.GothamBold
titleBar.TextSize = 18
titleBar.Parent = menuMain

-- Botões X (fechar) e - (minimizar)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,34,0,32)
closeBtn.Position = UDim2.new(1,-38,0,4)
closeBtn.BackgroundColor3 = AMOLEDBLACK
closeBtn.TextColor3 = WHITE
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.Parent = menuMain
newUICorner(closeBtn, 8)

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0,34,0,32)
minBtn.Position = UDim2.new(1,-76,0,4)
minBtn.BackgroundColor3 = AMOLEDBLACK
minBtn.TextColor3 = WHITE
minBtn.Text = "-"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 20
minBtn.Parent = menuMain
newUICorner(minBtn, 8)

-- Painel lateral - Abas
local tabsPanel = Instance.new("Frame")
tabsPanel.Size = UDim2.new(0,100,1,-40)
tabsPanel.Position = UDim2.new(0,0,0,40)
tabsPanel.BackgroundColor3 = AMOLEDBLACK
tabsPanel.Parent = menuMain
newUICorner(tabsPanel, 14)

local tabsList = Instance.new("UIListLayout")
tabsList.SortOrder = Enum.SortOrder.LayoutOrder
tabsList.Parent = tabsPanel

local tabAnim = createButton(tabsPanel, "Anim", AMOLEDBLACK, WHITE)
local tabEmotes = createButton(tabsPanel, "Emotes", AMOLEDBLACK, WHITE)
local tabDancas = createButton(tabsPanel, "Danças", AMOLEDBLACK, WHITE)
local tabTrol = createButton(tabsPanel, "Trol Msg", AMOLEDBLACK, WHITE)

-- Conteúdo da aba ativa (lado direito)
local tabContent = Instance.new("Frame")
tabContent.Size = UDim2.new(1,-110,1,-48)
tabContent.Position = UDim2.new(0,110,0,44)
tabContent.BackgroundTransparency = 1
tabContent.Parent = menuMain

-- Função de limpar abas
local function clearTabContent()
    for _,c in ipairs(tabContent:GetChildren()) do
        if c:IsA("GuiObject") then c:Destroy() end
    end
end

-- --- ABA ANIM --- --
local function openAnimTab()
    clearTabContent()
    local animTitle = Instance.new("TextLabel")
    animTitle.Size = UDim2.new(1,0,0,30)
    animTitle.Position = UDim2.new(0,0,0,0)
    animTitle.Text = "Animações"
    animTitle.BackgroundTransparency = 1
    animTitle.TextColor3 = WHITE
    animTitle.Font = Enum.Font.GothamBold
    animTitle.TextSize = 18
    animTitle.Parent = tabContent

    local animPanel = Instance.new("Frame")
    animPanel.Size = UDim2.new(1,0,1,-38)
    animPanel.Position = UDim2.new(0,0,0,34)
    animPanel.BackgroundColor3 = BARWHITE
    animPanel.Parent = tabContent
    newUICorner(animPanel, 12)

    local scroller = Instance.new("ScrollingFrame")
    scroller.Size = UDim2.new(1,0,1,0)
    scroller.CanvasSize = UDim2.new(0,0,0,#ANIMATIONS*36+8)
    scroller.BackgroundTransparency = 1
    scroller.ScrollBarThickness = 4
    scroller.Parent = animPanel

    local animList = Instance.new("UIListLayout")
    animList.SortOrder = Enum.SortOrder.LayoutOrder
    animList.Padding = UDim.new(0,6)
    animList.Parent = scroller

    for _,anim in ipairs(ANIMATIONS) do
        createButton(scroller, anim.Name, WHITE, AMOLEDBLACK, function()
            local char = player.Character or player.CharacterAdded:Wait()
            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                -- Parar animações atuais
                for _,track in pairs(humanoid:GetPlayingAnimationTracks()) do
                    track:Stop()
                end
                -- Carregar e tocar animação
                local animObj = Instance.new("Animation")
                animObj.AnimationId = "rbxassetid://"..anim.Id
                local playTrack = humanoid:LoadAnimation(animObj)
                playTrack:Play()
            end
        end)
    end
end

-- --- ABA TROL MSG --- --
local floodActive = false
local floodConn = nil

local function openTrolTab()
    clearTabContent()
    local trolTitle = Instance.new("TextLabel")
    trolTitle.Size = UDim2.new(1,0,0,30)
    trolTitle.Position = UDim2.new(0,0,0,0)
    trolTitle.Text = "Trol Msg"
    trolTitle.BackgroundTransparency = 1
    trolTitle.TextColor3 = WHITE
    trolTitle.Font = Enum.Font.GothamBold
    trolTitle.TextSize = 18
    trolTitle.Parent = tabContent

    for i,msg in ipairs(FLOOD_MESSAGES) do
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1,0,0,22)
        lbl.Position = UDim2.new(0,0,0,34+(i-1)*22)
        lbl.BackgroundTransparency = 1
        lbl.Text = msg
        lbl.TextColor3 = WHITE
        lbl.TextSize = 15
        lbl.Font = Enum.Font.Gotham
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Parent = tabContent
    end

    local floodBtn = Instance.new("TextButton")
    floodBtn.Size = UDim2.new(0, 160, 0, 32)
    floodBtn.Position = UDim2.new(0, 6, 0, 34+5*22)
    floodBtn.BackgroundColor3 = AMOLEDBLACK
    floodBtn.Text = floodActive and "Desativar Flood" or "Ativar Flood"
    floodBtn.TextColor3 = floodActive and Color3.fromRGB(255,87,87) or PURPLE
    floodBtn.Font = Enum.Font.GothamBold
    floodBtn.TextSize = 16
    floodBtn.Parent = tabContent
    newUICorner(floodBtn, 8)

    local aviso = Instance.new("TextLabel")
    aviso.Size = UDim2.new(1, -12, 0, 36)
    aviso.Position = UDim2.new(0, 6, 1, -44)
    aviso.BackgroundTransparency = 1
    aviso.Text = "Mande uma mensagem flodando (tem risco de levar aviso na sua conta por spam se alguém denunciar você)"
    aviso.TextColor3 = Color3.fromRGB(255, 180, 70)
    aviso.TextSize = 13
    aviso.TextWrapped = true
    aviso.Font = Enum.Font.Gotham
    aviso.Parent = tabContent

    floodBtn.MouseButton1Click:Connect(function()
        floodActive = not floodActive
        floodBtn.Text = floodActive and "Desativar Flood" or "Ativar Flood"
        floodBtn.TextColor3 = floodActive and Color3.fromRGB(255,87,87) or PURPLE
        if floodActive then
            -- Flood
            floodConn = game:GetService("RunService").RenderStepped:Connect(function()
                if not floodActive then return end
                for _,msg in ipairs(FLOOD_MESSAGES) do
                    if not floodActive then break end
                    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
                        :WaitForChild("SayMessageRequest"):FireServer(msg, "All")
                    wait(math.random(1,2))
                end
            end)
        else
            if floodConn then floodConn:Disconnect() floodConn = nil end
        end
    end)
end

-- --- ABA EMOTES / DANÇAS (Breve) --- --
local function openSoonTab()
    clearTabContent()
    local soon = Instance.new("TextLabel")
    soon.Size = UDim2.new(1,0,1,0)
    soon.Position = UDim2.new(0,0,0,0)
    soon.BackgroundTransparency = 1
    soon.Text = "Em breve!"
    soon.TextColor3 = WHITE
    soon.Font = Enum.Font.GothamBold
    soon.TextSize = 22
    soon.Parent = tabContent
end

-- Troca de abas
tabAnim.MouseButton1Click:Connect(openAnimTab)
tabTrol.MouseButton1Click:Connect(openTrolTab)
tabEmotes.MouseButton1Click:Connect(openSoonTab)
tabDancas.MouseButton1Click:Connect(openSoonTab)

-- Mostrar menu principal
tBtn.MouseButton1Click:Connect(function()
    menuMain.Visible = true
    tBtn.Visible = false
    openAnimTab()
end)

-- Fechar menu
closeBtn.MouseButton1Click:Connect(function()
    menuMain.Visible = false
    tBtn.Visible = true
end)

-- Minimizar
local minimized = false
local miniFrame

minBtn.MouseButton1Click:Connect(function()
    menuMain.Visible = false
    minimized = true
    if not miniFrame then
        miniFrame = Instance.new("Frame")
        miniFrame.Size = UDim2.new(0,180,0,48)
        miniFrame.Position = UDim2.new(0,18,0.5,-24)
        miniFrame.BackgroundColor3 = AMOLEDBLACK
        miniFrame.Parent = screenGui
        miniFrame.Active = true
        miniFrame.Draggable = true
        newUICorner(miniFrame, 14)

        local miniTitle = Instance.new("TextLabel")
        miniTitle.Size = UDim2.new(1,-68,1,0)
        miniTitle.Position = UDim2.new(0,0,0,0)
        miniTitle.BackgroundTransparency = 1
        miniTitle.Text = "thurx&samy hub"
        miniTitle.TextColor3 = WHITE
        miniTitle.Font = Enum.Font.GothamBold
        miniTitle.TextSize = 18
        miniTitle.Parent = miniFrame

        local minRestore = Instance.new("TextButton")
        minRestore.Size = UDim2.new(0,34,0,32)
        minRestore.Position = UDim2.new(1,-72,0,8)
        minRestore.BackgroundColor3 = AMOLEDBLACK
        minRestore.TextColor3 = WHITE
        minRestore.Text = "-"
        minRestore.Font = Enum.Font.GothamBold
        minRestore.TextSize = 20
        minRestore.Parent = miniFrame
        newUICorner(minRestore,8)
        minRestore.MouseButton1Click:Connect(function()
            menuMain.Visible = true
            miniFrame.Visible = false
            minimized = false
        end)

        local minClose = Instance.new("TextButton")
        minClose.Size = UDim2.new(0,34,0,32)
        minClose.Position = UDim2.new(1,-36,0,8)
        minClose.BackgroundColor3 = AMOLEDBLACK
        minClose.TextColor3 = WHITE
        minClose.Text = "X"
        minClose.Font = Enum.Font.GothamBold
        minClose.TextSize = 20
        minClose.Parent = miniFrame
        newUICorner(minClose,8)
        minClose.MouseButton1Click:Connect(function()
            miniFrame.Visible = false
            tBtn.Visible = true
            menuMain.Visible = false
            minimized = false
        end)
    end
    miniFrame.Visible = true
end)

-- Segurança: Parar flood ao fechar/minimizar menu
local function stopFlood()
    floodActive = false
    if floodConn then floodConn:Disconnect() floodConn = nil end
end

closeBtn.MouseButton1Click:Connect(stopFlood)
if miniFrame then
    miniFrame:FindFirstChild("minClose").MouseButton1Click:Connect(stopFlood)
end

-- Segurança extra: Parar flood ao resetar personagem
player.CharacterRemoving:Connect(stopFlood)

-- FIM DO SCRIPT ThurX Hub
