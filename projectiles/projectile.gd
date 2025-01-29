class_name Projectile extends Area2D

@export var speed: float = 500.0
@export var direction: Vector2 = Vector2(0, -1)
@export var type: String = "default"  # Projectile type for damage calculations


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	# Move the projectile in the specified direction
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("damageable"):
		area.damage(1)
	pass
