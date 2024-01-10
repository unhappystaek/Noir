extends Spatial

#Weapons owned:



func _ready():
	pass # Replace with function body.


func _process(delta):
	$weaponPedestal16/Spatial.rotation.y += 0.1
	$weaponPedestal4/Spatial.rotation.y += 0.1
	$weaponPedestal9/Spatial.rotation.y += 0.1
	$weaponPedestal7/Spatial.rotation.y += 0.1
	$weaponPedestal6/Spatial.rotation.y += 0.1
	$weaponPedestal12/Spatial.rotation.y += 0.1
