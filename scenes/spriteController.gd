extends Sprite3D

@export var time_change: float;
@export var target_a: float;
var original_a: float;

var changing = false;
func _ready():
	original_a = modulate.a

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(changing):
		modulate.a = Global._lerp_floats(modulate.a,target_a/255,time_change*delta)
	else:
		modulate.a = Global._lerp_floats(modulate.a,original_a,time_change*delta)

func change_properties(val: bool):
	changing = val;
