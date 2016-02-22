include("shared.lua")

SWEP.PrintName 		= "Magnum"

SWEP.DrawAmmo 		= false
SWEP.DrawCrosshair 	= true

SWEP.ViewModelFOV	= 50

SWEP.Slot 			= 2
SWEP.SlotPos 		= 1

function SWEP:DrawWeaponSelection( x, y, w, h, alpha )
end

function SWEP:Initialize()
	self.PrintName = Translator:Client(self.Owner) and Translator:Client(self.Owner).magnum or "Magnum"
end

function SWEP:DrawWorldModel()	
	self:DrawModel()
end