extends KinematicBody2D

export (int) var speed = 400
export (int) var GRAVITY = 1200
export (int) var jump_speed = -600
onready var animation = get_node("AnimationPlayer")
var is_crouch = false
var can_double_jump = true
const UP = Vector2(0,-1)

var velocity = Vector2()

func get_input():
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed("ui_down"):
		is_crouch = !is_crouch
	if Input.is_action_just_pressed('ui_up'):
		if is_on_floor():
			velocity.y = jump_speed
			can_double_jump = true
			is_crouch = false
		elif can_double_jump:
			velocity.y = jump_speed
			can_double_jump = false
		
	elif Input.is_action_pressed('ui_right'):
		$Sprite.flip_h = false
		if is_crouch:
			velocity.x += speed/2
		else: 
			velocity.x += speed
	elif Input.is_action_pressed('ui_left'):
		$Sprite.flip_h = true
		if is_crouch:
			velocity.x -= speed/2
		else:
			velocity.x -= speed
	else:
		animation.play("idle")
		
	update_animation()

func update_animation():
	if is_crouch:
		if velocity.y > 30:
			animation.play("fall")
			is_crouch = false
		else: 
			animation.play("crouch")
	else:		
		if is_on_floor():
			if abs(velocity.x) > 0:
				animation.play("walk")
			else:
				animation.play("idle")
		else:
			if velocity.y > 0:
				animation.play("fall")
			else:
				animation.play("jump")
			
	
func _physics_process(delta):
	print(is_crouch)
	velocity.y += delta * GRAVITY
	if velocity.y > 1200:
		velocity.y = 1200
	get_input()
	velocity = move_and_slide(velocity, UP)
