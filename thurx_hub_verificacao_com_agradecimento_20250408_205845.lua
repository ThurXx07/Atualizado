-- ThurX Hub | Brookhaven RP 🏡 - Menu Delta Executor Style -- AMOLED + Avatar Customização: Cabeça, Mão, Sapato -- Com drag, minimização, botões "IDs", "Aplicar", "Remover"

-- Serviços local Players = game:GetService("Players") local TweenService = game:GetService("TweenService") local LocalPlayer = Players.LocalPlayer

-- IDs DE ITENS (Atualizados) local CHAPEUS = {"15449843197", "6238615247", "5522245154", "13999441546", "13685386157", "14424693881", "16513914096"} local MASCARAS = {"15153086202", "14960781135", "10832389374841", "14942141376", "17164246258", "15153122962", "14840793625", "15153906895", "15021037739", "15153876013", "15013531613", "15013413561"} local CAMISAS = {"11182924874", "11679250718", "10954586887", "11613796964", "12483105503", "12483109504"} local GARRAS = {"15153086202", "14960781135", "10832389374841", "14942141376", "17164246258", "15153122962", "14840793625", "15153906895", "15021037739", "15153876013", "15013531613", "15013413561"} local SAPATOS = {"13692896835", "13692898868", "13692900864", "13692909747", "13692902454", "13692908134", "13692906657", "13692904559"} local MAO = {"10789914680", "10789939838", "10789950437", "10789945800", "10713780551", "10714157708", "10713798995", "10713770556", "10713817180", "11251080505", "10713761236"} local FLORES = {"12465483807", "1246547853", "12465465333", "12465376206"}

-- CORES local AMOLED = Color3.fromRGB(0,0,0) local WHITE = Color3.fromRGB(255,255,255) local BTN = Color3.fromRGB(30,30,30) local PURPLE = Color3.fromRGB(140,0,255)

-- Funções auxiliares local function round(obj, radius) local u = Instance.new("UICorner") u.CornerRadius = UDim.new(0, radius or 12) u.Parent = obj end

-- Tela principal local gui = Instance.new("ScreenGui", game.CoreGui) local loadFrame = Instance.new("Frame", gui) loadFrame.Size = UDim2.new(0, 320, 0, 140) loadFrame.Position = UDim2.new(0.5, -160, 0.5, -70) loadFrame.BackgroundColor3 = AMOLED round(loadFrame, 20)

local title = Instance.new("TextLabel", loadFrame) title.Size = UDim2.new(1, 0, 0, 40) title.Position = UDim2.new(0, 0, 0, 15) title.Text = "thurx&samy" title.TextColor3 = WHITE title.TextSize = 28 title.Font = Enum.Font.GothamBold title.BackgroundTransparency = 1

local msg = Instance.new("TextLabel", loadFrame) msg.Size = UDim2.new(1, 0, 0, 26) msg.Position = UDim2.new(0, 0, 0, 65) msg.Text = "Carregando..." msg.TextColor3 = WHITE msg.TextSize = 18 msg.Font = Enum.Font.Gotham msg.BackgroundTransparency = 1

local bar = Instance.new("Frame", loadFrame) bar.Size = UDim2.new(0.8, 0, 0, 8) bar.Position = UDim2.new(0.1, 0, 0, 100) bar.BackgroundColor3 = BTN round(bar, 5)

local fill = Instance.new("Frame", bar) fill.Size = UDim2.new(0, 0, 1, 0) fill.BackgroundColor3 = PURPLE round(fill, 5)

