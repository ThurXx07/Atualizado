-- ThurX | Linha do Céu 🙏
-- Menu de utilidades com auto-farm e compra de gamepass
-- Coloque este script em StarterGui em um LocalScript

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Funções de auto-farm e gamepass (apenas mock)
local function ativarAutoFarm()
    print("[ThurX] Auto farm ativado!")
    -- Coloque aqui o código real de auto-farm
end

local function abrirGamepass()
    print("[ThurX] Comprar gamepass!")
    -- Coloque aqui o código real de compra de gamepass
end

-- Função para criar popout animado
local function popout(gui)
    gui.Position = UDim2.new(0.5, 0, 0.5, 0)
    gui.Size = UDim2.new(0, 0, 0, 0)
    gui.Visible = true
    TweenService:Create(gui, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 370, 0, 315), Position = UDim2.new(0.5, -185, 0.5, -157)}):Play()
end

-- Função para criar animação de minimizar
local function minimizar(gui, miniBtn)
    gui.Visible = false
    miniBtn.Visible = true
end

-- Função para restaurar o menu
local function restaurar(gui, miniBtn)
    gui.Visible = true
    miniBtn.Visible = false
end

-- Função para criar a tela de carregamento
local function criarLoadingScreen()
    local loading = Instance.new("ScreenGui", player.PlayerGui)
    loading.Name = "ThurXLoading"
    local frame = Instance.new("Frame", loading)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.Size = UDim2.new(0, 370, 0, 140)
    frame.Position = UDim2.new(0.5, -185, 0.5, -70)
    frame.AnchorPoint = Vector2.new(0.5,0.5)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.ZIndex = 10
    frame.Visible = false

    local uicorner = Instance.new("UICorner", frame)
    uicorner.CornerRadius = UDim.new(0, 18)

    local title = Instance.new("TextLabel", frame)
    title.Text = "ThurX | Linha do Céu 🙏"
    title.Font = Enum.Font.FredokaOne
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.TextSize = 25
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1,0,0,42)
    title.Position = UDim2.new(0,0,0,8)

    local loadingLabel = Instance.new("TextLabel", frame)
    loadingLabel.Text = "Carregando mapa..."
    loadingLabel.Font = Enum.Font.FredokaOne
    loadingLabel.TextColor3 = Color3.fromRGB(255,255,255)
    loadingLabel.TextSize = 19
    loadingLabel.BackgroundTransparency = 1
    loadingLabel.Size = UDim2.new(1,0,0,36)
    loadingLabel.Position = UDim2.new(0,0,0.6,0)

    frame.Visible = true
    popout(frame)
    wait(2.3)
    TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency=1, Position = UDim2.new(0.5, -185, -0.2, -70)}):Play()
    wait(0.6)
    loading:Destroy()
end

