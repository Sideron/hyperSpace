extends Node3D

@export var model: MeshInstance3D;
@export var time_change: float;
@export var target_a: float;
var original_a: float;
var changing = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	original_a = model.get_surface_override_material(0).albedo_color.a;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(changing):
		model.get_surface_override_material(0).albedo_color.a = Global._lerp_floats(model.get_surface_override_material(0).albedo_color.a,target_a/255,time_change*delta);
	else:
		model.get_surface_override_material(0).albedo_color.a = Global._lerp_floats(model.get_surface_override_material(0).albedo_color.a,original_a,time_change*delta);

func change_properties(val: bool):
	changing = val;
