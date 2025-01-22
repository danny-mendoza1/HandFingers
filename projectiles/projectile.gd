class_name Projectile extends Area2D

@export var speed: float = 500.0
@export var direction: Vector2 = Vector2(0, -1)
@export var type: String = "default"  # Projectile type for damage calculations


func _ready() -> void:
	# Connect the body entered signal for collision handling
	self.connect("body_entered", Callable(self, "_on_body_entered"))


func _physics_process(delta: float) -> void:
	# Move the projectile in the specified direction
	position += direction * speed * delta


func _on_body_entered(body: Node) -> void:
	# Check if the body has a take_damage method
	if "take_damage" in body:
		body.take_damage(self)
	queue_free()  # Destroy the projectile upon impact
