extends Area3D

class_name InteractionArea

# text displayed above an object to indicate it can be interacted with
@export var action_name: String = "interact"

var interact: Callable = func():
	pass

func _on_body_entered(_body:Node3D):
	InteractionManager.register_area(self)
	print("entered")
	

func _on_body_exited(_body:Node3D):
	InteractionManager.unregister_area(self)
	print("left")
