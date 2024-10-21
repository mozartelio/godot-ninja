extends Area2D

func _on_Area2D_body_entered(body):
	set_collision_layer_bit(2,false)
	set_collision_mask_bit(0,false)
	print(get_collision_layer_bit(0))

