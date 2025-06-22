-- ThurX Hub Flood UI (Delta Executor Compatível)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local ChatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
local RunService = game:GetService("RunService")

-- Remove GUI duplicada se já existir
pcall(function() if game.CoreGui:FindFirstChild("ThurXFloodUI") then game.CoreGui.ThurXFloodUI:Destroy() end end)

-- Criação ScreenGui
local main = Instance.new("ScreenGui")
main.Name = "ThurXFloodUI"
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false
if syn and syn.protect_gui then
    syn.protect_gui(main)
    main.Parent = game.CoreGui
else
    main.Parent = gethui and gethui() or game.CoreGui
end

-- Botão principal de abrir menu
local btnTrol = Instance.new("TextButton")
btnTrol.Size = UDim2.new(0, 160, 0, 40)
btnTrol.Position = UDim2.new(0, 20, 0, 100)
btnTrol.Text = "Abrir Menu Flood"
btnTrol.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btnTrol.TextColor3 = Color3.new(1, 1, 1)
btnTrol.Font = Enum.Font.GothamBlack
btnTrol.TextSize = 17
btnTrol.ZIndex = 10
btnTrol.AutoButtonColor = true
btnTrol.Parent = main
Instance.new("UICorner", btnTrol).CornerRadius = UDim.new(0, 8)

-- Frame do Flood
local trolFrame = Instance.new("Frame")
trolFrame.Size = UDim2.new(0, 340, 0, 245)
trolFrame.Position = UDim2.new(0, 200, 0, 90)
trolFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
trolFrame.Visible = false
trolFrame.ZIndex = 20
trolFrame.Parent = main
Instance.new("UICorner", trolFrame).CornerRadius = UDim.new(0, 10)

-- Aviso de risco
local aviso = Instance.new("TextLabel")
aviso.Text = "⚠️ Risco de aviso por spam!"
aviso.Size = UDim2.new(1, -20, 0, 32)
aviso.Position = UDim2.new(0, 10, 0, 8)
aviso.TextColor3 = Color3.fromRGB(255, 230, 80)
aviso.Font = Enum.Font.GothamSemibold
aviso.TextSize = 14
aviso.BackgroundTransparency = 1
aviso.TextXAlignment = Enum.TextXAlignment.Left
aviso.ZIndex = 21
aviso.Parent = trolFrame

-- Dropdown de mensagens
local msgDropdown = Instance.new("TextButton")
msgDropdown.Size = UDim2.new(1, -20, 0, 36)
msgDropdown.Position = UDim2.new(0, 10, 0, 50)
msgDropdown.Text = "➤ Escolher mensagem"
msgDropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
msgDropdown.TextColor3 = Color3.new(1, 1, 1)
msgDropdown.Font = Enum.Font.Gotham
msgDropdown.TextSize = 15
msgDropdown.ZIndex = 21
msgDropdown.Parent = trolFrame
Instance.new("UICorner", msgDropdown).CornerRadius = UDim.new(0, 6)

local msgOptions = {
    "[servidor] Samy e thur que manda no chat kkkj",
    "[servidor] Samy&thur by hackead server",
    "[servidor] o chat do servidor violou algumas mensagem...",
    "[servidor] esse servidor ta dominado pelos melhores 😈 Samy e Thur"
}

local dropdownMenu = Instance.new("Frame")
dropdownMenu.Size = UDim2.new(1, -20, 0, #msgOptions * 32)
dropdownMenu.Position = UDim2.new(0, 10, 0, 86)
dropdownMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
dropdownMenu.Visible = false
dropdownMenu.ZIndex = 22
dropdownMenu.Parent = trolFrame
Instance.new("UICorner", dropdownMenu).CornerRadius = UDim.new(0, 6)

local selectedMsg = ""
for i, text in ipairs(msgOptions) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 32)
    btn.Position = UDim2.new(0, 5, 0, (i-1)*32)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 13
    btn.ZIndex = 23
    btn.Parent = dropdownMenu
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(function()
        selectedMsg = text
        msgDropdown.Text = "✅ Mensagem selecionada!"
        dropdownMenu.Visible = false
    end)
end

msgDropdown.MouseButton1Click:Connect(function()
    dropdownMenu.Visible = not dropdownMenu.Visible
end)

-- Fecha dropdown ao clicar fora
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and dropdownMenu.Visible then
        local mouse = game:GetService("UserInputService"):GetMouseLocation()
        local guiPos = dropdownMenu.AbsolutePosition
        local guiSize = dropdownMenu.AbsoluteSize
        if not (mouse.X >= guiPos.X and mouse.X <= guiPos.X+guiSize.X and mouse.Y >= guiPos.Y and mouse.Y <= guiPos.Y+guiSize.Y) then
            dropdownMenu.Visible = false
        end
    end
end)

-- Botão de ativar/desativar flood
local toggleFlood = Instance.new("TextButton")
toggleFlood.Size = UDim2.new(1, -20, 0, 36)
toggleFlood.Position = UDim2.new(0, 10, 0, 95 + (#msgOptions * 32))
toggleFlood.Text = "🔁 Ativar Flood"
toggleFlood.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleFlood.TextColor3 = Color3.new(1, 1, 1)
toggleFlood.Font = Enum.Font.GothamBold
toggleFlood.TextSize = 15
toggleFlood.ZIndex = 21
toggleFlood.Parent = trolFrame
Instance.new("UICorner", toggleFlood).CornerRadius = UDim.new(0, 6)

-- Flood logic
local floodEnabled = false
local floodCoroutine

toggleFlood.MouseButton1Click:Connect(function()
    floodEnabled = not floodEnabled
    toggleFlood.Text = floodEnabled and "⛔ Desativar Flood" or "🔁 Ativar Flood"
    if floodEnabled and selectedMsg ~= "" and ChatEvent then
        if floodCoroutine and coroutine.status(floodCoroutine) ~= "dead" then
            coroutine.close(floodCoroutine)
        end
        floodCoroutine = coroutine.create(function()
            while floodEnabled do
                ChatEvent:FireServer(selectedMsg, "All")
                for i=1,15 do
                    if not floodEnabled then return end
                    task.wait(0.1)
                end
            end
        end)
        coroutine.resume(floodCoroutine)
    end
end)

-- Abre/fecha menu
btnTrol.MouseButton1Click:Connect(function()
    trolFrame.Visible = not trolFrame.Visible
end)

-- Segurança: Desativa flood se fechar menu
trolFrame:GetPropertyChangedSignal("Visible"):Connect(function()
    if not trolFrame.Visible then
        floodEnabled = false
        toggleFlood.Text = "🔁 Ativar Flood"
    end
end)

-- Segurança: Desativa flood ao resetar
Players.LocalPlayer.CharacterRemoving:Connect(function()
    floodEnabled = false
    toggleFlood.Text = "🔁 Ativar Flood"
end)
