extends Node2D

func _ready() -> void:
	da.mc_position(Vector2(150,830))
	da.camera_limits(0,3839,0,1080,Vector2(1,1))


func _on_capatu_holului_body_entered(body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file","res://Scenes/clasa.tscn")


func _on_usa_baye_body_entered(body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file","res://Scenes/baye.tscn")
