class_name StateMove extends State

@export var move_speed: float = 300.0
@onready var attack: State = $"../Attack"


func enter() -> void:
	#player.update_animation("walk")
	pass


func exit() -> void:
	pass


## What happens during the _process update in this State
func process(_delta: float) -> State:
	player.velocity = player.direction * move_speed

	#if player.set_direction():
	#player.update_animation("walk")

	return null


## What happens during the _physics_process update in this State
func physics(_delta: float) -> State:
	return null


## What happens with input envents in this State
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("player_attack"):
		return attack
	return null
