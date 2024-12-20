extends Node3D


func _destroy():
	$".."._destroy();
