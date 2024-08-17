extends CharacterBody2D


var speed = 25

func _physics_process(delta: float) -> void:
	velocity.x -= speed * delta
	move_and_slide()
