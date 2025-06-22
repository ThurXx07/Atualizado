-- ThurX Hub | brookhaven rp🏡 samy&thur brm
-- Menu AMOLED centrado, arredondado, responsivo, focado só em animações + funcionalidades extras
-- Compatível com Delta Executor (LocalScript)
-- por ThurXx07

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Remove GUIs antigas
pcall(function() if game.CoreGui:FindFirstChild("ThurXHub_AMOLED") then game.CoreGui.ThurXHub_AMOLED:Destroy() end end)
pcall(function() if game.CoreGui:FindFirstChild("ThurXHub_TButton") then game.CoreGui.ThurXHub_TButton:Destroy() end end)

-- Função para cantos arredondados
local function roundify(obj, r)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, r or 14)
    corner.Parent = obj
end

-- Função para criar uma borda RGB animada
local function addRGBBorder(frame, thickness)
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = thickness or 2
    uiStroke.Parent = frame
    -- RGB Animation
    local h = 0
    game:GetService("RunService").RenderStepped:Connect(function()
        h = h + 0.002
        if h > 1 then h = 0 end
        uiStroke.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromHSV(h,1,1)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV((h+.2)%1,1,1))
        }
    end)
end

-- Animações Roblox (poses populares)
local anims = {
    {"Vampire", 1083445855},
    {"Zombie", 616158929},
    {"Levitate", 616006778},
    {"Mage", 616091570},
    {"Stylish", 619535595},
    {"Robot", 616088211},
    {"Elder", 845392038},
    {"Knight", 657595757},
    {"Toy", 782841498},
    {"Bubbly", 910004836},
    {"Super Hero", 616115533},
    {"Cartoony", 742637544},
    {"Popstar", 1212900985},
    {"Pirate", 591872667},
    {"Werewolf", 1083195517},
    {"Ninja", 656117400},
    {"Idle padrão", 2510235063},
}

-- Função para aplicar animação
local function applyAnim(animId)
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildWhichIsA("Humanoid")
    if not hum then return end
    -- Remove tracks personalizadas antigas
    for _,track in ipairs(hum:GetPlayingAnimationTracks()) do
        pcall(function()
            if track.Name == "ThurXAnim" then
                track:Stop()
                track:Destroy()
            end
        end)
    end
    -- Cria e toca animação
    local anim = Instance.new("Animation")
    anim.Name = "ThurXAnim"
    anim.AnimationId = "rbxassetid://"..tostring(animId)
    local track = hum:LoadAnimation(anim)
    track.Name = "ThurXAnim"
    track:Play()
end

