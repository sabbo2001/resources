resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Identity (criminalist)'

version '1.2.5'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/script.js',
	'html/style.css',
	'html/vendor/mdi-font/css/material-design-iconic-font.min.css',
	'html/vendor/font-awesome-4.7/css/font-awesome.min.css',
	'html/vendor/select2/select2.min.css',
	'html/vendor/datepicker/daterangepicker.css',
	'html/css/main.css',
	'html/vendor/jquery/jquery.min.js',
	'html/vendor/select2/select2.min.js',
	'html/vendor/datepicker/moment.min.js',
	'html/vendor/datepicker/daterangepicker.js',
	'html/img/bg.jpg',
	'html/img/bg1.jpg',
	'html/img/bg2.jpg',
	'html/img/bg3.jpg',
	'html/img/cursor.png',
}

dependency 'es_extended'