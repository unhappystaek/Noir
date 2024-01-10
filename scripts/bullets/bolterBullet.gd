extends Spatial

var damage: int = 45
var speed: int = 100

func _process(delta):
	translation += transform.basis * Vector3(0, 0, -speed) * delta




func _on_Timer_timeout():
	$".".queue_free()
