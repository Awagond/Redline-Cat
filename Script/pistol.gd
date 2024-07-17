extends Area2D

var item = ""

func set_item(item_name):
	$Sprite2D.texture = load("res://Texture/Gun/Pistol.png")
	item = item_name

func _ready():
	pass 

#func _input(event):
	#if event.is_action_pressed("interactive"):
		#var pl = get_parent().get_player()
		#if abs(pl.position.x - position.x) < 64 and abs(pl.position.y - position.y) < 64:
			#get_parent().remove_child(self)
			#pl.pick(self)
