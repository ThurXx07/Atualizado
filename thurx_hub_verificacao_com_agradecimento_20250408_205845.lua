-- ThurX SamyXHub | Brookhaven RP 🏡
-- Menu estilo imagem, AMOLED, layout lateral, botão "Avatar" único, itens em linha, dark, drag size, mobile/delta executor

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- IDs das imagens fornecidas
local CABECA = {"12465483807","1246547853","12465465333","12465376206"}
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

local AMOLED = Color3.fromRGB(0,0,0)
local BTN = Color3.fromRGB(35,35,35)
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
loadTitle.Text = "samy&thur script"
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
loadMsg.Text = "Carregando roupas..."
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
menu.Size = UDim2.new(0, 600, 0, 390)
menu.Position = UDim2.new(0.5, -300, 0.5, -195)
menu.BackgroundColor3 = DARK
menu.Active = true
menu.Draggable = true
menu.ZIndex = 10
menu.BorderSizePixel = 0
newUICorner(menu, 22)

-- Topo
local topbar = Instance.new("Frame", menu)
topbar.Size = UDim2.new(1, 0, 0, 44)
topbar.BackgroundColor3 = AMOLED
topbar.ZIndex = 11
newUICorner(topbar, 15)

local title = Instance.new("TextLabel", topbar)
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 16, 0, 0)
title.BackgroundTransparency = 1
title.Text = "ThurX Hub | brookhaven rp 🏡 samy&thur brm"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = WHITE
title.TextXAlignment = Enum.TextXAlignment.Left

-- Fechar e minimizar
local closeBtn = Instance.new("TextButton", topbar)
closeBtn.Size = UDim2.new(0,38,0,32)
closeBtn.Position = UDim2.new(1,-44,0,6)
closeBtn.BackgroundColor3 = BTN
closeBtn.TextColor3 = WHITE
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.ZIndex = 12
newUICorner(closeBtn, 8)

local minBtn = Instance.new("TextButton", topbar)
minBtn.Size = UDim2.new(0,38,0,32)
minBtn.Position = UDim2.new(1,-84,0,6)
minBtn.BackgroundColor3 = BTN
minBtn.TextColor3 = WHITE
minBtn.Text = "-"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 24
minBtn.ZIndex = 12
newUICorner(minBtn, 8)

-- Barra lateral (Avatar)
local sidebar = Instance.new("Frame", menu)
sidebar.Size = UDim2.new(0, 93, 1, -44)
sidebar.Position = UDim2.new(0, 0, 0, 44)
sidebar.BackgroundColor3 = AMOLED
sidebar.ZIndex = 10
newUICorner(sidebar, 16)

local btnAvatar = Instance.new("TextButton", sidebar)
btnAvatar.Size = UDim2.new(1,-14,0,48)
btnAvatar.Position = UDim2.new(0,7,0,18)
btnAvatar.BackgroundColor3 = PURPLE
btnAvatar.Text = "Avatar"
btnAvatar.Font = Enum.Font.GothamBold
btnAvatar.TextColor3 = WHITE
btnAvatar.TextSize = 18
btnAvatar.ZIndex = 12
newUICorner(btnAvatar, 14)

-- Conteúdo (lado direito)
local content = Instance.new("Frame", menu)
content.Size = UDim2.new(1, -115, 1, -44)
content.Position = UDim2.new(0, 108, 0, 44)
content.BackgroundColor3 = WHITE
content.ZIndex = 11
newUICorner(content, 19)

