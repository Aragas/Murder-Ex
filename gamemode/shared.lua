GM.Name 	= "Murder-Ex"
GM.Author 	= "MechanicalMind, Aragas(Pinkie Arg) and Contributors"
// credits to Minty Fresh for some styling on the scoreboard
// credits to Waddlesworth for the logo and menu icon
GM.Email 	= ""
GM.Website 	= "https://github.com/Aragas/murder-extended"
GM.Version = "22"

GM.QMenuDelay = CreateConVar("mu_qmenu_delay", 0.7, bit.bor(FCVAR_NOTIFY, FCVAR_REPLICATED), "Delay for Q Menu use" )
GM.ShowAdminsOnScoreboard = CreateConVar("mu_scoreboard_show_admins", 1, bit.bor(FCVAR_REPLICATED), "Should show admins on scoreboard" )
GM.AdminPanelAllowed = CreateConVar("mu_allow_admin_panel", 1, bit.bor(FCVAR_NOTIFY, FCVAR_REPLICATED), "Should allow admins to use mu_admin_panel" )
GM.ShowSpectateInfo = CreateConVar("mu_show_spectate_info", 1, bit.bor(FCVAR_NOTIFY, FCVAR_REPLICATED), "Should show players name and color to spectators" )

function GM:SetupTeams()
	team.SetUp(1, translate.teamSpectators, Color(150, 150, 150))
	team.SetUp(2, translate.teamPlayers, Color(26, 120, 245))
end
GM:SetupTeams()
