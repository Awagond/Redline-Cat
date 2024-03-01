extends Node

# синглтон, нужен для глобальных данных, доступных из любой сцены или точки игры
# (ввиду отсутствия в godot глобальных областей, данные в одной сцене 
# уничтожаются при переходе на другую сцену)
# https://www.youtube.com/watch?v=S8exNI0rpLs

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
