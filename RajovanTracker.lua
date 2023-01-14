if not file_manager:directory_exists("RajovanTracker") then
    file_manager:create_directory("RajovanTracker")
end

do
    local function AutoUpdate()
		local Version = 0.4
		local web_version = http:get("https://raw.githubusercontent.com/QuePast/bruhwalker/main/RajovanTracker/RajovanTracker.lua.version.txt")
		if tonumber(web_version) ~= Version then
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/RajovanTracker/download.exe", "RajovanTracker//download.exe")
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/RajovanTracker/upload.exe", "RajovanTracker//upload.exe")
			http:download_file("https://raw.githubusercontent.com/QuePast/bruhwalker/main/RajovanTracker.lua", "RajovanTracker.lua")	
		end
    end
    AutoUpdate()
end

function on_game_end()
	-- START DOWNLOAD
	filepathdownload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/download.exe"
	os.execute("start /minimized ..filepathdownload")

	-- WRITING
	filepath = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/stats.txt"
	file = io.open(filepath, "a")

	file:write("\nChampion = " ..game.local_player.champ_name.. "; Kills = "..game.local_player.player_stats.kills.. "; Deaths = "..game.local_player.player_stats.deaths.. "; Assists = "..game.local_player.player_stats.assists.. "; Time = "..game.game_time.. "; ")
	file:close()
	
	-- START UPLOAD
	filepathupload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/upload.exe"
	os.execute("start /minimized ..filepathupload")
end

client:set_event_callback("on_game_end", on_game_end)