-- Elemento: linha para cada grupo (cabeça, mão, sapato)
local function createRow(y, nome, idList)
    local label = Instance.new("TextLabel", content)
    label.Size = UDim2.new(0, 92, 0, 32)
    label.Position = UDim2.new(0, 10, 0, y)
    label.BackgroundTransparency = 1
    label.Text = nome
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = Color3.fromRGB(30,30,30)
    label.TextSize = 16

    -- ID selecionado
    local selectedId = ""
    local selBar = Instance.new("TextLabel", content)
    selBar.Size = UDim2.new(0, 90, 0, 28)
    selBar.Position = UDim2.new(0,110,0,y+2)
    selBar.BackgroundColor3 = BTN
    selBar.TextColor3 = WHITE
    selBar.Font = Enum.Font.Gotham
    selBar.TextSize = 13
    selBar.Text = ""
    newUICorner(selBar, 8)
    selBar.TextXAlignment = Enum.TextXAlignment.Center
    selBar.TextYAlignment = Enum.TextYAlignment.Center

    -- Dropdown ids
    local idBtn = Instance.new("TextButton", content)
    idBtn.Size = UDim2.new(0, 66, 0, 28)
    idBtn.Position = UDim2.new(0, 210, 0, y+2)
    idBtn.BackgroundColor3 = BTN
    idBtn.Text = "IDs"
    idBtn.Font = Enum.Font.GothamBold
    idBtn.TextColor3 = WHITE
    idBtn.TextSize = 13
    newUICorner(idBtn, 8)

    local idDropdown = nil
    idBtn.MouseButton1Click:Connect(function()
        if idDropdown and idDropdown.Parent then idDropdown:Destroy() end
        idDropdown = Instance.new("ScrollingFrame", content)
        idDropdown.Size = UDim2.new(0, 88, 0, math.min(7,#idList)*28)
        idDropdown.Position = UDim2.new(0, 210, 0, y+32)
        idDropdown.BackgroundColor3 = Color3.fromRGB(22,22,22)
        idDropdown.ZIndex = 100
        idDropdown.ScrollBarThickness = 5
        idDropdown.CanvasSize = UDim2.new(0,0,0,#idList*28)
        idDropdown.AutomaticCanvasSize = Enum.AutomaticSize.None
        newUICorner(idDropdown, 8)
        for i,id in ipairs(idList) do
            local optBtn = Instance.new("TextButton", idDropdown)
            optBtn.Size = UDim2.new(1, -8, 0, 24)
            optBtn.Position = UDim2.new(0,4,0,(i-1)*28+2)
            optBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
            optBtn.TextColor3 = WHITE
            optBtn.Text = id
            optBtn.Font = Enum.Font.Gotham
            optBtn.TextSize = 13
            optBtn.ZIndex = 100
            newUICorner(optBtn, 6)
            optBtn.MouseButton1Click:Connect(function()
                selectedId = id
                selBar.Text = id
                idDropdown:Destroy()
            end)
        end
    end)

    -- Botão aplicar
    local applyBtn = Instance.new("TextButton", content)
    applyBtn.Size = UDim2.new(0, 68, 0, 28)
    applyBtn.Position = UDim2.new(0, 290, 0, y+2)
    applyBtn.BackgroundColor3 = PURPLE
    applyBtn.Text = "Aplicar"
    applyBtn.Font = Enum.Font.GothamBold
    applyBtn.TextColor3 = WHITE
    applyBtn.TextSize = 13
    newUICorner(applyBtn, 8)
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

    -- Botão remover
    local removeBtn = Instance.new("TextButton", content)
    removeBtn.Size = UDim2.new(0, 68, 0, 28)
    removeBtn.Position = UDim2.new(0, 365, 0, y+2)
    removeBtn.BackgroundColor3 = BTN
    removeBtn.Text = "Remover"
    removeBtn.Font = Enum.Font.GothamBold
    removeBtn.TextColor3 = WHITE
    removeBtn.TextSize = 13
    newUICorner(removeBtn, 8)
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

-- Inicializa layout dos itens (um embaixo do outro)
clear(content)
createRow(16,"Cabeça",CABECA)
createRow(62,"Mão",MAO)
createRow(108,"Sapato",SAPATOS)

-- Minimizar
local miniFrame
minBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    if not miniFrame then
        miniFrame = Instance.new("Frame", gui)
        miniFrame.Size = UDim2.new(0, 260, 0, 40)
        miniFrame.Position = UDim2.new(0.02,0,0.73,0)
        miniFrame.BackgroundColor3 = AMOLED
        miniFrame.ZIndex = 100
        miniFrame.Draggable = true
        newUICorner(miniFrame, 13)
        local miniTitle = Instance.new("TextLabel", miniFrame)
        miniTitle.Size = UDim2.new(1,-68,1,0)
        miniTitle.Position = UDim2.new(0,12,0,0)
        miniTitle.BackgroundTransparency = 1
        miniTitle.Text = "thurx&samy | brookhaven rp 🏡"
        miniTitle.TextColor3 = WHITE
        miniTitle.Font = Enum.Font.GothamBold
        miniTitle.TextSize = 16
        miniTitle.TextXAlignment = Enum.TextXAlignment.Left
        local minRestore = Instance.new("TextButton", miniFrame)
        minRestore.Size = UDim2.new(0,34,0,26)
        minRestore.Position = UDim2.new(1,-62,0,7)
        minRestore.BackgroundColor3 = BTN
        minRestore.TextColor3 = WHITE
        minRestore.Text = "-"
        minRestore.Font = Enum.Font.GothamBold
        minRestore.TextSize = 17
        newUICorner(minRestore,7)
        minRestore.MouseButton1Click:Connect(function()
            menu.Visible = true
            miniFrame.Visible = false
        end)
        local minClose = Instance.new("TextButton", miniFrame)
        minClose.Size = UDim2.new(0,34,0,26)
        minClose.Position = UDim2.new(1,-30,0,7)
        minClose.BackgroundColor3 = BTN
        minClose.TextColor3 = WHITE
        minClose.Text = "X"
        minClose.Font = Enum.Font.GothamBold
        minClose.TextSize = 17
        newUICorner(minClose,7)
        minClose.MouseButton1Click:Connect(function()
            miniFrame.Visible = false
            floatBtn.Visible = true
        end)
    end
    miniFrame.Visible = true
end)

-- Fechar/abrir menu
local floatBtn = Instance.new("TextButton", gui)
floatBtn.Size = UDim2.new(0,48,0,48)
floatBtn.Position = UDim2.new(0.03,0,0.62,0)
floatBtn.BackgroundColor3 = AMOLED
floatBtn.TextColor3 = PURPLE
floatBtn.Text = "東"
floatBtn.Font = Enum.Font.GothamBlack
floatBtn.TextSize = 25
floatBtn.Visible = false
newUICorner(floatBtn, 12)
floatBtn.Draggable = true

closeBtn.MouseButton1Click:Connect(function()
    menu.Visible = false
    floatBtn.Visible = true
end)
floatBtn.MouseButton1Click:Connect(function()
    menu.Visible = true
    floatBtn.Visible = false
end)
