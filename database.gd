extends Control

signal kill

var con = false



func _ready():
	$WindowBarBG.color = Global.scheme + "ff"


func beready():
	con = false
	$Content/VBoxContainer/ColorRect.color = "#9b0000"
	$Content/VBoxContainer/ColorRect/Label.text = "ENSURING SECURE CONNECTION"
	$Content/VBoxContainer/Connect.show()
	$Content/VBoxContainer/Database.hide()
	$Content/VBoxContainer/Index.hide()
	$Content/VBoxContainer/Match.hide()
	$Content/VBoxContainer2.hide()
	await get_tree().create_timer(randf_range(1.5,2.5)).timeout
	$Content/VBoxContainer/Connect.hide()
	$Content/VBoxContainer2.show()
	con = true


func _on_close_pressed():
	kill.emit()


func matched(case, type):
	$Content/VBoxContainer/ColorRect.color = "#009b9b"
	$Content/VBoxContainer/ColorRect/Label.text = "DATABASE MATCH FOUND"
	$Content/VBoxContainer/Database.hide()
	$Content/VBoxContainer/Index.hide()
	$Content/VBoxContainer/Match.show()
	$Content/VBoxContainer2/Class.text = type + " #" + Marshalls.utf8_to_base64(case).to_upper().rstrip("=")


func _process(delta):
	if con == true:
		if $Content/VBoxContainer2/TextEdit.text == "":
			$Content/VBoxContainer/ColorRect.color = "#9b9b00"
			$Content/VBoxContainer/ColorRect/Label.text = "SECURELY CONNECTED TO THE DATABASE"
			$Content/VBoxContainer/Database.show()
			$Content/VBoxContainer/Index.hide()
			$Content/VBoxContainer/Match.hide()
			$Content/VBoxContainer2/Class.text = ""
			$Content/VBoxContainer2/ScrollContainer/File.text = ""
		elif "time" in $Content/VBoxContainer2/TextEdit.text.to_lower() and "boy" in $Content/VBoxContainer2/TextEdit.text.to_lower():
			matched("timeman", "Agent")
			$Content/VBoxContainer2/ScrollContainer/File.text = Archive.timeboy
		elif "molecule" in $Content/VBoxContainer2/TextEdit.text.to_lower() and "girl" in $Content/VBoxContainer2/TextEdit.text.to_lower():
			matched("moleculegirl", "Agent")
			$Content/VBoxContainer2/ScrollContainer/File.text = Archive.moleculegirl
		elif "time" in $Content/VBoxContainer2/TextEdit.text.to_lower() and "friend" in $Content/VBoxContainer2/TextEdit.text.to_lower():
			matched("timefriend", "Agent")
			$Content/VBoxContainer2/ScrollContainer/File.text = Archive.timefriend
		elif "x" in $Content/VBoxContainer2/TextEdit.text.to_lower() and "stop" in $Content/VBoxContainer2/TextEdit.text.to_lower():
			matched("xstop", "Podsekce")
			$Content/VBoxContainer2/ScrollContainer/File.text = Archive.xstop
		else:
			$Content/VBoxContainer/ColorRect.color = "#009b00"
			$Content/VBoxContainer/ColorRect/Label.text = "STUDYING THE DATABASE INDEX"
			$Content/VBoxContainer/Database.hide()
			$Content/VBoxContainer/Index.show()
			$Content/VBoxContainer/Match.hide()
			$Content/VBoxContainer2/Class.text = ""
			$Content/VBoxContainer2/ScrollContainer/File.text = ""
