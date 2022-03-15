extends KinematicBody2D
var speed = 300
var _attack_angle
	
func _physics_process(delta):
	var collision = move_and_collide(Vector2(1,0).rotated(deg2rad(_attack_angle)) * speed * delta)
	if collision:
		# if there is a collision with walls, remove Bullet
		# hitbox collision handled on Monster class
		if collision.get_collider() is TileMap:
			queue_free()
