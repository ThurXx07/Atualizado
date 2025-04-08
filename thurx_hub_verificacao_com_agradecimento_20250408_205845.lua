-- ThurXHub BROOKHAVEN RP 🏡 - V1 Final
-- Desenvolvido para Delta Executor
-- Créditos: @thurx_mimiu

-- Variáveis locais
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false
gui.Name = "ThurXHub"

-- Tela de carregamento
local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
loadingFrame.ZIndex = 10

local title = Instance.new("TextLabel", loadingFrame)
title.Text = "BROOKHAVEN RP 🏡"
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.TextScaled = true

local info = Instance.new("TextLabel", loadingFrame)
info.Text = "AGUARDE OS 10 SEG"
info.Size = UDim2.new(1, 0, 0.05, 0)
info.Position = UDim2.new(0, 0, 0.25, 0)
info.TextColor3 = Color3.new(1, 1, 1)
info.BackgroundTransparency = 1
info.TextScaled = true

local bar = Instance.new("Frame", loadingFrame)
bar.Size = UDim2.new(0, 0, 0.02, 0)
bar.Position = UDim2.new(0.1, 0, 0.32, 0)
bar.BackgroundColor3 = Color3.fromRGB(100, 0, 255)
bar.BorderSizePixel = 0

local statusText = Instance.new("TextLabel", loadingFrame)
statusText.Size = UDim2.new(1, 0, 0.05, 0)
statusText.Position = UDim2.new(0, 0, 0.36, 0)
statusText.BackgroundTransparency = 1
statusText.TextColor3 = Color3.new(1, 1, 1)
statusText.TextScaled = true

local statusUpdates = {"carregando mundo...", "criando os mapa...", "criando códigos...", "criando skin..."}

-- Atualização da barra
spawn(function()
	for i = 1, 10 do
		bar.Size = UDim2.new(i / 10 * 0.8, 0, 0.02, 0)
		statusText.Text = statusUpdates[(i - 1) % #statusUpdates + 1]
		wait(1)
	end
	loadingFrame:Destroy()
	createThurXHub()
end)

-- Função principal do menu
function createThurXHub()
	local menu = Instance.new("Frame", gui)
	menu.Position = UDim2.new(0.2, 0, 0.2, 0)
	menu.Size = UDim2.new(0.6, 0, 0.6, 0)
	menu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	menu.BorderSizePixel = 0
	menu.Active = true
	menu.Draggable = true

	local header = Instance.new("TextLabel", menu)
	header.Size = UDim2.new(1, 0, 0.1, 0)
	header.BackgroundTransparency = 1
	header.Text = "ThurXHub BROOKHAVEN RP"
	header.TextColor3 = Color3.fromRGB(255, 255, 255)
	header.TextScaled = true

	local line = Instance.new("Frame", menu)
	line.Size = UDim2.new(0.01, 0, 0.9, 0)
	line.Position = UDim2.new(0.25, 0, 0.1, 0)
	line.BackgroundColor3 = Color3.new(1, 1, 1)

	local sidebar = Instance.new("Frame", menu)
	sidebar.Size = UDim2.new(0.25, 0, 0.9, 0)
	sidebar.Position = UDim2.new(0, 0, 0.1, 0)
	sidebar.BackgroundColor3 = Color3.new(0, 0, 0)

	local content = Instance.new("Frame", menu)
	content.Size = UDim2.new(0.75, 0, 0.9, 0)
	content.Position = UDim2.new(0.25, 0, 0.1, 0)
	content.BackgroundTransparency = 1

	local function clearContent()
		for _, v in pairs(content:GetChildren()) do
			if not v:IsA("UIListLayout") then
				v:Destroy()
			end
		end
	end

	-- Botão Invisível
	local invisible = false
	local btnInvisible = Instance.new("TextButton", sidebar)
	btnInvisible.Size = UDim2.new(1, 0, 0, 40)
	btnInvisible.Position = UDim2.new(0, 0, 0, 0)
	btnInvisible.BackgroundColor3 = Color3.new(0, 0, 0)
	btnInvisible.TextColor3 = Color3.new(1, 1, 1)
	btnInvisible.Text = "Ficar Invisível"

	btnInvisible.MouseButton1Click:Connect(function()
		invisible = not invisible
		if invisible then
			btnInvisible.Text = "Desativar Invisibilidade"
			for _, v in pairs(player.Character:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("Decal") then
					v.Transparency = 1
				end
			end
		else
			btnInvisible.Text = "Ficar Invisível"
			for _, v in pairs(player.Character:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("Decal") then
					v.Transparency = 0
				end
			end
		end
	end)

	-- Adicionar Nome e Bio estilo Brookhaven
	pcall(function()
		local char = player.Character
		local humanoid = char:FindFirstChildOfClass("Humanoid")
		humanoid.DisplayName = "USUARIO USANDO THURX HUB V1"
		local textBox = char:FindFirstChild("Head"):FindFirstChild("OriginalSize")
		if humanoid:FindFirstChild("Description") then
			humanoid:FindFirstChild("Description").Bio = "BROOKHAVEN RP 🏡 SCRIPTER"
		end
	end)

	-- Botão flutuante
	local floatingBtn = Instance.new("TextButton", gui)
	floatingBtn.Size = UDim2.new(0, 40, 0, 40)
	floatingBtn.Position = UDim2.new(0, 10, 1, -50)
	floatingBtn.BackgroundColor3 = Color3.new(0, 0, 0)
	floatingBtn.TextColor3 = Color3.new(1, 1, 1)
	floatingBtn.Text = "T"
	floatingBtn.Draggable = true
	floatingBtn.Active = true

	floatingBtn.MouseButton1Click:Connect(function()
		menu.Visible = not menu.Visible
	end)
end
