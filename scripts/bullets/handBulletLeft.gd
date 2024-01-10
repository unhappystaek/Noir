extends Spatial


var speed: int = 25
var damage: int = 5

func _process(delta):
	translation += transform.basis * Vector3(0, 0, -speed) * delta

func _on_Area_body_entered(body):
	$".".queue_free()


func _on_Timer_timeout():
	$".".queue_free()
