extends MeshInstance3D

@onready var player = $"../../Player"
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_surface_override_material(0).uv1_offset.x = global_position.x/get_surface_override_material(0).uv1_scale.x*0.72
	get_surface_override_material(0).uv1_offset.y -= Global.speed*delta/get_surface_override_material(0).uv1_scale.y*2.7  #*0.0114
	print(global_position.x)
	#if get_surface_override_material(0).uv1_offset.x > 1:
		#get_surface_override_material(0).uv1_offset.x -= 1
	
	if get_surface_override_material(0).uv1_offset.y < 1:
		get_surface_override_material(0).uv1_offset.y += 1
