extends Spatial


var hp: int = 60
var bullet = load("res://scenes/prefabScenes/bullets/somethingBullet.tscn")
var instance

func _process(delta):

	$".".look_at($"../../player/head/Camera".global_transform.origin, Vector3.UP)
	


func _on_Area_area_entered(area):
	if area.is_in_group("playerBullet"):
		hp -= area.get_parent().damage
		if hp <= 0:
			death()


func death():
	$".".queue_free()


func _on_shootTimer_timeout():
	instance = bullet.instance()
	$"../../bulletManager".add_child(instance)
	instance.global_transform = $shootingPoint.global_transform
	$AudioStreamPlayer3D.play()
