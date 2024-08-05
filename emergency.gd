extends Control

var step = 0
var con = true



func _ready():
	anim()


func _on_button_pressed():
	if step == 0:
		step += 1
		$HBoxContainer/VBoxContainer/HBoxContainer/Button.disabled = true
	else:
		step = 0
		$HBoxContainer/VBoxContainer/HBoxContainer/Button.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button2.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button3.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button4.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button5.disabled = false


func _on_button_2_pressed():
	if step == 2:
		step += 1
		$HBoxContainer/VBoxContainer/HBoxContainer/Button2.disabled = true
	else:
		step = 0
		$HBoxContainer/VBoxContainer/HBoxContainer/Button.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button2.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button3.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button4.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button5.disabled = false


func _on_button_3_pressed():
	if step == 4:
		step += 1
		$HBoxContainer/VBoxContainer/HBoxContainer/Button3.disabled = true
	else:
		step = 0
		$HBoxContainer/VBoxContainer/HBoxContainer/Button.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button2.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button3.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button4.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button5.disabled = false


func _on_button_4_pressed():
	if step == 3:
		step += 1
		$HBoxContainer/VBoxContainer/HBoxContainer/Button4.disabled = true
	else:
		step = 0
		$HBoxContainer/VBoxContainer/HBoxContainer/Button.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button2.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button3.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button4.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button5.disabled = false


func _on_button_5_pressed():
	if step == 1:
		step += 1
		$HBoxContainer/VBoxContainer/HBoxContainer/Button5.disabled = true
	else:
		step = 0
		$HBoxContainer/VBoxContainer/HBoxContainer/Button.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button2.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button3.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button4.disabled = false
		$HBoxContainer/VBoxContainer/HBoxContainer/Button5.disabled = false


func _on_button_l_pressed():
	$TimerL.start(randf())


func _on_button_r_pressed():
	$TimerR.start(randf())


func anim():
	con = true
	var twn
	await get_tree().create_timer(4).timeout
	while con:
		twn = create_tween()
		twn.tween_property($ColorRect, "color", Color("#400a0a"), 3.5)
		await get_tree().create_timer(4.5).timeout
		twn.kill()
		twn = create_tween()
		twn.tween_property($ColorRect, "color", Color("#ff2929"), 3.5)
		await get_tree().create_timer(8.5).timeout
		twn.kill()


func _process(delta):
	if $HBoxContainer/VSlider.value == 10 and $HBoxContainer/VSlider2.value == 20 and $HBoxContainer/VSlider3.value == 30 and $HBoxContainer/VSlider4.value == 40 and step == 5 and $HBoxContainer/VBoxContainer/HBoxContainer2/ButtonL.disabled == true and $HBoxContainer/VBoxContainer/HBoxContainer2/ButtonR.disabled == true:
		con = false
		var d = DirAccess.open("user://")
		d.remove("emergency.lock")
		get_tree().change_scene_to_file("res://BIOS.tscn")


func _on_timer_l_timeout():
	$HBoxContainer/VBoxContainer/HBoxContainer2/ButtonL.disabled = true


func _on_timer_r_timeout():
	$HBoxContainer/VBoxContainer/HBoxContainer2/ButtonR.disabled = true
