extends Control

signal kill



func _ready():
	$WindowBarBG.color = Global.scheme + "ff"


func _on_close_pressed():
	kill.emit()


func _on_button_pressed():
	if $VBoxContainer/TextEdit2.is_visible_in_tree() == false:
		$VBoxContainer/TextEdit2.show()
	else:
		$VBoxContainer/TextEdit2.hide()


func _on_text_edit_2_text_changed():
	$VBoxContainer/Button.text = $VBoxContainer/TextEdit2.text.to_upper()


func _on_button_send_pressed():
	var d = $VBoxContainer/HBoxContainer/TextEdit.text
	if ":" in d:
		d = d.split(":", false, 1)
		$VBoxContainer/HBoxContainer/TextEdit.text = ""
		$VBoxContainer/ScrollContainer/Label.text += d[0].to_upper() + ": " + d[1] + "\n"
	else:
		$VBoxContainer/HBoxContainer/TextEdit.text = ""
		$VBoxContainer/ScrollContainer/Label.text += "ME: " + d + "\n"


func _on_trash_pressed():
	$VBoxContainer/ScrollContainer/Label.text = ""
