

-- 🛡️ God Mode GUI | Made by LuaDev

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--== GUI ==--
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = true -- ✔️ 重生時 GUI 會移除

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 140)
frame.Position = UDim2.new(0.5, -125, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "God Mode\nMade by LuaDev"
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.8, 0, 0.4, 0)
button.Position = UDim2.new(0.1, 0, 0.5, 0)
button.Text = "Enable God Mode"
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
button.TextColor3 = Color3.new(1,1,1)

--== 功能 ==--
local godEnabled = false

button.MouseButton1Click:Connect(function()
	godEnabled = not godEnabled
	if godEnabled then
		button.Text = "GOD Mode ON"
		spawn(function()
			while godEnabled do
				if humanoid.Health < humanoid.MaxHealth then
					humanoid.Health = humanoid.MaxHealth
				end
				humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
				task.wait(0.1)
			end
		end)
	else
		button.Text = "Enable GOD Mode"
	end
end)
