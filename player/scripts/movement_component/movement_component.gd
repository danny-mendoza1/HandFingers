class_name MovementComponent extends Node

@export var move_speed: float = 300.0
@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"


func move(direction: Vector2, _delta: float) -> void:
	var velocity = direction * move_speed
	get_parent().velocity = velocity
	update_animation(direction)


func update_animation(direction: Vector2) -> void:
	if direction.x < 0:
		animated_sprite.play("Left")
	elif direction.x > 0:
		animated_sprite.play("Right")
	else:
		animated_sprite.play("Straight")
