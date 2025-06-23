-- ThurX & Samy Hub Menu Script (Mobile, Delta Executor)
-- Corrigido: Flood realmente envia, ícones atualizados, lista de animações/danças com IDs válidos,
-- layout AMOLED, barra preta de rolagem, minimizar/maximizar/menu T, aviso de spam visível, emojis no minimizado.

-- Serviços
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Cores e assets
local AMOLED = Color3.fromRGB(0,0,0)
local WHITE = Color3.fromRGB(255,255,255)
local GRAY = Color3.fromRGB(220,220,220)
local LIGHTGRAY = Color3.fromRGB(200,200,200)
local PURPLE = Color3.fromRGB(130,0,220)
local WARNING = Color3.fromRGB(255, 120, 50)
local BARBLACK = Color3.fromRGB(10,10,10)

local ICONS = { -- Roblox oficiais
  ["Idle"] = "rbxassetid://507766666",
  ["Levitar"] = "rbxassetid://507766666",
  ["Vampiro"] = "rbxassetid://507770239",
  ["Ninja"] = "rbxassetid://507777826",
  ["Zumbi"] = "rbxassetid://507766388",
  ["Robô"] = "rbxassetid://507776043",
  ["SuperHero"] = "rbxassetid://616111295",
  ["Cartwheel"] = "rbxassetid://1015570390",
  ["Pose"] = "rbxassetid://5319828216",
  ["Dança 1"] = "rbxassetid://507777268",
  ["Dança 2"] = "rbxassetid://507776043",
  ["Dança 3"] = "rbxassetid://507771019",
  ["Dança 4"] = "rbxassetid://616139451",
  ["Dança 5"] = "rbxassetid://507777623",
}

-- Animações e Danças (IDs válidos oficiais Roblox)
local ANIMATIONS = {
    {Name = "Idle", Id = "507766666"},
    {Name = "Levitar", Id = "507766666"},
    {Name = "Pose", Id = "5319828216"},
    {Name = "Vampiro", Id = "507770239"},
    {Name = "Ninja", Id = "507777826"},
    {Name = "Zumbi", Id = "507766388"},
    {Name = "Robô", Id = "507776043"},
    {Name = "SuperHero", Id = "616111295"},
    {Name = "Cartwheel", Id = "1015570390"},
}
local DANCES = {
    {Name = "Dança 1", Id = "507777268"},
    {Name = "Dança 2", Id = "507776043"},
    {Name = "Dança 3", Id = "507771019"},
    {Name = "Dança 4", Id = "616139451"},
    {Name = "Dança 5", Id = "507777623"},
}

local TROLL_MESSAGES = {
    "[servidor] servidor foi hackeado pela samy&thurxhub",
    "[servidor] samy&thurxhub hackead",
    "[servidor] o chat do servidor foi detectado um usuário cometendo assédio cuidado, pois vai tomar as devidas punições",
    "[servidor] Samy&thur está no servidor"
}

-- Utilidades
local function newUICorner(obj, r) local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, r or 10); c.Parent = obj; end
local function clear(tab) for _,v in ipairs(tab:GetChildren()) do if v:IsA("GuiObject") then v:Destroy() end end end

-- Busca SayMessageRequest com fallback para executores
local function getChatEvent()
    if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
        return ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
    end
    for _,d in pairs(ReplicatedStorage:GetDescendants()) do
        if d.Name == "SayMessageRequest" then return d end
    end
    return nil
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ThurXSamyHubMobile"
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false

-- TELA DE CARREGAMENTO
local loadFrame = Instance.new("Frame")
loadFrame.Size = UDim2.new(0, 360, 0, 170)
loadFrame.Position = UDim2.new(0.5, -180, 0.5, -85)
loadFrame.BackgroundColor3 = AMOLED
loadFrame.BorderSizePixel = 0
loadFrame.Parent = gui
newUICorner(loadFrame, 16)

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1,0,0,44)
loadTitle.Position = UDim2.new(0,0,0,10)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "samy&thur hub"
loadTitle.TextColor3 = WHITE
loadTitle.Font = Enum.Font.GothamBold
loadTitle.TextSize = 30
loadTitle.Parent = loadFrame

