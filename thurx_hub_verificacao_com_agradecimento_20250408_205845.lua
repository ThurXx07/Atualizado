-- Funções de conteúdo da direita
local function clearContent()
	for _, child in pairs(rightContent:GetChildren()) do
		if not child:IsA("UICorner") then
			child:Destroy()
		end
	end
end

local animations = {
	{"Vampiro", 279949478},
	{"Zumbi", 616006778},
	{"Levitar", 616006556},
	{"Astronauta", 616008087},
	{"Ninja", 656118852},
	{"Super-Herói", 616111295},
	{"Velho", 616006760},
	{"Caminhada Lenta", 616013216},
	{"Gangue", 616078636},
}

local floodMessages = {
	"Use ThurX Hub pra dançar igual vampiro!",
	"ThurX Hub é o melhor do Brookhaven!",
	"Samy e Thur dominaram o RP 😈",
	"🔥 TROL TROL TROL TROL 🔥"
}

local floodEnabled = false

-- Botão flood loop
task.spawn(function()
	while true do
		if floodEnabled then
			for _, msg in ipairs(floodMessages) do
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
				wait(1)
			end
		end
		wait(2)
	end
end)

-- Resposta aos botões do lado esquerdo
for _, btn in pairs(sidePanel:GetChildren()) do
	if btn:IsA("TextButton") then
		btn.MouseButton1Click:Connect(function()
			clearContent()

			if btn.Name == "Anim" then
				local title = Instance.new("TextLabel", rightContent)
				title.Size = UDim2.new(1,0,0,30)
				title.Position = UDim2.new(0,0,0,0)
				title.Text = "Animações"
				title.TextColor3 = Color3.new(1,1,1)
				title.BackgroundTransparency = 1
				title.Font = Enum.Font.GothamBold
				title.TextScaled = true

				local scroll = Instance.new("ScrollingFrame", rightContent)
				scroll.Size = UDim2.new(1,-10,1,-40)
				scroll.Position = UDim2.new(0,5,0,35)
				scroll.CanvasSize = UDim2.new(0,0,0, #animations * 40)
				scroll.ScrollBarThickness = 6
				scroll.BackgroundColor3 = Color3.new(1,1,1)

				local uicorner = Instance.new("UICorner", scroll)
				uicorner.CornerRadius = UDim.new(0,10)

				for i,anim in ipairs(animations) do
					local abtn = Instance.new("TextButton", scroll)
					abtn.Size = UDim2.new(1,-10,0,35)
					abtn.Position = UDim2.new(0,5,0,(i-1)*40)
					abtn.Text = anim[1]
					abtn.TextColor3 = Color3.new(0,0,0)
					abtn.Font = Enum.Font.Gotham
					abtn.TextScaled = true
					abtn.BackgroundColor3 = Color3.fromRGB(230,230,230)

					abtn.MouseButton1Click:Connect(function()
						local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
						if humanoid then
							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://"..anim[2]
							local track = humanoid:LoadAnimation(animation)
							track:Play()
						end
					end)
				end

			elseif btn.Name == "Trol Msg" then
				local title = Instance.new("TextLabel", rightContent)
				title.Size = UDim2.new(1,0,0,30)
				title.Position = UDim2.new(0,0,0,0)
				title.Text = "Trol Message"
				title.TextColor3 = Color3.new(1,1,1)
				title.BackgroundTransparency = 1
				title.Font = Enum.Font.GothamBold
				title.TextScaled = true

				local scroll = Instance.new("ScrollingFrame", rightContent)
				scroll.Size = UDim2.new(1,-10,1,-80)
				scroll.Position = UDim2.new(0,5,0,35)
				scroll.CanvasSize = UDim2.new(0,0,0, #floodMessages * 40)
				scroll.ScrollBarThickness = 6
				scroll.BackgroundColor3 = Color3.fromRGB(240,240,240)

				local uicorner = Instance.new("UICorner", scroll)
				uicorner.CornerRadius = UDim.new(0,10)

				for i,msg in ipairs(floodMessages) do
					local fbtn = Instance.new("TextButton", scroll)
					fbtn.Size = UDim2.new(1,-10,0,35)
					fbtn.Position = UDim2.new(0,5,0,(i-1)*40)
					fbtn.Text = msg
					fbtn.TextColor3 = Color3.new(0,0,0)
					fbtn.Font = Enum.Font.Gotham
					fbtn.TextScaled = true
					fbtn.BackgroundColor3 = Color3.fromRGB(230,230,230)
				end

				local toggleBtn = Instance.new("TextButton", rightContent)
				toggleBtn.Size = UDim2.new(1,-20,0,40)
				toggleBtn.Position = UDim2.new(0,10,1,-45)
				toggleBtn.Text = "Ativar Flood"
				toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
				toggleBtn.TextColor3 = Color3.new(1,1,1)
				toggleBtn.Font = Enum.Font.GothamBold
				toggleBtn.TextScaled = true

				toggleBtn.MouseButton1Click:Connect(function()
					floodEnabled = not floodEnabled
					toggleBtn.Text = floodEnabled and "Desativar Flood" or "Ativar Flood"
				end)

				local aviso = Instance.new("TextLabel", rightContent)
				aviso.Size = UDim2.new(1, -20, 0, 40)
				aviso.Position = UDim2.new(0, 10, 1, -90)
				aviso.Text = "Mande uma mensagem flodando (tem risco de levar aviso na sua conta por spam se alguém denunciar você)"
				aviso.TextColor3 = Color3.new(1,1,1)
				aviso.Font = Enum.Font.Gotham
				aviso.TextScaled = true
				aviso.BackgroundTransparency = 1
				aviso.TextWrapped = true
			end
		end)
	end
end
