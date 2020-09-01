extends KinematicBody2D

signal damaged(amount);
signal died;

const damage_time = 0.1;
const drag = 0.5;
var sprite;
var health = 100;
var damage_debounce = true;
var damage_timer;
var death_particles = [];
var velocity = Vector2();

# Applies damage to the enemy.
func damage(amount, knockback):
	if damage_debounce:
		damage_debounce = false;
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
			sprite.material.set_shader_param("visible", false);
			emit_signal("died");
		else:
			# Apply knockback.
			velocity += knockback;
		# Animate damage (also gives time for particles to emit).
		var toggle = false;
		for i in range(10):
			damage_timer.start();
			yield(damage_timer, "timeout");
			toggle = not toggle;
			sprite.material.set_shader_param("damaged", toggle);
		if health == 0:
			# Post-death (free node).
			call_deferred("free");
		else:
			damage_debounce = false;

func _ready():
	sprite = $Sprite;
	damage_timer = $DamageTimer;
	sprite.material = load("res://src/resources/material_enemy.tres");
	damage_timer.wait_time = damage_time;
	damage_timer.one_shot = true;

func _physics_process(delta):
	# Apply drag.
	velocity *= 1 - delta*drag;
