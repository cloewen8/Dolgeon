extends "res://src/scripts/attack.gd"

var Dolphin = load("res://src/scripts/dolphin.gd");

var left;
var right;
var leftAnim;
var rightAnim;

func _ready():
	knockback = 0.4;
	damage_amount = 10;
	left = $Left;
	right = $Right;
	leftAnim = left.get_node("AnimationPlayer");
	rightAnim = right.get_node("AnimationPlayer");

func attack(type):
	if type == Dolphin.AttackType.LEFT:
		leftAnim.play("attack_left");
	elif type == Dolphin.AttackType.RIGHT:
		rightAnim.play("attack_right");

func _process(delta):
	var forward = Vector2.UP.rotated(get_parent().rotation);
	if leftAnim.is_playing():
		for body in left.get_overlapping_bodies():
			damage(body, -15);
	if rightAnim.is_playing():
		for body in right.get_overlapping_bodies():
			damage(body, 15);
