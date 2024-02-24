extends Node2D

var item = preload("res://Scene/pistol.tscn")

func get_player():
	return $Player
	
func _ready(): #Спавн пистолета.
	var weapon = item.instantiate()
#	$Item.add_child(weapon)
	weapon.set_item("pistol")
	weapon.position = Vector2(int(randf_range(10,300)), int(randf_range(10,300)))
	pass
