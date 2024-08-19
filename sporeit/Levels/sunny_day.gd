extends Node2D

@onready var spore_scene = preload("res://Characters/Items/dropping_spore.tscn")
@onready var spores_to_spawn = $EasterEggUI/SporesToSpawn
@onready var spawn_timer = $EasterEggUI/HSlider

var game_start : bool = false
var count : int = 0

@export var spores : int = 10000
@export var timer_time : float = 0.25

		
func convert_user_spores_input_values(value: String) -> int:
	var number = value.to_int()
	check_values(number)
	return number

func convert_user_timer(value: int) -> float:
	var added_decimal : String
	if value < 10:
		var added_zero = str("0", value)
		added_decimal = str("0.", added_zero)
	else:
		added_decimal = str("0.", value)
	var num = added_decimal.to_float()
	print(num)
	return num 

func check_values(value):
	if value == 0:
		$InvalidEntry.show()
	else:
		$InvalidEntry.hide()

# NOTE: Works great with the timer with out it crashes
func spawn_ten_thousand():
		for i in range(spores):
			count += 1
			spawn_spore()
			$SporeCount.text = str(count)
			if timer_time > 0:
				await get_tree().create_timer(timer_time).timeout
			if game_start == false:
				break


func spawn_spore() -> void:
	var spore = spore_scene.instantiate()
	add_child(spore)
	spore.position = get_random_spawn_point()


#NOTE: No higher than 200 Y axis, NO lower than 240 Y axis
# NOTE: No lower than 352, NO Higher than 824
func get_random_spawn_point() -> Vector2:
	var random_x_position = randi_range(352, 824)
	var random_y_position = randi_range(200, 240)
	var pos = Vector2(random_x_position, random_y_position)
	return pos


func _on_start_pressed() -> void:
	game_start = true
	spores = convert_user_spores_input_values(spores_to_spawn.text)
	timer_time = convert_user_timer(spawn_timer.value)
	spawn_ten_thousand()


func _on_kill_switch_pressed() -> void:
	game_start = false
