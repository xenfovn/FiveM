fx_version 'cerulean'
game 'gta5'

description 'QB-iFruitStore'
version '1.0.0'

ui_page "html/index.html"

client_scripts {
    'client/main.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua',
    'config.lua'
}

files {
    'html/*',
}