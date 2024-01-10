extends Spatial


var speed: int = 15
var damage: int = 35

func _process(delta):
	translation += transform.basis * Vector3(0, 0, -speed) * delta
	$Spatial.rotation.y += delta * 5




func _on_Timer_timeout():
	$".".queue_free()
