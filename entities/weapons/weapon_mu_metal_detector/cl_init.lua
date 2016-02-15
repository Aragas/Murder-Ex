include("shared.lua")

SWEP.PrintName 		= translate and translate.metalDetector or "Metal Detector"

SWEP.DrawAmmo 		= false
SWEP.DrawCrosshair 	= true

SWEP.ViewModelFOV	= 50

SWEP.Slot 			= 3
SWEP.SlotPos 		= 1

function SWEP:DrawWeaponSelection( x, y, w, h, alpha )
end

function SWEP:Initialize()
	self.PrintName = translate and translate.metalDetector or "Metal Detector"
end

function SWEP:DrawWorldModel()	
	self:DrawModel()
end