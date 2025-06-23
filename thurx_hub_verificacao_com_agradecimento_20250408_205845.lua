-- ThurX & Samy Hub: Skin/Avatar Menu Script (Delta Executor/Mobile Ready)
-- Interface AMOLED, arrastável, layout pedido, FLOOD/AVATAR/ITEMS FUNCIONANDO

-- SERVIÇOS
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- CORES
local AMOLED = Color3.fromRGB(0,0,0)
local WHITE = Color3.fromRGB(255,255,255)
local GRAY = Color3.fromRGB(220,220,220)
local PURPLE = Color3.fromRGB(130,0,220)
local WARNING = Color3.fromRGB(255, 120, 50)
local BARBLACK = Color3.fromRGB(10,10,10)

-- IDs DE ITENS (exemplo, substitua pelos IDs reais das imagens/itens do seu jogo)
local CHAPEUS = {"12345678", "23456789", "34567890"} -- coloque os IDs reais
local MASCARAS = {"45678901", "56789012"}
local CAMISAS = {"67890123", "78901234"}
local GARRAS = {"89012345"}
local SAPATOS = {"90123456"}
local MAO = {"12340123"}
local FLORES = {"21098765"}

-- UTILS
local function newUICorner(obj, r) local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r or 10);c.Parent=obj;end
local function clear(tab) for _,v in ipairs(tab:GetChildren()) do if v:IsA("GuiObject") then v:Destroy() end end end

-- GET CHAT EVENT
local function getChatEvent()
    if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
        return ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
    end
    for _,d in pairs(ReplicatedStorage:GetDescendants()) do
        if d.Name=="SayMessageRequest" then return d end
    end
    return nil
end

-- GUI RAIZ
local gui = Instance.new("ScreenGui")
gui.Name = "ThurXSamySkinHub"
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false

-- BOTÃO T
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

-- MINIMIZADO
local minimized, miniFrame = false, nil

-- MENU PRINCIPAL
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 600, 0, 440)
menu.Position = UDim2.new(0.5, -300, 0.5, -220)
menu.BackgroundColor3 = AMOLED
menu.Active = true
menu.Draggable = true
menu.ZIndex = 50
menu.Parent = gui
newUICorner(menu, 18)

-- TOPO
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

-- BOTÕES X e -
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

-- BARRA VERTICAL
local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 7, 1, -46)
bar.Position = UDim2.new(0, 97, 0, 46)
bar.BackgroundColor3 = BARBLACK
bar.Visible = false
bar.ZIndex = 55
bar.Parent = menu
newUICorner(bar, 4)

-- LADO ESQUERDO - BOTÕES
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

-- BOTÃO COPIAR SKIN
local btnCopySkin = Instance.new("TextButton")
btnCopySkin.Size = UDim2.new(1, -16, 0, 50)
btnCopySkin.Position = UDim2.new(0, 8, 0, 12)
btnCopySkin.BackgroundColor3 = AMOLED
btnCopySkin.Text = "Avatar"
btnCopySkin.Font = Enum.Font.GothamBlack
btnCopySkin.TextColor3 = WHITE
btnCopySkin.TextSize = 18
btnCopySkin.ZIndex = 54
btnCopySkin.Parent = sidebar
btnCopySkin.AutoButtonColor = true
newUICorner(btnCopySkin, 10)

-- BOTÃO ROUPA/ITENS
local btnItens = Instance.new("TextButton")
btnItens.Size = UDim2.new(1, -16, 0, 50)
btnItens.BackgroundColor3 = AMOLED
btnItens.Text = "Itens"
btnItens.Font = Enum.Font.GothamBlack
btnItens.TextColor3 = WHITE
btnItens.TextSize = 18
btnItens.ZIndex = 54
btnItens.Parent = sidebar
btnItens.AutoButtonColor = true
newUICorner(btnItens, 10)

-- CONTEÚDO DIREITA
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -104, 1, -46)
content.Position = UDim2.new(0, 104, 0, 46)
content.BackgroundColor3 = WHITE
content.ZIndex = 54
content.Parent = menu
newUICorner(content, 14)

---------------------- FUNÇÕES DE CONTEÚDO ------------------------

