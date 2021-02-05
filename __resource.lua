--script-by-benny70--

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Basic Needs'

version '1.0.1'

server_scripts {
	'pl.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'pl.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'esx_status'
}
