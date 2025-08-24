class_name VideoList

var videos: Array[Video]
var length: int
var title: String
var current_index: int

func set_title(new_title: String) -> void:
	title = new_title

func get_title() -> String:
	return title

func parse_file(filename: String) -> void:
	length = 0
	current_index = 0
	videos = []
	var file = FileAccess.open(filename, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var content_list = content.split("\n", false)
	
	for row in content_list:
		var new_video = Video.new()
		new_video.parse_text(row)
		videos.append(new_video)
		length += 1

func next_video() -> String:
	current_index += 1
	return videos[current_index].get_url()

func get_current_video() -> Video:
	return videos[current_index]

func get_current_index() -> int:
	return current_index

func get_video_by_index(idx: int) -> Video:
	return videos[idx]
	
func get_length() -> int:
	return length
	
func shuffle() -> void:
	videos.shuffle()
