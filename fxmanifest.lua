fx_version 'cerulean'
game 'gta5'

description 'QB-vehiclecontrol'
version '1.0.0'

shared_scripts {
	'config.lua'
} 
server_script 'server/*.lua'
client_scripts {
	'client/*.lua'
}

ui_page {
    'html/index.html',
}

files {
	'html/index.html',
	'html/script.js', 
	'html/style.css',
}



-- data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
--data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'
-- data_file 'COMBAT_BEHAVIOUR_OVERRIDE_FILE' 'combatbehaviour.meta'
--data_file 'HANDLING_FILE' 'handling.meta'



exports {
	--'HasHarness'
}

lua54 'yes'