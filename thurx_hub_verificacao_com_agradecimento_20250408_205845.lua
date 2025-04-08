-- ThurXHub - Key System + Tela de Agradecimento + Menu Completo (sem TROLL/GAMEPASS)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Tela de Key
local keyGui = Instance.new("ScreenGui", PlayerGui)
keyGui.Name = "ThurXKeySystem"
keyGui.ResetOnSpawn = false

local fundo = Instance.new("Frame", keyGui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.BackgroundColor3 = Color3.fromRGB(10, 10, 10)

local pergunta = Instance.new("TextLabel", fundo)
pergunta.Size = UDim2.new(0.9, 0, 0.1, 0)
pergunta.Position = UDim2.new(0.05, 0, 0.1, 0)
pergunta.Text = "QUANTOS INSCRITOS TEM O CANAL @thurx?"
pergunta.TextColor3 = Color3.new(1, 1, 1)
pergunta.Font = Enum.Font.GothamBold
pergunta.TextScaled = true
pergunta.BackgroundTransparency = 1

local linkBtn = Instance.new("TextButton", fundo)
linkBtn.Size = UDim2.new(0.6, 0, 0.07, 0)
linkBtn.Position = UDim2.new(0.2, 0, 0.22, 0)
linkBtn.Text = "VER CANAL (COPIAR LINK)"
linkBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 150)
linkBtn.TextColor3 = Color3.new(1,1,1)
linkBtn.Font = Enum.Font.GothamBold
linkBtn.TextScaled = true

linkBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@thurx007?feature=shared")
end)

local input = Instance.new("TextBox", fundo)
input.Size = UDim2.new(0.6, 0, 0.07, 0)
input.Position = UDim2.new(0.2, 0, 0.32, 0)
input.PlaceholderText = "Digite a resposta aqui"
input.Text = ""
input.TextScaled = true
input.Font = Enum.Font.Gotham
input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
input.TextColor3 = Color3.new(1, 1, 1)

local liberar = Instance.new("TextButton", fundo)
liberar.Size = UDim2.new(0.5, 0, 0.07, 0)
liberar.Position = UDim2.new(0.25, 0, 0.42, 0)
liberar.Text = "LIBERAR ACESSO"
liberar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
liberar.TextColor3 = Color3.new(1,1,1)
liberar.Font = Enum.Font.GothamBold
liberar.TextScaled = true

liberar.MouseButton1Click:Connect(function()
    local key = input.Text
    if key == "Thurx" or key == "THURXHUB0007" then
        keyGui:Destroy()
        mostrarTelaAgradecimento(abrirMenuThurxHub)
    else
        liberar.Text = "KEY INCORRETA!"
        wait(1.5)
        liberar.Text = "LIBERAR ACESSO"
    end
end)

