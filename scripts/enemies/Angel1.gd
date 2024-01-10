extends Spatial


var hp: int = 101
var shotLogic: = 0
var bullet = load("res://scenes/prefabScenes/bullets/angel1Bullet.tscn")
var instance
var loopLock: bool = false

func _process(delta):
	$Circle001.rotation.z += 0.7 * delta
	$Circle001.rotation.x += 0.5 * delta
	$Circle.rotation.y += delta
	$Circle002.rotation.z += 2 * delta
	$Circle002.rotation.y += 0.3 * delta
	$Circle003.rotation.x += 1.5 * delta
	$Circle003.rotation.y += delta
	
	$Spatial.look_at($"../../player/head/Camera".global_transform.origin, Vector3.UP)
	
	if (shotLogic == 21 or shotLogic == 16 or shotLogic == 11 or shotLogic == 6) and hp > 0:
		
		instance = bullet.instance()
		$"../../bulletManager".add_child(instance)
		instance.global_transform = $Spatial/shootingPoint.global_transform
		
		if shotLogic == 21:
			$AudioStreamPlayer3D2.play()
	
	shotLogic -= 1


func _on_Area_area_entered(area):
	if area.is_in_group("playerBullet"):
		hp -= area.get_parent().damage
		if hp <= 0 and loopLock == false:
			loopLock = true
			death()


func death():
	$AudioStreamPlayer3D.play()
	$AnimationPlayer.play("angel1death")
	$Timer.start()


func _on_Timer_timeout():
	$".".queue_free()


func _on_shootTimer_timeout():
	shotLogic = 21
