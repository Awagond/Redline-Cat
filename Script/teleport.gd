extends Area2D

@export var level_name = ''
@export var level_point = ''

func _ready():
	$MeshInstance2D.hide()
	
func _on_body_entered(body):
	if body.name == 'Player':
		if level_name:
			G.locate(level_name, level_point)
