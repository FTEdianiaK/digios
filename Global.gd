extends Node

# Modifies the BIOS logo // digi, xyz, t
var bios = "digi"

# Modifies the booting animation // reg, qck, fir
var boot = "fir"

# Switches the movement mode // mnl, aut
var mode = "aut"
var scheme = "#cc5252"

# Keeps the desktop wallpaper // 1, 2, 3
var wallpaper = 1



func _ready():
	if FileAccess.file_exists("user://window.lock"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(Vector2i(1280, 720))
		DisplayServer.window_set_position(Vector2i(DisplayServer.screen_get_size().x*0.5-DisplayServer.window_get_size().x*0.5,DisplayServer.screen_get_size().y*0.5-DisplayServer.window_get_size().y*0.5))



func scheme_update():
	if bios == "digi":
		scheme = "#000000"
	elif bios == "xyz":
		scheme = "#52b8cc"
	elif bios == "cht":
		scheme = "#cc5252"
