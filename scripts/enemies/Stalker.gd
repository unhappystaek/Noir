extends Spatial

var hp: int = 30
var bullet = load("res://scenes/prefabScenes/bullets/stalkerBullet.tscn")
var instance
var loopLock: bool = false

func _process(delta):

	$Stalker.look_at($"../../player/head/Camera".global_transform.origin, Vector3.UP)
	$".".translate(($"../../player".global_transform.origin - $".".global_transform.origin).normalized() * 0.05)
	#.move_toward($"../../player/head/Camera".global_transform.origin, delta * 100)
	
	instance = bullet.instance()
	$"../../bulletManager".add_child(instance)
	instance.global_transform = $Stalker/shootingPoint.global_transform
	


func _on_Area_area_entered(area):
	if area.is_in_group("playerBullet"):
		hp -= area.get_parent().damage
		if hp <= 0 and loopLock == false:
			loopLock = true
			death()


func death():
	$AudioStreamPlayer3D.play()
	$Stalker/AnimationPlayer.play("stalkerDeath")
	$deathTimer.start()


func _on_deathTimer_timeout():
	$".".queue_free()


