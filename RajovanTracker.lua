if not file_manager:directory_exists("RajovanTracker") then
    file_manager:create_directory("RajovanTracker")
end

data = menu:add_category("Data Mining")
getdata = menu:add_checkbox("Test", data, 0)

do
    local function AutoUpdate()
		local Version = 0.5
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

function on_tick()
	if menu:get_value(getdata) == 1 then
		-- START DOWNLOAD
		--console:log("DOWNLOADING")
		filepathdownload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/download.vbs"
		local handle = io.popen(filepathdownload)
		handle:close()
		--console:log("DOWNLOADING DONE")
		
		-- WRITING
		filepath = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/stats.txt"
		file = io.open(filepath, "a+")

		--console:log("WRITING")
		file:write("\nChampion = " ..game.local_player.champ_name.. "; Kills = "..game.local_player.player_stats.kills.. "; Deaths = "..game.local_player.player_stats.deaths.. "; Assists = "..game.local_player.player_stats.assists.. "; Farm = "..game.local_player.player_stats.creepscore.. "; Scripts = ")
		file:close()
		--console:log("WRITING DONE")
		
		-- START UPLOAD
		--console:log("START UPLOAD")
		filepathupload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/upload.vbs"
		local handle = io.popen(filepathupload)
		handle:close()
		console:log("UPLOAD DONE")
	
		-- REMOVING TEMP FILES
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
		
		menu:set_value(getdata, 0)
	end
end

client:set_event_callback("on_tick", on_tick)
