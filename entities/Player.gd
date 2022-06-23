extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var UP = Vector2(0, -1)
var SLOPE_STOP = 64
var velocity = Vector2()
var move_speed = 6 * 96
var gravity = 3500
var jump_velocity = -1200
var is_grounded = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	detect_ground()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, UP, SLOPE_STOP)
	pass;

func detect_ground():
	var raycastLeft = get_node("FloorDetectorLeft") as RayCast2D
	var raycastCenter = get_node("FloorDetectorCenter") as RayCast2D
	var raycastRight = get_node("FloorDetectorRight") as RayCast2D
	is_grounded = raycastLeft.is_colliding() || raycastCenter.is_colliding() || raycastRight.is_colliding()
	pass

func _input(event):
	if !is_grounded:
		return
	if event.is_action_pressed("ui_select"):
		velocity.y = jump_velocity

func get_input():
	var move_direction = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right")) 
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
