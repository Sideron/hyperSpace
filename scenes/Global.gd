extends Node

var speed = 0
var count = 0;
var mainSpeed = 0;

func _lerp_floats(a:float,b:float,t:float):
	return a*(1-t) + b*t
