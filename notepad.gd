extends Control

signal kill



func _ready():
	$WindowBarBG.color = Global.scheme + "ff"
	if FileAccess.file_exists("user://notepad.txt"):
		$TextEdit.text = FileAccess.get_file_as_string("user://notepad.txt")


func _on_close_pressed():
	var f = FileAccess.open("user://notepad.txt", FileAccess.WRITE)
	f.store_string($TextEdit.text)
	f.close()
	kill.emit()
