extends Node2D

@onready var spore_scene = preload("res://Characters/Items/dropping_spore.tscn")
var count = 0

func spawn_ten_thousand():
	for i in range(10000):
		count += 1
		spawn_spore()
		print(count)
		await get_tree().create_timer(0.25).timeout
	
func spawn_spore() -> void:
	var spore = spore_scene.instantiate()
	add_child(spore)
	spore.position = get_random_spawn_point()

#TODO: Use the mouse to get global positons for our X and Y axis
func get_random_spawn_point() -> Vector2:
	var random_x_position = randi_range(0, 1152)
	var random_y_position = randi_range(0, 648)
	var pos = Vector2(random_x_position, random_y_position)
	return pos


func _on_start_pressed() -> void:
	spawn_ten_thousand()
