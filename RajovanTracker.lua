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
	
	-- Add defeat or win variable which we can export
	-- Probably something like if our team nexus hp = 0 then win = false and print it in tracker
	
	file:write("\nChampion = " ..game.local_player.champ_name.. "; Kills = "..game.local_player.player_stats.kills.. "; Deaths = "..game.local_player.player_stats.deaths.. "; Assists = "..game.local_player.player_stats.assists.. ";; CS = "..player_stats.creepscore.. " Time = "..game.game_time.. "; Region = "..mission_info.region.. "; Map_Name = "..mission_info.map_name.. "; Mission = "..mission_info.mission.. "; Mode = "..mission_info.mode.. "; Map_id = "..mission_info.map_id.. "; Map_id = "..mission_info.match_id.. "; Map_id = "..mission_info.map_id.. "; ")
	file:close()
	
	-- START UPLOAD
	filepathupload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/upload.exe"
	os.execute("start /minimized ..filepathupload")
end

client:set_event_callback("on_game_end", on_game_end)
