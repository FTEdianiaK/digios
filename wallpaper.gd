extends Control

signal kill
signal wallpaper



func _ready():
	$WindowBarBG.color = Global.scheme + "ff"


func _on_close_pressed():
	kill.emit()


func _on_1_pressed():
	wallpaper.emit(1)


func _on_2_pressed():
	wallpaper.emit(2)


func _on_3_pressed():
	wallpaper.emit(3)
