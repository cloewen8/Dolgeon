extends Node2D

var damage_amount = 10;
var knockback = 1;

var Enemy = load("res://src/scripts/enemy.gd");

func attack(type):
	assert(false, "Unimplemented attack!");

func damage(body, kockbackRotate = 0):
	if body is Enemy:
		body.damage(damage_amount, Vector2.UP.rotated(get_parent().rotation + deg2rad(kockbackRotate))*knockback);
