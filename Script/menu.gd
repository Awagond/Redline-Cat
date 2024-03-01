extends Node2D



func _on_play_pressed():
	#get_tree().change_scene_to_file("res://Scene/level_house.tscn")
	get_tree().change_scene_to_file("res://Scene/global_game_scene.tscn")
	# скрипт смены сцены через global.gd
	#G.scene('global_game_scene')
	#G.scene('level_house')
	# можно создать меню выбора уровня


func _on_quit_pressed():
	#get_tree().quit()
	G.exit()
