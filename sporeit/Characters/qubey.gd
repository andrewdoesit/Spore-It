extends CharacterBody2D

# TODO: Find out what is wrong with the animations its hard to get the switches right
@onready var spore_score = $Control/SporeScore

var spores_collected = 0


func _ready() -> void:
	$AnimatedSprite2D.play("move_foward")


# NOTE: Might want to change the scene when we die
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		if spores_collected > 0:
			spores_collected = 0 
		elif spores_collected <= 0:
			queue_free()
			print("LOOSE")

	if body.is_in_group("SporeItem"):
		spores_collected += 1
		# TODO: add the node to the player and have it trail behind him
		body.queue_free()
		$WeeSound.play()
		print("Spores Collected: ", spores_collected)
	update_ui()

func update_ui() -> void:
	spore_score.text = str(spores_collected)
	
