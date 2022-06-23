extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var score = 0.0;

func _process(delta):
	var player = get_node("Player") as CollisionObject2D
	if score * 10 < (player.position.y * -1.0):
		score = (player.position.y * -1.0) / 10
	var label = get_node("Node2D/Label") as Label
	label.text = "Score: " + str(int(score))
	pass

var rng = RandomNumberGenerator.new()

func randomXPosition():
	return rng.randf_range(-400.0, 400.0)

func _on_Area2D_body_exited(_body:Node):
	pass # Replace with function body.


func _on_Area2D_body_entered(body:Node):
	var currPosition = body.get('position') as Vector2
	currPosition.y = currPosition.y - 1000
	currPosition.x = randomXPosition()
	body.set('position', currPosition)
	pass # Replace with function body.


func _on_EventBoxLeft_body_entered(body:Node):
	if body.name == "Player":
		var player = body as KinematicBody2D
		player.position.x = 520.0

	pass # Replace with function body.


func _on_EventBoxRight_body_entered(body:Node):
	if body.name == "Player":
		var player = body as KinematicBody2D
		player.position.x = -520.0
	pass # Replace with function body.
