extends KinematicBody2D


export var speed : int = 8



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("mover_derecha"):
		var mouvement : Vector2 = Vector2(speed,0)
		move_and_collide(mouvement)
	if Input.is_action_pressed("mover_izquierda"):
		var mouvement : Vector2 = Vector2(-speed,0)
		move_and_collide(mouvement)
