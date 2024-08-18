extends Node2D

@onready var spore_scene = preload("res://Characters/Items/dropping_spore.tscn")
# TODO: Hide this code maybe or Find some wierd way of turning it to true
# When true we will run the spawn 10k function with variables of user input
var easter_egg_enabled : bool = false
var count = 0

	
# NOTE: Works great with the timer with out it crashes
func spawn_ten_thousand():
	for i in range(10000):
		count += 1
		spawn_spore()
		$SporeCount.text = str(count)
		await get_tree().create_timer(0.25).timeout


func spawn_spore() -> void:
	var spore = spore_scene.instantiate()
	add_child(spore)
	spore.position = get_random_spawn_point()


#NOTE: No higher than 200 Y axis
# NOTE NO lower than 240 Y axis
# NOTE: No lower than 352 
# NOTE: NO Higher than 824
func get_random_spawn_point() -> Vector2:
	var random_x_position = randi_range(352, 824)
	var random_y_position = randi_range(200, 240)
	var pos = Vector2(random_x_position, random_y_position)
	return pos


func _on_start_pressed() -> void:
	spawn_ten_thousand()
