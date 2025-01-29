class_name Player extends CharacterBody2D

@export var movement_component: MovementComponent
@export var attack_component: AttackComponent

var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	if movement_component == null:
		movement_component = $MovementComponent
	if attack_component == null:
		attack_component = $AttackComponent


func _process(delta: float) -> void:
	direction = Vector2(Input.get_axis("player_left", "player_right"), Input.get_axis("player_up", "player_down")).normalized()

	# Handle movement and attacking simultaneously
	movement_component.move(direction, delta)
	attack_component.attack(delta)


func _physics_process(_delta: float) -> void:
	move_and_slide()
	# Ensure the player stays within the screen bounds
	var view_rect: Rect2 = get_viewport_rect()
	position.x = clamp(position.x, 0, view_rect.size.x)
	position.y = clamp(position.y, 0, view_rect.size.y)
