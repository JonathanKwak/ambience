local map = script.Parent
local myPlayer = game.Players.LocalPlayer
local myCharacter = myPlayer.Character or myPlayer.CharacterAdded:Wait()
local myRoot = myCharacter:WaitForChild("HumanoidRootPart")

local util = require(game.ReplicatedStorage.Modules.Util)
local runService = game:GetService("RunService")

local SHORE_BUFFER = 100 -- x studs far from the shore, the shore SFX will not be heard
local marker = script.ZMarker
local ambience = script.Ambience

for _, sound: Sound in pairs(ambience:GetChildren()) do
	sound:Play()
end

local camera = workspace.CurrentCamera

local function renderStep()
	local myPos = myRoot.Position
	local zDifference = math.clamp(math.abs(marker.Position.Z - myPos.Z), 0, SHORE_BUFFER)
	local ratio = zDifference / SHORE_BUFFER
	
	for _, sound: Sound in pairs(ambience:GetChildren()) do
		local isInverse = sound:GetAttribute("Inverse")
		local volume = sound:GetAttribute("Volume") or 1
		
		sound.Volume = (isInverse and (1 - ratio) or ratio) * volume
	end
end

runService.RenderStepped:Connect(renderStep)
