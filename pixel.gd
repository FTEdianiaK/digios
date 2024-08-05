extends Control

signal kill

var f = 0



func _ready():
	$Pixel.scale.y = self.size.y / 1024
	$Pixel.scale.x = $Pixel.scale.y
	$Pixel.position.x = ((self.size.x - ($Pixel.scale.x * 1024)) /2)


func _on_close_pressed():
	emit_signal("kill")


func _on_next_pressed():
	f += 1
	if f == 16:
		f = 0

	$Pixel.frame = f
