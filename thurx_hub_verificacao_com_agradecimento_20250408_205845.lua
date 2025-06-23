-- ThurX & Samy | Brookhaven RP 🏡 Menu estilo imagem, AMOLED, drag, Delta Executor/mobile, IDs atualizados
-- Com botões CABEÇA, MÃO, SAPATO, etc, cada um com seus próprios botões (Aplicar, Remover, IDs), scroll lateral e tudo conforme imagem/modelo

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- IDs DE ITENS (agora com os valores atualizados)
local CHAPEUS = {
    "15449843197", "6238615247", "5522245154", "13999441546", "13685386157",
    "14424693881", "16513914096"
}
local MASCARAS = {
    "15153086202", "14960781135", "10832389374841", "14942141376", "17164246258", "15153122962",
    "14840793625", "15153906895", "15021037739", "15153876013", "15013531613", "15013413561"
}
local CAMISAS = {
    "11182924874", "11679250718", "10954586887", "11613796964", "12483105503", "12483109504"
}
local GARRAS = {
    "15153086202", "14960781135", "10832389374841", "14942141376", "17164246258", "15153122962",
    "14840793625", "15153906895", "15021037739", "15153876013", "15013531613", "15013413561"
}
local SAPATOS = {
    "13692896835", "13692898868", "13692900864", "13692909747", "13692902454",
    "13692908134", "13692906657", "13692904559"
}
local MAO = {
    "10789914680", "10789939838", "10789950437", "10789945800",
    "10713780551", "10714157708", "10713798995", "10713770556",
    "10713817180", "11251080505", "10713761236"
}
local FLORES = {
    "12465483807", "1246547853", "12465465333", "12465376206"
}

-- CORES
local AMOLED = Color3.fromRGB(0,0,0)
local BTN = Color3.fromRGB(35,35,35)
local BTN2 = Color3.fromRGB(30,30,30)
local WHITE = Color3.fromRGB(255,255,255)
local DARK = Color3.fromRGB(18,18,18)
local PURPLE = Color3.fromRGB(130,0,220)

local function newUICorner(obj, r) local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r or 16);c.Parent=obj;end
local function clear(tab) for _,v in ipairs(tab:GetChildren()) do if v:IsA("GuiObject")then v:Destroy() end end end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")
gui.Name = "ThurXSamyMenu"
gui.ResetOnSpawn = false

-- Carregamento estilizado
local loadFrame = Instance.new("Frame", gui)
loadFrame.Size = UDim2.new(0, 320, 0, 140)
loadFrame.Position = UDim2.new(0.5,-160,0.5,-70)
loadFrame.BackgroundColor3 = AMOLED
newUICorner(loadFrame, 20)

local loadTitle = Instance.new("TextLabel", loadFrame)
loadTitle.Size = UDim2.new(1,0,0,44)
loadTitle.Position = UDim2.new(0,0,0,14)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "thurx&samy"
loadTitle.TextColor3 = WHITE
loadTitle.Font = Enum.Font.GothamBlack
loadTitle.TextSize = 28

local barLine = Instance.new("Frame", loadFrame)
barLine.Size = UDim2.new(0.84, 0, 0, 7)
barLine.Position = UDim2.new(0.08,0,0,62)
barLine.BackgroundColor3 = BTN
newUICorner(barLine, 5)

local barLoad = Instance.new("Frame", barLine)
barLoad.Size = UDim2.new(0, 0, 1, 0)
barLoad.Position = UDim2.new(0,0,0,0)
barLoad.BackgroundColor3 = PURPLE
newUICorner(barLoad, 5)

local loadMsg = Instance.new("TextLabel", loadFrame)
loadMsg.Size = UDim2.new(1,0,0,30)
loadMsg.Position = UDim2.new(0,0,0,77)
loadMsg.BackgroundTransparency = 1
loadMsg.Text = "Carregando..."
loadMsg.TextColor3 = WHITE
loadMsg.Font = Enum.Font.Gotham
loadMsg.TextSize = 16

