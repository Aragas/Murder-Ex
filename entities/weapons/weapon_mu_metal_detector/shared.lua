SWEP.Base 					= "weapon_base"

SWEP.ViewModel				= "models/weapons/v_stunbaton.mdl"
SWEP.WorldModel				= "models/weapons/w_stunbaton.mdl"

SWEP.Spawnable				= true
SWEP.AdminOnly				= true

SWEP.Primary.ReloadTime 	= 10
SWEP.Primary.Recoil 		= 5
SWEP.Primary.ClipSize  		= -1
SWEP.Primary.DefaultClip 	= 1
SWEP.Primary.Automatic  	= true
SWEP.Primary.Delay 			= 0.1
SWEP.Primary.Ammo 			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= false
SWEP.Secondary.Ammo         = "none"

function SWEP:CanPrimaryAttack()
	return true
end

function SWEP:CanSecondaryAttack()
	return false
end

function SWEP:PrimaryAttack()
	if !self.LastReloadTime then self.LastReloadTime = 0 end
	if (CurTime() - self.LastReloadTime) < self.Primary.ReloadTime then return false end
	
	local trace = self.Owner:GetEyeTrace()

	if not IsValid(trace.Entity) or not trace.Entity:IsPlayer() or trace.Entity:GetPos():Distance(self.Owner:GetPos()) > 120 then
		return
	end

	for k,v in pairs(trace.Entity:GetWeapons()) do
		if v:IsValid() then
			if v:GetClass() ~= "weapon_rp_hands" then  -- don't count Hands
				self:HasSomething()
				self.LastReloadTime = CurTime()
				return
			end
		end
	end
	
	self:HasNothing() 
	self.LastReloadTime = CurTime()
	
	hook.Run("MUMetalDetector", self.Owner) -- Hook for revarding
end

function SWEP:Deploy()
	return true
end

local function GetColor(col)
	if string.len(col.x) > 3 then
		col.x = string.sub(col.x, 1, 4)
	end
	if string.len(col.y) > 3 then
		col.y = string.sub(col.y, 1, 4)
	end
	if string.len(col.z) > 3 then
		col.z = string.sub(col.z, 1, 4)
	end
					
	col.x = col.x * 255
	col.x = math.ceil(col.x)
				
	col.y = col.y * 255
	col.y = math.ceil(col.y)
				
	col.z = col.z * 255
	col.z = math.ceil(col.z)
	
	return col
end

function SWEP:HasSomething()
	if CLIENT then
		lcolor = GetColor(self.Owner:GetPlayerColor())
		scolor = GetColor(self.Owner:GetEyeTraceNoCursor().Entity:GetPlayerColor())
		
		// duplicating
		Translator:ClientPrint(5,
				Color(lcolor.x, lcolor.y, lcolor.z), self.Owner:GetBystanderName(),
				Color(255,255,255), ": ",
				Color(scolor.x, scolor.y, scolor.z), self.Owner:GetEyeTraceNoCursor().Entity:GetBystanderName(),
				Color(255,255,255), " ",
				Color(255,255,255), "translate.hasSomething"
		)
	end

	if SERVER then
		self.Owner:EmitSound("npc/combine_soldier/gear5.wav", 75, 100)
		timer.Simple(0.3, function() self.Owner:EmitSound("buttons/button3.wav", 75, 100) end)
	end
end

function SWEP:HasNothing()
	if CLIENT then
		lcolor = GetColor(self.Owner:GetPlayerColor())
		scolor = GetColor(self.Owner:GetEyeTraceNoCursor().Entity:GetPlayerColor())
		
		// duplicating
		chat.AddText(
			Color(lcolor.x, lcolor.y, lcolor.z), self.Owner:GetBystanderName(),
			Color(255,255,255), ": ",
			Color(scolor.x, scolor.y, scolor.z), self.Owner:GetEyeTraceNoCursor().Entity:GetBystanderName(),
			Color(255,255,255), " ",
			Color(255,255,255), "translate.hasNothing")
	end

	if SERVER then
		self.Owner:EmitSound("npc/combine_soldier/gear5.wav", 75, 100)
		timer.Simple(0.3, function() self.Owner:EmitSound("buttons/button2.wav", 75, 100) end)
	end
end

function SWEP:Holster()
	return true
end
