class_name BasicLaser extends Projectile

@export var damage: int = 1  # Damage dealt by the laser


func _ready() -> void:
	# Override the default type if needed
	type = "laser"


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass  # Replace with function body.
