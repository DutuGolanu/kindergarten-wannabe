extends CharacterBody2D

var speed = 600
var acceleration = 200
var friction = 150

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D


func _physics_process(delta):
	var direction = Input.get_vector("a","d","w","s")
	if da.can_move == true:
		if direction:
			velocity.x = move_toward(velocity.x,speed * direction.x,acceleration)
			velocity.y = move_toward(velocity.y,speed * direction.y,acceleration)
			anim.play("running")
		else:
			velocity = velocity.move_toward(Vector2.ZERO,friction)
			anim.play("idle")
	else:
		velocity = Vector2.ZERO
		anim.play("idle")
	move_and_slide()
