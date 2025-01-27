class_name Meteor extends Area2D

@export var min_speed: float = 10
@export var max_speed: float = 20

var speed: float = 0


func _ready() -> void:
	speed = randf_range(min_speed, max_speed)
	pass


func _physics_process(delta: float) -> void:
	position.y += speed * delta
	pass
