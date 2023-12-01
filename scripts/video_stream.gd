@tool

extends VideoStreamPlayer

func _ready():
	play()

func _on_finished():
	play()