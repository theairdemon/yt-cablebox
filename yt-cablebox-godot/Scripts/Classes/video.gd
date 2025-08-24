class_name Video

var url: String
var title: String
var duration: String
var duration_seconds: float

func parse_text(raw_input: String) -> void:
	var split_input = raw_input.split("},{")
	# clean up extra brackets
	url = split_input[0].right(-1)
	title = split_input[1]
	duration_seconds = float(split_input[2].left(-1))
	
	# get timestamp
	duration = str(floor(int(duration_seconds) / 60)) + ":" + str(int(duration_seconds) % 60)

func get_url() -> String:
	return url

func get_title() -> String:
	return title

func get_durations_seconds() -> float:
	return duration_seconds

func debug() -> void:
	print(url)
	print(title)
	print(duration_seconds)
	print(duration)
