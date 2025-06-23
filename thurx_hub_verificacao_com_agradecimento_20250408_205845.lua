-- ThurX & SamyXHub | Brookhaven RP 🏡
-- Menu de Avatar/3D Items com carregamento, dark AMOLED, responsivo, drag-size, Delta Executor/Mobile Ready

-- SERVIÇOS
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- CORES
local AMOLED = Color3.fromRGB(0,0,0)
local WHITE = Color3.fromRGB(255,255,255)
local PURPLE = Color3.fromRGB(130,0,220)
local BARBLACK = Color3.fromRGB(10,10,10)
local DARK = Color3.fromRGB(18,18,18)
local BTN = Color3.fromRGB(30,30,30)
local GRAY = Color3.fromRGB(200,200,200)

-- IDs (Preencha com os das imagens, exemplo FLORES = {"id1","id2",...})
local CABECA = {"12465483807","1246547853","12465465333","12465376206"} -- Flores/Chapéu IDs da Imagem 1
local MAO = {
    "11182924874","11679250718","10954586887","11613796964","12483105503","12483109504",
    "1360863184","10789914680","10789939838","10789950437","10789945808",
    "11511211329","10713780551","10714157708","10713798995","10713770556","10713817180",
    "11251080505","10713761236"
}
local SAPATOS = {
    "11856087406","12298192447","14337827820","11856084059","12088306881","13978580595",
    "12088300165","14337838380","1397739307","12286197088","14338740380","13978580785",
    "13978571030","12296180963","1397730483","14338738628","14338744148"
}

-- UTILS
local function newUICorner(obj, r) local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r or 12);c.Parent=obj;end
local function clear(tab) for _,v in ipairs(tab:GetChildren())do if v:IsA("GuiObject")then v:Destroy() end end end

-- GUI RAIZ
local gui = Instance.new("ScreenGui")
gui.Name = "ThurXSamy3DMenu"
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- ANIMAÇÃO CARREGAMENTO
local loadFrame = Instance.new("Frame")
loadFrame.Size = UDim2.new(0, 350, 0, 180)
loadFrame.Position = UDim2.new(0.5,-175,0.5,-90)
loadFrame.BackgroundColor3 = AMOLED
loadFrame.BorderSizePixel = 0
loadFrame.Parent = gui
loadFrame.AnchorPoint = Vector2.new(0,0)
newUICorner(loadFrame, 22)

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1,0,0,46)
loadTitle.Position = UDim2.new(0,0,0,20)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "samy&thur script"
loadTitle.TextColor3 = WHITE
loadTitle.Font = Enum.Font.GothamBlack
loadTitle.TextSize = 30
loadTitle.Parent = loadFrame

local barLine = Instance.new("Frame")
barLine.Size = UDim2.new(0.85, 0, 0, 8)
barLine.Position = UDim2.new(0.075,0,0,74)
barLine.BackgroundColor3 = Color3.fromRGB(30,30,30)
barLine.BorderSizePixel = 0
barLine.Parent = loadFrame
newUICorner(barLine, 5)

local barLoad = Instance.new("Frame")
barLoad.Size = UDim2.new(0, 0, 1, 0)
barLoad.Position = UDim2.new(0,0,0,0)
barLoad.BackgroundColor3 = PURPLE
barLoad.BorderSizePixel = 0
barLoad.Parent = barLine
newUICorner(barLoad, 5)

local loadMsg = Instance.new("TextLabel")
loadMsg.Size = UDim2.new(1,0,0,30)
loadMsg.Position = UDim2.new(0,0,0,108)
loadMsg.BackgroundTransparency = 1
loadMsg.Text = "Carregando roupas..."
loadMsg.TextColor3 = WHITE
loadMsg.Font = Enum.Font.Gotham
loadMsg.TextSize = 16
loadMsg.Parent = loadFrame

