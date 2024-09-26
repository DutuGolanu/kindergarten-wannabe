extends Node2D

func _ready() -> void:
	da.mc_position(Vector2(190,590))
	da.camera_limits(0,2880,0,1620)

func _on_usa_baye_body_entered(body):
	get_tree().call_deferred("change_scene_to_file","res://Scenes/hol.tscn")
