extends Node3D

@export var player: Node3D;
@export var range: float;

@export var meters : float;
@export var speedCoef : float;
var remaining: float;
# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = 60
	remaining = meters;
	for i in 10:
		_spawn_node_random();
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(Global.count)
	remaining -= delta*(Global.speed*speedCoef);
	if remaining <= 0:
		_spawn_node();
		remaining = meters;
	
	#print(Engine.get_frames_per_second())
	
func create_obstacle(new_node: Node):
	add_sibling(new_node)

func _spawn_node():
	# Instancia un nuevo Node3D en una posición aleatoria
	var chance = randi_range(0,100)
	
	var distance_spawn = 900;
	var new_node;
	var height;
	
	var min_rotation = 0;
	var max_rotation = 360
	
	if chance <40:
		new_node = preload("res://Objs/obstacle.tscn").instantiate()
		height = randf_range(-1.8,0)
	elif chance < 55:
		new_node = preload("res://Objs/obstacle3.tscn").instantiate()
		height = -1
		var randScl = randf_range(2.5,4.5)
		new_node.scale = Vector3(1,1,1)*randScl
		distance_spawn = 910;
	elif chance < 65:	
		new_node = preload("res://Objs/arc.tscn").instantiate()
		height = randf_range(-6.5,-2.5)
		min_rotation = -1.3; max_rotation = 1.3;
	elif chance <68:
		new_node = preload("res://Objs/windmill.tscn").instantiate()
		height = -5.216
		min_rotation = 3; max_rotation = 3;
		distance_spawn = 1000;
	elif chance <70:
		new_node = preload("res://Objs/powerArc.tscn").instantiate()
		height = 1.473
		min_rotation = 0; max_rotation = 0;
	elif chance <75:
		new_node = preload("res://Objs/obstacle5.tscn").instantiate()
		height = 11.826
		distance_spawn = 930;
	elif chance <90:
		new_node = preload("res://Objs/obstacle2.tscn").instantiate()
		height = randf_range(-4,4.5)
	else:
		new_node = preload("res://Objs/obstacle4.tscn").instantiate()
		height = randf_range(8.2,8.217)
		distance_spawn = 950;
	
	# Configura la posición aleatoria
	var xPos = player.position.x+(randfn(0,0.2)*range)#randf_range(-range+player.position.x, range+player.position.x)
	new_node.position = Vector3(xPos, height, -distance_spawn)
	new_node.rotation = Vector3(0,randf_range(min_rotation,max_rotation),0)

	# Agrega el nuevo nodo al árbol de escena
	add_sibling(new_node)

func _spawn_node_random():
	var chance = randi_range(0,100)
	var new_node;
	var height;
	var min_rotation = 0;
	var max_rotation = 360
	var distance_spawn = 900;
	
	if chance <60:
		new_node = preload("res://Objs/obstacle.tscn").instantiate()
		height = randf_range(-1.8,0)
	elif chance < 75:
		new_node = preload("res://Objs/obstacle3.tscn").instantiate()
		height = -1
		var randScl = randf_range(2.5,4.5)
		new_node.scale = Vector3(1,1,1)*randScl
	elif chance < 90:	
		new_node = preload("res://Objs/arc.tscn").instantiate()
		height = randf_range(-6.5,-2.5)
		min_rotation = -1.3; max_rotation = 1.3;
	else:
		new_node = preload("res://Objs/obstacle2.tscn").instantiate()
		height = randf_range(-4,4.5)
	
	# Configura la posición aleatoria
	var xPos = randf_range(-range+player.position.x, range+player.position.x)
	new_node.position = Vector3(xPos, height, randf_range(20,-distance_spawn))
	new_node.rotation = Vector3(0,randf_range(min_rotation,max_rotation),0)

	# Agrega el nuevo nodo al árbol de escena
	add_child(new_node)