local loadSteps = {"Carregando roupas...","Carregando itens...","Carregando mapa...","Carregando players...","Carregando interface...","Sincronizando..."}
for i,txt in ipairs(loadSteps) do
    TweenService:Create(barLoad, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {Size = UDim2.new(i/#loadSteps,0,1,0)}):Play()
    loadMsg.Text = txt
    wait(1.5)
end
wait(0.8)
TweenService:Create(loadFrame, TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
TweenService:Create(barLine, TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
TweenService:Create(loadTitle, TweenInfo.new(0.3),{TextTransparency=1}):Play()
TweenService:Create(barLoad, TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
TweenService:Create(loadMsg, TweenInfo.new(0.3),{TextTransparency=1}):Play()
wait(0.35)
loadFrame:Destroy()

-- MENU PRINCIPAL (com drag sizing)
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 620, 0, 420)
menu.Position = UDim2.new(0.5,-310,0.5,-210)
menu.BackgroundColor3 = DARK
menu.Active = true
menu.Draggable = true
menu.ZIndex = 100
menu.Parent = gui
menu.BorderSizePixel = 0
menu.AnchorPoint = Vector2.new(0,0)
newUICorner(menu, 19)

-- DRAG SIZE inferior direita
local dragHandle = Instance.new("Frame")
dragHandle.Size = UDim2.new(0,38,0,38)
dragHandle.Position = UDim2.new(1,-38,1,-38)
dragHandle.AnchorPoint = Vector2.new(0,0)
dragHandle.BackgroundColor3 = BTN
dragHandle.BorderSizePixel = 0
dragHandle.Parent = menu
dragHandle.ZIndex = 150
newUICorner(dragHandle, 12)
local dragImg = Instance.new("ImageLabel")
dragImg.Parent = dragHandle
dragImg.BackgroundTransparency = 1
dragImg.Size = UDim2.new(1,0,1,0)
dragImg.Image = "rbxassetid://6031091000"
dragImg.ImageColor3 = Color3.fromRGB(80,80,80)

local dragging,offset
dragHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        offset = Vector2.new(input.Position.X, input.Position.Y)
    end
end)
dragHandle.InputEnded:Connect(function(input)
    dragging = false
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local newS = Vector2.new(input.Position.X, input.Position.Y) - offset
        local newW = math.clamp(menu.Size.X.Offset + newS.X, 360, 900)
        local newH = math.clamp(menu.Size.Y.Offset + newS.Y, 260, 700)
        menu.Size = UDim2.new(0, newW, 0, newH)
        dragHandle.Position = UDim2.new(1,-38,1,-38)
        offset = Vector2.new(input.Position.X, input.Position.Y)
    end
end)

-- TOPO
local topbar = Instance.new("Frame")
topbar.Size = UDim2.new(1, 0, 0, 44)
topbar.BackgroundColor3 = AMOLED
topbar.ZIndex = 101
topbar.Parent = menu
newUICorner(topbar, 18)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.67, 0, 1, 0)
title.Position = UDim2.new(0, 16, 0, 0)
title.BackgroundTransparency = 1
title.Text = "samy&thurxhub | brookhaven rp 🏡"
title.Font = Enum.Font.GothamBold
title.TextSize = 19
title.TextColor3 = WHITE
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 102
title.Parent = topbar

-- X (fechar) e - (minimizar)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,38,0,32)
closeBtn.Position = UDim2.new(1, -84, 0, 6)
closeBtn.BackgroundColor3 = BTN
closeBtn.TextColor3 = WHITE
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.ZIndex = 102
closeBtn.Parent = topbar
newUICorner(closeBtn, 9)

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0,38,0,32)
minBtn.Position = UDim2.new(1, -42, 0, 6)
minBtn.BackgroundColor3 = BTN
minBtn.TextColor3 = WHITE
minBtn.Text = "-"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 24
minBtn.ZIndex = 102
minBtn.Parent = topbar
newUICorner(minBtn, 9)

-- BARRA PRETA ENTRE ÁREAS
local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 7, 1, -44)
bar.Position = UDim2.new(0, 97, 0, 44)
bar.BackgroundColor3 = BARBLACK
bar.Visible = false
bar.ZIndex = 110
bar.Parent = menu
newUICorner(bar, 5)

-- LADO ESQUERDO - BOTÕES
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 97, 1, -44)
sidebar.Position = UDim2.new(0, 0, 0, 44)
sidebar.BackgroundColor3 = AMOLED
sidebar.ZIndex = 106
sidebar.Parent = menu
newUICorner(sidebar, 18)
local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Padding = UDim.new(0, 14)
sidebarLayout.Parent = sidebar

-- BOTÕES ESQUERDA - Avatar, Cabeça, Mão, Sapato
local function createSidebarBtn(txt)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-16,0,52)
    btn.BackgroundColor3 = BTN
    btn.Text = txt
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = WHITE
    btn.TextSize = 18
    btn.Parent = sidebar
    btn.AutoButtonColor = true
    btn.ZIndex = 107
    newUICorner(btn, 12)
    return btn
end

local btnAvatar = createSidebarBtn("Avatar")
local btnMao = createSidebarBtn("Item para a mão")
local btnSapato = createSidebarBtn("Sapato")

