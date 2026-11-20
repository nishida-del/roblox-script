-- Movement Control
-- Roblox LocalScript

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local speed = 16
local jumpPower = 50
local infiniteJump = false

local function setupCharacter(character)
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.WalkSpeed = speed
    humanoid.UseJumpPower = true
    humanoid.JumpPower = jumpPower
end

if player.Character then
    setupCharacter(player.Character)
end

player.CharacterAdded:Connect(setupCharacter)

UIS.JumpRequest:Connect(function()
    if infiniteJump and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
