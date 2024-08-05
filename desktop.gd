extends Control

var qck = 0



func _ready():
	if Global.boot == "qck":
		$QuickBG.show()
		Global.scheme = "#000000"
		$TaskBG.color = "#0000009b"
		$AppList.hide()

		if Global.mode == "aut":
			$QuickTimer.start(randf_range(1.0, 2.0))
	else:
		$TaskBG.color = Global.scheme + "9b"
		change_wallpaper()

func change_wallpaper():
	var num = Global.wallpaper
	for i in range(1,4):
		get_node("Wallpaper" + str(i)).hide()
	get_node("Wallpaper" + str(num)).show()


func _on_menu_button_pressed():
	if $TaskBar/Padding2.is_visible_in_tree() == false:
		$TaskBar/Padding2.show()
		$TaskBar/ShutDown.show()
		$TaskBar/Restart.show()
		$TaskBar/Emergency.show()
	else:
		$TaskBar/Padding2.hide()
		$TaskBar/ShutDown.hide()
		$TaskBar/Restart.hide()
		$TaskBar/Emergency.hide()


func _on_quick_timer_timeout():
	qck += 1
	if qck == 1:
		$AppList.show()
		$QuickTimer.start(randf_range(1.0, 2.0))
	elif qck == 2:
		Global.scheme_update()
		$TaskBG.color = Global.scheme + "9b"
		$QuickTimer.start(randf_range(1.0, 2.0))
	elif qck == 3:
		$QuickBG.hide()
		change_wallpaper()


func _on_notepad_button_pressed():
	$Notepad.show()
	$AppList.hide()


func _on_kill():
	$Notepad.hide()
	$Wallpaper.hide()
	$Database.hide()
	$Comms.hide()
	$Chat.hide()
	$Radar.hide()
	$Hacker.hide()
	$Pixel.hide()
	$AppList.show()


func _process(delta):
	if Global.mode == "mnl":
		if Input.is_action_just_pressed("mnl_next"):
			if qck != 3:
				qck += 1
				manual_change()
		elif Input.is_action_just_pressed("mnl_prev"):
			qck -= 1
			if qck == -1:
				get_tree().change_scene_to_file("res://boot.tscn")
			else:
				manual_change()

func manual_change():
	if qck == 0:
		$AppList.hide()
	elif qck == 1:
		$AppList.show()
		Global.scheme = "#000000"
		$TaskBG.color = "#0000009b"
	elif qck == 2:
		Global.scheme_update()
		$TaskBG.color = Global.scheme + "9b"
		$QuickBG.show()
	elif qck == 3:
		$QuickBG.hide()


func _on_shut_down_pressed():
	get_tree().quit()


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://BIOS.tscn")


func _on_emergency_pressed():
	get_tree().change_scene_to_file("res://emergency.tscn")


func _on_wallpaper_button_pressed():
	$Wallpaper.show()
	$AppList.hide()


func _on_wallpaper_wallpaper(num):
	$Wallpaper.hide()
	Global.wallpaper = num
	change_wallpaper()
	$AppList.show()


func _on_database_button_pressed():
	$Database.show()
	$Database.beready()
	$AppList.hide()


func _on_comms_button_pressed():
	$Comms.show()
	$AppList.hide()


func _on_chat_button_pressed():
	$Chat.show()
	$AppList.hide()


func _on_radar_button_pressed():
	$Radar.show()
	$AppList.hide()
	$Radar.anim()


func _on_hacker_button_pressed():
	$Hacker.show()
	$AppList.hide()
	$Hacker.beready()


func _on_pixel_button_pressed():
	$Pixel.show()
	$AppList.hide()