-- CONTEÚDO DIREITA
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -104, 1, -44)
content.Position = UDim2.new(0, 104, 0, 44)
content.BackgroundColor3 = WHITE
content.ZIndex = 108
content.Parent = menu
newUICorner(content, 16)

-- Função: Barra preta aparece ao rolar (efeito visual)
local function showBar()
    bar.Visible = true
    spawn(function()
        local t = tick()
        while tick()-t < 1.2 do wait(0.1) end
        bar.Visible = false
    end)
end

-- Função: Cria seção 3D Item
local function create3DSection(nome, idList)
    local y = 0
    clear(content)
    -- Roupas 3D título
    local mainLabel = Instance.new("TextLabel")
    mainLabel.Size = UDim2.new(1,0,0,36)
    mainLabel.Position = UDim2.new(0,0,0,7)
    mainLabel.BackgroundTransparency = 1
    mainLabel.Text = "Roupas 3D"
    mainLabel.Font = Enum.Font.GothamBold
    mainLabel.TextSize = 21
    mainLabel.TextColor3 = DARK
    mainLabel.ZIndex = 109
    mainLabel.Parent = content

    -- Nome do item (ex: Cabeça, Mão, Sapato)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 130, 0, 28)
    label.Position = UDim2.new(0, 0, 0, 46)
    label.BackgroundTransparency = 1
    label.Text = nome
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = Color3.fromRGB(40,40,40)
    label.TextSize = 16
    label.ZIndex = 109
    label.Parent = content

    -- Box atual (id selecionado)
    local selectedId = ""
    local selIdBar = Instance.new("TextLabel")
    selIdBar.Size = UDim2.new(0, 102, 0, 28)
    selIdBar.Position = UDim2.new(0,140,0,46)
    selIdBar.BackgroundColor3 = BARBLACK
    selIdBar.TextColor3 = WHITE
    selIdBar.Font = Enum.Font.GothamBold
    selIdBar.TextSize = 14
    selIdBar.Text = ""
    selIdBar.ZIndex = 110
    selIdBar.Parent = content
    newUICorner(selIdBar, 8)
    selIdBar.TextXAlignment = Enum.TextXAlignment.Center
    selIdBar.TextYAlignment = Enum.TextYAlignment.Center

    -- Botão de IDs (abre lista)
    local idBtn = Instance.new("TextButton")
    idBtn.Size = UDim2.new(0, 90, 0, 28)
    idBtn.Position = UDim2.new(0,260,0,46)
    idBtn.BackgroundColor3 = BTN
    idBtn.Text = "IDs"
    idBtn.Font = Enum.Font.GothamBold
    idBtn.TextColor3 = WHITE
    idBtn.TextSize = 13
    idBtn.ZIndex = 110
    idBtn.Parent = content
    newUICorner(idBtn, 8)

    -- Dropdown de IDs
    local idDropdown = nil
    idBtn.MouseButton1Click:Connect(function()
        if idDropdown and idDropdown.Parent then idDropdown:Destroy() end
        idDropdown = Instance.new("ScrollingFrame")
        idDropdown.Size = UDim2.new(0, 120, 0, math.min(7,#idList)*32)
        idDropdown.Position = UDim2.new(0, 260, 0, 74)
        idDropdown.BackgroundColor3 = Color3.fromRGB(30,30,30)
        idDropdown.ZIndex = 111
        idDropdown.Parent = content
        idDropdown.ScrollBarThickness = 6
        idDropdown.CanvasSize = UDim2.new(0,0,0,#idList*32)
        idDropdown.AutomaticCanvasSize = Enum.AutomaticSize.None
        newUICorner(idDropdown, 8)

        for i,id in ipairs(idList) do
            local optBtn = Instance.new("TextButton")
            optBtn.Size = UDim2.new(1, -8, 0, 28)
            optBtn.Position = UDim2.new(0, 4, 0, (i-1)*32+2)
            optBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
            optBtn.TextColor3 = WHITE
            optBtn.Text = id
            optBtn.Font = Enum.Font.Gotham
            optBtn.TextSize = 14
            optBtn.ZIndex = 112
            optBtn.Parent = idDropdown
            newUICorner(optBtn, 7)
            optBtn.MouseButton1Click:Connect(function()
                selectedId = id
                selIdBar.Text = id
                idDropdown:Destroy()
            end)
        end
    end)

    -- Botão aplicar
    local applyBtn = Instance.new("TextButton")
    applyBtn.Size = UDim2.new(0, 134, 0, 34)
    applyBtn.Position = UDim2.new(0, 7, 0, 90)
    applyBtn.BackgroundColor3 = PURPLE
    applyBtn.Text = "Aplicar"
    applyBtn.Font = Enum.Font.GothamBold
    applyBtn.TextColor3 = WHITE
    applyBtn.TextSize = 16
    applyBtn.ZIndex = 110
    applyBtn.Parent = content
    newUICorner(applyBtn, 10)
    applyBtn.MouseButton1Click:Connect(function()
        if selectedId and selectedId ~= "" then
            -- Exemplo: adicionar Accessory ao personagem (ajuste para seu sistema)
            local char = LocalPlayer.Character
            if char then
                local acc = Instance.new("Accessory")
                acc.Name = nome.."_"..selectedId
                local handle = Instance.new("Part")
                handle.Name = "Handle"
                handle.Size = Vector3.new(1,1,1)
                handle.Parent = acc
                acc.Parent = char
            end
        end
    end)
end

btnAvatar.MouseButton1Click:Connect(function() create3DSection("Cabeça", CABECA) end)
btnMao.MouseButton1Click:Connect(function() create3DSection("Mão", MAO) end)
btnSapato.MouseButton1Click:Connect(function() create3DSection("Sapato", SAPATOS) end)

-- Inicializa na aba Avatar/Cabeça
create3DSection("Cabeça", CABECA)

-- MINIMIZAR E FECHAR/MENU FLUTUANTE
local minimized, miniFrame = false, nil
minBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    minimized = true
    if not miniFrame then
        miniFrame = Instance.new("Frame")
        miniFrame.Size = UDim2.new(0, 340, 0, 48)
        miniFrame.Position = UDim2.new(0.01,0,0.05,0)
        miniFrame.BackgroundColor3 = AMOLED
        miniFrame.ZIndex = 200
        miniFrame.Active = true
        miniFrame.Draggable = true
        newUICorner(miniFrame, 14)
        miniFrame.Parent = gui

        local quad = Instance.new("Frame")
        quad.Size = UDim2.new(0, 230, 0, 48)
        quad.Position = UDim2.new(0, 0, 0, 0)
        quad.BackgroundColor3 = BTN
        quad.BorderSizePixel = 0
        quad.ZIndex = 201
        quad.Parent = miniFrame
        newUICorner(quad, 12)

        local miniTitle = Instance.new("TextLabel")
        miniTitle.Size = UDim2.new(0, 180, 0, 48)
        miniTitle.Position = UDim2.new(0, 12, 0, 0)
        miniTitle.BackgroundTransparency = 1
        miniTitle.Text = "thurx&samy | brookhaven rp 🏡"
        miniTitle.TextColor3 = WHITE
        miniTitle.Font = Enum.Font.GothamBold
        miniTitle.TextSize = 15
        miniTitle.TextXAlignment = Enum.TextXAlignment.Left
        miniTitle.ZIndex = 202
        miniTitle.Parent = miniFrame

        local minRestore = Instance.new("TextButton")
        minRestore.Size = UDim2.new(0,34,0,32)
        minRestore.Position = UDim2.new(1,-72,0,8)
        minRestore.BackgroundColor3 = BTN
        minRestore.TextColor3 = WHITE
        minRestore.Text = "-"
        minRestore.Font = Enum.Font.GothamBold
        minRestore.TextSize = 20
        minRestore.ZIndex = 203
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
        minClose.BackgroundColor3 = BTN
        minClose.TextColor3 = WHITE
        minClose.Text = "X"
        minClose.Font = Enum.Font.GothamBold
        minClose.TextSize = 20
        minClose.ZIndex = 203
        minClose.Parent = miniFrame
        newUICorner(minClose,8)
        minClose.MouseButton1Click:Connect(function()
            miniFrame.Visible = false
            floatBtn.Visible = true
            menu.Visible = false
            minimized = false
        end)
    end
    miniFrame.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    floatBtn.Visible = true
end)

-- BOTÃO FLUTUANTE (T japonês)
local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 54, 0, 54)
floatBtn.Position = UDim2.new(0.05,0,0.69,0)
floatBtn.BackgroundColor3 = AMOLED
floatBtn.TextColor3 = PURPLE
floatBtn.Text = "T 東"
floatBtn.Font = Enum.Font.GothamBlack
floatBtn.TextSize = 32
floatBtn.Visible = false
floatBtn.ZIndex = 300
newUICorner(floatBtn, 16)
floatBtn.Parent = gui
floatBtn.Draggable = true

closeBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    floatBtn.Visible = true
end)
floatBtn.MouseButton1Click:Connect(function()
    menu.Visible = true
    floatBtn.Visible = false
end)
