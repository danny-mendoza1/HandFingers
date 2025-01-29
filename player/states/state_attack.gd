class_name StateAttack extends State

@export var projectile_scene: PackedScene = preload("res://projectiles/projectile.tscn")
@export var fire_rate: float = 0.2  # Cooldown time between projectiles
@export var fire_delay: float = 0.2
@onready var fire_delay_timer: Timer = $"../../FireDelayTimer"

var _fire_timer: float = 0.0  # Timer to track cooldowns
var projectile_position_offset = Vector2(0, -60)


func _ready() -> void:
	# Ensure the projectile scene is set, preload a default if not
	if projectile_scene == null:
		projectile_scene = preload("res://projectiles/projectile.tscn")


func enter() -> void:
	# Reset the fire timer when entering the attack state
	_fire_timer = 0.0


func process(delta: float) -> State:
	# Decrease the fire timer
	_fire_timer -= delta

	player.velocity = player.direction * 300.0  # Adjust speed as needed

	# Check for input and fire if ready
	if Input.is_action_pressed("player_attack") and _fire_timer <= 0.0:
		_fire_timer = fire_rate  # Reset the cooldown
		fire_projectile()
	return null


func fire_projectile() -> void:
	var projectile := projectile_scene.instantiate()
	projectile.global_position = player.global_position + projectile_position_offset
	get_tree().current_scene.add_child(projectile)
