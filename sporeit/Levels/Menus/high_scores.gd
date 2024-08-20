extends Control

var player_names = []
var player_scores = [1010000, 980000, 749000, 690000, 420000]

func _ready() -> void:
	var list = load_from_file()
	
	set_high_scores()
	set_high_score_names()
	set_high_score_scores()

func set_high_scores():
	#Global.names.shuffle()
	#for i in range(5):
		#var nam = Global.names.pop_front()
		#player_names.append(nam)
	print(player_names)
	
	
	
func set_high_score_names():
	$VBoxContainer/Label.text = player_names[0]
	$VBoxContainer/Label2.text = player_names[1]
	$VBoxContainer/Label3.text = player_names[2]
	$VBoxContainer/Label4.text = player_names[3]
	$VBoxContainer/Label5.text = player_names[4]

func set_high_score_scores():
	$VBoxContainer2/Label.text = str(player_scores[0])
	$VBoxContainer2/Label2.text = str(player_scores[1])
	$VBoxContainer2/Label3.text = str(player_scores[2])
	$VBoxContainer2/Label4.text = str(player_scores[3])
	$VBoxContainer2/Label5.text = str(player_scores[4])

func save_to_file():
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_csv_line(player_names)

func load_from_file():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	print(content)
	return content

func _on_main_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Menus/main_menu.tscn")


func _on_back_button_pressed() -> void:
	load_from_file()
	#get_tree().change_scene_to_file("res://Levels/sunny_day.tscn")


func _on_save_button_pressed() -> void:
	save_to_file()
	
