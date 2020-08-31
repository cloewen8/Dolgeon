extends KinematicBody2D

export(float) var speed = 0.3;
var sprite;
var ray;
var dir;

func update_spite():
	sprite.flip_h = dir.dot(Vector2.LEFT) > 0;

func _ready():
	sprite = $Sprite;
	sprite.region_rect.position.x = RandomNumberGenerator.new().randi_range(0, 2)*8;
	ray = $RayCast2D;
	dir = ray.cast_to.normalized();
	update_spite();

func _physics_process(delta):
	# Move forward.
	move_and_collide(dir*speed);
	if ray.is_colliding():
		# Change directions.
		dir = -dir;
		ray.cast_to = -ray.cast_to;
		update_spite();
