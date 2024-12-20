extends Area3D

var gover = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	connect("body_entered", collision)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gover:
		Global.count = 0
		Global.speed = 0
		var fishdelete = get_tree().get_nodes_in_group("Fish")
		for fishthings in fishdelete:
			fishthings.queue_free()
		get_tree().reload_current_scene()

func collision(body: Node3D):
	if body.is_in_group("obstacle"):
		if(!$"..".shieldOn):
			gover = true;
		else:
			body._destroy();
	elif body.is_in_group("pickable"):
		body.pickEffect();