-- Tela de Agradecimento
function mostrarTelaAgradecimento(callback)
    local gui = Instance.new("ScreenGui", PlayerGui)
    gui.Name = "ThurxAgradecimento"
    gui.ResetOnSpawn = false

    local fundo = Instance.new("Frame", gui)
    fundo.Size = UDim2.new(1, 0, 1, 0)
    fundo.BackgroundColor3 = Color3.new(0, 0, 0)

    local aviso = Instance.new("TextLabel", fundo)
    aviso.Size = UDim2.new(1, 0, 0.1, 0)
    aviso.Position = UDim2.new(0, 0, 0.1, 0)
    aviso.Text = "AGUARDE O SCRIPT SER INICIALIZADO..."
    aviso.TextColor3 = Color3.new(1,1,0)
    aviso.Font = Enum.Font.GothamBold
    aviso.TextScaled = true
    aviso.BackgroundTransparency = 1

    local texto = Instance.new("TextLabel", fundo)
    texto.Size = UDim2.new(1, 0, 0.5, 0)
    texto.Position = UDim2.new(0, 0, 0.3, 0)
    texto.Text = "OBRIGADO POR USAR\nTHURX HUB\n\nScript Inspirado no Rael Hub"
    texto.TextColor3 = Color3.new(1, 1, 1)
    texto.Font = Enum.Font.GothamBlack
    texto.TextScaled = true
    texto.BackgroundTransparency = 1

    local barraFundo = Instance.new("Frame", fundo)
    barraFundo.Size = UDim2.new(0.6, 0, 0.03, 0)
    barraFundo.Position = UDim2.new(0.2, 0, 0.85, 0)
    barraFundo.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

    local barra = Instance.new("Frame", barraFundo)
    barra.Size = UDim2.new(0, 0, 1, 0)
    barra.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

    local tween = TweenService:Create(barra, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    tween.Completed:Connect(function()
        gui:Destroy()
        callback()
    end)
end

-- Menu Principal
function abrirMenuThurxHub()
    local gui = Instance.new("ScreenGui", PlayerGui)
    gui.Name = "ThurxHubMenu"
    gui.ResetOnSpawn = false

    local fundo = Instance.new("Frame")
    fundo.Name = "FundoMenu"
    fundo.Size = UDim2.new(0.6, 0, 0.6, 0)
    fundo.Position = UDim2.new(0.2, 0, 0.2, 0)
    fundo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    fundo.BorderSizePixel = 0
    fundo.Parent = gui

    local titulo = Instance.new("TextLabel", fundo)
    titulo.Size = UDim2.new(1, 0, 0.1, 0)
    titulo.Text = "THURX HUB V1 BROOKHAVEN RP 🏡"
    titulo.TextColor3 = Color3.new(1, 1, 1)
    titulo.Font = Enum.Font.GothamBold
    titulo.TextScaled = true
    titulo.BackgroundTransparency = 1

    -- Botão Invisível
    local botaoInvisivel = Instance.new("TextButton", fundo)
    botaoInvisivel.Size = UDim2.new(0.4, 0, 0.15, 0)
    botaoInvisivel.Position = UDim2.new(0.05, 0, 0.15, 0)
    botaoInvisivel.Text = "FICAR INVISIVEL"
    botaoInvisivel.TextColor3 = Color3.new(1,1,1)
    botaoInvisivel.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    botaoInvisivel.Font = Enum.Font.Gotham
    botaoInvisivel.TextScaled = true

    botaoInvisivel.MouseButton1Click:Connect(function()
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local desc = humanoid:GetAppliedDescription()
            desc.Shirt = ""
            desc.Pants = ""
            desc.Face = ""
            humanoid:ApplyDescription(desc)
        end
    end)

    -- Botão Fechar
    local botaoFechar = Instance.new("TextButton", fundo)
    botaoFechar.Size = UDim2.new(0.1, 0, 0.1, 0)
    botaoFechar.Position = UDim2.new(0.9, -35, 0, 5)
    botaoFechar.Text = "X"
    botaoFechar.TextColor3 = Color3.new(1,0,0)
    botaoFechar.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    botaoFechar.Font = Enum.Font.GothamBlack
    botaoFechar.TextScaled = true

    botaoFechar.MouseButton1Click:Connect(function()
        fundo.Visible = false
        local confirm = Instance.new("Frame", gui)
        confirm.Size = UDim2.new(0.4, 0, 0.2, 0)
        confirm.Position = UDim2.new(0.3, 0, 0.4, 0)
        confirm.BackgroundColor3 = Color3.fromRGB(40, 0, 0)

        local aviso = Instance.new("TextLabel", confirm)
        aviso.Size = UDim2.new(1, 0, 0.6, 0)
        aviso.Text = "TEM CERTEZA QUE DESEJA FECHAR O MENU?"
        aviso.TextColor3 = Color3.new(1,1,1)
        aviso.Font = Enum.Font.Gotham
        aviso.TextScaled = true
        aviso.BackgroundTransparency = 1

        local sim = Instance.new("TextButton", confirm)
        sim.Size = UDim2.new(0.45, 0, 0.3, 0)
        sim.Position = UDim2.new(0.05, 0, 0.65, 0)
        sim.Text = "SIM"
        sim.TextScaled = true
        sim.Font = Enum.Font.GothamBold
        sim.BackgroundColor3 = Color3.fromRGB(120, 0, 0)

        local nao = Instance.new("TextButton", confirm)
        nao.Size = UDim2.new(0.45, 0, 0.3, 0)
        nao.Position = UDim2.new(0.5, 0, 0.65, 0)
        nao.Text = "NÃO"
        nao.TextScaled = true
        nao.Font = Enum.Font.GothamBold
        nao.BackgroundColor3 = Color3.fromRGB(0, 80, 0)

        sim.MouseButton1Click:Connect(function()
            gui:Destroy()
        end)
        nao.MouseButton1Click:Connect(function()
            fundo.Visible = true
            confirm:Destroy()
        end)
    end)
end
