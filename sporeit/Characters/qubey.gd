extends CharacterBody2D


var spores_collected = 0


func loose_game() -> void:
	print() 


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		# CHeck If we have any spores collected if not die
		if spores_collected > 0:
			spores_collected = 0 
		elif spores_collected <= 0:
			#queue_free()
			pass
	#if body.is_in_group("powerup"):
		#pass
