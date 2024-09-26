extends Node2D

@onready var Tabla = $TablaFaraUnPicior

func _ready():
	pass

func _process(delta):
	indexare()


func indexare():
	if da.mc_instantiated.global_position.y >= 735:
		$Masa.z_index = 0
		$Masa2.z_index = 0
	else:
		$Masa.z_index = 5
		$Masa2.z_index = 5
	if da.mc_instantiated.global_position.y >= 925:
		$Masa3.z_index = 0
		$Masa4.z_index = 0
	else:
		$Masa3.z_index = 5
		$Masa4.z_index = 5
	if da.mc_instantiated.global_position.y >= 885:
		Tabla.z_index = 3
	else:
		Tabla.z_index = 6
	if da.mc_instantiated.global_position.y >=800:
		$PiciorDeTabla.z_index = 2
	else:
		$PiciorDeTabla.z_index = 5
