-- ThurXHub - Key System + Tela de Agradecimento + Menu + Texto acima do personagem
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Função: Mostrar texto acima do personagem
local function mostrarTextoSobrePersonagem()
	local character = player.Character or player.CharacterAdded:Wait()
	local head = character:WaitForChild("Head")

	local function criarBillboard(texto, cor, offsetY, font)
		local billboard = Instance.new("BillboardGui", head)
		billboard.Size = UDim2.new(0, 200, 0, 50)
		billboard.StudsOffset = Vector3.new(0, offsetY, 0)
		billboard.AlwaysOnTop = true

		local label = Instance.new("TextLabel", billboard)
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.TextColor3 = cor
		label.TextScaled = true
		label.Font = font
		label.Text = texto
	end

	criarBillboard("بەکارهێنەری سکریپتی thurx", Color3.fromRGB(255, 0, 0), 2.5, Enum.Font.GothamBold)
	criarBillboard("scripter hub", Color3.fromRGB(0, 255, 0), 3.2, Enum.Font.Gotham)
end

-- Função: Abrir menu flutuante ThurxHub
local function abrirMenuThurxHub()
	local gui = Instance.new("ScreenGui")
	gui.Name = "ThurxHubMenu"
	gui.ResetOnSpawn = false
	gui.Parent = PlayerGui

	local fundo = Instance.new("Frame")
	fundo.Size = UDim2.new(0.6, 0, 0.6, 0)
	fundo.Position = UDim2.new(0.2, 0, 0.2, 0)
	fundo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	fundo.Parent = gui

	local titulo = Instance.new("TextLabel", fundo)
	titulo.Size = UDim2.new(1, 0, 0.1, 0)
	titulo.Text = "THURX HUB V1 BROOKHAVEN RP 🏡"
	titulo.TextColor3 = Color3.new(1, 1, 1)
	titulo.Font = Enum.Font.GothamBold
	titulo.TextScaled = true
	titulo.BackgroundTransparency = 1

	local botaoInvisivel = Instance.new("TextButton", fundo)
	botaoInvisivel.Size = UDim2.new(0.4, 0, 0.15, 0)
	botaoInvisivel.Position = UDim2.new(0.05, 0, 0.15, 0)
	botaoInvisivel.Text = "FICAR INVISÍVEL"
	botaoInvisivel.TextColor3 = Color3.new(1, 1, 1)
	botaoInvisivel.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
	botaoInvisivel.Font = Enum.Font.Gotham
	botaoInvisivel.TextScaled = true

	botaoInvisivel.MouseButton1Click:Connect(function()
		local desc = Instance.new("HumanoidDescription")
		player.Character:FindFirstChildOfClass("Humanoid"):ApplyDescription(desc)
	end)

	local botaoFechar = Instance.new("TextButton", fundo)
	botaoFechar.Size = UDim2.new(0.1, 0, 0.1, 0)
	botaoFechar.Position = UDim2.new(0.9, -35, 0, 5)
	botaoFechar.Text = "X"
	botaoFechar.TextColor3 = Color3.new(1, 0, 0)
	botaoFechar.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
	botaoFechar.Font = Enum.Font.GothamBlack
	botaoFechar.TextScaled = true

	botaoFechar.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)

	mostrarTextoSobrePersonagem()
end

-- Função: Tela de agradecimento com barra de carregamento
local function mostrarTelaAgradecimento(callback)
	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.Name = "ThurxAgradecimento"
	gui.ResetOnSpawn = false

	local fundo = Instance.new("Frame", gui)
	fundo.Size = UDim2.new(1, 0, 1, 0)
	fundo.BackgroundColor3 = Color3.new(0, 0, 0)

	local aviso = Instance.new("TextLabel", fundo)
	aviso.Size = UDim2.new(1, 0, 0.1, 0)
	aviso.Position = UDim2.new(0, 0, 0.1, 0)
	aviso.Text = "AGUARDE O SCRIPT SER INICIALIZADO... ISSO PODE LEVAR ATÉ 10 SEGUNDOS!"
	aviso.TextColor3 = Color3.new(1, 1, 0)
	aviso.Font = Enum.Font.GothamBold
	aviso.TextScaled = true
	aviso.BackgroundTransparency = 1

	local texto = Instance.new("TextLabel", fundo)
	texto.Size = UDim2.new(1, 0, 0.5, 0)
	texto.Position = UDim2.new(0, 0, 0.3, 0)
	texto.Text = "OBRIGADO POR USAR\nTHURX HUB\n\nScript Inspirado no Rael Hub 🏡"
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

	local tween = TweenService:Create(barra, TweenInfo.new(10, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
	tween:Play()

	tween.Completed:Connect(function()
		gui:Destroy()
		callback()
	end)
end

-- Sistema de Key básica
local keyDigitada = "Thurx" -- pode substituir isso por uma tela de input mais tarde
if keyDigitada == "Thurx" or keyDigitada == "THURXHUB0007" then
	mostrarTelaAgradecimento(abrirMenuThurxHub)
else
	warn("Key incorreta. Acesso negado.")
end
