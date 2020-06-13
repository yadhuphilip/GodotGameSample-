extends CPUParticles2D



func _on_Freeze_blood_timeout():
	set_process(false)
	set_physics_process(false)
	set_process_input(false)
	set_process_internal(false)
	set_process_unhandled_input(false)
	set_process_unhandled_key_input(false)
	#scale_amount_random = lerp(scale_amount_random, 0 , .1)


func _on_Timer_timeout():
	#scale_amount_random = lerp(scale_amount_random, 0 , .1)
	queue_free()
	#pass
