extends RigidBody2D

var original_position = null

func _ready():
	original_position = position

func _on_Ball_body_entered(body):
	$BounceEffect.playing = true
