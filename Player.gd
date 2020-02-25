extends KinematicBody2D

export (int) var speed = 200
const MAX_SPEED = 400

var velocity = Vector2()


func _process(delta):
	if Input.is_action_pressed('ui_right'):
		$AnimatedSprite.play('walk_right')
		position.x += MAX_SPEED * delta
	elif Input.is_action_pressed('ui_left'):
		$AnimatedSprite.play('walk_left')
		position.x -= MAX_SPEED * delta
	elif Input.is_action_pressed('ui_up'):
		$AnimatedSprite.play('walk_up')
		position.y -= MAX_SPEED * delta
	elif Input.is_action_pressed('ui_down'):
		$AnimatedSprite.play('walk_down')
		position.y += MAX_SPEED * delta
	else:
		$AnimatedSprite.stop()

