SWEP.Base 					= "weapon_base"
SWEP.ViewModel				= "models/weapons/v_357.mdl"
SWEP.WorldModel				= "models/weapons/w_357.mdl"

SWEP.Spawnable				= true
SWEP.AdminOnly				= true

SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= true

SWEP.Primary.Delay			= 3
SWEP.Primary.Recoil			= 5
SWEP.Primary.Damage			= 120
SWEP.Primary.NumShots		= 1	
SWEP.Primary.Cone			= 1
SWEP.Primary.ClipSize		= -1
SWEP.Primary.Force			= 420
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= false
SWEP.Primary.Ammo         	= "none"
SWEP.Primary.Sound			= "Weapon_357.Single"
SWEP.Primary.ReloadTime 	= 3.7
SWEP.ReloadFinishedSound	= Sound("Weapon_Crossbow.BoltElectrify")
SWEP.ReloadSound 			= Sound("Weapon_357.Reload")

SWEP.Secondary.Delay		= 0.9
SWEP.Secondary.Recoil		= 0
SWEP.Secondary.Damage		= 0
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.Cone			= 0
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= false
SWEP.Secondary.Ammo         = "none"
SWEP.Secondary.Sound		= ""

local CanAttack = true

function SWEP:Initialize()
	CanAttack = true
end

//function SWEP:BulletCallback(att, tr, dmg)
//	return {effects = true, damage = true}
//end

function SWEP:PrimaryAttack()
	if !CanAttack then return false end
	
	local bullet = {}
	bullet.Num = self.Primary.NumShots
	bullet.Src = self.Owner:GetShootPos()
	bullet.Dir = self.Owner:GetAimVector()
	bullet.Spread = Vector(self.Primary.Cone / 90, self.Primary.Cone / 90, 0)
	bullet.Tracer = self.Primary.Tracer
	bullet.Force = self.Primary.Force
	bullet.Damage = self.Primary.Damage

	self.Owner:FireBullets(bullet)
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:EmitSound(Sound(self.Primary.Sound))
	self.Owner:ViewPunch(Angle(-self.Primary.Recoil, 0, 0))

	self.NextLower = CurTime() + 0.4
	CanAttack = false
end

function SWEP:Think()
	if self.NextAttack && self.NextAttack < CurTime() then
		self.NextAttack = nil
		CanAttack = true
	end
	if self.NextLower && self.NextLower < CurTime() then
		self.NextLower = nil
		self.NextUpper = CurTime() + self.Primary.ReloadTime
		self:SendWeaponAnim(ACT_VM_RELOAD)
		
		local i = math.random(1, 3)
		if i == 2 then i = 4 end
		
		self:EmitSound("weapons/357/357_reload" .. i .. ".wav")
		self.Owner:SetAnimation( PLAYER_RELOAD )
	end
	if self.NextUpper && self.NextUpper < CurTime() then
		self.NextUpper = nil
		self.NextAttack = CurTime() + 0.1
	end
end

function SWEP:Deploy()
	if !CanAttack then
		self.NextAttack = nil
		self.NextLower = nil
		self.NextUpper = CurTime() + self.Primary.ReloadTime
		self:EmitSound(self.ReloadSound)
		self:SendWeaponAnim(ACT_VM_RELOAD)
	end
	
	return true
end

function SWEP:Holster()
	return true
end