extends Area2D

func _on_FallArea_body_entered(body):
	body.global_transform.origin = body.original_position
	if body.get_class() == "RigidBody2D":
		body.linear_velocity = Vector2(0, 0)
	yield(get_tree().create_timer(0.5), "timeout")
	print(body.position)
