include("shared.lua")

SWEP.PrintName 		= "Metal Detector"

SWEP.DrawAmmo 		= false
SWEP.DrawCrosshair 	= true

SWEP.ViewModelFOV	= 50

SWEP.Slot 			= 3
SWEP.SlotPos 		= 1

function SWEP:DrawWeaponSelection( x, y, w, h, alpha )
end

function SWEP:Initialize()
	self.PrintName = Translator:Client(self.Owner) and Translator:Client(self.Owner).metalDetector or "Metal Detector"
end

function SWEP:DrawWorldModel()	
	self:DrawModel()
end