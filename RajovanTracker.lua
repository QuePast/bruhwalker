if not file_manager:directory_exists("RajovanTracker") then
    file_manager:create_directory("RajovanTracker")
end

do
    local function AutoUpdate()
		local Version = 0.6
		local web_version = http:get("https://raw.githubusercontent.com/QuePast/bruhwalker/main/RajovanTracker/RajovanTracker.lua.version.txt")
		if tonumber(web_version) ~= Version then
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/RajovanTracker/download.vbs", "RajovanTracker//download.vbs")
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/RajovanTracker/download.exe", "RajovanTracker//download.exe")
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/RajovanTracker/upload.vbs", "RajovanTracker//upload.vbs")
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/RajovanTracker/upload.exe", "RajovanTracker//upload.exe")
			http:download_file("https://raw.githubusercontent.com/QuePast/bruhwalker/main/RajovanTracker.lua", "RajovanTracker.lua")	
		end
    end
    AutoUpdate()
end

function on_game_end()
	--console:log("DOWNLOADING")
	filepathdownload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/download.vbs"
	local handle = io.popen(filepathdownload)
	handle:close()
	--console:log("DOWNLOADING DONE")
	
	--console:log("WRITING")
	filepath = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/stats.txt"
	file = io.open(filepath, "a+")

	file:write("\nChampion = " ..game.local_player.champ_name.. "; Kills = "..game.local_player.player_stats.kills.. "; Deaths = "..game.local_player.player_stats.deaths.. "; Assists = "..game.local_player.player_stats.assists.. ";; CS = "..game.local_player.player_stats.creepscore.. " Time = "..game.game_time.. "; Region = "..mission_info.region.. "; Map_Name = "..mission_info.map_name.. "; Mission = "..mission_info.mission.. "; Mode = "..mission_info.mode.. "; Map_id = "..mission_info.map_id.. "; Scripts = ")
	file:close()
	--console:log("WRITING DONE")
	
	--console:log("START UPLOAD")
	filepathupload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/upload.vbs"
	local handle = io.popen(filepathupload)
	handle:close()
	--console:log("UPLOAD DONE")
	
	--console:log("REMOVING TEMP FILES")
	tempd = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/tempd.txt"		
	tempu = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/tempu.txt"
	input = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/input.txt"
	stats = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/stats.txt"

	os.remove(tempd)
	os.remove(tempu)
	os.remove(input)
	os.remove(stats)
	--console:log("REMOVING TEMP FILES DONE")
end

client:set_event_callback("on_game_end", on_game_end)
