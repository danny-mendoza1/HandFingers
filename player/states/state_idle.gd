class_name StateIdle extends State

@onready var attack: StateAttack = $"../Attack"
@onready var move: StateMove = $"../Move"


func enter() -> void:
	print("entered idle state")
	pass


func exit() -> void:
	pass


## What happens during the _process update in this State
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return move
	player.velocity = Vector2.ZERO
	return null


## What happens during the _physics_process update in this State
func physics(_delta: float) -> State:
	return null


## What happens with input envents in this State
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("player_attack"):
		return attack
	return null
