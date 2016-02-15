SWEP.ViewModel				= "models/weapons/v_crowbar.mdl"
SWEP.WorldModel				= "models/weapons/w_crowbar.mdl"

SWEP.Spawnable				= false
SWEP.AdminOnly				= true

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= false
SWEP.Primary.Ammo         	= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= false
SWEP.Secondary.Ammo         = "none"

function SWEP:Initialize()
	self:DrawShadow(false)
end

function SWEP:Deploy()
	if SERVER then
		self:SetColor(255,255,255,0)
		if IsValid(self.Owner) then
			timer.Simple(0, function()
				if IsValid(self) && IsValid(self.Owner) then
					self.Owner:DrawViewModel(false)
				end
			end)
		end
	end
	
	return true
end

function SWEP:Holster()
	return true
end

function SWEP:PrimaryAttack()
	if SERVER then
		if IsValid(self.Owner) then
			if self.Owner:HasWeapon("weapon_mu_knife") then
				self.Owner:SelectWeapon("weapon_mu_knife")
			elseif self.Owner:HasWeapon("weapon_mu_magnum") then
				self.Owner:SelectWeapon("weapon_mu_magnum")
			end
		end
	end
	
	return
end