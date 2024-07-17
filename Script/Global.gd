extends Node

# синглтон, нужен для глобальных данных, доступных из любой сцены или точки игры
# (ввиду отсутствия в godot глобальных областей, данные в одной сцене 
# уничтожаются при переходе на другую сцену)
# https://www.youtube.com/watch?v=S8exNI0rpLs

#переменные ниже получают значения при запуске сцены global_game_scene
var game
var world
var player

var level
var level_name = 'house'
var level_point = 'start' # задана точка для спавна в первый раз


func exit():
	get_tree().quit()

func _ready():
	print('G_loaded') # для вывода сообщения о загрузке global скрипта

	
func load_level(): #скрипт для смены сцены
	level = load("res://Scene/level_" + level_name + ".tscn").instantiate()
	#var inst = level.instantiate()
	world.add_child(level)
	
	var lp = level.get_node('point_'+level_point)
	if lp:
		player.position = lp.position
		#player.get_node('Camera2D').position = player.position

func reload():
	get_tree().reload_current_scene()

func locate(ln, lp):
	level_name = ln
	level_point = lp
	reload()

##func hello():
#	print('hello?') # тест метода global скрипта

##func scene(scene_name): #скрипт для смены сцены
#	get_tree().change_scene_to_file("res://Scene/" + scene_name + ".tscn")
