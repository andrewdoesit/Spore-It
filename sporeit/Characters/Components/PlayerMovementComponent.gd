class_name CompPlayerMove

extends Node

#NOTE: Must attach the script and assign to the characterbody2d
@export var character : CharacterBody2D
@export var vertical_speed : float = 300
@export var forward_speed : float = 50

#TODO: use this for the user input it might make our animations easier
func _input(event: InputEvent) -> void:
	pass
	
# NOTE: Having Velocity has a physics effect 
# If you change to position it will give it a different effect 
# TODO: Try with both once we have a level
func _physics_process(delta: float) -> void:
	character.position.x += forward_speed * delta
	if Input.is_action_pressed("up"):
		character.velocity.y -= vertical_speed * delta
	if Input.is_action_pressed("down"):
		character.velocity.y += vertical_speed * delta
	if Input.is_action_pressed("stop"):
		character.velocity =  Vector2.ZERO
	character.move_and_slide()
