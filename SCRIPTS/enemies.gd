extends Node2D

export var max_enemies = 5
export var probability = 0.3

onready var enemy1 = load("res://SCENES/enemy1.tscn")
onready var enemy2 = load("res://SCENES/enemy2.tscn")

func _ready():
	randomize() 


func _on_Timer_timeout():
	if get_child_count() < max_enemies + 1:
		if randf() < probability or get_child_count() == 1:
			if randf() < 0.5:
				var e = enemy1.instance()
				add_child(e)
			else:
				var e = enemy2.instance()
				add_child(e)