local loadSteps = {"Carregando roupas...","Carregando itens...","Carregando mapa...","Carregando players...","Sincronizando..."}
for i,txt in ipairs(loadSteps) do
    TweenService:Create(barLoad,TweenInfo.new(1.2),{Size=UDim2.new(i/#loadSteps,0,1,0)}):Play()
    loadMsg.Text = txt
    wait(1.2)
end
TweenService:Create(loadFrame,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
TweenService:Create(barLine,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
TweenService:Create(loadTitle,TweenInfo.new(0.4),{TextTransparency=1}):Play()
TweenService:Create(barLoad,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
TweenService:Create(loadMsg,TweenInfo.new(0.4),{TextTransparency=1}):Play()
wait(0.4)
loadFrame:Destroy()

-- MENU PRINCIPAL
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 550, 0, 392)
menu.Position = UDim2.new(0.5, -275, 0.5, -196)
menu.BackgroundColor3 = DARK
menu.Active = true
menu.Draggable = true
menu.ZIndex = 10
menu.BorderSizePixel = 0
newUICorner(menu, 19)

-- Topo
local topbar = Instance.new("Frame", menu)
topbar.Size = UDim2.new(1, 0, 0, 47)
topbar.BackgroundColor3 = AMOLED
topbar.ZIndex = 11
newUICorner(topbar, 15)
topbar.Active = true
topbar.Draggable = false

local title = Instance.new("TextLabel", topbar)
title.Size = UDim2.new(1, -80, 0.5, 0)
title.Position = UDim2.new(0, 16, 0, 0)
title.BackgroundTransparency = 1
title.Text = "ThurX Hub | brookhaven rp"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = WHITE
title.TextXAlignment = Enum.TextXAlignment.Left

local subtitle = Instance.new("TextLabel", topbar)
subtitle.Size = UDim2.new(1, -80, 0.5, 0)
subtitle.Position = UDim2.new(0, 16, 0.5, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "🏡 samy&thur brm"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 15
subtitle.TextColor3 = WHITE
subtitle.TextXAlignment = Enum.TextXAlignment.Left

local minBtn = Instance.new("TextButton", topbar)
minBtn.Size = UDim2.new(0,38,0,32)
minBtn.Position = UDim2.new(1,-84,0,7)
minBtn.BackgroundColor3 = BTN
minBtn.TextColor3 = WHITE
minBtn.Text = "-"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 22
minBtn.ZIndex = 12
newUICorner(minBtn, 8)
minBtn.BorderColor3 = WHITE
minBtn.BorderSizePixel = 2

local plusBtn = Instance.new("TextButton", topbar)
plusBtn.Size = UDim2.new(0,38,0,32)
plusBtn.Position = UDim2.new(1,-44,0,7)
plusBtn.BackgroundColor3 = BTN
plusBtn.TextColor3 = WHITE
plusBtn.Text = "+"
plusBtn.Font = Enum.Font.GothamBold
plusBtn.TextSize = 22
plusBtn.ZIndex = 12
newUICorner(plusBtn, 8)
plusBtn.BorderColor3 = WHITE
plusBtn.BorderSizePixel = 2

-- Barra lateral (Avatar)
local sidebar = Instance.new("Frame", menu)
sidebar.Size = UDim2.new(0, 113, 1, -47)
sidebar.Position = UDim2.new(0, 0, 0, 47)
sidebar.BackgroundColor3 = AMOLED
sidebar.ZIndex = 10
newUICorner(sidebar, 16)

local btnAvatar = Instance.new("TextButton", sidebar)
btnAvatar.Size = UDim2.new(1,-16,0,54)
btnAvatar.Position = UDim2.new(0,8,0,22)
btnAvatar.BackgroundColor3 = PURPLE
btnAvatar.Text = "Avatar"
btnAvatar.Font = Enum.Font.GothamBold
btnAvatar.TextColor3 = WHITE
btnAvatar.TextSize = 20
btnAvatar.ZIndex = 12
btnAvatar.AutoButtonColor = true
newUICorner(btnAvatar, 15)

-- Conteúdo (lado direito)
local content = Instance.new("Frame", menu)
content.Size = UDim2.new(1, -135, 1, -47)
content.Position = UDim2.new(0, 125, 0, 47)
content.BackgroundColor3 = AMOLED
content.ZIndex = 11
content.ClipsDescendants = true
newUICorner(content, 19)

local scroll = Instance.new("ScrollingFrame", content)
scroll.Size = UDim2.new(1,0,1,0)
scroll.CanvasSize = UDim2.new(0,0,0,600)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 7
scroll.ZIndex = 13
scroll.AutomaticCanvasSize = Enum.AutomaticSize.None

-- Função: Cria cada linha do menu (Cabeça, Máscara, Camisa, Garras, Sapato, Mão, Flores)
local function createRow(y, nome, idList)
    local label = Instance.new("TextLabel", scroll)
    label.Size = UDim2.new(0, 90, 0, 28)
    label.Position = UDim2.new(0, 12, 0, y)
    label.BackgroundTransparency = 1
    label.Text = nome
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = WHITE
    label.TextSize = 17
    label.TextXAlignment = Enum.TextXAlignment.Left

    local selectedId = ""
    local selBar = Instance.new("TextLabel", scroll)
    selBar.Size = UDim2.new(0, 132, 0, 28)
    selBar.Position = UDim2.new(0, 104, 0, y)
    selBar.BackgroundColor3 = BTN2
    selBar.TextColor3 = WHITE
    selBar.Font = Enum.Font.Gotham
    selBar.TextSize = 14
    selBar.Text = ""
    selBar.TextXAlignment = Enum.TextXAlignment.Center
    selBar.TextYAlignment = Enum.TextYAlignment.Center
    newUICorner(selBar, 9)

    local idBtn = Instance.new("TextButton", scroll)
    idBtn.Size = UDim2.new(0, 54, 0, 28)
    idBtn.Position = UDim2.new(0, 242, 0, y)
    idBtn.BackgroundColor3 = BTN2
    idBtn.Text = "IDs"
    idBtn.Font = Enum.Font.GothamBold
    idBtn.TextColor3 = WHITE
    idBtn.TextSize = 13
    newUICorner(idBtn, 9)

    local idDropdown = nil
    idBtn.MouseButton1Click:Connect(function()
        if idDropdown and idDropdown.Parent then idDropdown:Destroy() end
        idDropdown = Instance.new("ScrollingFrame", scroll)
        idDropdown.Size = UDim2.new(0, 90, 0, math.min(7,#idList)*27)
        idDropdown.Position = UDim2.new(0, 242, 0, y+30)
        idDropdown.BackgroundColor3 = Color3.fromRGB(22,22,22)
        idDropdown.ZIndex = 100
        idDropdown.ScrollBarThickness = 5
        idDropdown.CanvasSize = UDim2.new(0,0,0,#idList*27)
        newUICorner(idDropdown, 8)
        for i,id in ipairs(idList) do
            local optBtn = Instance.new("TextButton", idDropdown)
            optBtn.Size = UDim2.new(1, -8, 0, 24)
            optBtn.Position = UDim2.new(0,4,0,(i-1)*27+2)
            optBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
            optBtn.TextColor3 = WHITE
            optBtn.Text = id
            optBtn.Font = Enum.Font.Gotham
            optBtn.TextSize = 13
            optBtn.ZIndex = 101
            newUICorner(optBtn, 6)
            optBtn.MouseButton1Click:Connect(function()
                selectedId = id
                selBar.Text = id
                idDropdown:Destroy()
            end)
        end
    end)

    local applyBtn = Instance.new("TextButton", scroll)
    applyBtn.Size = UDim2.new(0, 66, 0, 28)
    applyBtn.Position = UDim2.new(0, 312, 0, y)
    applyBtn.BackgroundColor3 = PURPLE
    applyBtn.Text = "Aplicar"
    applyBtn.Font = Enum.Font.GothamBold
    applyBtn.TextColor3 = WHITE
    applyBtn.TextSize = 13
    newUICorner(applyBtn, 9)
    applyBtn.MouseButton1Click:Connect(function()
        if selectedId and selectedId ~= "" then
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

    local removeBtn = Instance.new("TextButton", scroll)
    removeBtn.Size = UDim2.new(0, 66, 0, 28)
    removeBtn.Position = UDim2.new(0, 384, 0, y)
    removeBtn.BackgroundColor3 = PURPLE
    removeBtn.Text = "Remover"
    removeBtn.Font = Enum.Font.GothamBold
    removeBtn.TextColor3 = WHITE
    removeBtn.TextSize = 13
    newUICorner(removeBtn, 9)
    removeBtn.MouseButton1Click:Connect(function()
        local char = LocalPlayer.Character
        if char then
            for _,acc in ipairs(char:GetChildren()) do
                if acc:IsA("Accessory") and acc.Name:find(nome.."_") then acc:Destroy() end
            end
        end
        selBar.Text = ""
        selectedId = ""
    end)
end

-- Inicializa layout dos itens (um embaixo do outro, rolagem)
clear(scroll)
local y = 25
createRow(y, "Cabeça", CHAPEUS)      y = y + 48
createRow(y, "Máscara", MASCARAS)    y = y + 48
createRow(y, "Camisa", CAMISAS)      y = y + 48
createRow(y, "Garras", GARRAS)       y = y + 48
createRow(y, "Sapato", SAPATOS)      y = y + 48
createRow(y, "Mão", MAO)             y = y + 48
createRow(y, "Flores", FLORES)       y = y + 48

scroll.CanvasSize = UDim2.new(0,0,0,y+48)

-- Minimizar
local miniFrame
minBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    if not miniFrame then
        miniFrame = Instance.new("Frame", gui)
        miniFrame.Size = UDim2.new(0, 310, 0, 44)
        miniFrame.Position = UDim2.new(0.07,0,0.81,0)
        miniFrame.BackgroundColor3 = AMOLED
        miniFrame.ZIndex = 100
        miniFrame.Draggable = true
        newUICorner(miniFrame, 13)
        local miniTitle = Instance.new("TextLabel", miniFrame)
        miniTitle.Size = UDim2.new(1,-84,1,0)
        miniTitle.Position = UDim2.new(0,14,0,0)
        miniTitle.BackgroundTransparency = 1
        miniTitle.Text = "samy&thur"
        miniTitle.TextColor3 = WHITE
        miniTitle.Font = Enum.Font.GothamBold
        miniTitle.TextSize = 19
        miniTitle.TextXAlignment = Enum.TextXAlignment.Left
        local minRestore = Instance.new("TextButton", miniFrame)
        minRestore.Size = UDim2.new(0,36,0,30)
        minRestore.Position = UDim2.new(1,-76,0,7)
        minRestore.BackgroundColor3 = BTN
        minRestore.TextColor3 = WHITE
        minRestore.Text = "-"
        minRestore.Font = Enum.Font.GothamBold
        minRestore.TextSize = 19
        minRestore.BorderSizePixel = 2
        minRestore.BorderColor3 = WHITE
        newUICorner(minRestore,7)
        local minClose = Instance.new("TextButton", miniFrame)
        minClose.Size = UDim2.new(0,36,0,30)
        minClose.Position = UDim2.new(1,-36,0,7)
        minClose.BackgroundColor3 = BTN
        minClose.TextColor3 = WHITE
        minClose.Text = "X"
        minClose.Font = Enum.Font.GothamBold
        minClose.TextSize = 19
        minClose.BorderSizePixel = 2
        minClose.BorderColor3 = WHITE
        newUICorner(minClose,7)
        minRestore.MouseButton1Click:Connect(function()
            menu.Visible = true
            miniFrame.Visible = false
        end)
        minClose.MouseButton1Click:Connect(function()
            miniFrame.Visible = false
            floatBtn.Visible = true
        end)
    end
    miniFrame.Visible = true
end)

-- Fechar/abrir menu
local floatBtn = Instance.new("TextButton", gui)
floatBtn.Size = UDim2.new(0,54,0,54)
floatBtn.Position = UDim2.new(0.03,0,0.83,0)
floatBtn.BackgroundColor3 = AMOLED
floatBtn.TextColor3 = PURPLE
floatBtn.Text = "東"
floatBtn.Font = Enum.Font.GothamBlack
floatBtn.TextSize = 28
floatBtn.Visible = false
newUICorner(floatBtn, 13)
floatBtn.Draggable = true

plusBtn.MouseButton1Click:Connect(function()
    -- Apenas de enfeite, pode adicionar funções extras aqui se quiser
end)
floatBtn.MouseButton1Click:Connect(function()
    menu.Visible = true
    floatBtn.Visible = false
end)
