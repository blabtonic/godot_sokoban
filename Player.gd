extends KinematicBody2D

export (int) var speed = 100
export (int) var push_speed = 80
 
const MAX_SPEED = 400

var velocity = Vector2()


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.normal)
	update_animation(delta)
	move_and_slide(velocity.normalized() * speed, Vector2())
	
	if get_slide_count() > 0:
		check_box_collision(velocity)

func update_animation(delta):
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

func check_box_collision(velocity):
	if abs(velocity.x) + abs(velocity.y) > 1:
		return
	var crate = get_slide_collision(0).collider as Crate
	if crate:
		print(velocity)
		crate.push(push_speed * velocity)
