extends Node2D

var enemy_1 = preload("res://Enemy.tscn")

func _ready():
	randomize()
	Global.node_creation_parent = self

func _exit_tree():
	Global.node_creation_parent = null
	

func _on_Enemy_spawn_timer_timeout():
	randomize()
	var enemy_position = Vector2(rand_range(-160, 670), rand_range(-90,390))
	
	while enemy_position.x < 640 and enemy_position.x > -50 and enemy_position.y <360 and enemy_position.y >45:
		randomize()
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90,390)) 
	
	Global.instance_node(enemy_1,enemy_position,self)


func _on_Screen_shake_time_timeout():
	pass # Replace with function body.
