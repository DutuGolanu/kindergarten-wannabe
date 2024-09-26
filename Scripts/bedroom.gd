extends Node2D

const lines = [
	{
		"text" : "Sunt gata sa ma aventurez pana afara?",
		"choices" : [
				{"text" : "DA"},
				{"text" : "NU"}
		]
	}
]

func _ready() -> void:
	da.camera_limits(0,3840,0,2160)
	da.add_mc()



func _on_usa_body_entered(_body: Node2D) -> void:
	ui.add_textbox(lines)
