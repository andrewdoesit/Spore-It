extends Node2D
# TODO: Have the gnats spawn One at a time and when off the screen quefree


@onready var screen_view = $Qubey/Camera2D
@onready var gnat = preload("res://Characters/Enemies/fu_nat.tscn")
var spawned_gnats = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_gnat()
	remove_gnat()

func get_random_spawn_position() -> Vector2:
	# TODO: Take the center point value and return a random point off screen
	# Add to the point size of half the view port for the X axis
	# Get the hieght of the view port and divide by 4 for spawning on Y axis
	var spawn_position = screen_view.get_screen_center_position()
	spawn_position.x = spawn_position.x * 10
	spawn_position.y = randi_range(0, 648)
	return spawn_position

func spawn_gnat() -> void:
	var enemy = gnat.instantiate()
	add_child(enemy)
	spawned_gnats.append(enemy)
	enemy.position = get_random_spawn_position()

func remove_gnat() -> void:
	await get_tree().create_timer(3.0).timeout
	for i in spawned_gnats:
		i.queue_free()
		spawned_gnats.clear()
