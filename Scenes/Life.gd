extends Node2D

signal life_collected

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("vanish")
	emit_signal("life_collected")
	
	

func vanish():
	queue_free()
