local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Mostrar nome acima do personagem
function mostrarNomeFlutuante()
	local billboard = Instance.new("BillboardGui", player.Character:WaitForChild("Head"))
	billboard.Name = "NomeThurx"
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true

	local texto = Instance.new("TextLabel", billboard)
	texto.Size = UDim2.new(1, 0, 1, 0)
	texto.BackgroundTransparency = 1
	texto.Text = "THURX HUB V1 BROOKHAVEN RP 🏡"
	texto.TextColor3 = Color3.new(1, 0, 0)
	texto.TextStrokeTransparency = 0
	texto.Font = Enum.Font.GothamBold
	texto.TextScaled = true
end

-- Invisibilidade real
function deixarInvisivel()
	local char = player.Character
	for _, parte in pairs(char:GetDescendants()) do
		if parte:IsA("BasePart") and parte.Name ~= "HumanoidRootPart" then
			partep = parte:FindFirstChildOfClass("Decal")
			if partep then partep:Destroy() end
			partep = parte:FindFirstChildOfClass("Texture")
			if partep then partep:Destroy() end
			partep = parte:FindFirstChildOfClass("SpecialMesh")
			if partep then partep:Destroy() end
			partep = parte:FindFirstChildOfClass("MeshPart")
			if partep then partep:Destroy() end
			partep = parte:FindFirstChildOfClass("ShirtGraphic")
			if partep then partep:Destroy() end
			partep = parte:FindFirstChildOfClass("Shirt")
			if partep then partep:Destroy() end
			partep = parte:FindFirstChildOfClass("Pants")
			if partep then partep:Destroy() end
			partep = parte:FindFirstChildOfClass("Accessory")
			if partep then partep:Destroy() end
			partep = parte:FindFirstChildOfClass("Hat")
			if partep then partep:Destroy() end
			parte.Transparency = 1
		end
	end
end

-- Botão flutuante “T” para abrir menu
function criarBotaoFlutuante(callback)
	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.Name = "ThurxFlutuante"
	gui.ResetOnSpawn = false

	local botao = Instance.new("TextButton", gui)
	botao.Size = UDim2.new(0, 50, 0, 50)
	botao.Position = UDim2.new(0, 10, 1, -60)
	botao.Text = "T"
	botao.Font = Enum.Font.GothamBlack
	botao.TextScaled = true
	botao.BackgroundColor3 = Color3.new(0, 0, 0)
	botao.TextColor3 = Color3.new(1, 0, 0)

	botao.MouseButton1Click:Connect(function()
		gui:Destroy()
		callback()
	end)
end

-- Tela de agradecimento
function mostrarTelaAgradecimento(callback)
	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.Name = "ThurxAgradecimento"
	gui.ResetOnSpawn = false

	local fundo = Instance.new("Frame", gui)
	fundo.Size = UDim2.new(1, 0, 1, 0)
	fundo.BackgroundColor3 = Color3.new(0, 0, 0)

	local texto = Instance.new("TextLabel", fundo)
	texto.Size = UDim2.new(1, 0, 0.6, 0)
	texto.Position = UDim2.new(0, 0, 0.3, 0)
	texto.Text = "OBRIGADO POR USAR\nTHURX HUB\n\nScript Inspirado no rael hub"
	texto.TextColor3 = Color3.new(1, 1, 1)
	texto.Font = Enum.Font.GothamBlack
	texto.TextScaled = true
	texto.BackgroundTransparency = 1

	local barra = Instance.new("Frame", fundo)
	barra.Size = UDim2.new(0.6, 0, 0.03, 0)
	barra.Position = UDim2.new(0.2, 0, 0.85, 0)
	barra.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

	local progresso = Instance.new("Frame", barra)
	progresso.Size = UDim2.new(0, 0, 1, 0)
	progresso.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

	local tween = TweenService:Create(progresso, TweenInfo.new(10), {Size = UDim2.new(1, 0, 1, 0)})
	tween:Play()

	tween.Completed:Connect(function()
		gui:Destroy()
		mostrarNomeFlutuante()
		callback()
	end)
end

-- Menu Principal com botão de fechar
function abrirMenuThurxHub()
	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.Name = "ThurxHubMenu"
	gui.ResetOnSpawn = false

	local fundo = Instance.new("Frame", gui)
	fundo.Size = UDim2.new(0.6, 0, 0.6, 0)
	fundo.Position = UDim2.new(0.2, 0, 0.2, 0)
	fundo.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

	local titulo = Instance.new("TextLabel", fundo)
	titulo.Size = UDim2.new(1, 0, 0.1, 0)
	titulo.Text = "THURX HUB V1 BROOKHAVEN RP 🏡"
	titulo.TextColor3 = Color3.new(1, 1, 1)
	titulo.Font = Enum.Font.GothamBold
	titulo.TextScaled = true
	titulo.BackgroundTransparency = 1

	local menu = Instance.new("Frame", fundo)
	menu.Size = UDim2.new(0.3, 0, 0.9, 0)
	menu.Position = UDim2.new(0, 0, 0.1, 0)
	menu.BackgroundColor3 = Color3.fromRGB(40, 0, 0)

	local conteudo = Instance.new("Frame", fundo)
	conteudo.Size = UDim2.new(0.7, 0, 0.9, 0)
	conteudo.Position = UDim2.new(0.3, 0, 0.1, 0)
	conteudo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

	local function mostrarConteudo(func)
		for _, v in pairs(conteudo:GetChildren()) do
			if not v:IsA("UIListLayout") then v:Destroy() end
		end
		func()
	end

	local invisBtn = Instance.new("TextButton", menu)
	invisBtn.Size = UDim2.new(1, -10, 0, 40)
	invisBtn.Position = UDim2.new(0, 5, 0, 5)
	invisBtn.Text = "FICAR INVISÍVEL"
	invisBtn.Font = Enum.Font.Gotham
	invisBtn.TextScaled = true
	invisBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
	invisBtn.TextColor3 = Color3.new(1,1,1)
	invisBtn.MouseButton1Click:Connect(function()
		mostrarConteudo(function()
			local ativar = Instance.new("TextButton", conteudo)
			ativar.Size = UDim2.new(0.6, 0, 0.2, 0)
			ativar.Position = UDim2.new(0.2, 0, 0.3, 0)
			ativar.Text = "ATIVAR INVISIBILIDADE"
			ativar.TextScaled = true
			ativar.Font = Enum.Font.GothamBold
			ativar.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
			ativar.TextColor3 = Color3.new(1, 1, 1)

			ativar.MouseButton1Click:Connect(deixarInvisivel)
		end)
	end)

	local fechar = Instance.new("TextButton", fundo)
	fechar.Size = UDim2.new(0.08, 0, 0.08, 0)
	fechar.Position = UDim2.new(0.92, -5, 0, 5)
	fechar.Text = "X"
	fechar.Font = Enum.Font.GothamBlack
	fechar.TextScaled = true
	fechar.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
	fechar.TextColor3 = Color3.new(1, 1, 1)

	fechar.MouseButton1Click:Connect(function()
		gui:Destroy()
		criarBotaoFlutuante(abrirMenuThurxHub)
	end)

	conteudo.Parent = fundo
end

-- INICIAR
mostrarTelaAgradecimento(abrirMenuThurxHub)
