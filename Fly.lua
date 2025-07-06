-- MP HUB - Fly Script com ativar/desativar (pressione F)

local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local flying = false
local bv, bg

UIS.InputBegan:Connect(function(key, gp)
    if gp then return end
    if key.KeyCode == Enum.KeyCode.F then
        flying = not flying
        if flying then
            -- Ativar voo
            bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Parent = hrp

            bg = Instance.new("BodyGyro")
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.CFrame = hrp.CFrame
            bg.Parent = hrp

            while flying and task.wait() do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
                bg.CFrame = workspace.CurrentCamera.CFrame
            end
        else
            -- Desativar voo
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end
    end
end)
