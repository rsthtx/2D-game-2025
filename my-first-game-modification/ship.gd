extends Sprite2D

var speed = 400
var angular_speed = PI
@onready var distance: Label = $HUD/distance
var travelled_distance: float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = 0
	if Input.is_action_pressed("left"):
		direction = -1
	if Input.is_action_pressed("right"):
		direction = 1
		
	rotation += direction * angular_speed * delta
	
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("forward"):
		velocity = Vector2.UP.rotated(rotation) * speed
	
	position += velocity * delta
	
	travelled_distance += velocity.length() * delta
	
	distance.text = "%.02f" % travelled_distance
