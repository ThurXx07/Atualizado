-- ThurX HUB | brookhaven rp🏡
-- Menu de músicas para Brookhaven RP (todos ouvem)
-- Feito para Delta Executor, Synapse X, Fluxus, etc.
-- by ThurXx07

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Remove GUI antigo se existir
if game.CoreGui:FindFirstChild("ThurXHUB_Music") then
    game.CoreGui.ThurXHUB_Music:Destroy()
end

-- Cria a GUI principal
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "ThurXHUB_Music"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 340, 0, 360)
MainFrame.Position = UDim2.new(0, 40, 0, 120)
MainFrame.BackgroundColor3 = Color3.fromRGB(21,21,21)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Título
local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "ThurX HUB | brookhaven rp🏡"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- Separador
local Line = Instance.new("Frame", MainFrame)
Line.Size = UDim2.new(1, -24, 0, 2)
Line.Position = UDim2.new(0, 12, 0, 42)
Line.BackgroundColor3 = Color3.fromRGB(120,120,120)

-- Título músicas
local MusicTitle = Instance.new("TextLabel", MainFrame)
MusicTitle.Text = "🎵 Músicas públicas (todos ouvem):"
MusicTitle.Size = UDim2.new(1, -24, 0, 30)
MusicTitle.Position = UDim2.new(0, 12, 0, 50)
MusicTitle.BackgroundTransparency = 1
MusicTitle.TextColor3 = Color3.fromRGB(255,255,255)
MusicTitle.Font = Enum.Font.GothamSemibold
MusicTitle.TextSize = 16
MusicTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Lista de músicas
local songs = {
    {"todo mundo ouvir", "72334211564889"},
    {"ix", "93782728519019"},
    {"death bed", "76463442516219"},
    {"120011175571061", "120011175571061"},
    {"OMADA Phonk", "96610114209889"},
    {"?", "111668097052966"},
    {"UNK", "104300546340195"},
    {"y funk", "129546408528391"},
    {"ur funk", "132406629909648"},
    {"e", "118457386765851"},
    {"white tee", "9087418452"},
    {"a funk", "109188610023287"},
    {"134713831368801", "134713831368801"},
}

-- ScrollingFrame para botões das músicas
local Scroll = Instance.new("ScrollingFrame", MainFrame)
Scroll.Size = UDim2.new(1, -24, 1, -110)
Scroll.Position = UDim2.new(0, 12, 0, 90)
Scroll.BackgroundColor3 = Color3.fromRGB(30,30,30)
Scroll.ScrollBarThickness = 6
Scroll.CanvasSize = UDim2.new(0, 0, 0, #songs*38)
Scroll.BorderSizePixel = 0

-- Função para tocar música globalmente (todos ouvem)
local function playMusicGlobal(id)
    -- Procura por boombox do jogador
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    local char = LocalPlayer.Character
    local boombox = nil

    -- Procura na mochila e personagem
    if backpack then
        for _,v in pairs(backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
                if v.Name:lower():find("boombox") then
                    boombox = v
                    break
                end
            end
        end
    end
    if not boombox and char then
        for _,v in pairs(char:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
                if v.Name:lower():find("boombox") then
                    boombox = v
                    break
                end
            end
        end
    end

    if not boombox then
        -- Mensagem avisando para equipar o boombox
        local msg = Instance.new("TextLabel", MainFrame)
        msg.Text = "Equipe o Boombox para tocar!"
        msg.Size = UDim2.new(1, -24, 0, 30)
        msg.Position = UDim2.new(0, 12, 1, -38)
        msg.BackgroundTransparency = 0.2
        msg.BackgroundColor3 = Color3.fromRGB(80,40,40)
        msg.TextColor3 = Color3.fromRGB(255,255,255)
        msg.Font = Enum.Font.GothamBold
        msg.TextSize = 15
        spawn(function()
            wait(2.2)
            if msg then msg:Destroy() end
        end)
        return
    end

    -- Tentar executar remotamente o boombox
    local args = {[1]=tonumber(id)}
    for _,v in pairs(getgc(true)) do
        if typeof(v) == "function" and getfenv(v).script and getfenv(v).script.Parent and getfenv(v).script.Parent.Name:lower():find("boombox") then
            local info = debug.getinfo(v)
            if info and info.name:lower():find("play") then
                pcall(function() v(unpack(args)) end)
            end
        end
    end
    -- Alternativa: tentar disparar eventos comuns do boombox (para exploits que suportam fireServer)
    for _,v in pairs(char:GetChildren()) do
        if v:IsA("Tool") and v.Name:lower():find("boombox") then
            local remote = v:FindFirstChildWhichIsA("RemoteEvent", true)
            if remote then
                pcall(function()
                    remote:FireServer(tonumber(id))
                end)
            end
        end
    end
end

-- Cria os botões das músicas
for i, song in ipairs(songs) do
    local btn = Instance.new("TextButton", Scroll)
    btn.Size = UDim2.new(1, -12, 0, 32)
    btn.Position = UDim2.new(0, 6, 0, (i-1)*38)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,45)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Text = song[1]
    btn.AutoButtonColor = true

    btn.MouseButton1Click:Connect(function()
        playMusicGlobal(song[2])
        btn.BackgroundColor3 = Color3.fromRGB(60,100,60)
        wait(0.15)
        btn.BackgroundColor3 = Color3.fromRGB(35,35,45)
    end)
end

-- Fechar menu (X)
local X = Instance.new("TextButton", MainFrame)
X.Text = "X"
X.Size = UDim2.new(0, 32, 0, 32)
X.Position = UDim2.new(1, -38, 0, 6)
X.BackgroundColor3 = Color3.fromRGB(80,20,20)
X.TextColor3 = Color3.fromRGB(255,255,255)
X.Font = Enum.Font.GothamBold
X.TextSize = 18
X.AutoButtonColor = true
X.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Fim do script
