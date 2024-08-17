extends Node2D
# TODO: Have the gnats spawn One at a time and when off the screen quefree


@onready var camera = $Qubey/Camera2D
@onready var gnat = preload("res://Characters/Enemies/fu_nat.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_gnat()
	spawn_gnat()
	spawn_gnat()


func get_random_spawn_position() -> Vector2:
	# BUG: Seems to only work one time they get clustered
	var spawn_position = camera.get_screen_center_position()
	spawn_position.x = spawn_position.x * 10
	spawn_position.y = randi_range(0, 648)
	return spawn_position

func spawn_gnat() -> void:
	var enemy = gnat.instantiate()
	add_child(enemy)
	enemy.position = get_random_spawn_position()
