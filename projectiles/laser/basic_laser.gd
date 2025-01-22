class_name BasicLaser extends Projectile

@export var damage: int = 1  # Damage dealt by the laser


func _ready() -> void:
	# Override the default type if needed
	type = "laser"
