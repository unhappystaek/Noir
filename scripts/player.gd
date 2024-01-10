extends KinematicBody


export var speed = 10
export var accel = 10
export var gravity = 50
export var jump = 15
export var sensitivity = 0.15
export var max_angle = 90
export var min_angle = -80

onready var head = $head

var look_rot = Vector3.ZERO
var move_dir = Vector3.ZERO
var velocity = Vector3.ZERO

var playerHp: int = 3
var hpPressure: float = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$head/Camera/UI/damageOverlay.modulate = Color(1, 1, 1, 0)

func _process(delta):
	if hpPressure >= 1:
		playerHp -= 1
		hpPressure = 0
		if playerHp <= 0:
			get_tree().change_scene("res://scenes/trueScenes/deathScene.tscn")
		if playerHp == 2:
			$head/Camera/UI/health/h1/AnimationPlayer.play("loseHP")
		if playerHp == 1:
			$head/Camera/UI/health/h3/AnimationPlayer.play("loseHP")
		
	if hpPressure > 0:
		hpPressure -= 0.03 * delta
		$head/Camera/UI/damageOverlay.modulate = Color(1, 1, 1, (clamp(hpPressure, 0, 1)))
		
	if hpPressure == 0:
		$head/Camera/UI/damageOverlay.modulate = Color(1, 1, 1, 0)
		
	$head/Camera/weapons/left/dodecagowno/Dodecagowno.rotation.y += 1.5 * delta
	
	$head/Camera/weapons/right/mother/mother.rotation.y += 0.8 * delta
	$head/Camera/weapons/right/mother/mother.rotation.x += 0.5 * delta
	$head/Camera/weapons/right/mother/mother.rotation.z += 0.3 * delta

func _physics_process(delta):
	#set rotation
	head.rotation_degrees.x = look_rot.x
	rotation_degrees.y = look_rot.y
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_just_pressed("jump"):
		velocity.y = jump
	
	move_dir = Vector3(
		Input.get_axis("left", "right"),
		0,
		Input.get_axis("forward", "backward")
	).normalized().rotated(Vector3.UP, rotation.y)
	
	velocity.x = lerp(velocity.x, move_dir.x * speed, accel * delta)
	velocity.z = lerp(velocity.z, move_dir.z * speed, accel * delta)
	
	velocity = move_and_slide(velocity, Vector3.UP)


func _input(event):
	if event is InputEventMouseMotion:
		look_rot.y -= (event.relative.x * sensitivity)
		look_rot.x -= (event.relative.y * sensitivity)
		look_rot.x = clamp(look_rot.x, min_angle, max_angle)


func _on_Area_area_entered(area):
	if area.is_in_group("enemyBullet"):
		hpPressure += area.get_parent().damage