local barLine = Instance.new("Frame")
barLine.Size = UDim2.new(0.85, 0, 0, 6)
barLine.Position = UDim2.new(0.075,0,0,60)
barLine.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barLine.BorderSizePixel = 0
barLine.Parent = loadFrame
newUICorner(barLine, 4)

local barLoad = Instance.new("Frame")
barLoad.Size = UDim2.new(0, 0, 1, 0)
barLoad.Position = UDim2.new(0,0,0,0)
barLoad.BackgroundColor3 = PURPLE
barLoad.BorderSizePixel = 0
barLoad.Parent = barLine
newUICorner(barLoad, 4)

local loadMsg = Instance.new("TextLabel")
loadMsg.Size = UDim2.new(1,0,0,30)
loadMsg.Position = UDim2.new(0,0,0,76)
loadMsg.BackgroundTransparency = 1
loadMsg.Text = "Carregando recursos..."
loadMsg.TextColor3 = WHITE
loadMsg.Font = Enum.Font.Gotham
loadMsg.TextSize = 16
loadMsg.Parent = loadFrame

local loadingTexts = {"Carregando recursos...", "Carregando botões...", "Carregando animações...", "Carregando danças...", "Carregando troll...", "Finalizando..."}
for i,txt in ipairs(loadingTexts) do
    TweenService:Create(barLoad, TweenInfo.new(1.6, Enum.EasingStyle.Linear), {Size = UDim2.new(i/#loadingTexts,0,1,0)}):Play()
    loadMsg.Text = txt
    wait(1.6)
end
wait(1)
loadFrame:Destroy()

-- Ícone T
local tBtn = Instance.new("TextButton")
tBtn.Size = UDim2.new(0, 60, 0, 60)
tBtn.Position = UDim2.new(0, 20, 0.5, -30)
tBtn.BackgroundColor3 = AMOLED
tBtn.Text = "T"
tBtn.TextColor3 = PURPLE
tBtn.Font = Enum.Font.GothamBlack
tBtn.TextSize = 38
tBtn.Visible = false
tBtn.ZIndex = 100
newUICorner(tBtn, 18)
tBtn.Parent = gui

-- Estado Minimizado
local minimized = false
local miniFrame = nil

-- MENU PRINCIPAL
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 600, 0, 420)
menu.Position = UDim2.new(0.5, -300, 0.5, -210)
menu.BackgroundColor3 = AMOLED
menu.Active = true
menu.Draggable = true
menu.ZIndex = 50
menu.Parent = gui
newUICorner(menu, 18)

-- Topo
local topbar = Instance.new("Frame")
topbar.Size = UDim2.new(1, 0, 0, 46)
topbar.BackgroundColor3 = AMOLED
topbar.ZIndex = 51
topbar.Parent = menu
newUICorner(topbar, 18)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "samy&thur hub menu script"
title.Font = Enum.Font.GothamBold
title.TextSize = 19
title.TextColor3 = WHITE
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 52
title.Parent = topbar

-- Botão X
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,38,0,34)
closeBtn.Position = UDim2.new(1, -84, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
closeBtn.TextColor3 = WHITE
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.ZIndex = 52
closeBtn.Parent = topbar
newUICorner(closeBtn, 8)

-- Botão -
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0,38,0,34)
minBtn.Position = UDim2.new(1, -42, 0, 6)
minBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
minBtn.TextColor3 = WHITE
minBtn.Text = "-"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 24
minBtn.ZIndex = 52
minBtn.Parent = topbar
newUICorner(minBtn, 8)

-- Barra preta vertical entre áreas
local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 7, 1, -46)
bar.Position = UDim2.new(0, 97, 0, 46)
bar.BackgroundColor3 = BARBLACK
bar.Visible = false
bar.ZIndex = 55
bar.Parent = menu
newUICorner(bar, 4)

-- Lado esquerdo (abertura de abas)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 97, 1, -46)
sidebar.Position = UDim2.new(0, 0, 0, 46)
sidebar.BackgroundColor3 = AMOLED
sidebar.ZIndex = 53
sidebar.Parent = menu
newUICorner(sidebar, 16)

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Padding = UDim.new(0, 12)
sidebarLayout.Parent = sidebar

