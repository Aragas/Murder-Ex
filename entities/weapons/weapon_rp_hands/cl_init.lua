include("shared.lua")

SWEP.PrintName		= "Hands"

SWEP.DrawAmmo 		= false
SWEP.DrawCrosshair 	= false

SWEP.ViewModelFOV	= 60

SWEP.Slot			= 0
SWEP.SlotPos		= 1

function SWEP:DrawWeaponSelection( x, y, w, h, alpha )
end

function SWEP:Initialize()
	self.PrintName = Translator:Client(self.Owner) and Translator:Client(self.Owner).hands or "Hands"
end

function SWEP:DrawWorldModel()
end