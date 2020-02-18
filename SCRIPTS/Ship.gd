extends KinematicBody2D

export var health = 100
export var score = 0
export var margin = 5
export var y_range = 150
export var acceleration = 0.1

var velocity = Vector2(0,0)

onready var Bullet = load("res://SCENES/Bullet.tscn")

signal health_changed
signal score_changed

func _ready():
	emit_signal("health_changed")
	emit_signal("score_changed")
	pass

func change_health(h):
	health -= h
	emit_signal("health_changed")
	if health <= 0:
		die()

func change_score(s):
	score+=s
	emit_signal("score_changed")

func die():
	queue_free()

func _physics_process(delta):
	if Input.is_action_pressed("shoot"):
		var b = Bullet.instance()
		b.position = position
		b.position.y -= 25
		get_node("/root/Game/Bullets").fire(b)
		
	if Input.is_action_pressed("left"):
		velocity.x -= acceleration
	if Input.is_action_pressed("right"):
		velocity.x += acceleration
	if Input.is_action_pressed("up"):
		velocity.y -= acceleration
	if Input.is_action_pressed("down"):
		velocity.y += acceleration
	
	if position.x < margin:
		velocity.x = 0
		position.x = margin
	if position.x > get_viewport_rect().size.x - margin:
		velocity.x = 0
		position.x = get_viewport_rect().size.x - margin
	if position.y < margin:
		velocity.y = 0
		position.y = margin
	if position.y > get_viewport_rect().size.y - margin:
		velocity.y = 0
		position.y = get_viewport_rect().size.y - margin
	
	var collision = move_and_collide(velocity)
