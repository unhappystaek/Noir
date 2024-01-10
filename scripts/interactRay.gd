
extends RayCast

signal nextWaveClick

onready var weapons = $"../weapons"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_exception(owner)


func _process(delta):
	if is_colliding():
		var detected = get_collider()
		if Input.is_action_pressed("interaction"):
			if detected is nextWave:
				emit_signal("nextWaveClick")
				$"../../../../weaponAltar/nextWave/AnimationPlayer".play("newWave")
				
			if detected is AreaLeftHand:
				weapons.weaponIdLeft = 0
				$"../weapons/left/handL".visible = true
				$"../weapons/left/ball".visible = false
				$"../weapons/left/dodecagowno".visible = false
			if detected is AreaBalls:
				weapons.weaponIdLeft = 1
				$"../weapons/left/ball".visible = true
				$"../weapons/left/handL".visible = true
				$"../weapons/left/dodecagowno".visible = false
			if detected is AreaDodeca:
				weapons.weaponIdLeft = 2
				$"../weapons/left/ball".visible = false
				$"../weapons/left/handL".visible = true
				$"../weapons/left/dodecagowno".visible = true
				
				
			if detected is AreaRightHand:
				weapons.weaponIdRight = 0
				$"../weapons/right/bolter".visible = false
				$"../weapons/right/handR".visible = true
				$"../weapons/right/mother".visible = false
			if detected is AreaBolter:
				weapons.weaponIdRight = 1
				$"../weapons/right/bolter".visible = true
				$"../weapons/right/handR".visible = false
				$"../weapons/right/mother".visible = false
			if detected is AreaMother:
				weapons.weaponIdRight = 2
				$"../weapons/right/bolter".visible = false
				$"../weapons/right/handR".visible = true
				$"../weapons/right/mother".visible = true
