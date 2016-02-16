SWEP.Base 					= "weapon_base"

SWEP.ViewModel				= "models/weapons/c_medkit.mdl"
SWEP.WorldModel				= "models/weapons/w_medkit.mdl"

SWEP.Spawnable				= true
SWEP.AdminOnly				= true

SWEP.UseHands 				= true

SWEP.Primary.Recoil 		= 0
SWEP.Primary.ClipSize 		= -1
SWEP.Primary.DefaultClip 	= 1
SWEP.Primary.Automatic  	= true
SWEP.Primary.Delay 			= 0.1
SWEP.Primary.Ammo 			= "none"

SWEP.Secondary.Recoil 		= 0
SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= 1
SWEP.Secondary.Automatic 	= true
SWEP.Secondary.Delay 		= 0.3
SWEP.Secondary.Ammo 		= "none"

function SWEP:PrimaryAttack()
	local player = self.Owner:GetEyeTrace().Entity
	
	if player && player:Health() < 100 && self.Owner:GetPos():Distance(player:GetPos()) <= 85 then
		player:SetHealth(player:Health() + 1)
		self.Owner:EmitSound("hl1/fvox/boop.wav", 150, player:Health())
	end

	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end

function SWEP:SecondaryAttack()
	local maxhealth = self.Owner:GetMaxHealth() or 100
	if self.Owner:Health() < maxhealth then
		self.Owner:SetHealth(self.Owner:Health() + 1)
		self.Owner:EmitSound("hl1/fvox/boop.wav", 150, self.Owner:Health())
	end
	
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
end