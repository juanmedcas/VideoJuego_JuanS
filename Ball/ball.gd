extends RigidBody2D

var inicio_juego : bool = false

func _input(event):
	if event.is_action_pressed("iniciar") and not inicio_juego:
		linear_velocity = Vector2(65,-240)
		inicio_juego = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("Gr_block_level1"):
			body.queue_free()
			if body.get_parent().get_child_count() == 1:
				print("WINNER!")
				queue_free()
		elif body.get_name() == "bord_but":
			print("GAME OVER!")
			queue_free()


"""
var cuerpos_coll = get_colliding_bodies()
	for body in cuerpos_coll:
		if body.is_in_group("Gr_block_level1"):
			#body.hide()
"""
