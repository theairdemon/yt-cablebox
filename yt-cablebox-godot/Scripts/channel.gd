extends HBoxContainer

@export var webview: WebView

var videos: VideoList
var completed_video_duration: float
var mouse_hovering: bool
var is_active: bool

func init_channel_menu(init_videos: VideoList) -> void:
	mouse_hovering = false
	is_active = false
	$Label.text = init_videos.get_title()
	completed_video_duration = 0
	videos = init_videos
	
	for i in range(0, videos.get_length()):
		var newLabel = $Label.duplicate()
		newLabel.text = videos.get_video_by_index(i).get_title()
		add_child(newLabel)

func set_webview(new_webview: WebView) -> void:
	webview = new_webview

func update(current_duration: float) -> void:	
	if current_duration > completed_video_duration + videos.get_current_video().get_durations_seconds():
		completed_video_duration += videos.get_current_video().get_durations_seconds()
		var next_url = videos.next_video()
		if is_active:
			webview.load_url(next_url)

func activate(current_duration: float) -> void:
	if is_active:
		var video_time = get_amount_into_video(current_duration)
		var timed_url = videos.get_current_video().get_url() + "&t=" + str(floor(video_time)) + "s"
		webview.load_url(timed_url)

func get_amount_into_video(current_duration: float) -> float:
	return current_duration - completed_video_duration

func get_mouse_hovering() -> bool:
	return mouse_hovering

func set_is_active(new_is_active: bool) -> void:
	is_active = new_is_active

func _on_mouse_entered() -> void:
	mouse_hovering = true

func _on_mouse_exited() -> void:
	mouse_hovering = false