-- Botão Anim
local btnAnim = Instance.new("TextButton")
btnAnim.Size = UDim2.new(1, -16, 0, 50)
btnAnim.Position = UDim2.new(0, 8, 0, 12)
btnAnim.BackgroundColor3 = AMOLED
btnAnim.Text = "Anim"
btnAnim.Font = Enum.Font.GothamBlack
btnAnim.TextColor3 = WHITE
btnAnim.TextSize = 19
btnAnim.ZIndex = 54
btnAnim.Parent = sidebar
btnAnim.AutoButtonColor = true
newUICorner(btnAnim, 10)

-- Botão Danca
local btnDanca = Instance.new("TextButton")
btnDanca.Size = UDim2.new(1, -16, 0, 50)
btnDanca.BackgroundColor3 = AMOLED
btnDanca.Text = "Dança"
btnDanca.Font = Enum.Font.GothamBlack
btnDanca.TextColor3 = WHITE
btnDanca.TextSize = 19
btnDanca.ZIndex = 54
btnDanca.Parent = sidebar
btnDanca.AutoButtonColor = true
newUICorner(btnDanca, 10)

-- Botão Troll
local btnTroll = Instance.new("TextButton")
btnTroll.Size = UDim2.new(1, -16, 0, 50)
btnTroll.BackgroundColor3 = AMOLED
btnTroll.Text = "Troll"
btnTroll.Font = Enum.Font.GothamBlack
btnTroll.TextColor3 = WHITE
btnTroll.TextSize = 19
btnTroll.ZIndex = 54
btnTroll.Parent = sidebar
btnTroll.AutoButtonColor = true
newUICorner(btnTroll, 10)

-- Conteúdo dinâmico direita
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -104, 1, -46)
content.Position = UDim2.new(0, 104, 0, 46)
content.BackgroundColor3 = WHITE
content.ZIndex = 54
content.Parent = menu
newUICorner(content, 14)

-- Função barra preta ao rolar
local function showBar()
    bar.Visible = true
    spawn(function()
        local t = tick()
        while tick()-t < 1.1 do wait(0.1) end
        bar.Visible = false
    end)
end

-- Função animações/danças
local function showAnimacoes(tabList, titleText)
    clear(content)
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = titleText
    title.Font = Enum.Font.GothamBold
    title.TextSize = 23
    title.TextColor3 = AMOLED
    title.ZIndex = 55
    title.Parent = content

    local panel = Instance.new("Frame")
    panel.Size = UDim2.new(1, -50, 0, 120)
    panel.Position = UDim2.new(0, 25, 0, 50)
    panel.BackgroundColor3 = GRAY
    panel.ZIndex = 55
    panel.Parent = content
    newUICorner(panel, 16)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.CanvasSize = UDim2.new(0, #tabList*110, 0, 0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 5
    scroll.ScrollingDirection = Enum.ScrollingDirection.X
    scroll.ZIndex = 56
    scroll.Parent = panel

    local iconsLayout = Instance.new("UIListLayout")
    iconsLayout.FillDirection = Enum.FillDirection.Horizontal
    iconsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    iconsLayout.Padding = UDim.new(0, 16)
    iconsLayout.Parent = scroll

    for _,anim in ipairs(tabList) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 100, 0, 110)
        btn.BackgroundColor3 = LIGHTGRAY
        btn.Text = ""
        btn.ZIndex = 57
        btn.Parent = scroll
        newUICorner(btn, 10)

        local img = Instance.new("ImageLabel")
        img.BackgroundTransparency = 1
        img.Size = UDim2.new(0, 58, 0, 58)
        img.Position = UDim2.new(0.5, -29, 0, 10)
        img.Image = ICONS[anim.Name] or "rbxassetid://7072722950"
        img.ZIndex = 58
        img.Parent = btn

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 0, 32)
        lbl.Position = UDim2.new(0, 0, 1, -32)
        lbl.BackgroundTransparency = 1
        lbl.Text = anim.Name
        lbl.TextColor3 = AMOLED
        lbl.TextSize = 15
        lbl.Font = Enum.Font.Gotham
        lbl.ZIndex = 58
        lbl.Parent = btn

        btn.MouseButton1Click:Connect(function()
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                for _,track in pairs(humanoid:GetPlayingAnimationTracks()) do
                    track:Stop()
                end
                local animObj = Instance.new("Animation")
                animObj.AnimationId = "rbxassetid://"..anim.Id
                local playTrack = humanoid:LoadAnimation(animObj)
                playTrack:Play()
            end
        end)
    end

    scroll:GetPropertyChangedSignal("CanvasPosition"):Connect(showBar)
