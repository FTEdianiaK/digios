extends Control

var stage = 0
var step = 0
var steps = ["~ CHECKING MOTHERBOARD INTEGRITY ~", "~ POPULATING RANDOM ACCESS MEMORY ~", "~ OPENING FILE SYSTEM ~", "~ DECYPHERING HARD DRIVE ~", "~ TESTING OVERCLOCKING CAPABILITY ~", "~ OVERHEATING! STARTING FANS ~", "~ ~ DONE! WELCOME TO DIGIOS ~ ~"]



func _ready():
	$CMD.text = "* * * * * *  DIGIOS   -  v0.7  * * * * * *\n\nSOFTWARE DISTRIBUTION F_TEK\n\nPROCESSOR ONLINE, LOADING SYS/INF:\nsys/inf v" + Engine.get_version_info()["string"].to_upper() + "\n" + Global.bios.to_upper() + " bootloader\nrunning on " + OS.get_name().to_upper() + " v" + str(OS.get_version()) + "\nusing " + str(OS.get_processor_count()) + " threads\n" + OS.get_video_adapter_driver_info()[0].to_upper() + " graphics ready\n\nENABLING GRAPHICS..."
	$CMD.visible_ratio = 0
	$Animation.scale.x = self.size.x / 640
	$Animation.position.y = ((self.size.y - ($Animation.scale.y * 360)) /2)

	if Global.boot == "qck":
		$Animation.stop()
		$Animation.play("qck_start")

func _on_animation_animation_finished():
	if Global.mode != "mnl":
		if $Animation.animation == "start":
			$Animation.animation = "load"
			$Animation.frame = (randi_range(1,6)*4-1)
			$Animation.play()
			$LoadTimer.start(randf_range(2.0,4.0))
		elif $Animation.animation == "qck_start":
			await get_tree().create_timer(0.2).timeout
			get_tree().change_scene_to_file("res://desktop.tscn")


func _on_load_timer_timeout():
	if Global.boot == "reg":
		get_tree().change_scene_to_file("res://desktop.tscn")
	else:
		$Animation.hide()
		$CMDTimer.start()


func _on_cmd_timer_timeout():
	$CMD.visible_ratio += 0.005
	if $CMD.visible_ratio == 1 and Global.mode == "aut":
		await get_tree().create_timer(1.0).timeout
		$CMDTimer.stop()
		$CMD.hide()
		$ProgressStatus.text = steps[step]
		$ProgressStatus.show()
		$Progress.show()
		$ProgressTimer.start(randf_range(1.0,3.0))
	elif $CMD.visible_ratio == 1 and Global.mode == "mnl":
		$CMDTimer.stop()


func _on_progress_timer_timeout():
	step += 1
	$Progress.value = step
	$ProgressStatus.text = steps[step]
	$ProgressTimer.start(randf_range(1.0,3.0))
	if step == 6:
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://desktop.tscn")


func _process(delta):
	if Global.mode == "mnl":
		if Input.is_action_just_pressed("mnl_next"):
			if stage != 3:
				stage += 1
			else:
				step += 1
				if step == 7:
					get_tree().change_scene_to_file("res://desktop.tscn")

			manual_change()
		elif Input.is_action_just_pressed("mnl_prev"):
			if stage != 3:
				stage -= 1
				if stage == -1:
					get_tree().change_scene_to_file("res://BIOS.tscn")
			else:
				step -= 1
				if step == -1:
					step = 0
					stage -= 1

			manual_change()


func manual_change():
	if stage == 0:
		$Animation.animation = "start"
		$Animation.frame = 0
		$Animation.play()
	elif stage == 1:
		if Global.boot == "qck":
			get_tree().change_scene_to_file("res://desktop.tscn")

		$Animation.show()
		$Animation.animation = "load"
		$Animation.frame = (randi_range(1,6)*4-1)
		$Animation.play()
		$CMDTimer.stop()
		$CMD.visible_ratio = 0
	elif stage == 2 and Global.boot == "reg":
		get_tree().change_scene_to_file("res://desktop.tscn")
	elif stage == 2 and Global.boot == "fir":
		$CMD.visible_ratio = 0
		$Animation.hide()
		$CMDTimer.start()
		$CMD.show()
		$ProgressStatus.hide()
		$Progress.hide()
	elif stage == 3 and step != 7:
		$CMD.visible_ratio = 0
		$CMD.hide()
		$Progress.value = step
		$ProgressStatus.text = steps[step]
		$ProgressStatus.show()
		$Progress.show()
