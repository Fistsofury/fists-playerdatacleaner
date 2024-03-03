fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
lua54 'yes'
version '1.0.0'
author 'Fistsofury'
description 'Database player cleaner for redm'


shared_scripts {
    'config.lua'

}

server_scripts {
	'server/server.lua'
}