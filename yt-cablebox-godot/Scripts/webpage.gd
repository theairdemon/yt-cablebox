class_name Webpage

static var core_html = """<html>
<body>

<iframe width="560" height="315" src="https://www.youtube.com/embed/bXFkSEGafmo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

</body>
</html>"""

static var core_html_first = """<html>
<body>

<iframe width="560" height="315" src="""

static var core_html_second = """ title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

</body>
</html>"""

static func build_webpage(input_url: String) -> void:
	#var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	#file.store_string(content)
	var file = FileAccess.open("res://Scripts/video_player.html", FileAccess.WRITE)
	var new_html = core_html_first + '"' + input_url + '"' + core_html_second
	file.store_string(new_html)
	file.close()
