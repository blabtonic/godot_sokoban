extends KinematicBody2D
class_name Crate

func push(velocity):
	move_and_slide(velocity, Vector2())
