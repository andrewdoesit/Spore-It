extends Node2D


@onready var camera = $Qubey/Camera2D

@onready var gnat = preload("res://Characters/Enemies/fu_nat.tscn")
@onready var spore_item = preload("res://Characters/Items/spore_item.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


#BUG: This throws an error when we loss our character
func get_random_spawn_position() -> Vector2:
	var spawn_position = camera.get_screen_center_position()
	spawn_position.x = spawn_position.x * 2
	spawn_position.y = randi_range(0, 648)
	return spawn_position

func spawn_gnat() -> void:
	var enemy = gnat.instantiate()
	add_child(enemy)
	enemy.position = get_random_spawn_position()

func spawn_spore_item() -> void:
	var item = spore_item.instantiate()
	add_child(item)
	item.position = get_random_spawn_position()
	 
func _on_enemy_spawn_timer_timeout() -> void:
	spawn_gnat()
	$EnemySpawnTimer.start()
	print("FU-Nat")


func _on_item_spawn_timer_timeout() -> void:
	spawn_spore_item()
	$ItemSpawnTimer.start()
	print("Spawned a Spore")
