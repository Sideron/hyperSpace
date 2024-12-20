extends Area3D

@onready var player = $"..";
func _ready():
	connect("body_entered", collide)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func collide(body: Node3D):
	if (body.is_in_group("obstacle") || body.is_in_group("enemy")) && !player.shieldOn:
		if(body.global_position.x>player.global_position.x):
			player.leftSpeed = player.hspeed*0.58;
		else:
			player.rigthSpeed = player.hspeed*0.50;
			
		Global.speed *= 0.7
		
	if body.is_in_group("pickable"):
		body.pickEffect();
		
	if body.is_in_group("enemy"):
		print("Collided with enemy");
