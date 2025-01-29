class_name Meteor extends Area2D

@export var life: int = 1

@export var min_speed: float = 10
@export var max_speed: float = 20
@export var min_rotation_rate: float = -20
@export var max_rotation_rate: float = 20

var speed: float = 0
var rotation_rate: float = 0


func _ready() -> void:
	speed = randf_range(min_speed, max_speed)
	rotation_rate = randf_range(min_rotation_rate, max_rotation_rate)
	pass


func _physics_process(delta: float) -> void:
	rotation_degrees += rotation_rate * delta
	position.y += speed * delta
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func damage(amount: int):
	life -= amount
	if life <= 0:
		queue_free()
