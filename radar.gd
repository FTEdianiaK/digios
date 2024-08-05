extends Control

signal kill

var con = true



func _ready():
	$WindowBarBG.color = Global.scheme + "ff"


func anim():
	con = true
	var twn
	await get_tree().create_timer(2).timeout
	while con:
		twn = create_tween()
		twn.tween_property($HBoxContainer2/Control/Radar, "color", Color("#00000064"), 0.5)
		await get_tree().create_timer(1).timeout
		twn.kill()
		twn = create_tween()
		twn.tween_property($HBoxContainer2/Control/Radar, "color", Color("#00000000"), 0.5)
		await get_tree().create_timer(4.5).timeout
		twn.kill()


func _on_close_pressed():
	kill.emit()
	con = false


func _on_button_1_pressed():
	$HBoxContainer2/Control/Map1.show()
	$HBoxContainer2/Control/Map2.hide()


func _on_button_2_pressed():
	$HBoxContainer2/Control/Map1.hide()
	$HBoxContainer2/Control/Map2.show()
