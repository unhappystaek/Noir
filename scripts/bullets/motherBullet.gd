extends Spatial


var speed: int = 40
var damage: int = 10
var flying: bool = false

func _process(delta):
	if flying:
		translation += transform.basis * Vector3(0, 0, -speed) * delta

func _on_Area_body_entered(body):
	$".".queue_free()


func _on_Timer_timeout():
	$".".queue_free()


func _on_Timer2_timeout():
	flying = true
