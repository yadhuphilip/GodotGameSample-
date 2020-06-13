extends Sprite

var speed = 75
var velocity = Vector2()
var stun = false
var hp = 3
var blood_particles = preload("res://Blood_particles.tscn")
func _ready():
	randomize()

func _process(delta):
	if Global.player!=null and stun==false:
		velocity = global_position.direction_to(Global.player.global_position)
	elif stun:
		velocity = lerp(velocity, Vector2(0,0),0.1)
	global_position += velocity*speed*delta
	
	if hp<=0:
		if Global.camera!=null:
			Global.camera.screen_shake(65,0.1)
		
		Global.points +=10
		if Global.node_creation_parent!=null:
			var bloodparts = Global.instance_node(blood_particles, global_position,Global.node_creation_parent)
			bloodparts.rotation  = velocity.angle()
			queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager") and stun == false:
		modulate = Color.white
		velocity = -velocity * 6
		stun = true
		hp -=1
		$Stun_timer.start()
		area.get_parent().queue_free()
		#queue_free()


func _on_Stun_timer_timeout():
	modulate = Color("de0c0c")
	stun = false
