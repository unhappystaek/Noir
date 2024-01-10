extends Spatial


var wave: int = 0
var waveFinished: bool = true
var ready: bool = true
var loopPrevent: bool = false

var stalker = load("res://scenes/prefabScenes/enemies/Stalker.tscn")
var angel1 = load("res://scenes/prefabScenes/enemies/Angel1.tscn")
var something = load("res://scenes/prefabScenes/enemies/Something.tscn")
var instance
var spawnlogic

func _on_waveTimer_timeout():
	waveFinished = true
	ready = true



func _process(delta):
	if waveFinished and $".".get_child_count() == 3 and ready:
		ready = false
		$"../weaponAltar/AudioStreamPlayer2".play()
		$"../weaponAltar/nextWave/AnimationPlayer".play_backwards("newWave")



func _on_interactRay_nextWaveClick():
	$"../weaponAltar/AudioStreamPlayer".play()
	waveFinished = false
	wave += 1
	$waveTimer.start()



func _on_enemySpawnTimer_timeout():
	if !waveFinished:
		var spawnpoint = $spawnpoints.get_child(randi() % 23) 
		var spawnlogic: int = (randi() % 3)
		if spawnlogic == 0:
			instance = angel1.instance()
		if spawnlogic == 1:
			instance = stalker.instance()
		if spawnlogic == 2:
			instance = something.instance()
		$".".add_child(instance)
		instance.global_transform = spawnpoint.global_transform
		
