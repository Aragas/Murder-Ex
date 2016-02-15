include("shared.lua")

SWEP.PrintName 		= translate and translate.medkit or "Medkit"

SWEP.DrawAmmo 		= false
SWEP.DrawCrosshair 	= true

SWEP.ViewModelFOV	= 50

SWEP.Slot 			= 4
SWEP.SlotPos 		= 1

function SWEP:DrawWeaponSelection( x, y, w, h, alpha )
end

function SWEP:Initialize()
	self.PrintName = translate and translate.medkit or "Medkit"
end

function SWEP:DrawWorldModel()	
	self:DrawModel()
end