-- ThurX Hub | brookhaven rp🏡 samy&thur brm
-- Menu AMOLED centrado, arredondado, responsivo, anim/trol/dr veículo
-- Compatível com Delta Executor (LocalScript)
-- por ThurXx07 & samy

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

-- Remove GUIs antigas
pcall(function() if game.CoreGui:FindFirstChild("ThurXHub_AMOLED") then game.CoreGui.ThurXHub_AMOLED:Destroy() end end)
pcall(function() if game.CoreGui:FindFirstChild("ThurXHub_TButton") then game.CoreGui.ThurXHub_TButton:Destroy() end end)

-- Função para cantos arredondados
local function roundify(obj, r)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, r or 14)
    corner.Parent = obj
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

-- Responsividade mobile
mainFrame.AnchorPoint = Vector2.new(0,0)
if UserInputService and UserInputService.TouchEnabled then
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

-- Painel lateral esquerdo (agora com 3 botões)
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
animBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
animBtn.TextColor3 = Color3.fromRGB(255,255,255)
animBtn.Font = Enum.Font.GothamBold
animBtn.TextSize = 16
animBtn.AutoButtonColor = true
roundify(animBtn, 12)

-- Botão "TROL"
local trolBtn = Instance.new("TextButton", leftPanel)
trolBtn.Text = "TROL"
trolBtn.Size = UDim2.new(1, -20, 0, 38)
trolBtn.Position = UDim2.new(0, 10, 0, 72)
trolBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
trolBtn.TextColor3 = Color3.fromRGB(255,255,255)
trolBtn.Font = Enum.Font.GothamBold
trolBtn.TextSize = 16
trolBtn.AutoButtonColor = true
roundify(trolBtn, 12)

-- Botão "DR Veículo"
local drBtn = Instance.new("TextButton", leftPanel)
drBtn.Text = "DR Veículo"
drBtn.Size = UDim2.new(1, -20, 0, 38)
drBtn.Position = UDim2.new(0, 10, 0, 126)
drBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
drBtn.TextColor3 = Color3.fromRGB(255,255,255)
drBtn.Font = Enum.Font.GothamBold
drBtn.TextSize = 16
drBtn.AutoButtonColor = true
roundify(drBtn, 12)

-- Painel de conteúdo (direita)
local rightPanel = Instance.new("Frame", mainFrame)
rightPanel.Size = UDim2.new(1, -120, 1, -58)
rightPanel.Position = UDim2.new(0, 110, 0, 54)
rightPanel.BackgroundTransparency = 1

-- Painéis de conteúdo (um para cada aba)
local function clearPanels()
    for _,v in ipairs(rightPanel:GetChildren()) do
        v.Visible = false
    end
end

-- Painel ANIM
local animFrame = Instance.new("Frame", rightPanel)
animFrame.Visible = true
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

