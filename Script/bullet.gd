extends Area2D

var speed = 200
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	position += transform.x * speed * delta
	


#func _on_area_entered(area):
		#queue_free()


func _on_body_entered():
	queue_free()
