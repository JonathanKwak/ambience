local map = script.Parent
local myPlayer = game.Players.LocalPlayer
local myCharacter = myPlayer.Character or myPlayer.CharacterAdded:Wait()
local myRoot = myCharacter:WaitForChild("HumanoidRootPart")

local util = require(game.ReplicatedStorage.Modules.Util)
local runService = game:GetService("RunService")

local SHORE_BUFFER = 100 -- x studs far from the shore, the shore SFX will not be heard
local marker = script.ZMarker

script.Seabirds:Play()
script.Landbirds:Play()
script.Shore:Play()

local camera = workspace.CurrentCamera

local function renderStep()
	local myPos = myRoot.Position
	local zDifference = math.clamp(math.abs(marker.Position.Z - myPos.Z), 0, SHORE_BUFFER)
	local ratio = zDifference / SHORE_BUFFER
	
	script.Landbirds.Volume = ratio * script.Landbirds:GetAttribute("Volume")
	script.Shore.Volume = (1 - ratio) * script.Shore:GetAttribute("Volume")
	script.Seabirds.Volume = (1 - ratio) * script.Seabirds:GetAttribute("Volume")
end

runService.RenderStepped:Connect(renderStep)
