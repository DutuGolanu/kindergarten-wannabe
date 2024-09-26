extends Node2D

func _ready() -> void:
	da.mc_position(Vector2(960,860))
	da.camera_limits(-600,2500,-10000,1084,Vector2(0.618,0.618))

func _process(_delta):
	if da.mc_instantiated.global_position.y <= 662:
		$gard.z_index = 2
		$GardPartial2.z_index = 2
		$GardPartial.z_index = 2
	else:
		$gard.z_index = 0
		$GardPartial2.z_index = 0
		$GardPartial.z_index = 0


func _on_usa_scolii_body_entered(body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/hol.tscn")
