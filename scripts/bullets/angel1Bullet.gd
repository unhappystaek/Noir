extends Spatial


var damage: float = 0.15
var speed: int = 70

func _process(delta):
	translation += transform.basis * Vector3(0, 0, -speed) * delta


func _on_Timer_timeout():
	$".".queue_free()
