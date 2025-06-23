-- ThurX & Samy Hub: Skin/Avatar Menu Script (Delta Executor/Mobile Ready) -- Interface AMOLED, arrastável no menu principal, com assinatura e carregamento personalizado

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
local WARNING = Color3.fromRGB(255,120,50)
local BARBLACK = Color3.fromRGB(10,10,10)

-- IDs DE ITENS (exemplo, substitua pelos IDs reais)
local CHAPEUS = {"12345678", "23456789", "34567890"}
local MASCARAS = {"45678901", "56789012"}
local CAMISAS = {"67890123", "78901234"}
local GARRAS = {"89012345"}
local SAPATOS = {"90123456"}
local MAO = {"12340123"}
local FLORES = {"21098765"}

-- UTILS
local function newUICorner(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 10)
    c.Parent = obj
end

local function clear(tab)
    for _, v in ipairs(tab:GetChildren()) do
        if v:IsA("GuiObject") then v:Destroy() end
    end
end

-- GUI RAIZ
local gui = Instance.new("ScreenGui")
gui.Name = "ThurXSamySkinHub"
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false

-- TELA DE CARREGAMENTO
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 320, 0, 160)
loadingFrame.Position = UDim2.new(0.5, -160, 0.5, -80)
loadingFrame.BackgroundColor3 = AMOLED
loadingFrame.ZIndex = 999
loadingFrame.Parent = gui
newUICorner(loadingFrame, 14)

local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 50)
hubTitle.Position = UDim2.new(0, 0, 0, 8)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "samy&thur hub"
hubTitle.Font = Enum.Font.FredokaOne
hubTitle.TextSize = 28
hubTitle.TextColor3 = WHITE
hubTitle.ZIndex = 1000
hubTitle.Parent = loadingFrame

local roach = Instance.new("TextLabel")
roach.Size = UDim2.new(1, 0, 0, 30)
roach.Position = UDim2.new(0, 0, 0, 56)
roach.BackgroundTransparency = 1
roach.Text = "🪳"
roach.Font = Enum.Font.FredokaOne
roach.TextSize = 28
roach.TextColor3 = WHITE
roach.ZIndex = 1000
roach.Parent = loadingFrame

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, -20, 0, 26)
loadingText.Position = UDim2.new(0, 10, 0, 100)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Carregando roupas, itens 3D..."
loadingText.Font = Enum.Font.FredokaOne
loadingText.TextSize = 16
loadingText.TextColor3 = WHITE
loadingText.TextXAlignment = Enum.TextXAlignment.Center
loadingText.ZIndex = 1000
loadingText.Parent = loadingFrame

-- Simulação de carregamento (pode ser ajustada para funções reais)
local statusList = {
    "Carregando roupas...",
    "Carregando itens 3D...",
    "Ajustando scripts...",
    "Finalizando..."
}

local function startLoading()
    spawn(function()
        for _, txt in ipairs(statusList) do
            loadingText.Text = txt
            wait(0.8)
        end
        loadingFrame:Destroy()
        menu.Visible = true
    end)
end

-- Criando o menu principal (oculto inicialmente)
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 400, 0, 500)
menu.Position = UDim2.new(0.5, -200, 0.5, -250)
menu.BackgroundColor3 = AMOLED
menu.ZIndex = 100
menu.Visible = false
menu.Parent = gui
newUICorner(menu, 16)

-- Função para permitir arrastar o menu
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                             startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

menu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = menu.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

menu.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Botão fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -38, 0, 8)
closeBtn.BackgroundColor3 = WARNING
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.FredokaOne
closeBtn.TextSize = 18
closeBtn.TextColor3 = WHITE
closeBtn.ZIndex = 101
closeBtn.Parent = menu
newUICorner(closeBtn, 6)

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Botão minimizar
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 32, 0, 32)
minBtn.Position = UDim2.new(1, -78, 0, 8)
minBtn.BackgroundColor3 = BARBLACK
minBtn.Text = "-"
minBtn.Font = Enum.Font.FredokaOne
minBtn.TextSize = 24
minBtn.TextColor3 = WHITE
minBtn.ZIndex = 101
minBtn.Parent = menu
newUICorner(minBtn, 6)

local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, child in pairs(menu:GetChildren()) do
        if child ~= minBtn and child ~= closeBtn and child ~= assinatura then
            child.Visible = not minimized
        end
    end
    menu.Size = minimized and UDim2.new(0, 120, 0, 50) or UDim2.new(0, 400, 0, 500)
end)

-- Assinatura no canto inferior esquerdo do menu
local assinatura = Instance.new("TextLabel")
assinatura.Size = UDim2.new(0, 160, 0, 24)
assinatura.Position = UDim2.new(0, 10, 1, -30)
assinatura.BackgroundTransparency = 1
assinatura.Text = "✦ 𝓈𝒶𝓂𝓎&𝓉𝒽𝓊𝓇 ✦"
assinatura.Font = Enum.Font.FredokaOne
assinatura.TextSize = 16
assinatura.TextColor3 = WHITE
assinatura.ZIndex = 60
assinatura.Parent = menu

-- Aqui você pode continuar adicionando botões, abas e funcionalidades do seu menu

-- Inicia a simulação do carregamento e depois abre o menu
startLoading()
