include("shared.lua")

SWEP.PrintName		= translate and translate.hands or "Hands"

SWEP.DrawAmmo 		= false
SWEP.DrawCrosshair 	= false

SWEP.ViewModelFOV	= 60

SWEP.Slot			= 0
SWEP.SlotPos		= 1

function SWEP:DrawWeaponSelection( x, y, w, h, alpha )
end

function SWEP:Initialize()
	self.PrintName = translate and translate.hands or "Hands"
end

function SWEP:DrawWorldModel()
end