-- Função para criar o menu principal
local function criarMenu()
    local gui = Instance.new("ScreenGui", player.PlayerGui)
    gui.Name = "ThurXMenu"

    local frame = Instance.new("Frame", gui)
    frame.Name = "MainFrame"
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.Size = UDim2.new(0, 370, 0, 315)
    frame.Position = UDim2.new(0.5, -185, 0.5, -157)
    frame.AnchorPoint = Vector2.new(0.5,0.5)
    frame.BackgroundTransparency = 0.10
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true

    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 18)

    -- Título
    local title = Instance.new("TextLabel", frame)
    title.Text = "ThurX | Linha do Céu 🙏"
    title.Font = Enum.Font.FredokaOne
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.TextSize = 23
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1,0,0,38)
    title.Position = UDim2.new(0,0,0,8)

    -- Minimizar e Fechar
    local closeBtn = Instance.new("TextButton", frame)
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.FredokaOne
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.TextSize = 18
    closeBtn.BackgroundColor3 = Color3.fromRGB(210, 20, 20)
    closeBtn.Size = UDim2.new(0,32,0,32)
    closeBtn.Position = UDim2.new(1,-40,0,8)
    closeBtn.AnchorPoint = Vector2.new(0,0)
    closeBtn.AutoButtonColor = true
    closeBtn.ZIndex = 3
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 7)

    local minBtn = Instance.new("TextButton", frame)
    minBtn.Text = "-"
    minBtn.Font = Enum.Font.FredokaOne
    minBtn.TextColor3 = Color3.new(1,1,1)
    minBtn.TextSize = 22
    minBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    minBtn.Size = UDim2.new(0,32,0,32)
    minBtn.Position = UDim2.new(1,-80,0,8)
    minBtn.AnchorPoint = Vector2.new(0,0)
    minBtn.AutoButtonColor = true
    minBtn.ZIndex = 3
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 7)

    -- Botões
    local autoFarmBtn = Instance.new("TextButton", frame)
    autoFarmBtn.Text = "Auto Farm"
    autoFarmBtn.Font = Enum.Font.FredokaOne
    autoFarmBtn.TextColor3 = Color3.fromRGB(255,255,255)
    autoFarmBtn.TextSize = 19
    autoFarmBtn.BackgroundColor3 = Color3.fromRGB(40, 140, 50)
    autoFarmBtn.Size = UDim2.new(0, 140, 0, 45)
    autoFarmBtn.Position = UDim2.new(0, 24, 0, 70)
    autoFarmBtn.ZIndex = 2
    Instance.new("UICorner", autoFarmBtn).CornerRadius = UDim.new(0, 10)

    local gamepassBtn = Instance.new("TextButton", frame)
    gamepassBtn.Text = "Gamepass"
    gamepassBtn.Font = Enum.Font.FredokaOne
    gamepassBtn.TextColor3 = Color3.fromRGB(255,255,255)
    gamepassBtn.TextSize = 19
    gamepassBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 230)
    gamepassBtn.Size = UDim2.new(0, 140, 0, 45)
    gamepassBtn.Position = UDim2.new(0, 24, 0, 130)
    gamepassBtn.ZIndex = 2
    Instance.new("UICorner", gamepassBtn).CornerRadius = UDim.new(0, 10)

    -- Painéis laterais para cada função
    local autoFarmPanel = Instance.new("Frame", frame)
    autoFarmPanel.BackgroundColor3 = Color3.fromRGB(33,33,40)
    autoFarmPanel.Size = UDim2.new(0,130,0,110)
    autoFarmPanel.Position = UDim2.new(1,-145,0,70)
    autoFarmPanel.Visible = false
    Instance.new("UICorner", autoFarmPanel).CornerRadius = UDim.new(0, 12)
    local afLabel = Instance.new("TextLabel", autoFarmPanel)
    afLabel.Text = "Auto Farm Ativo 🙏"
    afLabel.Font = Enum.Font.FredokaOne
    afLabel.TextColor3 = Color3.new(1,1,1)
    afLabel.TextSize = 17
    afLabel.BackgroundTransparency = 1
    afLabel.Size = UDim2.new(1,0,1,0)

    local gamepassPanel = Instance.new("Frame", frame)
    gamepassPanel.BackgroundColor3 = Color3.fromRGB(33,33,40)
    gamepassPanel.Size = UDim2.new(0,130,0,110)
    gamepassPanel.Position = UDim2.new(1,-145,0,185)
    gamepassPanel.Visible = false
    Instance.new("UICorner", gamepassPanel).CornerRadius = UDim.new(0, 12)
    local gpLabel = Instance.new("TextLabel", gamepassPanel)
    gpLabel.Text = "Clique para comprar\nGamepass!"
    gpLabel.Font = Enum.Font.FredokaOne
    gpLabel.TextColor3 = Color3.new(1,1,1)
    gpLabel.TextSize = 15
    gpLabel.BackgroundTransparency = 1
    gpLabel.Size = UDim2.new(1,0,1,0)

    -- Menu minimizado flutuante
    local miniBtn = Instance.new("TextButton", gui)
    miniBtn.Text = "ThurX | Linha do Céu 🙏"
    miniBtn.Font = Enum.Font.FredokaOne
    miniBtn.TextColor3 = Color3.fromRGB(255,255,255)
    miniBtn.TextSize = 16
    miniBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
    miniBtn.Size = UDim2.new(0, 185, 0, 36)
    miniBtn.Position = UDim2.new(0, 40, 0.5, -18)
    miniBtn.Visible = false
    Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, 18)

    -- Botão flutuante "T"
    local tIcon = Instance.new("TextButton", gui)
    tIcon.Text = "T"
    tIcon.Font = Enum.Font.FredokaOne
    tIcon.TextColor3 = Color3.new(1,1,1)
    tIcon.TextSize = 23
    tIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    tIcon.Size = UDim2.new(0, 48, 0, 48)
    tIcon.Position = UDim2.new(0.03, 0, 0.85, 0)
    tIcon.Visible = false
    Instance.new("UICorner", tIcon).CornerRadius = UDim.new(1, 0) -- Totalmente arredondado

    -- Arrastar botão T
    local drag = false
    local offset
    tIcon.MouseButton1Down:Connect(function(x, y)
        drag = true
        offset = Vector2.new(x, y) - tIcon.AbsolutePosition
    end)
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        drag = false
    end)
    game:GetService("RunService").RenderStepped:Connect(function()
        if drag then
            local mouse = game:GetService("UserInputService"):GetMouseLocation()
            tIcon.Position = UDim2.new(0, mouse.X - offset.X, 0, mouse.Y - offset.Y)
        end
    end)
    tIcon.MouseButton1Click:Connect(function()
        frame.Visible = true
        tIcon.Visible = false
    end)

    -- Pop-up de confirmação para sair
    local confirmGui = Instance.new("Frame", gui)
    confirmGui.Size = UDim2.new(0, 260, 0, 110)
    confirmGui.Position = UDim2.new(0.5, -130, 0.5, -55)
    confirmGui.BackgroundColor3 = Color3.fromRGB(20,20,20)
    confirmGui.Visible = false
    Instance.new("UICorner", confirmGui).CornerRadius = UDim.new(0, 24)
    local confirmLabel = Instance.new("TextLabel", confirmGui)
    confirmLabel.Text = "Deseja mesmo sair?"
    confirmLabel.Font = Enum.Font.FredokaOne
    confirmLabel.TextColor3 = Color3.new(1,1,1)
    confirmLabel.TextSize = 18
    confirmLabel.BackgroundTransparency = 1
    confirmLabel.Size = UDim2.new(1,0,0,38)
    confirmLabel.Position = UDim2.new(0,0,0,12)

    local btnSim = Instance.new("TextButton", confirmGui)
    btnSim.Text = "Sim"
    btnSim.Font = Enum.Font.FredokaOne
    btnSim.TextColor3 = Color3.fromRGB(255,255,255)
    btnSim.TextSize = 17
    btnSim.BackgroundColor3 = Color3.fromRGB(40, 140, 50)
    btnSim.Size = UDim2.new(0, 90, 0, 36)
    btnSim.Position = UDim2.new(0.1, 0, 1, -50)
    Instance.new("UICorner", btnSim).CornerRadius = UDim.new(0, 10)

    local btnNao = Instance.new("TextButton", confirmGui)
    btnNao.Text = "Não"
    btnNao.Font = Enum.Font.FredokaOne
    btnNao.TextColor3 = Color3.fromRGB(255,255,255)
    btnNao.TextSize = 17
    btnNao.BackgroundColor3 = Color3.fromRGB(210, 20, 20)
    btnNao.Size = UDim2.new(0, 90, 0, 36)
    btnNao.Position = UDim2.new(0.55, 0, 1, -50)
    Instance.new("UICorner", btnNao).CornerRadius = UDim.new(0, 10)

    -- Eventos dos botões principais
    autoFarmBtn.MouseButton1Click:Connect(function()
        autoFarmPanel.Visible = not autoFarmPanel.Visible
        gamepassPanel.Visible = false
        ativarAutoFarm()
    end)

    gamepassBtn.MouseButton1Click:Connect(function()
        gamepassPanel.Visible = not gamepassPanel.Visible
        autoFarmPanel.Visible = false
        abrirGamepass()
    end)

    -- Minimizar
    minBtn.MouseButton1Click:Connect(function()
        minimizar(frame, miniBtn)
    end)
    miniBtn.MouseButton1Click:Connect(function()
        restaurar(frame, miniBtn)
    end)

    -- Fechar
    closeBtn.MouseButton1Click:Connect(function()
        confirmGui.Visible = true
        popout(confirmGui)
    end)

    btnNao.MouseButton1Click:Connect(function()
        confirmGui.Visible = false
    end)
    btnSim.MouseButton1Click:Connect(function()
        gui.Enabled = false
        tIcon.Visible = true
    end)
end

-- Execução
criarLoadingScreen()
criarMenu()
