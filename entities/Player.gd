extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var UP = Vector2(0, -1)
var SLOPE_STOP = 64
var velocity = Vector2()
var move_speed = 5 * 96
var gravity = 1200
var jump_velocity = -720


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, UP, SLOPE_STOP)
	pass;

func _input(event):
	if event.is_action_pressed("ui_select"):
		velocity.y = jump_velocity

func get_input():
	var move_direction = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right")) 
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
