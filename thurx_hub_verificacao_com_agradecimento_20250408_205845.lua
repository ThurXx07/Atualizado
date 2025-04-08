-- ThurX Hub - Script Principal
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Verificação por Key
local keyValida1 = "Thurx"
local keyValida2 = "THURXHUB0007"
local keyGui = Instance.new("ScreenGui", PlayerGui)
keyGui.Name = "ThurxKeyGui"
keyGui.ResetOnSpawn = false

local blackFrame = Instance.new("Frame", keyGui)
blackFrame.Size = UDim2.new(1, 0, 1, 0)
blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)

local aviso = Instance.new("TextLabel", blackFrame)
aviso.Size = UDim2.new(1, 0, 0.2, 0)
aviso.Position = UDim2.new(0, 0, 0.3, 0)
aviso.Text = "OBRIGADO POR USAR\nTHURX HUB\nScript inspirado no Rael Hub 🏡"
aviso.TextScaled = true
aviso.TextColor3 = Color3.new(1, 1, 1)
aviso.BackgroundTransparency = 1
aviso.Font = Enum.Font.SourceSansBold

local barra = Instance.new("Frame", blackFrame)
barra.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
barra.Position = UDim2.new(0.2, 0, 0.6, 0)
barra.Size = UDim2.new(0, 0, 0.05, 0)

-- Animação da barra
local TweenService = game:GetService("TweenService")
local barraTween = TweenService:Create(barra, TweenInfo.new(2), {Size = UDim2.new(0.6, 0, 0.05, 0)})
barraTween:Play()
barraTween.Completed:Wait()

-- Input de Key
aviso.Text = "Digite a KEY para continuar"

local input = Instance.new("TextBox", blackFrame)
input.Size = UDim2.new(0.6, 0, 0.08, 0)
input.Position = UDim2.new(0.2, 0, 0.7, 0)
input.PlaceholderText = "Digite sua key aqui..."
input.Font = Enum.Font.SourceSans
input.TextScaled = true
input.Text = ""

local confirmar = Instance.new("TextButton", blackFrame)
confirmar.Text = "LIBERAR ACESSO"
confirmar.Size = UDim2.new(0.6, 0, 0.08, 0)
confirmar.Position = UDim2.new(0.2, 0, 0.8, 0)
confirmar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
confirmar.Font = Enum.Font.SourceSansBold
confirmar.TextScaled = true

confirmar.MouseButton1Click:Connect(function()
    if input.Text == keyValida1 or input.Text == keyValida2 then
        keyGui:Destroy()
        -- Abre o menu principal
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThurXx07/Atualizado/main/thurx_hub_menu_completo.lua"))()
    else
        aviso.Text = "KEY INVÁLIDA - TENTE NOVAMENTE"
    end
end)
