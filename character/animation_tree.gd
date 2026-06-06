extends Node2D

@export var animation_tree: AnimationTree
@export var player: CharacterBody2D

var _last_direction := Vector2(0,-1) 

func _physics_process(delta: float) -> void:
	
	var idle = !player.velocity
	
	if !idle:
		_last_direction = player.velocity.normalized()
	
	animation_tree.set("parameters/conditions/idle",idle)
	animation_tree.set("parameters/conditions/walk",!idle)
	
	animation_tree.set("parameters/Idle/blend_position",_last_direction)
	animation_tree.set("parameters/Walk/blend_position",_last_direction)
	pass
