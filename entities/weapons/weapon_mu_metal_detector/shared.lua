SWEP.Base 					= "weapon_base"

SWEP.ViewModel				= "models/weapons/v_stunbaton.mdl"
SWEP.WorldModel				= "models/weapons/w_stunbaton.mdl"

SWEP.Spawnable				= true
SWEP.AdminOnly				= true

SWEP.Primary.Recoil 		= 0
SWEP.Primary.ClipSize  		= -1
SWEP.Primary.DefaultClip 	= 1
SWEP.Primary.Automatic  	= true
SWEP.Primary.Delay 			= 0.1
SWEP.Primary.Ammo 			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= false
SWEP.Secondary.Ammo         = "none"

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(CurTime() + 10)

	local trace = self.Owner:GetEyeTrace()

	if not IsValid(trace.Entity) or not trace.Entity:IsPlayer() or trace.Entity:GetPos():Distance(self.Owner:GetPos()) > 120 then
		return
	end

	for k,v in pairs(trace.Entity:GetWeapons()) do
		if v:IsValid() then
			if v:GetClass() ~= "weapon_rp_hands" then  -- don't count Hands
				self:HasSomething()
				return
			end
		end
	end
	
	self:HasNothing() 

end

function SWEP:SecondaryAttack()
end

function SWEP:HasSomething()
	if CLIENT then
		local bname = self.Owner:GetEyeTraceNoCursor().Entity:GetBystanderName()
		
		RunConsoleCommand("say", bname..translate.hasSomething)
	end

	if SERVER then
		self.Owner:EmitSound("npc/combine_soldier/gear5.wav", 75, 100)
		timer.Simple(0.3, function() self.Owner:EmitSound("buttons/button3.wav", 75, 100) end)
	end
end

function SWEP:HasNothing()
	if CLIENT then
		local bname = LocalPlayer():GetEyeTraceNoCursor().Entity:GetBystanderName()
		
		RunConsoleCommand("say", "["..bcolor.x..", "..bcolor.y..", "..bcolor.z..", 255]"..bname.."[255, 255, 255, 255] "..translate.hasNothing)
	end

	if SERVER then
		self.Owner:EmitSound("npc/combine_soldier/gear5.wav", 75, 100)
		timer.Simple(0.3, function() self.Owner:EmitSound("buttons/button2.wav", 75, 100) end)
	end
end

function SWEP:Holster()
	return true
end
