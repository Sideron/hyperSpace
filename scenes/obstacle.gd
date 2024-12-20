extends Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.z+= Global.speed * delta
	if(global_position.z>15):
		Global.count -= 1;
		queue_free();

func _destroy():
	queue_free();
