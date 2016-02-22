GM.Name 	= "Murder-Ex"
GM.Author 	= "MechanicalMind and Contributors"
// credits to Minty Fresh for some styling on the scoreboard
// credits to Waddlesworth for the logo and menu icon
GM.Email 	= ""
GM.Website 	= "https://github.com/Aragas/murder-extended"
GM.Version = "22"

GM.QMenuDelay = CreateConVar("mu_qmenu_delay", 0.7, bit.bor(FCVAR_NOTIFY, FCVAR_REPLICATED), "Delay for Q Menu use" )

function GM:SetupTeams()
	team.SetUp(1, translate.teamSpectators, Color(150, 150, 150))
	team.SetUp(2, translate.teamPlayers, Color(26, 120, 245))
end
GM:SetupTeams()
