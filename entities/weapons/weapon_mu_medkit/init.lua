AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

SWEP.Weight				= 5

SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

function SWEP:Initialize()
	self:SetHoldType("normal")
end