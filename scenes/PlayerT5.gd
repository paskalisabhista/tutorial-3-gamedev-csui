extends KinematicBody2D

export (int) var speed = 400
export (int) var GRAVITY = 1200
export (int) var jump_speed = -600
onready var animation = get_node("AnimationPlayer")
var is_crouch = false
var can_double_jump = true

var footstep_sfx = true

const UP = Vector2(0,-1)

var velocity = Vector2()
var original_position = null

func _ready():
	original_position = position
	
func get_input():
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed("ui_down"):
		is_crouch = !is_crouch
	if Input.is_action_just_pressed('ui_up'):
		if is_on_floor():
			$JumpEffect.play()
			velocity.y = jump_speed
			can_double_jump = true
			is_crouch = false
		elif can_double_jump:
			$JumpEffect.play()
			velocity.y = jump_speed
			can_double_jump = false
		
	elif Input.is_action_pressed('ui_right'):
		$AnimatedSprite.flip_h = false
		if is_crouch:
			velocity.x += speed/2
		else: 
			velocity.x += speed
	elif Input.is_action_pressed('ui_left'):
		$AnimatedSprite.flip_h = true
		if is_crouch:
			velocity.x -= speed/2
		else:
			velocity.x -= speed
	else:
		$AnimatedSprite.play("berdiri")
		
	update_animation()

func update_animation():
	if is_crouch:
		if velocity.y > 30:
			$AnimatedSprite.play("lompat")
			is_crouch = false
		else: 
			$AnimatedSprite.play("jongkok")
	else:		
		if is_on_floor():
			if abs(velocity.x) > 0:
				if footstep_sfx:
					$FootstepEffect.play()
					footstep_sfx = false
					$FootstepEffect/FootstepTimer.start()
				$AnimatedSprite.play("jalan")
			else:				
				$AnimatedSprite.play("berdiri")
		else:
			if velocity.y > 0:
				$AnimatedSprite.play("jatuh")
			else:
				$AnimatedSprite.play("lompat")
			
	
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if velocity.y > 1200:
		velocity.y = 1200
	get_input()
	velocity = move_and_slide(velocity, UP)


func _on_FootstepTimer_timeout():
	footstep_sfx = true
