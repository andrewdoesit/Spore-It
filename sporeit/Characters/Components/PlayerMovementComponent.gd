class_name CompPlayerMove

extends Node
# Gonna use this for quick reference probably wont keep it
#NOTE: Must attach the script and assign to the characterbody2d
@export var character : CharacterBody2D
@export var vertical_speed : float = 300
@export var foward_speed : float = 25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# NOTE: Having Velocity has a physics effect 
# If you change to position it will give it a different effect 
# TODO: Try with both once we have a level
func _physics_process(delta: float) -> void:
	character.velocity.x += foward_speed * delta
	if Input.is_action_pressed("up"):
		character.velocity.y -= vertical_speed * delta
	if Input.is_action_pressed("down"):
		character.velocity.y += vertical_speed * delta
	
	character.move_and_slide()
