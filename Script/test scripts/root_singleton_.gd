extends Node

# синглтон, нужен для глобальных данных, доступных из любой сцены или точки игры
# (ввиду отсутствия в godot глобальных областей, данные в одной сцене 
# уничтожаются при переходе на другую сцену)
# https://www.youtube.com/watch?v=S8exNI0rpLs

'''
var human = preload("res://Script/test.gd") # чтобы висело в памяти, пока эта нода существует. Например если на протяжении игры будут создаваться объекты этого класса
var student = preload("res://student.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	#var human = load("res://Script/test.gd") #объявление класса human и загрузка класса (файла скрипта .gd) в память
	var petr = human.new('Petr', 90) # создание объекта(petr) класса human
	# объекты класса наследуют свойства класса, например для создания нескольких персонажей с одинаковыми характеристиками
	petr.name = 'Vasya'
	petr.say('hello epta') # нужно, чтобы в классе(скрипте) был объявлен метод say()
	
	var alex = student.new('Alex', 50)
	alex.say('hello nahyu')
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
'''
