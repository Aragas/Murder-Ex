include("shared.lua")

SWEP.DrawAmmo 			= true
SWEP.DrawCrosshair 		= true

SWEP.ViewModelFOV		= 50

SWEP.Slot 				= 2
SWEP.SlotPos 			= 1

killicon.AddFont("weapon_mu_magnum", "HL2MPTypeDeath", "1", Color(255, 0, 0))

function SWEP:DrawWeaponSelection( x, y, w, h, alpha )
end

function SWEP:Initialize()
end

function SWEP:Deploy()
	return true
end

function SWEP:Holster()
	return true
end

function SWEP:DrawViewModel()	
	return false
end

function SWEP:DrawWorldModel()	
	self:DrawModel()
end

//function SWEP:DrawHUD()
//end