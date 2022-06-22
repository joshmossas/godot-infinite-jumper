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

var rng = RandomNumberGenerator.new()

func randomXPosition():
	return rng.randf_range(-400.0, 400.0)

func _on_Area2D_body_exited(body:Node):
	var currPosition = body.get('position') as Vector2
	currPosition.y = currPosition.y - 1000
	currPosition.x = randomXPosition()
	body.set('position', currPosition)
	pass # Replace with function body.
