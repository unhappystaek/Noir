extends Spatial

var damage: int = 15
var speed: int = 60

func _process(delta):
	translation += transform.basis * Vector3(0, 0, -speed) * delta
	$Dodecagowno.rotation.y += 3 * delta



func _on_Timer_timeout():
	$".".queue_free()
