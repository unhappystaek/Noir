extends Spatial


var weaponIdLeft: int = 0
var weaponIdRight: int = 0

var instanceLeft
var instanceLeft2
var instanceLeft3
var instanceRight

var handBulletLeft = load("res://scenes/prefabScenes/bullets/handBulletLeft.tscn")
var handBulletRight = load("res://scenes/prefabScenes/bullets/handBulletRight.tscn")
var bolterBullet = load("res://scenes/prefabScenes/bullets/bolterBullet.tscn")
var ballsBullet = load("res://scenes/prefabScenes/bullets/ballsBullet.tscn")
var dodecaBullet = load("res://scenes/prefabScenes/bullets/dodecaBullet.tscn")
var motherBullet = load("res://scenes/prefabScenes/bullets/motherBullet.tscn")


func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("leftWeapon"):
		leftFire()
	
		
	if Input.is_action_pressed("rightWeapon"):
		rightFire()
	else:
		$right/mother/AudioStreamPlayer3D.stop()
		
	

func leftFire():
	match weaponIdLeft:
		0:
			if !$left/handL/AnimationPlayer.is_playing():
				$left/handL/AnimationPlayer.play("New Anim")
				instanceLeft = handBulletLeft.instance()
				$"../../../../bulletManager".add_child(instanceLeft)
				instanceLeft.global_transform = $left/handL/shootingPoint.global_transform
		1:
			if !$left/ball/AnimationPlayer.is_playing():
				$left/ball/AnimationPlayer.play("New Anim")
				instanceLeft = ballsBullet.instance()
				$"../../../../bulletManager".add_child(instanceLeft)
				instanceLeft.global_transform = $left/ball/shootingPoint.global_transform
		
		2:
			if !$left/dodecagowno/AnimationPlayer.is_playing():
				$left/dodecagowno/AnimationPlayer.play("New Anim")
				instanceLeft = dodecaBullet.instance()
				instanceLeft2 = dodecaBullet.instance()
				instanceLeft3 = dodecaBullet.instance()
				$"../../../../bulletManager".add_child(instanceLeft)
				$"../../../../bulletManager".add_child(instanceLeft2)
				$"../../../../bulletManager".add_child(instanceLeft3)
				instanceLeft.global_transform = $left/dodecagowno/shootingPoint.global_transform
				instanceLeft2.global_transform = $left/dodecagowno/shootingPoint2.global_transform
				instanceLeft3.global_transform = $left/dodecagowno/shootingPoint3.global_transform
		
	
func rightFire():
	match weaponIdRight:
		0:
			if !$right/handR/AnimationPlayer.is_playing():
				$right/handR/AnimationPlayer.play("New Anim")
				instanceRight = handBulletRight.instance()
				$"../../../../bulletManager".add_child(instanceRight)
				instanceRight.global_transform = $right/handR/shootingPoint.global_transform
		1:
			if !$right/bolter/AnimationPlayer.is_playing():
				$right/bolter/AnimationPlayer.play("New Anim")
				instanceRight = bolterBullet.instance()
				$"../../../../bulletManager".add_child(instanceRight)
				instanceRight.global_transform = $right/bolter/shootingPoint.global_transform
				$right/bolter/AudioStreamPlayer.play()
		2:
			if !$right/mother/AnimationPlayer.is_playing():
				$right/mother/AnimationPlayer.play("New Anim")
				instanceRight = motherBullet.instance()
				$"../../../../bulletManager".add_child(instanceRight)
				instanceRight.global_transform = $right/mother/shootingPoint.global_transform
				if $right/mother/AudioStreamPlayer3D.playing == false:
					$right/mother/AudioStreamPlayer3D.play()
				
