extends Control

var paused: bool = false

func _ready():
	$TextureRect.visible = true

func _on_Timer_timeout():
	$AnimationPlayer.play("fadeUI")
	

func _unhandled_input(event):
	
	if event.is_action_pressed("pause"):
		
		if paused == false:
			paused = true
			#get_tree().paused = true
			$pause.visible = true
			$pause/resume.grab_focus()
		else:
			paused = false
			#get_tree().paused = false
			$pause.visible = false
			


func _on_resume_button_down():
	$pause.visible = false
	paused = false


func _on_Quit_button_down():
	get_tree().change_scene("res://scenes/trueScenes/mainMenu.tscn")
