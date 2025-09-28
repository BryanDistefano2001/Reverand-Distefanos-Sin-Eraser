extends Node2D

@onready var bible = $"."
#@onready var button = $Button
@onready var end_pos = $end_position

@onready var blackness = $blackness
@onready var blackness_pos = $blackness_pos

@export var button : Node

func _ready():
	blackness.self_modulate.a = 0
	var tween = create_tween().set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_OUT)
	tween.tween_property(button, "position", end_pos.position, 5)



func _physics_process(delta):
	#print(blackness_pos.position.x)
	blackness.self_modulate.a = blackness_pos.position.x
	
	if blackness.self_modulate.a >= 1:
		get_tree().change_scene_to_file("uid://b7t2w0jrk8yx8")

func _on_button_pressed():
	
	
	var tween = create_tween().set_ease(Tween.EASE_IN)
	tween.tween_property(blackness_pos, "position", Vector2(1,1), 3)
	
	
	
	#print(blackness_pos.position.x)
	
	
	# uid://b7t2w0jrk8yx8 = Game.tscn
