resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'




client_scripts {
    "src/RageUI/client/RMenu.lua",
    "src/RageUI/client/menu/RageUI.lua",
    "src/RageUI/client/menu/Menu.lua",
    "src/RageUI/client/menu/MenuController.lua",
    "src/RageUI/client/components/*.lua",
    "src/RageUI/client/menu/elements/*.lua",
    "src/RageUI/client/menu/items/*.lua",
    "src/RageUI/client/menu/panels/*.lua",
    "src/RageUI/client/menu/windows/*.lua",
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'@es_extended/locale.lua',
	"server.lua",

}

client_scripts {
	'@es_extended/locale.lua',
	
	"client.lua",
	"menu.lua"



}