-- GUI principal
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ThurXHub_AMOLED"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- Fundo preto AMOLED centralizado
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 560, 0, 400)
mainFrame.Position = UDim2.new(0.5, -280, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
roundify(mainFrame, 24)

mainFrame.AnchorPoint = Vector2.new(0,0)
if UserInputService.TouchEnabled then
    mainFrame.Size = UDim2.new(0, math.min(420, workspace.CurrentCamera.ViewportSize.X-16), 0, 340)
    mainFrame.Position = UDim2.new(0.5, -mainFrame.Size.X.Offset/2, 0.5, -mainFrame.Size.Y.Offset/2)
end

-- Cabeçalho
local header = Instance.new("Frame", mainFrame)
header.Size = UDim2.new(1,0,0,46)
header.BackgroundTransparency = 1

local title = Instance.new("TextLabel", header)
title.Text = "ThurX Hub | brookhaven rp🏡 samy&thur brm"
title.Size = UDim2.new(1, -58, 1, 0)
title.Position = UDim2.new(0, 16, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left

-- Botão "X" Fechar
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0,38,0,38)
closeBtn.Position = UDim2.new(1, -46, 0, 4)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.AutoButtonColor = true
roundify(closeBtn, 12)

-- Painel lateral esquerdo (com botões)
local leftPanel = Instance.new("Frame", mainFrame)
leftPanel.Size = UDim2.new(0, 100, 1, -46)
leftPanel.Position = UDim2.new(0,0,0,46)
leftPanel.BackgroundColor3 = Color3.fromRGB(8,8,8)
leftPanel.BorderSizePixel = 0
roundify(leftPanel, 18)

-- Botão "Anim"
local animBtn = Instance.new("TextButton", leftPanel)
animBtn.Text = "Anim"
animBtn.Size = UDim2.new(1, -20, 0, 38)
animBtn.Position = UDim2.new(0, 10, 0, 18)
animBtn.BackgroundColor3 = Color3.fromRGB(85,40,160)
animBtn.TextColor3 = Color3.fromRGB(255,255,255)
animBtn.Font = Enum.Font.GothamBold
animBtn.TextSize = 16
animBtn.AutoButtonColor = true
roundify(animBtn, 12)

-- Botão "Fake Ban"
local fakeBanBtn = Instance.new("TextButton", leftPanel)
fakeBanBtn.Text = "Fake Ban"
fakeBanBtn.Size = UDim2.new(1, -20, 0, 34)
fakeBanBtn.Position = UDim2.new(0, 10, 0, 68)
fakeBanBtn.BackgroundColor3 = Color3.fromRGB(220,220,220)
fakeBanBtn.TextColor3 = Color3.fromRGB(0,0,0)
fakeBanBtn.Font = Enum.Font.GothamBold
fakeBanBtn.TextSize = 15
fakeBanBtn.AutoButtonColor = true
roundify(fakeBanBtn, 12)

-- Texto pequeno "enviar uma mensagem de trol", preto
local fakeBanHint = Instance.new("TextLabel", leftPanel)
fakeBanHint.Text = "enviar uma mensagem de trol"
fakeBanHint.Size = UDim2.new(1, -20, 0, 16)
fakeBanHint.Position = UDim2.new(0, 10, 0, 104)
fakeBanHint.BackgroundTransparency = 1
fakeBanHint.TextColor3 = Color3.fromRGB(0,0,0)
fakeBanHint.Font = Enum.Font.Gotham
fakeBanHint.TextSize = 13
fakeBanHint.TextXAlignment = Enum.TextXAlignment.Left

-- Botão "Auto Rejoin"
local autoRejoinBtn = Instance.new("TextButton", leftPanel)
autoRejoinBtn.Text = "Auto Rejoin"
autoRejoinBtn.Size = UDim2.new(1, -20, 0, 34)
autoRejoinBtn.Position = UDim2.new(0, 10, 0, 132)
autoRejoinBtn.BackgroundColor3 = Color3.fromRGB(220,220,220)
autoRejoinBtn.TextColor3 = Color3.fromRGB(35,35,35)
autoRejoinBtn.Font = Enum.Font.GothamBold
autoRejoinBtn.TextSize = 15
autoRejoinBtn.AutoButtonColor = true
roundify(autoRejoinBtn, 12)

-- Botão "Resertar in game" abaixo do Auto Rejoin
local resetBtn = Instance.new("TextButton", leftPanel)
resetBtn.Text = "Resertar in game"
resetBtn.Size = UDim2.new(1, -20, 0, 28)
resetBtn.Position = UDim2.new(0, 10, 0, 170)
resetBtn.BackgroundColor3 = Color3.fromRGB(220,220,220)
resetBtn.TextColor3 = Color3.fromRGB(35,35,35)
resetBtn.Font = Enum.Font.GothamBold
resetBtn.TextSize = 14
resetBtn.AutoButtonColor = true
roundify(resetBtn, 10)

-- [DR VEÍCULO]
-- Label para a função
local drLabel = Instance.new("TextLabel", leftPanel)
drLabel.Text = "Dr Veículo"
drLabel.Size = UDim2.new(1, -20, 0, 21)
drLabel.Position = UDim2.new(0, 10, 0, 210)
drLabel.BackgroundTransparency = 1
drLabel.TextColor3 = Color3.fromRGB(35,35,35)
drLabel.Font = Enum.Font.GothamBold
drLabel.TextSize = 15
drLabel.TextXAlignment = Enum.TextXAlignment.Left

-- TextBox para velocidade, substitui o antigo "Turbo Veículo"
local turboBox = Instance.new("TextBox", leftPanel)
turboBox.PlaceholderText = "Velocidade (ex: 500)"
turboBox.Size = UDim2.new(1, -20, 0, 32)
turboBox.Position = UDim2.new(0, 10, 0, 232)
turboBox.BackgroundColor3 = Color3.fromRGB(245,245,245)
turboBox.TextColor3 = Color3.fromRGB(35,35,35)
turboBox.Font = Enum.Font.GothamBold
turboBox.TextSize = 15
turboBox.ClearTextOnFocus = false
turboBox.Text = ""
roundify(turboBox, 10)
addRGBBorder(turboBox, 2)

-- Texto pequeno para a TextBox
local turboHint = Instance.new("TextLabel", leftPanel)
turboHint.Text = "altera a velocidade do veículo"
turboHint.Size = UDim2.new(1, -20, 0, 14)
turboHint.Position = UDim2.new(0, 10, 0, 268)
turboHint.BackgroundTransparency = 1
turboHint.TextColor3 = Color3.fromRGB(0,0,0)
turboHint.Font = Enum.Font.Gotham
turboHint.TextSize = 12
turboHint.TextXAlignment = Enum.TextXAlignment.Left

-- [FAKE BAN] - Botões ao lado do Fake Ban
local btnY = fakeBanBtn.Position.Y.Offset
local btnX = fakeBanBtn.Position.X.Offset + fakeBanBtn.Size.X.Offset + 8
local btnW = 74

local enviarTrolBtn = Instance.new("TextButton", leftPanel)
enviarTrolBtn.Text = "Enviar Trol"
enviarTrolBtn.Size = UDim2.new(0, btnW, 0, 34)
enviarTrolBtn.Position = UDim2.new(0, btnX, 0, btnY)
enviarTrolBtn.BackgroundColor3 = Color3.fromRGB(220,220,220)
enviarTrolBtn.TextColor3 = Color3.fromRGB(35,35,35)
enviarTrolBtn.Font = Enum.Font.GothamBold
enviarTrolBtn.TextSize = 13
enviarTrolBtn.AutoButtonColor = true
roundify(enviarTrolBtn, 10)

local pararTrolBtn = Instance.new("TextButton", leftPanel)
pararTrolBtn.Text = "Parar de Enviar"
pararTrolBtn.Size = UDim2.new(0, btnW, 0, 34)
pararTrolBtn.Position = UDim2.new(0, btnX + btnW + 7, 0, btnY)
pararTrolBtn.BackgroundColor3 = Color3.fromRGB(220,220,220)
pararTrolBtn.TextColor3 = Color3.fromRGB(35,35,35)
pararTrolBtn.Font = Enum.Font.GothamBold
pararTrolBtn.TextSize = 13
pararTrolBtn.AutoButtonColor = true
roundify(pararTrolBtn, 10)

-- Painel de conteúdo (direita)
local rightPanel = Instance.new("Frame", mainFrame)
rightPanel.Size = UDim2.new(1, -120, 1, -58)
rightPanel.Position = UDim2.new(0, 110, 0, 54)
rightPanel.BackgroundTransparency = 1

-- Quadro branco de animações (arredondado)
local animFrame = Instance.new("Frame", rightPanel)
animFrame.Size = UDim2.new(1, 0, 1, 0)
animFrame.Position = UDim2.new(0, 0, 0, 0)
animFrame.BackgroundColor3 = Color3.fromRGB(245,245,245)
animFrame.BorderSizePixel = 0
roundify(animFrame, 18)

-- Título "Animações"
local animTitle = Instance.new("TextLabel", animFrame)
animTitle.Text = "Animações"
animTitle.Size = UDim2.new(1, -24, 0, 32)
animTitle.Position = UDim2.new(0, 14, 0, 8)
animTitle.BackgroundTransparency = 1
animTitle.TextColor3 = Color3.fromRGB(35,35,35)
animTitle.Font = Enum.Font.GothamBold
animTitle.TextSize = 18
animTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Área de scroll das animações
local animScroll = Instance.new("ScrollingFrame", animFrame)
animScroll.Size = UDim2.new(1, -24, 1, -48)
animScroll.Position = UDim2.new(0, 12, 0, 40)
animScroll.BackgroundTransparency = 1
animScroll.ScrollBarThickness = 7
animScroll.CanvasSize = UDim2.new(0,0,0,#anims * 44 + 2)
animScroll.BorderSizePixel = 0

-- Adiciona botões de animações
for i, data in ipairs(anims) do
    local btn = Instance.new("TextButton", animScroll)
    btn.Text = data[1]
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Position = UDim2.new(0, 0, 0, (i-1)*44)
    btn.BackgroundColor3 = Color3.fromRGB(220,220,220)
    btn.TextColor3 = Color3.fromRGB(35,35,35)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.AutoButtonColor = true
    roundify(btn, 10)
    btn.MouseButton1Click:Connect(function()
        applyAnim(data[2])
    end)
end

animBtn.MouseButton1Click:Connect(function()
    animFrame.Visible = true
    animBtn.BackgroundColor3 = Color3.fromRGB(85,40,160)
end)

-- Botão "T" flutuante
local function createFloatingT()
    if game.CoreGui:FindFirstChild("ThurXHub_TButton") then game.CoreGui.ThurXHub_TButton:Destroy() end
    local tGui = Instance.new("ScreenGui", game.CoreGui)
    tGui.Name = "ThurXHub_TButton"
    tGui.IgnoreGuiInset = true
    tGui.ResetOnSpawn = false
    local tBtn = Instance.new("TextButton", tGui)
    tBtn.Size = UDim2.new(0, 56, 0, 56)
    tBtn.Position = UDim2.new(0, 22, 1, -74)
    tBtn.BackgroundColor3 = Color3.fromRGB(8,8,8)
    tBtn.Text = "T"
    tBtn.TextColor3 = Color3.fromRGB(180,80,255)
    tBtn.Font = Enum.Font.GothamBlack
    tBtn.TextSize = 36
    tBtn.BackgroundTransparency = 0
    roundify(tBtn, 28)
    tBtn.Active = true
    tBtn.Draggable = true
    tBtn.MouseButton1Click:Connect(function()
        tGui:Destroy()
        gui.Enabled = true
    end)
end

closeBtn.MouseButton1Click:Connect(function()
    gui.Enabled = false
    createFloatingT()
end)

-- Responsividade: re-centralizar ao mudar de tela
game:GetService("RunService").RenderStepped:Connect(function()
    if gui.Enabled and mainFrame.Visible then
        local vp = workspace.CurrentCamera.ViewportSize
        mainFrame.Position = UDim2.new(0.5, -mainFrame.Size.X.Offset/2, 0.5, -mainFrame.Size.Y.Offset/2)
    end
end)

-- ⚠️ IMPORTANTE: NÃO modificar o visual do menu (cores, bordas, fontes, posições, estilos AMOLED etc.)
-- Apenas aplicar as funcionalidades e elementos listados abaixo mantendo o design atual.

-- [FAKE BAN] - Funções dos botões de trol
local trolLooping = false
local trolThread = nil

enviarTrolBtn.MouseButton1Click:Connect(function()
    if trolLooping then return end
    trolLooping = true
    trolThread = coroutine.create(function()
        while trolLooping do
            local msg = string.rep("ᅠ", 500) .. "Chat is hackead by Samy&ThurX Hub"
            local args = {[1] = msg, [2] = "All"}
            -- RemoteEvent padrão do chat
            for _,v in pairs(getgc(true)) do
                if typeof(v) == "table" and rawget(v,"SayMessageRequest") then
                    v.SayMessageRequest:FireServer(msg,"All")
                end
            end
            -- Fallback para outros sistemas:
            local remote = game.ReplicatedStorage:FindFirstChild("SayMessageRequest", true)
            if remote and remote:IsA("RemoteEvent") then
                remote:FireServer(msg,"All")
            end
            wait(2)
        end
    end)
    coroutine.resume(trolThread)
end)

pararTrolBtn.MouseButton1Click:Connect(function()
    trolLooping = false
end)

fakeBanBtn.MouseButton1Click:Connect(function()
    -- Fake ban visual apenas
    local banGui = Instance.new("ScreenGui", game.CoreGui)
    banGui.Name = "ThurXHub_FakeBan"
    local banFrame = Instance.new("Frame", banGui)
    banFrame.Size = UDim2.new(0,340,0,140)
    banFrame.Position = UDim2.new(0.5,-170,0.5,-70)
    banFrame.BackgroundColor3 = Color3.fromRGB(240,240,240)
    banFrame.BorderSizePixel = 0
    roundify(banFrame, 16)
    local banTitle = Instance.new("TextLabel", banFrame)
    banTitle.Text = "Você foi banido! (FAKE)"
    banTitle.TextColor3 = Color3.fromRGB(0,0,0)
    banTitle.Font = Enum.Font.GothamBold
    banTitle.TextSize = 20
    banTitle.BackgroundTransparency = 1
    banTitle.Size = UDim2.new(1,0,0,36)
    banTitle.Position = UDim2.new(0,0,0,8)
    local banMsg = Instance.new("TextLabel", banFrame)
    banMsg.Text = "Motivo: uso de ThurX Hub\nClique para fechar."
    banMsg.TextColor3 = Color3.fromRGB(0,0,0)
    banMsg.Font = Enum.Font.Gotham
    banMsg.TextSize = 16
    banMsg.BackgroundTransparency = 1
    banMsg.Size = UDim2.new(1, -24, 0, 48)
    banMsg.Position = UDim2.new(0,12,0,48)
    banFrame.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            banGui:Destroy()
        end
    end)
    banFrame.MouseButton1Click:Connect(function() banGui:Destroy() end)
    banFrame.Active = true
    banFrame.Draggable = true
end)

-- [AUTO REJOIN] - Reseta personagem
resetBtn.MouseButton1Click:Connect(function()
    if LocalPlayer and LocalPlayer.Character then
        LocalPlayer:LoadCharacter()
    end
end)

-- [DR VEÍCULO] - Turbo personalizado
turboBox.FocusLost:Connect(function(enterPressed)
    if not enterPressed then return end
    local val = tonumber(turboBox.Text)
    if not val then return end
    local char = LocalPlayer.Character
    if not char then return end
    local seat = nil
    for _,v in pairs(char:GetDescendants()) do
        if v:IsA("VehicleSeat") then seat = v break end
    end
    if not seat then
        -- Tenta achar em workspace (casos em que player está no seat mas não é filho do char)
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("VehicleSeat") and v.Occupant and v.Occupant.Parent == char then
                seat = v
                break
            end
        end
    end
    if seat then
        seat.MaxSpeed = val
        turboBox.Text = "Setado: "..val
    else
        turboBox.Text = "Entre num veículo!"
        wait(1.5)
        turboBox.Text = ""
    end
end)

-- Foco visual sempre no animFrame, único painel direito
animFrame.Visible = true

-- Fim do script ThurXx07
