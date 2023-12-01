extends StaticBody3D

@onready var interaction_area = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	%VideoStreamPlayer.visible = !%VideoStreamPlayer.visible