class_name StateAttack extends State

@export var projectile_scene: PackedScene = preload("res://projectiles/laser/basic_laser.tscn")
@export var fire_rate: float = 0.2  # Cooldown time between projectiles
var _fire_timer: float = 0.0  # Timer to track cooldowns


func _ready() -> void:
	# Ensure the projectile scene is set, preload a default if not
	if projectile_scene == null:
		projectile_scene = preload("res://projectiles/laser/basic_laser.tscn")


func enter() -> void:
	# Reset the fire timer when entering the attack state
	_fire_timer = 0.0


func _process(delta: float) -> void:
	# Decrease the fire timer
	_fire_timer -= delta
	# Delegate movement to the move state while in attack state
	player.velocity = player.direction * 300.0  # Adjust speed as needed

	# Check for input and fire if ready
	if Input.is_action_pressed("player_attack") and _fire_timer <= 0.0:
		_fire_timer = fire_rate  # Reset the cooldown
		fire_projectile()


func fire_projectile() -> void:
	if projectile_scene != null:
		var projectile_instance := projectile_scene.instantiate()
		if projectile_instance is Projectile:
			var projectile: Projectile = projectile_instance as Projectile
			projectile.position = owner.position + Vector2(20, 0)  # Adjust for player's position
			projectile.direction = Vector2(1, 0)  # Set direction to the right
			owner.get_parent().add_child(projectile)
		else:
			push_error("The instantiated projectile_scene is not a Projectile.")
