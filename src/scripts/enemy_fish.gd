extends "res://src/scripts/enemy.gd"

export(float) var speed = 0.3;
var ray;
var dir;

func update_sprite():
	sprite.flip_h = dir.dot(Vector2.LEFT) > 0;

func _ready():
	._ready();
	health = 1;
	death_particles = [$DeathParticlesA, $DeathParticlesB, $DeathParticlesC];
	sprite.region_rect.position.x = RandomNumberGenerator.new().randi_range(0, 2)*8;
	ray = $RayCast2D;
	dir = ray.cast_to.normalized();
	update_sprite();

func _physics_process(delta):
	# Move forward.
	move_and_collide(dir*speed + velocity);
	if ray.is_colliding():
		# Change directions.
		dir = -dir;
		ray.cast_to = -ray.cast_to;
		update_sprite();
	._physics_process(delta);