-- Área de scroll das animações (ALTURA REDUZIDA/MÉDIA)
local animScroll = Instance.new("ScrollingFrame", animFrame)
animScroll.Size = UDim2.new(1, -24, 0, 180)
animScroll.Position = UDim2.new(0, 12, 0, 44)
animScroll.BackgroundTransparency = 1
animScroll.ScrollBarThickness = 7
animScroll.CanvasSize = UDim2.new(0,0,0,#anims * 44 + 2)
animScroll.BorderSizePixel = 0

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

-- Painel TROL
local trolFrame = Instance.new("Frame", rightPanel)
trolFrame.Visible = false
trolFrame.Size = UDim2.new(1, 0, 1, 0)
trolFrame.Position = UDim2.new(0, 0, 0, 0)
trolFrame.BackgroundColor3 = Color3.fromRGB(245,245,245)
trolFrame.BorderSizePixel = 0
roundify(trolFrame, 18)

-- Loop Fling texto
local loopFlingTx = Instance.new("TextLabel", trolFrame)
loopFlingTx.Text = "Loop Fling"
loopFlingTx.Size = UDim2.new(1, -24, 0, 34)
loopFlingTx.Position = UDim2.new(0, 14, 0, 9)
loopFlingTx.BackgroundTransparency = 1
loopFlingTx.TextColor3 = Color3.fromRGB(35,35,35)
loopFlingTx.Font = Enum.Font.GothamBold
loopFlingTx.TextSize = 18
loopFlingTx.TextXAlignment = Enum.TextXAlignment.Left

local loopFlingDesc = Instance.new("TextLabel", trolFrame)
loopFlingDesc.Text = "Arremessar player apertando neles"
loopFlingDesc.Size = UDim2.new(1, -24, 0, 22)
loopFlingDesc.Position = UDim2.new(0, 14, 0, 40)
loopFlingDesc.BackgroundTransparency = 1
loopFlingDesc.TextColor3 = Color3.fromRGB(70,70,70)
loopFlingDesc.Font = Enum.Font.Gotham
loopFlingDesc.TextSize = 15
loopFlingDesc.TextXAlignment = Enum.TextXAlignment.Left

-- Fake Ban label
local fakeBanLbl = Instance.new("TextLabel", trolFrame)
fakeBanLbl.Text = "Fake Ban"
fakeBanLbl.Size = UDim2.new(0, 110, 0, 26)
fakeBanLbl.Position = UDim2.new(0, 14, 0, 74)
fakeBanLbl.BackgroundTransparency = 1
fakeBanLbl.TextColor3 = Color3.fromRGB(255,255,255)
fakeBanLbl.Font = Enum.Font.GothamBold
fakeBanLbl.TextSize = 17
fakeBanLbl.TextXAlignment = Enum.TextXAlignment.Left

-- Fake Ban toggle botão
local fakeBanActive = false
local fakeBanBtn = Instance.new("TextButton", trolFrame)
fakeBanBtn.Size = UDim2.new(0, 140, 0, 28)
fakeBanBtn.Position = UDim2.new(0, 128, 0, 73)
fakeBanBtn.Text = "Fake Ban  (✗)"
fakeBanBtn.BackgroundColor3 = Color3.fromRGB(18,18,18)
fakeBanBtn.TextColor3 = Color3.fromRGB(255,255,255)
fakeBanBtn.Font = Enum.Font.GothamBold
fakeBanBtn.TextSize = 15
fakeBanBtn.AutoButtonColor = true
roundify(fakeBanBtn, 10)

local fakeBanConn

fakeBanBtn.MouseButton1Click:Connect(function()
    fakeBanActive = not fakeBanActive
    fakeBanBtn.Text = "Fake Ban  ("..(fakeBanActive and "✓" or "✗")..")"
    if fakeBanActive then
        fakeBanBtn.BackgroundColor3 = Color3.fromRGB(52,160,80)
        -- Mensagem Fake Ban no chat, muito espaço antes pra esconder nome
        if fakeBanConn then fakeBanConn:Disconnect() end
        fakeBanConn = RunService.RenderStepped:Connect(function()
            local msg = "                                                                                           By Chat is hackead is ThurX&samy hub"
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
            wait(3.5)
        end)
    else
        fakeBanBtn.BackgroundColor3 = Color3.fromRGB(18,18,18)
        if fakeBanConn then fakeBanConn:Disconnect() end
    end
end)

-- Auto Rejoin label
local autoRejLbl = Instance.new("TextLabel", trolFrame)
autoRejLbl.Text = "Auto Rejoin"
autoRejLbl.Size = UDim2.new(1, -24, 0, 18)
autoRejLbl.Position = UDim2.new(0, 14, 0, 112)
autoRejLbl.BackgroundTransparency = 1
autoRejLbl.TextColor3 = Color3.fromRGB(120,120,120)
autoRejLbl.Font = Enum.Font.Gotham
autoRejLbl.TextSize = 14
autoRejLbl.TextXAlignment = Enum.TextXAlignment.Left

local resetLbl = Instance.new("TextLabel", trolFrame)
resetLbl.Text = "Dar reset no jogo, você será resertado"
resetLbl.Size = UDim2.new(1, -24, 0, 16)
resetLbl.Position = UDim2.new(0, 14, 0, 132)
resetLbl.BackgroundTransparency = 1
resetLbl.TextColor3 = Color3.fromRGB(160,160,160)
resetLbl.Font = Enum.Font.Gotham
resetLbl.TextSize = 13
resetLbl.TextXAlignment = Enum.TextXAlignment.Left

-- Painel DR Veículo
local drFrame = Instance.new("Frame", rightPanel)
drFrame.Visible = false
drFrame.Size = UDim2.new(1, 0, 1, 0)
drFrame.Position = UDim2.new(0, 0, 0, 0)
drFrame.BackgroundColor3 = Color3.fromRGB(245,245,245)
drFrame.BorderSizePixel = 0
roundify(drFrame, 18)

local turboLbl = Instance.new("TextLabel", drFrame)
turboLbl.Text = "Turbo Veículo"
turboLbl.Size = UDim2.new(0, 160, 0, 32)
turboLbl.Position = UDim2.new(0, 20, 0, 28)
turboLbl.BackgroundTransparency = 1
turboLbl.TextColor3 = Color3.fromRGB(35,35,35)
turboLbl.Font = Enum.Font.GothamBold
turboLbl.TextSize = 18
turboLbl.TextXAlignment = Enum.TextXAlignment.Left

local turboActive = false
local turboBtn = Instance.new("TextButton", drFrame)
turboBtn.Size = UDim2.new(0, 168, 0, 34)
turboBtn.Position = UDim2.new(0, 190, 0, 28)
turboBtn.Text = "Turbo Veículo  (✗)"
turboBtn.BackgroundColor3 = Color3.fromRGB(18,18,18)
turboBtn.TextColor3 = Color3.fromRGB(255,255,255)
turboBtn.Font = Enum.Font.GothamBold
turboBtn.TextSize = 15
turboBtn.AutoButtonColor = true
roundify(turboBtn, 10)

-- Carro RGB animado (simples, alternando background do botão)
local turboAnim
turboBtn.MouseButton1Click:Connect(function()
    turboActive = not turboActive
    turboBtn.Text = "Turbo Veículo  ("..(turboActive and "✓" or "✗")..")"
    if turboActive then
        if turboAnim then turboAnim:Disconnect() end
        turboAnim = RunService.RenderStepped:Connect(function()
            local t = tick()*1.3
            local r,g,b = Color3.fromHSV((t%1),1,1):ToHSV()
            turboBtn.BackgroundColor3 = Color3.fromHSV((t%1),0.7,0.9)
        end)
        -- Aqui você pode adicionar código para turbo real, se desejar
    else
        if turboAnim then turboAnim:Disconnect() end
        turboBtn.BackgroundColor3 = Color3.fromRGB(18,18,18)
    end
end)

-- Troca de painel ao clicar nos botões
local lastBtn = animBtn
local function selectPanel(panel, btn)
    clearPanels()
    panel.Visible = true
    if lastBtn then lastBtn.BackgroundColor3 = Color3.fromRGB(30,30,30) end
    btn.BackgroundColor3 = Color3.fromRGB(85,40,160)
    lastBtn = btn
end

animBtn.MouseButton1Click:Connect(function() selectPanel(animFrame, animBtn) end)
trolBtn.MouseButton1Click:Connect(function() selectPanel(trolFrame, trolBtn) end)
drBtn.MouseButton1Click:Connect(function() selectPanel(drFrame, drBtn) end)
selectPanel(animFrame, animBtn)

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
