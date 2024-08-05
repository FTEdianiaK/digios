extends Control



func _ready():
	if Global.bios == "digi":
		$IcoDigi.show()
	elif Global.bios == "xyz":
		$IcoXYZ.show()
	elif Global.bios == "t":
		$IcoChT.show()

	if Global.mode == "aut":
		$ProgressTimer.start(randf())

	type_update()


func _on_progress_timer_timeout():
	$Progress.value += 1
	$ProgressTimer.start(randf())
	if $Progress.value == 10:
		get_tree().change_scene_to_file("res://boot.tscn")


func type_update():
	$TypeLabel.text = Global.boot.to_lower() + "/" + Global.mode.to_lower()


func _process(delta):
	if Input.is_action_just_pressed("uefi"):
		$Progress.value = 0
		$ProgressTimer.stop()
		$PopUp.show()

	if Input.is_action_just_pressed("ui_accept"):
		if Global.boot == "fir":
			Global.boot = "reg"
			type_update()
		elif Global.boot == "reg":
			Global.boot = "qck"
			type_update()
		elif Global.boot == "qck":
			Global.boot = "fir"
			type_update()
	
	if Input.is_action_just_pressed("ui_end"):
		if Global.mode == "aut":
			Global.mode = "mnl"
			type_update()
			$Progress.value = 0
			$ProgressTimer.stop()
		else:
			Global.mode = "aut"
			type_update()
			$Progress.value = 0
			$ProgressTimer.start(randf())

	if Global.mode == "mnl":
		if Input.is_action_just_pressed("mnl_next"):
			if $Progress.value == 10:
				get_tree().change_scene_to_file("res://boot.tscn")
			$Progress.value += 1
		elif Input.is_action_just_pressed("mnl_prev"):
			if $Progress.value != 0:
				$Progress.value -= 1

func _on_boot_digios_pressed():
	Global.bios = "digi"
	Global.scheme_update()
	$IcoDigi.show()
	$IcoXYZ.hide()
	$IcoChT.hide()
	$PopUp.hide()
	
	if Global.mode == "aut":
		$ProgressTimer.start(randf())


func _on_boot_xyz_pressed():
	Global.bios = "xyz"
	Global.scheme_update()
	$IcoDigi.hide()
	$IcoXYZ.show()
	$IcoChT.hide()
	$PopUp.hide()
	
	if Global.mode == "aut":
		$ProgressTimer.start(randf())


func _on_boot_ch_t_pressed():
	Global.bios = "t"
	Global.scheme_update()
	$IcoDigi.hide()
	$IcoXYZ.hide()
	$IcoChT.show()
	$PopUp.hide()
	
	if Global.mode == "aut":
		$ProgressTimer.start(randf())
