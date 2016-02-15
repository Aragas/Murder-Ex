local taunts = {}

function addTaunt(cat, soundFile, sex)
	if !taunts[cat] then
		taunts[cat] = {}
	end
	if !taunts[cat][sex] then
		taunts[cat][sex] = {}
	end
	local t = {}
	t.sound = soundFile
	t.sex = sex
	t.category = cat
	table.insert(taunts[cat][sex], t)
end

// male
addTaunt("help", "vo/npc/male/help/help01.wav", "male")

addTaunt("scream", "vo/npc/male/scream/gordead_ans05.wav", "male")
addTaunt("scream", "vo/npc/male/scream/no02.wav", "male")
addTaunt("scream", "vo/npc/male/scream/runforyourlife01.wav", "male")
addTaunt("scream", "vo/npc/male/scream/runforyourlife02.wav", "male")
addTaunt("scream", "vo/npc/male/scream/watchout.wav", "male")

addTaunt("morose", "vo/npc/male/morose/gordead_ans02.wav", "male")
addTaunt("morose", "vo/npc/male/morose/question12.wav", "male")
addTaunt("morose", "vo/npc/male/morose/question20.wav", "male")
addTaunt("morose", "vo/npc/male/morose/question25.wav", "male")

addTaunt("funny", "vo/npc/male/funny/gordead_ans07.wav", "male")
addTaunt("funny", "vo/npc/male/funny/question02.wav", "male")
addTaunt("funny", "vo/npc/male/funny/question06.wav", "male")
addTaunt("funny", "vo/npc/male/funny/question19.wav", "male")

addTaunt("death", "vo/npc/male/death/answer11.wav", "male")
addTaunt("death", "vo/npc/male/death/goodgod.wav", "male")
addTaunt("death", "vo/npc/male/death/gordead_ans04.wav", "male")
addTaunt("death", "vo/npc/male/death/gordead_ans08.wav", "male")

// female
addTaunt("help", "vo/npc/female/help/help01.wav", "female")

addTaunt("scream", "vo/npc/female/scream/gordead_ans05.wav", "female")
addTaunt("scream", "vo/npc/female/scream/no02.wav", "female")
addTaunt("scream", "vo/npc/female/scream/runforyourlife01.wav", "female")
addTaunt("scream", "vo/npc/female/scream/runforyourlife02.wav", "female")
addTaunt("scream", "vo/npc/female/scream/watchout.wav", "female")

addTaunt("morose", "vo/npc/female/morose/gordead_ans02.wav", "female")
addTaunt("morose", "vo/npc/female/morose/question12.wav", "female")
addTaunt("morose", "vo/npc/female/morose/question20.wav", "female")
addTaunt("morose", "vo/npc/female/morose/question25.wav", "female")

addTaunt("funny", "vo/npc/female/funny/gordead_ans07.wav", "female")
addTaunt("funny", "vo/npc/female/funny/question02.wav", "female")
addTaunt("funny", "vo/npc/female/funny/question06.wav", "female")
addTaunt("funny", "vo/npc/female/funny/question19.wav", "female")

addTaunt("death", "vo/npc/female/death/answer11.wav", "female")
addTaunt("death", "vo/npc/female/death/goodgod.wav", "female")
addTaunt("death", "vo/npc/female/death/gordead_ans04.wav", "female")
addTaunt("death", "vo/npc/female/death/gordead_ans08.wav", "female")

concommand.Add("mu_taunt", function (ply, com, args, full)
	if ply.LastTaunt && ply.LastTaunt > CurTime() then return end
	if !ply:Alive() then return end
	if ply:Team() != 2 then return end

	if #args < 1 then return end
	local cat = args[1]:lower()
	if !taunts[cat] then return end

	local sex = string.lower(ply.ModelSex or "male")
	if !taunts[cat][sex] then return end

	local taunt = table.Random(taunts[cat][sex])
	ply:EmitSound(taunt.sound)

	ply.LastTaunt = CurTime() + SoundDuration(taunt.sound) + 0.3
end)