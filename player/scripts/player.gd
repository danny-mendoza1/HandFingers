class_name Player extends CharacterBody2D
var direction: Vector2 = Vector2.ZERO
@onready var state_machine: Node = $StateMachine


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.Initialize(self)
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	direction = Vector2(Input.get_axis("player_left", "player_right"), Input.get_axis("player_up", "player_down")).normalized()
	pass


func _physics_process(_delta):
	move_and_slide()
	#Make sure we are in the screen
	var view_rect: Rect2 = get_viewport_rect()
	position.x = clamp(position.x, 0, view_rect.size.x)
	position.y = clamp(position.y, 0, view_rect.size.y)
