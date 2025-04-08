-- ThurXHub BROOKHAVEN RP 🏡 - V1 Final
-- Desenvolvido para Delta Executor
-- Créditos: @thurx_mimiu

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remover GUI anterior, se existir
local oldGui = playerGui:FindFirstChild("ThurXHub")
if oldGui then
    oldGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "ThurXHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Tela de carregamento
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
loadingFrame.ZIndex = 10
loadingFrame.Parent = gui

local title = Instance.new("TextLabel")
title.Text = "BROOKHAVEN RP 🏡"
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.TextScaled = true
title.ZIndex = 11
title.Parent = loadingFrame

local info = Instance.new("TextLabel")
info.Text = "AGUARDE 10 SEGUNDOS"
info.Size = UDim2.new(1, 0, 0.05, 0)
info.Position = UDim2.new(0, 0, 0.25, 0)
info.TextColor3 = Color3.new(1, 1, 1)
info.BackgroundTransparency = 1
info.TextScaled = true
info.ZIndex = 11
info.Parent = loadingFrame

local barBackground = Instance.new("Frame")
barBackground.Size = UDim2.new(0.8, 0, 0.02, 0)
barBackground.Position = UDim2.new(0.1, 0, 0.32, 0)
barBackground.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
barBackground.BorderSizePixel = 0
barBackground.ZIndex = 11
barBackground.Parent = loadingFrame

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(100, 0, 255)
bar.BorderSizePixel = 0
bar.ZIndex = 12
bar.Parent = barBackground

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 0.05, 0)
statusText.Position = UDim2.new(0, 0, 0.36, 0)
statusText.BackgroundTransparency = 1
statusText.TextColor3 = Color3.new(1, 1, 1)
statusText.TextScaled = true
statusText.ZIndex = 11
statusText.Parent = loadingFrame

local statusUpdates = {"Carregando mundo...", "Criando o mapa...", "Gerando códigos...", "Configurando skins..."}

-- Atualização da barra de progresso
spawn(function()
    for i = 1, 10 do
        bar:TweenSize(UDim2.new(i / 10, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, true)
        statusText.Text = statusUpdates[(i - 1) % #statusUpdates + 1]
        wait(1)
    end
    loadingFrame:Destroy()
    createThurXHub()
end)

-- Função principal do menu
function createThurXHub()
    local menu = Instance.new("Frame")
    menu.Position = UDim2.new(0.2, 0, 0.2, 0)
    menu.Size = UDim2.new(0.6, 0, 0.6, 0)
    menu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    menu.BorderSizePixel = 0
    menu.Active = true
    menu.Draggable = true
    menu.Parent = gui

    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0.1, 0)
    header.BackgroundTransparency = 1
    header.Text = "ThurXHub BROOKHAVEN RP"
    header.TextColor3 = Color3.fromRGB(255, 255, 255)
    header.TextScaled = true
    header.Parent = menu

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 40, 0, 40)
    closeButton.Position = UDim2.new(1, -45, 0, 5)
    closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
    closeButton.TextColor3 = Color3.new(1, 1, 1)
    closeButton.Text = "X"
    closeButton.Parent = menu

    closeButton.MouseButton1Click:Connect(function()
        menu.Visible = false
    end)

    local line = Instance.new("Frame")
    line.Size = UDim2.new(0.01, 0, 0.9, 0)
    line.Position = UDim2.new(0.25, 0, 0.1, 0)
    line.BackgroundColor3 = Color3.new(1, 1, 1)
    line.Parent = menu

    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0.25, 0, 0.9, 0)
    sidebar.Position28
