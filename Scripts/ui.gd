extends Control

@onready var rich_text_label: RichTextLabel = $CanvasLayer/TextBox/MarginContainer/MarginContainer/RichTextLabel
@onready var typing_timer: Timer = $TypingTimer
@onready var culoare_text_box: ColorRect = $CanvasLayer/TextBox/MarginContainer/CuloareTextBox
@onready var canvas_layer: CanvasLayer = $CanvasLayer


var dialogue = []
var current_dialogue_index : int = 0 
var letter_index : int = 0
var line_ended : bool = false
var y_offset = 0  #For calculating the height of the next buttons

#2e8bc0 albastru pentru tigan
#BA0F30 rosu pentru boschetaru care imi da chase

func _ready() -> void:
	culoare_text_box.color = "#2e8bc0"
	canvas_layer.hide()

func _process(_delta) -> void:
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and line_ended == true:
		#rich_text_label.text = ""
		#current_dialogue_index += 1
		#letter_index = 0
		#line_ended = false
	if current_dialogue_index >= dialogue.size():
		rich_text_label.text = ""
		typing_timer.stop()
		canvas_layer.hide()
		da.can_move = true

func _on_typing_timer_timeout() -> void:
	show_dialogue()

func show_dialogue() -> void:
	if dialogue[current_dialogue_index]["text"].length() > letter_index:
		rich_text_label.text += dialogue[current_dialogue_index]["text"][letter_index]
		letter_index += 1
	elif dialogue[current_dialogue_index]["choices"] != null:
		typing_timer.stop()
		for c in dialogue[current_dialogue_index]["choices"]:
			var choice_button = Button.new()
			choice_button.text = c["text"]
			choice_button.custom_minimum_size = Vector2(200,90)
			choice_button.global_position = Vector2(1700,300 + y_offset)
			choice_button.add_theme_font_size_override("font_size",30)
			canvas_layer.add_child(choice_button)
			y_offset += 100
			choice_button.add_to_group("Choice_buttons")
			choice_button.pressed.connect(button_pressed.bind(c["text"]))

func add_textbox(lines) -> void:
	y_offset = 0
	dialogue = lines
	canvas_layer.show()
	typing_timer.start()
	da.can_move = false
	
func button_pressed(buton):
	get_tree().call_group("Choice_buttons","queue_free")
	match buton:
		"DA":
			get_tree().change_scene_to_file("res://Scenes/afara_sccoala.tscn")
			hide_textbox()
		"NU":
			hide_textbox()

func hide_textbox() -> void:
	rich_text_label.text = ""
	canvas_layer.hide()
	da.can_move = true
	letter_index = 0
	current_dialogue_index = 0
