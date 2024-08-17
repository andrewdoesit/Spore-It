extends CharacterBody2D


var speed = 25
var has_passed : bool = false

func _physics_process(delta: float) -> void:
	
	if !has_passed:
		position.x -= speed * delta
		#move_and_slide()
	elif has_passed:
		print("Goodbye")
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	# Keeping this for our bool safety
	has_passed = false



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	has_passed = true
	
