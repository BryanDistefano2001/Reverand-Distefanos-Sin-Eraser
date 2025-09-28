extends Node2D

@export var terry : Node
@onready var voice_lines = $voice_lines
@onready var animation_player = $AnimationPlayer
@onready var animation_player_2 = $rotation_anims
@onready var sprite = $Sprite
@onready var low = $Sprite/low
@onready var high_1 = $Sprite/high
@onready var high_2 = $Sprite/high2
@onready var timer = $Timer
@onready var blackness_pos = $blackness_pos
@onready var blackness = $Blackness

# voice lines
var voice_dict = {
	
	"speech_1" = preload("uid://dgmuetrijup63"),
	
}

func _ready():
	
	# animating terry
		
	var tween = create_tween()\
	.set_loops()\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(sprite, "position", high_1.position, 2.5)
	tween.set_parallel(false)
	
 

	# AUDIO
	
	

func _physics_process(delta):

	
	if voice_lines.playing:
		animation_player.play("talk")
		animation_player_2.play("rotate")
	
	
	


	
	print(sprite.rotation)
	
	blackness.self_modulate.a = blackness_pos.position.x	
	
	


func _on_timer_timeout():
	voice_lines.stream = voice_dict["speech_1"]
	voice_lines.volume_db = -5
	voice_lines.autoplay = true
	voice_lines.play()
	var tween = create_tween()\
	.set_loops()\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
		
	tween.tween_property(sprite, "position", high_1.position, 2.5)
	tween.tween_property(sprite, "position", high_2.position, 2.5)
	tween.tween_property(sprite, "position", low.position, 2.5)
	
	
	


func _on_fade_timer_timeout():
	
	var tween = create_tween()\
	#.set_ease(Tween.EASE_IN_OUT)\
	.set_loops(0)\
	.set_trans(Tween.TRANS_SINE)\
	.set_parallel()\
	.set_pause_mode(Tween.TWEEN_PAUSE_BOUND)	
	
	# fade black
	blackness.self_modulate.a = 1
	var black_tween = create_tween().set_ease(Tween.EASE_IN_OUT)
	black_tween.tween_property(blackness_pos, "position", Vector2(0,0), 3)
	



func _on_voice_lines_player_finished():
	var tween = create_tween()\
	.set_ease(Tween.EASE_OUT)\
	.set_parallel()
	tween.tween_property(sprite, "scale", Vector2.ZERO, 5)
	tween.tween_property(sprite, "rotation", 25, 7)
	
