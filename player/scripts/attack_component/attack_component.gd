class_name AttackComponent extends Node

@export var projectile_scene: PackedScene = preload("res://projectiles/projectile.tscn")
@export var fire_rate: float = 0.2
@export var projectile_position_offset: Vector2 = Vector2(0, -60)
@onready var fire_delay_timer: Timer = $"../FireDelayTimer"


func attack(_delta: float) -> void:
	if Input.is_action_pressed("player_attack") and fire_delay_timer.is_stopped():
		fire_projectile()


func fire_projectile() -> void:
	var projectile = projectile_scene.instantiate()
	projectile.global_position = get_parent().global_position + projectile_position_offset
	get_tree().current_scene.add_child(projectile)
	fire_delay_timer.start(fire_rate)