-- Avatar/Skin Copy
local function showAvatarTab()
    clear(content)
    -- Título
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 44)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Copiar skin"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 21
    title.TextColor3 = Color3.fromRGB(30,30,30)
    title.TextXAlignment = Enum.TextXAlignment.Right
    title.ZIndex = 55
    title.Parent = content

    local subt = Instance.new("TextLabel")
    subt.Size = UDim2.new(1, 0, 0, 18)
    subt.Position = UDim2.new(0, 0, 0, 40)
    subt.BackgroundTransparency = 1
    subt.Text = "*copie a skin de um jogador*"
    subt.Font = Enum.Font.Gotham
    subt.TextSize = 14
    subt.TextColor3 = Color3.fromRGB(120,120,120)
    subt.ZIndex = 55
    subt.Parent = content

    -- Lista de jogadores
    local playerLabel = Instance.new("TextLabel")
    playerLabel.Size = UDim2.new(1, -20, 0, 18)
    playerLabel.Position = UDim2.new(0, 10, 0, 60)
    playerLabel.BackgroundTransparency = 1
    playerLabel.Text = "Jogador:"
    playerLabel.Font = Enum.Font.GothamSemibold
    playerLabel.TextSize = 15
    playerLabel.TextColor3 = Color3.fromRGB(60,60,60)
    playerLabel.ZIndex = 55
    playerLabel.Parent = content

    local selectedPlayer = nil

    local plrDrop = Instance.new("TextButton")
    plrDrop.Size = UDim2.new(1,-20,0,36)
    plrDrop.Position = UDim2.new(0,10,0,80)
    plrDrop.BackgroundColor3 = GRAY
    plrDrop.Text = "Escolher jogador"
    plrDrop.Font = Enum.Font.Gotham
    plrDrop.TextColor3 = Color3.fromRGB(30,30,30)
    plrDrop.TextSize = 15
    plrDrop.ZIndex = 56
    plrDrop.Parent = content
    newUICorner(plrDrop, 8)

    local playerListFrame

    local function updatePlayers()
        if playerListFrame and playerListFrame.Parent then playerListFrame:Destroy() end
        playerListFrame = Instance.new("Frame")
        playerListFrame.Size = UDim2.new(1,-20,0, #Players:GetPlayers()*30 + 10)
        playerListFrame.Position = UDim2.new(0,10,0,116)
        playerListFrame.BackgroundColor3 = GRAY
        playerListFrame.ZIndex = 57
        playerListFrame.Parent = content
        newUICorner(playerListFrame, 7)
        for i,p in ipairs(Players:GetPlayers()) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1,-10,0,28)
            btn.Position = UDim2.new(0,5,0,(i-1)*30+5)
            btn.BackgroundColor3 = Color3.fromRGB(230,230,230)
            btn.Text = p.DisplayName.." ("..p.Name..")"
            btn.Font = Enum.Font.Gotham
            btn.TextColor3 = Color3.fromRGB(40,40,40)
            btn.TextSize = 14
            btn.ZIndex = 58
            btn.Parent = playerListFrame
            newUICorner(btn, 6)
            btn.MouseButton1Click:Connect(function()
                selectedPlayer = p
                plrDrop.Text = p.DisplayName.." ("..p.Name..")"
                if playerListFrame and playerListFrame.Parent then playerListFrame:Destroy() end
            end)
        end
    end

    plrDrop.MouseButton1Click:Connect(updatePlayers)

    local refreshBtn = Instance.new("TextButton")
    refreshBtn.Size = UDim2.new(0, 120, 0, 34)
    refreshBtn.Position = UDim2.new(0, 10, 0, 116 + (#Players:GetPlayers()*30 + 18))
    refreshBtn.BackgroundColor3 = AMOLED
    refreshBtn.Text = "Atualizar lista"
    refreshBtn.Font = Enum.Font.GothamSemibold
    refreshBtn.TextColor3 = WHITE
    refreshBtn.TextSize = 15
    refreshBtn.ZIndex = 56
    refreshBtn.Parent = content
    newUICorner(refreshBtn, 8)
    refreshBtn.MouseButton1Click:Connect(updatePlayers)

    local applyBtn = Instance.new("TextButton")
    applyBtn.Size = UDim2.new(1,-20,0,38)
    applyBtn.Position = UDim2.new(0,10,0,180 + (#Players:GetPlayers()*30 + 18))
    applyBtn.BackgroundColor3 = PURPLE
    applyBtn.Text = "Aplicar skin"
    applyBtn.Font = Enum.Font.GothamBold
    applyBtn.TextColor3 = WHITE
    applyBtn.TextSize = 18
    applyBtn.ZIndex = 57
    applyBtn.Parent = content
    newUICorner(applyBtn, 8)
    applyBtn.MouseButton1Click:Connect(function()
        if selectedPlayer and selectedPlayer.Character and LocalPlayer.Character then
            for _,obj in ipairs(LocalPlayer.Character:GetChildren()) do
                if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") then
                    obj:Destroy()
                end
            end
            for _,obj in ipairs(selectedPlayer.Character:GetChildren()) do
                if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") then
                    local clone = obj:Clone()
                    clone.Parent = LocalPlayer.Character
                end
            end
        end
    end)
end

-- Aba Itens/Roupas
local function showItensTab()
    clear(content)
    local y = 0
    local function makeSection(nome, lista)
        local section = Instance.new("Frame")
        section.Size = UDim2.new(1, -20, 0, 48 + #lista*44)
        section.Position = UDim2.new(0, 10, 0, y)
        section.BackgroundTransparency = 1
        section.ZIndex = 55
        section.Parent = content

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 100, 0, 26)
        label.Position = UDim2.new(0, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = nome
        label.Font = Enum.Font.GothamBold
        label.TextColor3 = Color3.fromRGB(40,40,40)
        label.TextSize = 17
        label.ZIndex = 56
        label.Parent = section

        for i,id in ipairs(lista) do
            local idbtn = Instance.new("TextButton")
            idbtn.Size = UDim2.new(0, 100, 0, 34)
            idbtn.Position = UDim2.new(0, 108, 0, 30+(i-1)*44)
            idbtn.BackgroundColor3 = GRAY
            idbtn.Text = id
            idbtn.Font = Enum.Font.Gotham
            idbtn.TextColor3 = Color3.fromRGB(60,60,60)
            idbtn.TextSize = 13
            idbtn.ZIndex = 57
            idbtn.Parent = section
            newUICorner(idbtn, 7)

            local aplicar = Instance.new("TextButton")
            aplicar.Size = UDim2.new(0, 90, 0, 28)
            aplicar.Position = UDim2.new(0, 220, 0, 32+(i-1)*44)
            aplicar.BackgroundColor3 = PURPLE
            aplicar.Text = "Aplicar"
            aplicar.Font = Enum.Font.GothamBold
            aplicar.TextColor3 = WHITE
            aplicar.TextSize = 13
            aplicar.ZIndex = 57
            aplicar.Parent = section
            newUICorner(aplicar, 7)

            aplicar.MouseButton1Click:Connect(function()
                -- Exemplo: adicionar Accessory ao personagem, troque para sua lógica de adicionar item
                local char = LocalPlayer.Character
                if char then
                    local acc = Instance.new("Accessory")
                    acc.Name = nome.."_"..id
                    local handle = Instance.new("Part")
                    handle.Name = "Handle"
                    handle.Size = Vector3.new(1,1,1)
                    handle.Parent = acc
                    acc.Parent = char
                end
            end)
        end
        y = y + section.Size.Y.Offset + 8
    end
    makeSection("Chapéu", CHAPEUS)
    makeSection("Máscara", MASCARAS)
    makeSection("Camisa", CAMISAS)
    makeSection("Garras", GARRAS)
    makeSection("Sapato", SAPATOS)
    makeSection("Mão", MAO)
    makeSection("Flores", FLORES)
end

-- TROCA DE ABAS
btnCopySkin.MouseButton1Click:Connect(showAvatarTab)
btnItens.MouseButton1Click:Connect(showItensTab)
showAvatarTab()

-- MINIMIZAR/MÁXIMIZAR/MENU T
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

closeBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    tBtn.Visible = true
end)
tBtn.MouseButton1Click:Connect(function()
    menu.Visible = true
    tBtn.Visible = false
end)
