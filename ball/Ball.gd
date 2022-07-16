extends RigidBody2D

onready var hit : AudioStreamPlayer = get_node("hit")
onready var you_win : AudioStreamPlayer = get_node("win")
onready var lose : AudioStreamPlayer = get_node("lose")


var game_started: bool = false

var live = 3

func _input(event):
	if event.is_action_released("iniciar") and not game_started:
		linear_velocity = Vector2(50, -200)
		game_started = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func reset():
	live = 3
	queue_free()
	get_tree().change_scene("res://title/title.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in get_colliding_bodies():
		hit.play()
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			if body.get_parent().get_child_count() == 1:
				you_win.play()
				yield(you_win, "finished")
				reset()
		elif body.get_name() == "bottom":
			lose.play()
			live -=1
			if live == 0:
				reset()
				

