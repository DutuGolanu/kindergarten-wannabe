extends Node


var mc = preload("res://Scenes/mc.tscn")
var mc_instantiated = mc.instantiate()
var mc_camera = mc_instantiated.get_child(2)

var can_move : bool = true
var mc_pos : Vector2


func mc_position(new_pos : Vector2) -> void:
	mc_pos = new_pos
	mc_instantiated.global_position = new_pos

func add_mc() -> void:
	mc_position(Vector2(2500,700))
	get_tree().root.add_child.call_deferred(mc_instantiated)

func camera_limits(left : int ,right : int ,top : int ,bottom : int ,zoom_value = null) -> void:
	mc_camera.limit_left = left
	mc_camera.limit_right = right
	mc_camera.limit_top = top
	mc_camera.limit_bottom = bottom
	if zoom_value != null:
		mc_camera.zoom = zoom_value
