extends Spatial


var damage: float = 0.45
var speed: int = 20
var phase: int = 0

func _process(delta):
	translation += transform.basis * Vector3(0, 0, -speed) * delta


func _on_look_timeout():
	
	if phase == 1:
		damage = 0.3
		speed = 35
		$".".look_at($"../../player/head/Camera".global_transform.origin, Vector3.UP)
	if phase == 2:
		$".".queue_free()
		
	phase += 1
