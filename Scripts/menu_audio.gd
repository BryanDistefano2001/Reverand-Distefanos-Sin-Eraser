extends Node2D
@onready var audio_stream_player = $AudioStreamPlayer

# vars for shuffling
# needs - shuffling number, algo for shuffling, sings linked to id, string that contains which song is 

@onready var volume_slider = $HSlider

# dict for songs id DEPRECATED
var dict = {
	# futility
	"futility": preload("uid://bo6ljb6qp36b7"),
	"limerance": preload("uid://mp80375v2y2m"),
	"pandora": preload("uid://j3q2m155xpq2"),
	"starlight": preload("uid://df3fyta1uw4a1"),
	"summertime": preload("uid://bjm0fga8nijvt"),
	"taking_whats_not_yours": preload("uid://r30rlhhw08et"),
	
}
# DEPRECATED
var dict_randomness = {
	
	"0": dict["futility"],
	"1": dict["limerance"],
	"2": dict["pandora"],
	"3": dict["starlight"],
	"4": dict["summertime"],
	"5": dict["taking_whats_not_yours"], 
	
}

@onready var bring_me_to_life = preload("uid://cgg1qa3qmil4t") 
@onready var howl = preload("uid://ds0wfpancl0gs") 

# random number gen
# var rng = RandomNumberGenerator.new() DEPRECATED
#var rng_song = rng.randi_range(0, len(dict_randomness) - 1) DEPRECATED

func _ready():
	

	
	# play random song DEPRECATED
	# audio_stream_player.stream = dict_randomness[str(rng_song)] DEPRECATED
	
	
	
	# audio_stream_player.stream = bring_me_to_life
	audio_stream_player.stream = howl
	audio_stream_player.autoplay = true
	audio_stream_player.volume_db = -30
	audio_stream_player.play()
	
	
	


# func _on_skip_back_pressed(): DEPRECATED
#	rng_song -= 1 
#	if rng_song < 0:
#		rng_song = len(dict_randomness) - 1
#	audio_stream_player.stream = dict_randomness[str(rng_song)]
#	audio_stream_player.play()

# func _on_skip_forward_pressed(): DEPRECATED
#	
#	rng_song += 1
#	if rng_song > len(dict_randomness) - 1:
#		rng_song = 0
#	audio_stream_player.stream = dict_randomness[str(rng_song)]
#	audio_stream_player.play()

# func _on_audio_stream_player_finished(): DEPRECATED
#	audio_stream_player.stream = bring_me_to_life
#	audio_stream_player.play()

func _on_h_slider_drag_ended(value_changed):
	audio_stream_player.volume_db = volume_slider.value 
	if audio_stream_player.volume_db == -41:
		audio_stream_player.volume_db = -10000000000
	#print(volume_slider.value)
	print(audio_stream_player.volume_db)
	


func _on_audio_stream_player_finished():
	audio_stream_player.stream = bring_me_to_life
	audio_stream_player.autoplay = true
	audio_stream_player.play()
