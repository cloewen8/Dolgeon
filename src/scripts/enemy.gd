extends KinematicBody2D

signal damaged(amount);
signal died;

const damage_time = 0.5;
var sprite;
var health = 100;
var damage_timer;
var death_particles = [];
var velocity = Vector2();

func _ready():
	sprite = $Sprite;
	damage_timer = $DamageTimer;
	# todo: Apply enemy shader.
	sprite.material = load("res://src/resources/material_enemy.tres");
	damage_timer.wait_time = damage_time;

# Applies damage to the enemy.
func damage(amount, knockback):
	# Apply damage.
	if amount > health:
		amount = health;
	health -= amount;
	# Emit event.
	emit_signal("damaged", amount);
	if health == 0:
		# Pre-death (particles, invisibility, event).
		for p in death_particles:
			p.emitting = true;
		print("died");
		sprite.visible = false;
		emit_signal("died");
	else:
		# Apply knockback.
		velocity += knockback;
	# Animate damage (also gives time for particles to emit).
	for i in range(10):
		damage_timer.start();
		yield(damage_timer, "timeout");
		print("toggle damage");
	if health == 0:
		# Post-death (free node).
		call_deferred("free");
