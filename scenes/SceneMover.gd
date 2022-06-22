extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var UP = Vector2(0, -1)
var move_speed = -100
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	position.y += move_speed * delta;
	if move_speed < 200.0:
		move_speed += -5 * delta;
	pass
