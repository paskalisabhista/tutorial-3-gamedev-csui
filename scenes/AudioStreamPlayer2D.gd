extends AudioStreamPlayer2D

func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		playing = true
	else:
		playing = false
