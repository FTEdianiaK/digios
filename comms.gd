extends Control

signal kill

var con = true


func _ready():
	$WindowBarBG.color = Global.scheme + "ff"


func anim():
	con = true
	var twni
	var twnj
	var twnk
	var i = randi_range(1,45)
	var j = randi_range(1,45)
	while j == i:
		j = randi_range(1,45)
	var k = randi_range(1,45)
	while k == j or k == i:
		k = randi_range(1,45)
	while con:
		twni = create_tween()
		twnj = create_tween()
		twnk = create_tween()
		twni.tween_property(get_node("GridContainer/" + str(i)), "modulate", Color(Global.scheme), 2)
		twnj.tween_property(get_node("GridContainer/" + str(j)), "modulate", Color(Global.scheme), 2)
		twnk.tween_property(get_node("GridContainer/" + str(k)), "modulate", Color(Global.scheme), 2)
		await get_tree().create_timer(2.5).timeout
		twni.kill()
		twnj.kill()
		twnk.kill()
		twni = create_tween()
		twnj = create_tween()
		twnk = create_tween()
		twni.tween_property(get_node("GridContainer/" + str(i)), "modulate", Color("#333333"), 2)
		twnj.tween_property(get_node("GridContainer/" + str(j)), "modulate", Color("#333333"), 2)
		twnk.tween_property(get_node("GridContainer/" + str(k)), "modulate", Color("#333333"), 2)
		await get_tree().create_timer(2.5).timeout
		twni.kill()
		twnj.kill()
		twnk.kill()
		i += 1
		if i == 46:
			i = 1

		j += 1
		if j == 46:
			j = 1

		k += 1
		if k == 46:
			k = 1


func _on_close_pressed():
	con = false
	kill.emit()


func _on_texture_button_2_pressed():
	con = false
	$HBoxContainer3.show()
	$HBoxContainer2.hide()
	$HBoxContainer2/VBoxContainer/HBoxContainer/TextureButton.disabled = false
	$HBoxContainer2/VBoxContainer/HBoxContainer/TextureButton.modulate = "#ffffff"
	$HBoxContainer2/VBoxContainer/HBoxContainer/TextureButton2.disabled = false
	$HBoxContainer2/VBoxContainer/HBoxContainer/TextureButton2.modulate = "#ffffff"
	$HBoxContainer2/VBoxContainer/HBoxContainer2/TextureButton.hide()
	$HBoxContainer2/VBoxContainer/TextEdit.hide()


func _on_button_pressed():
	if $HBoxContainer2/VBoxContainer/TextEdit.is_visible_in_tree() == false:
		$HBoxContainer2/VBoxContainer/TextEdit.show()
	else:
		$HBoxContainer2/VBoxContainer/TextEdit.hide()


func _on_text_edit_text_changed():
	$HBoxContainer2/VBoxContainer/Button.text = $HBoxContainer2/VBoxContainer/TextEdit.text.to_upper()


func _on_button_2_pressed():
	anim()
	$HBoxContainer3.hide()
	$HBoxContainer2.show()
	$HBoxContainer2/VBoxContainer/Label.text = "Calling peer..."
	$HBoxContainer2/VBoxContainer/HBoxContainer/TextureButton.disabled = true
	$HBoxContainer2/VBoxContainer/HBoxContainer/TextureButton.modulate = "#999999"
	$HBoxContainer2/VBoxContainer/HBoxContainer/TextureButton2.disabled = true
	$HBoxContainer2/VBoxContainer/HBoxContainer/TextureButton2.modulate = "#999999"


func _on_button1_pressed():
	anim()
	$HBoxContainer2/VBoxContainer/Label.text = ""
	$HBoxContainer3.hide()
	$HBoxContainer2.show()
	$HBoxContainer2/VBoxContainer/HBoxContainer2/TextureButton.show()


func _on_texture_button_pressed():
	$HBoxContainer2/VBoxContainer/Label.text = "Encrypting call..."
	$HBoxContainer2/VBoxContainer/HBoxContainer2/TextureButton.hide()
