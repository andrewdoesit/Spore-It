extends CharacterBody2D

# TODO: Find out what is wrong with the animations its hard to get the switches right
var spores_collected = 0
var play_foward_animation : bool = true
var play_back_animation : bool = false

func loose_game() -> void:
	$AnimatedSprite2D.play("move_foward")



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		# CHeck If we have any spores collected if not die
		if spores_collected > 0:
			spores_collected = 0 
		elif spores_collected <= 0:
			#queue_free()
			pass
	if body.is_in_group("SporeItem"):
		spores_collected += 1
		# TODO: add the node to the player and have it trail behind him
		body.queue_free()
		print("Spores Collected: ", spores_collected)
