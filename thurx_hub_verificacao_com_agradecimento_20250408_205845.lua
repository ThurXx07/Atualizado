-- Interface Flood Pronta — ThurX Hub (Delta Compatível)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local ChatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")

local floodEnabled = false
local selectedMsg = ""

-- GUI principal
local main = Instance.new("ScreenGui", game.CoreGui)
main.Name = "ThurXFloodUI"

local btnTrol = Instance.new("TextButton")
btnTrol.Size = UDim2.new(0, 150, 0, 30)
btnTrol.Position = UDim2.new(0, 10, 0, 10)
btnTrol.Text = "Abrir Menu Flood"
btnTrol.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btnTrol.TextColor3 = Color3.new(1, 1, 1)
btnTrol.Font = Enum.Font.GothamBold
btnTrol.TextSize = 14
Instance.new("UICorner", btnTrol).CornerRadius = UDim.new(0, 8)
btnTrol.Parent = main

-- Flood Frame
local trolFrame = Instance.new("Frame")
trolFrame.Size = UDim2.new(0, 300, 0, 240)
trolFrame.Position = UDim2.new(0, 10, 0, 50)
trolFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
trolFrame.Visible = false
Instance.new("UICorner", trolFrame).CornerRadius = UDim.new(0, 8)
trolFrame.Parent = main

local aviso = Instance.new("TextLabel")
aviso.Text = "⚠️ Risco de aviso por spam!"
aviso.Size = UDim2.new(1, -20, 0, 40)
aviso.Position = UDim2.new(0, 10, 0, 5)
aviso.TextColor3 = Color3.new(1, 1, 1)
aviso.Font = Enum.Font.GothamSemibold
aviso.TextSize = 13
aviso.BackgroundTransparency = 1
aviso.TextXAlignment = Enum.TextXAlignment.Left
aviso.Parent = trolFrame

local msgDropdown = Instance.new("TextButton")
msgDropdown.Size = UDim2.new(1, -20, 0, 30)
msgDropdown.Position = UDim2.new(0, 10, 0, 50)
msgDropdown.Text = "➤ Escolher mensagem"
msgDropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
msgDropdown.TextColor3 = Color3.new(1, 1, 1)
msgDropdown.Font = Enum.Font.Gotham
msgDropdown.TextSize = 14
Instance.new("UICorner", msgDropdown).CornerRadius = UDim.new(0, 6)
msgDropdown.Parent = trolFrame

local msgOptions = {
    "[servidor] Samy e thur que manda no chat kkkj",
    "[servidor] Samy&thur by hackead server",
    "[servidor] o chat do servidor violou algumas mensagem...",
    "[servidor] esse servidor ta dominado pelos melhores 😈 Samy e Thur"
}

local dropdownMenu = Instance.new("Frame")
dropdownMenu.Size = UDim2.new(1, -20, 0, #msgOptions * 28)
dropdownMenu.Position = UDim2.new(0, 10, 0, 85)
dropdownMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
dropdownMenu.Visible = false
Instance.new("UICorner", dropdownMenu).CornerRadius = UDim.new(0, 6)
dropdownMenu.Parent = trolFrame

for _, text in ipairs(msgOptions) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 28)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.Parent = dropdownMenu
    btn.MouseButton1Click:Connect(function()
        selectedMsg = text
        msgDropdown.Text = "✅ Mensagem selecionada!"
        dropdownMenu.Visible = false
    end)
end

msgDropdown.MouseButton1Click:Connect(function()
    dropdownMenu.Visible = not dropdownMenu.Visible
end)

local toggleFlood = Instance.new("TextButton")
toggleFlood.Size = UDim2.new(1, -20, 0, 30)
toggleFlood.Position = UDim2.new(0, 10, 0, 90 + (#msgOptions * 28))
toggleFlood.Text = "🔁 Ativar Flood"
toggleFlood.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleFlood.TextColor3 = Color3.new(1, 1, 1)
toggleFlood.Font = Enum.Font.GothamBold
toggleFlood.TextSize = 14
Instance.new("UICorner", toggleFlood).CornerRadius = UDim.new(0, 6)
toggleFlood.Parent = trolFrame

toggleFlood.MouseButton1Click:Connect(function()
    floodEnabled = not floodEnabled
    toggleFlood.Text = floodEnabled and "⛔ Desativar Flood" or "🔁 Ativar Flood"
    if floodEnabled then
        while floodEnabled and selectedMsg ~= "" and ChatEvent do
            ChatEvent:FireServer(selectedMsg, "All")
            task.wait(1.5)
        end
    end
end)

btnTrol.MouseButton1Click:Connect(function()
    trolFrame.Visible = not trolFrame.Visible
end)
