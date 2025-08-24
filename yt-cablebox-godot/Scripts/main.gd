extends Node2D

var DannyVideos: VideoList
var DrewVideos: VideoList
var KurtisVideos: VideoList

var current_session_time: float

func _ready() -> void:
	init_video_list()
	init_channel_menu()
	
	DannyVideos.get_current_video().debug()
	
	#current_session_time = 1230
	current_session_time = 0

func init_video_list() -> void:
	DannyVideos = VideoList.new()
	DannyVideos.parse_file("res://VideoCSVs/danny-videos.csv")
	DannyVideos.set_title("Channel 1: Danny Gonzalez")
	DannyVideos.shuffle()
	
	DrewVideos = VideoList.new()
	DrewVideos.parse_file("res://VideoCSVs/drew-videos.csv")
	DrewVideos.set_title("Channel 2: Drew Gooden")
	DrewVideos.shuffle() 
	
	KurtisVideos = VideoList.new()
	KurtisVideos.parse_file("res://VideoCSVs/kurtis-videos.csv")
	KurtisVideos.set_title("Channel 3: Kurtis Conner")
	KurtisVideos.shuffle() 
	
	$WebView.load_url(DannyVideos.get_current_video().get_url())

func init_channel_menu() -> void:
	for child in $ChannelMenu/ChannelList.get_children():
		child.set_webview($WebView)
	$ChannelMenu/ChannelList/Channel1.init_channel_menu(DannyVideos)
	$ChannelMenu/ChannelList/Channel2.init_channel_menu(DrewVideos)
	$ChannelMenu/ChannelList/Channel3.init_channel_menu(KurtisVideos)

func _process(delta: float) -> void:
	current_session_time += delta
	update_channels()
	switch_channels()

func switch_channels() -> void:
	for child in $ChannelMenu/ChannelList.get_children():
		if child.get_mouse_hovering() && Input.is_action_just_pressed("select"):
			child.set_is_active(true)
			child.activate(current_session_time)
			
			for child2 in $ChannelMenu/ChannelList.get_children():
				if child2 != child:
					child2.set_is_active(false)

func update_channels() -> void:
	for child in $ChannelMenu/ChannelList.get_children():
		child.update(current_session_time)
