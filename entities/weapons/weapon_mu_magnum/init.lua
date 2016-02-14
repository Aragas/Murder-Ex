AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

function SWEP:Initialize()
	self:SetHoldType("pistol")
end

function SWEP:Deploy()
	return true
end

function SWEP:Holster()
	return true
end

