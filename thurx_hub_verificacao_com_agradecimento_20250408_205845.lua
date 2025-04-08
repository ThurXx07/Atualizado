-- ThurXHub - Verificação de Key + Tela de Agradecimento + Abertura do Menu
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Função para abrir o menu principal (exemplo)
function abrirMenuThurxHub()
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "ThurxHubMenu"
    gui.ResetOnSpawn = false

    local fundo = Instance.new("Frame", gui)
    fundo.Size = UDim2.new(1, 0, 1, 0)
    fundo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    fundo.BorderSizePixel = 0

    local texto = Instance.new("TextLabel", fundo)
    texto.Size = UDim2.new(1, 0, 0.1, 0)
    texto.Position = UDim2.new(0, 0, 0, 0)
    texto.Text = "THURX HUB V1 BROOKHAVEN RP 🏡"
    texto.TextColor3 = Color3.fromRGB(255, 255, 255)
    texto.Font = Enum.Font.GothamBold
    texto.TextScaled = true
    texto.BackgroundTransparency = 1
end

-- Função de agradecimento
function mostrarTelaAgradecimento(callback)
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "ThurxAgradecimento"
    gui.ResetOnSpawn = false

    local fundo = Instance.new("Frame", gui)
    fundo.Size = UDim2.new(1, 0, 1, 0)
    fundo.BackgroundColor3 = Color3.new(0, 0, 0)
    fundo.BorderSizePixel = 0

    local texto = Instance.new("TextLabel", fundo)
    texto.Size = UDim2.new(1, 0, 0.5, 0)
    texto.Position = UDim2.new(0, 0, 0.2, 0)
    texto.Text = "OBRIGADO POR USAR\nTHURX HUB\n\nScript Inspirado no rael hub 🏡"
    texto.TextColor3 = Color3.new(1, 1, 1)
    texto.Font = Enum.Font.GothamBlack
    texto.TextSize = 28
    texto.TextScaled = true
    texto.BackgroundTransparency = 1

    local barraFundo = Instance.new("Frame", fundo)
    barraFundo.Size = UDim2.new(0.6, 0, 0.05, 0)
    barraFundo.Position = UDim2.new(0.2, 0, 0.8, 0)
    barraFundo.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    barraFundo.BorderSizePixel = 0

    local barra = Instance.new("Frame", barraFundo)
    barra.Size = UDim2.new(0, 0, 1, 0)
    barra.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    barra.BorderSizePixel = 0

    local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local tween = TweenService:Create(barra, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})

    tween:Play()
    tween.Completed:Connect(function()
        gui:Destroy()
        callback()
    end)
end

-- Simulação de digitar a key
local keyDigitada = "Thurx" -- substitua por input do jogador

if keyDigitada == "Thurx" or keyDigitada == "THURXHUB0007" then
    mostrarTelaAgradecimento(function()
        abrirMenuThurxHub()
    end)
else
    warn("Key incorreta. Acesso negado.")
end
