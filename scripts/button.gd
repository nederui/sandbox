extends StaticBody3D

@onready var interaction_area = $InteractionArea
@onready var tv = %VideoStreamPlayer

@export var channel_path = "res://video/"
var channels: Array
var current_channel: int = 0

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	get_channels()
	print("channels: ", channels)
	print("current channel: ", channels[current_channel])
	

func _on_interact():
	var new_video_instance = VideoStreamTheora.new()

	current_channel += 1
	if current_channel == channels.size():
		current_channel = 0
	new_video_instance.file = channels[current_channel]
	tv.stream = new_video_instance
	tv.play()
	print("new channel: ", channels[current_channel])

func get_channels():
	print("channels folder: ", channel_path)
	var dir = DirAccess.open(channel_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.get_extension() == "ogg":
				channels.append(channel_path + file_name)
			file_name = dir.get_next()
	else:
		print("An Error Occured While Trying to Access: ", channel_path)
