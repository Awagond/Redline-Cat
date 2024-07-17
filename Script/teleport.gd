extends Area2D

# сцена, являющаяся зоной, при вхождении в которую персонаж телепортируется в другую сцену
# 

@export var level_name = '' # хз, но надо
@export var level_point = '' # хз, но надо

func _ready():
	$MeshInstance2D.hide() # скрыть текстуру от зоны для телепорта
	
func _on_body_entered(body): # скрипт, для обработки события, когда персонаж в ходит в зону телепорта
	if body.name == 'Player': # если входит главный герой, то следующее условие >
		if level_name: # если level_point существует, имеет значение, то >
			G.locate(level_name, level_point) # передача функции global-скрипта данных о названии уровня и точки для спавна
