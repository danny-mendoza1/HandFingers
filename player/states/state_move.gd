class_name State_Move extends State

@export var move_speed: float = 300.0

func enter() -> void:
	#player.update_animation("walk")
	pass
	

func exit() -> void:
	pass
	
## What happens during the _process update in this State
func process( _delta : float ) -> State:
	
	player.velocity = player.direction * move_speed
	
	#if player.set_direction():
		#player.update_animation("walk")
		
	return null

## What happens during the _physics_process update in this State
func physics( _delta : float ) -> State:
	return null

## What happens with input envents in this State
#func handle_input ( _event : InputEvent ) -> State:
	#if _event.is_action_pressed("attack"):
		#return attack
	#if _event.is_action_pressed("interact"):
		#PlayerManager.interact_pressed.emit()
	#return null
