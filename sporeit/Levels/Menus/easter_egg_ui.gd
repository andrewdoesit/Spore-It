extends Control


func _ready() -> void:
	update_slider_value_label()

func _on_h_slider_value_changed(value: float) -> void:
	update_slider_value_label()

func update_slider_value_label():
	$SliderValue.text = str($HSlider.value)