end

-- Função Troll Message
local function showTroll()
    clear(content)
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 38)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Troll mensagem"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 23
    title.TextColor3 = AMOLED
    title.ZIndex = 55
    title.Parent = content

    local msgBtn = Instance.new("TextButton")
    msgBtn.Size = UDim2.new(1, -60, 0, 48)
    msgBtn.Position = UDim2.new(0, 30, 0, 54)
    msgBtn.BackgroundColor3 = AMOLED
    msgBtn.Text = "aperte aqui   >"
    msgBtn.Font = Enum.Font.GothamBold
    msgBtn.TextSize = 18
    msgBtn.TextColor3 = WHITE
    msgBtn.ZIndex = 56
    msgBtn.Parent = content
    newUICorner(msgBtn, 14)

    local avisoflood = Instance.new("TextLabel")
    avisoflood.Size = UDim2.new(1,-24,0,32)
    avisoflood.Position = UDim2.new(0,12,0,108)
    avisoflood.BackgroundTransparency = 1
    avisoflood.Text = "(sua conta pode ter risco de aviso e pode levar ban de 1 dia tome cuidado)"
    avisoflood.Font = Enum.Font.Gotham
    avisoflood.TextSize = 14
    avisoflood.TextColor3 = WARNING
    avisoflood.ZIndex = 57
    avisoflood.Parent = content

    local msgDropdown
    local flooding = false
    local floodConn = nil
    local lastFloodMsg = ""

    msgBtn.MouseButton1Click:Connect(function()
        if msgDropdown and msgDropdown.Parent then msgDropdown:Destroy() end
        msgDropdown = Instance.new("Frame")
        msgDropdown.Size = UDim2.new(1, -60, 0, (#TROLL_MESSAGES*36)+10)
        msgDropdown.Position = UDim2.new(0, 30, 0, 160)
        msgDropdown.BackgroundColor3 = AMOLED
        msgDropdown.ZIndex = 57
        msgDropdown.Parent = content
        newUICorner(msgDropdown, 10)

        for i, msg in ipairs(TROLL_MESSAGES) do
            local optBtn = Instance.new("TextButton")
            optBtn.Size = UDim2.new(1, -16, 0, 32)
            optBtn.Position = UDim2.new(0, 8, 0, (i-1)*36+6)
            optBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
            optBtn.TextColor3 = WHITE
            optBtn.Text = msg
            optBtn.Font = Enum.Font.Gotham
            optBtn.TextSize = 14
            optBtn.ZIndex = 58
            optBtn.Parent = msgDropdown
            newUICorner(optBtn, 8)

            optBtn.MouseButton1Click:Connect(function()
                lastFloodMsg = msg
                -- Botão ativar/desativar flood
                if msgDropdown:FindFirstChild("AtivarFloodBtn") then msgDropdown.AtivarFloodBtn:Destroy() end
                local ativarBtn = Instance.new("TextButton")
                ativarBtn.Name = "AtivarFloodBtn"
                ativarBtn.Size = UDim2.new(0, 164, 0, 36)
                ativarBtn.Position = UDim2.new(0.5, -82, 1, 8)
                ativarBtn.BackgroundColor3 = Color3.fromRGB(24,24,24)
                ativarBtn.Text = (flooding and "Desativar Flood" or "Ativar Flood")
                ativarBtn.TextColor3 = flooding and Color3.fromRGB(255,60,60) or Color3.fromRGB(0,255,100)
                ativarBtn.Font = Enum.Font.GothamBold
                ativarBtn.TextSize = 16
                ativarBtn.ZIndex = 59
                ativarBtn.Parent = msgDropdown
                newUICorner(ativarBtn, 8)

                ativarBtn.MouseButton1Click:Connect(function()
                    flooding = not flooding
                    ativarBtn.Text = flooding and "Desativar Flood" or "Ativar Flood"
                    ativarBtn.TextColor3 = flooding and Color3.fromRGB(255,60,60) or Color3.fromRGB(0,255,100)
                    if flooding then
                        if floodConn then floodConn:Disconnect() floodConn = nil end
                        floodConn = RunService.Heartbeat:Connect(function()
                            local chatEvent = getChatEvent()
                            if chatEvent and lastFloodMsg ~= "" then
                                chatEvent:FireServer(lastFloodMsg, "All")
                            end
                            wait(1)
                        end)
                    else
                        if floodConn then floodConn:Disconnect() floodConn = nil end
                    end
                end)
            end)
        end
    end)
end

-- Seletores de abas
btnAnim.MouseButton1Click:Connect(function() showAnimacoes(ANIMATIONS, "animacoes") end)
btnDanca.MouseButton1Click:Connect(function() showAnimacoes(DANCES, "dancas") end)
btnTroll.MouseButton1Click:Connect(showTroll)
showAnimacoes(ANIMATIONS, "animacoes")

-- Minimizar
minBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    minimized = true
    if not miniFrame then
        miniFrame = Instance.new("Frame")
        miniFrame.Size = UDim2.new(0, 340, 0, 48)
        miniFrame.Position = UDim2.new(0.01,0,0.05,0)
        miniFrame.BackgroundColor3 = AMOLED
        miniFrame.ZIndex = 90
        miniFrame.Active = true
        miniFrame.Draggable = true
        newUICorner(miniFrame, 14)
        miniFrame.Parent = gui

        local quad = Instance.new("TextLabel")
        quad.Size = UDim2.new(0, 228, 0, 48)
        quad.Position = UDim2.new(0, 0, 0, 0)
        quad.BackgroundTransparency = 1
        quad.Text = "⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️"
        quad.Font = Enum.Font.GothamBlack
        quad.TextSize = 22
        quad.TextColor3 = WHITE
        quad.TextXAlignment = Enum.TextXAlignment.Left
        quad.ZIndex = 91
        quad.Parent = miniFrame

        local miniTitle = Instance.new("TextLabel")
        miniTitle.Size = UDim2.new(0, 185, 0, 48)
        miniTitle.Position = UDim2.new(0, 70, 0, 0)
        miniTitle.BackgroundTransparency = 1
        miniTitle.Text = "thurx&samy hub | brookhaven rp"
        miniTitle.TextColor3 = WHITE
        miniTitle.Font = Enum.Font.GothamBold
        miniTitle.TextSize = 15
        miniTitle.TextXAlignment = Enum.TextXAlignment.Left
        miniTitle.ZIndex = 92
        miniTitle.Parent = miniFrame

        local minRestore = Instance.new("TextButton")
        minRestore.Size = UDim2.new(0,34,0,32)
        minRestore.Position = UDim2.new(1,-72,0,8)
        minRestore.BackgroundColor3 = Color3.fromRGB(60,60,60)
        minRestore.TextColor3 = WHITE
        minRestore.Text = "-"
        minRestore.Font = Enum.Font.GothamBold
        minRestore.TextSize = 20
        minRestore.ZIndex = 93
        minRestore.Parent = miniFrame
        newUICorner(minRestore,8)
        minRestore.MouseButton1Click:Connect(function()
            menu.Visible = true
            miniFrame.Visible = false
            minimized = false
        end)

        local minClose = Instance.new("TextButton")
        minClose.Size = UDim2.new(0,34,0,32)
        minClose.Position = UDim2.new(1,-36,0,8)
        minClose.BackgroundColor3 = Color3.fromRGB(60,60,60)
        minClose.TextColor3 = WHITE
        minClose.Text = "X"
        minClose.Font = Enum.Font.GothamBold
        minClose.TextSize = 20
        minClose.ZIndex = 93
        minClose.Parent = miniFrame
        newUICorner(minClose,8)
        minClose.MouseButton1Click:Connect(function()
            miniFrame.Visible = false
            tBtn.Visible = true
            menu.Visible = false
            minimized = false
        end)
    end
    miniFrame.Visible = true
end)

-- Fechar menu
closeBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    tBtn.Visible = true
end)

-- Reabrir menu com T
tBtn.MouseButton1Click:Connect(function()
    menu.Visible = true
    tBtn.Visible = false
end)