local etapas = {"Carregando roupas...", "Carregando itens...", "Carregando mapa...", "Carregando players...", "Sincronizando..."} for i, texto in ipairs(etapas) do TweenService:Create(fill, TweenInfo.new(1), {Size = UDim2.new(i/#etapas, 0, 1, 0)}):Play() msg.Text = texto wait(1.2) end loadFrame:Destroy()

-- MENU PRINCIPAL local menu = Instance.new("Frame", gui) menu.Size = UDim2.new(0, 520, 0, 360) menu.Position = UDim2.new(0.5, -260, 0.5, -180) menu.BackgroundColor3 = AMOLED menu.Active = true menu.Draggable = true round(menu, 18)

local header = Instance.new("Frame", menu) header.Size = UDim2.new(1, 0, 0, 40) header.BackgroundColor3 = BTN round(header, 12)

local headLabel = Instance.new("TextLabel", header) headLabel.Size = UDim2.new(0.6, 0, 1, 0) headLabel.Position = UDim2.new(0.05, 0, 0, 0) headLabel.Text = "samy&thur" headLabel.TextColor3 = WHITE headLabel.TextSize = 17 headLabel.BackgroundTransparency = 1 headLabel.Font = Enum.Font.GothamBold headLabel.TextXAlignment = Enum.TextXAlignment.Left

for i, sym in ipairs({"-", "X"}) do local b = Instance.new("TextButton", header) b.Size = UDim2.new(0, 36, 0, 26) b.Position = UDim2.new(1, -46 * i, 0.5, -13) b.BackgroundColor3 = AMOLED b.Text = sym b.TextColor3 = WHITE b.Font = Enum.Font.GothamBold b.TextSize = 20 round(b, 6) b.BorderSizePixel = 2 b.BorderColor3 = WHITE if sym == "X" then b.MouseButton1Click:Connect(function() menu.Visible = false toggleBtn.Visible = true end) end end

-- Botão flutuante para reabrir local toggleBtn = Instance.new("TextButton", gui) toggleBtn.Size = UDim2.new(0, 52, 0, 52) toggleBtn.Position = UDim2.new(0.03, 0, 0.85, 0) toggleBtn.BackgroundColor3 = AMOLED toggleBtn.Text = "東" toggleBtn.TextColor3 = PURPLE toggleBtn.TextSize = 26 toggleBtn.Font = Enum.Font.GothamBold toggleBtn.Visible = false round(toggleBtn, 13) toggleBtn.Draggable = true toggleBtn.MouseButton1Click:Connect(function() menu.Visible = true toggleBtn.Visible = false end)

-- Área de conteúdo local scroll = Instance.new("ScrollingFrame", menu) scroll.Size = UDim2.new(1, -24, 1, -52) scroll.Position = UDim2.new(0, 12, 0, 48) scroll.BackgroundTransparency = 1 scroll.ScrollBarThickness = 5 scroll.CanvasSize = UDim2.new(0, 0, 0, 600) scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y scroll.ClipsDescendants = true

local function criarLinha(y, nome, lista) local label = Instance.new("TextLabel", scroll) label.Size = UDim2.new(0, 90, 0, 28) label.Position = UDim2.new(0, 10, 0, y) label.BackgroundTransparency = 1 label.Text = nome label.TextColor3 = WHITE label.TextSize = 16 label.Font = Enum.Font.GothamBold

local idBox = Instance.new("TextLabel", scroll)
idBox.Size = UDim2.new(0, 132, 0, 28)
idBox.Position = UDim2.new(0, 102, 0, y)
idBox.BackgroundColor3 = BTN
idBox.TextColor3 = WHITE
idBox.Font = Enum.Font.Gotham
idBox.TextSize = 14
idBox.Text = ""
round(idBox, 6)

local dropdownBtn = Instance.new("TextButton", scroll)
dropdownBtn.Size = UDim2.new(0, 54, 0, 28)
dropdownBtn.Position = UDim2.new(0, 238, 0, y)
dropdownBtn.Text = "IDs"
dropdownBtn.BackgroundColor3 = BTN
dropdownBtn.TextColor3 = WHITE
dropdownBtn.TextSize = 13
dropdownBtn.Font = Enum.Font.GothamBold
round(dropdownBtn, 6)

local selectedId = ""
local drop
dropdownBtn.MouseButton1Click:Connect(function()
    if drop and drop.Parent then drop:Destroy() end
    drop = Instance.new("Frame", scroll)
    drop.Size = UDim2.new(0, 88, 0, math.min(6, #lista) * 26)
    drop.Position = UDim2.new(0, 238, 0, y + 30)
    drop.BackgroundColor3 = BTN
    drop.ZIndex = 20
    round(drop, 6)
    for i, id in ipairs(lista) do
        local opt = Instance.new("TextButton", drop)
        opt.Size = UDim2.new(1, -6, 0, 24)
        opt.Position = UDim2.new(0, 3, 0, (i - 1) * 26)
        opt.Text = id
        opt.TextSize = 13
        opt.TextColor3 = WHITE
        opt.Font = Enum.Font.Gotham
        opt.BackgroundColor3 = Color3.fromRGB(40,40,40)
        round(opt, 5)
        opt.MouseButton1Click:Connect(function()
            selectedId = id
            idBox.Text = id
            drop:Destroy()
        end)
    end
end)

local aplicar = Instance.new("TextButton", scroll)
aplicar.Size = UDim2.new(0, 60, 0, 28)
aplicar.Position = UDim2.new(0, 304, 0, y)
aplicar.Text = "Aplicar"
aplicar.BackgroundColor3 = PURPLE
aplicar.TextColor3 = WHITE
aplicar.TextSize = 13
aplicar.Font = Enum.Font.GothamBold
round(aplicar, 6)
aplicar.MouseButton1Click:Connect(function()
    if selectedId ~= "" then
        local char = LocalPlayer.Character
        if char then
            local acc = Instance.new("Accessory")
            acc.Name = nome .. "_" .. selectedId
            local handle = Instance.new("Part")
            handle.Name = "Handle"
            handle.Size = Vector3.new(1,1,1)
            handle.Parent = acc
            acc.Parent = char
        end
    end
end)

local remover = Instance.new("TextButton", scroll)
remover.Size = UDim2.new(0, 66, 0, 28)
remover.Position = UDim2.new(0, 368, 0, y)
remover.Text = "Remover"
remover.BackgroundColor3 = PURPLE
remover.TextColor3 = WHITE
remover.TextSize = 13
remover.Font = Enum.Font.GothamBold
round(remover, 6)
remover.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char then
        for _, acc in ipairs(char:GetChildren()) do
            if acc:IsA("Accessory") and acc.Name:find(nome.."_") then
                acc:Destroy()
            end
        end
    end
    idBox.Text = ""
    selectedId = ""
end)

end

-- Itens local posY = 10 criarLinha(posY, "Cabeça", CHAPEUS) posY += 44 criarLinha(posY, "Mão", MAO) posY += 44 criarLinha(posY, "Sapato", SAPATOS)

