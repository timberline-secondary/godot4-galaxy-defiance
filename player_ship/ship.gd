extends Node2D

@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer = $FireRateTimer
@onready var scale_component:ScaleComponent = $ScaleComponent as ScaleComponent
@onready var move_component = $MoveComponent as MoveComponent
@onready var animated_sprite_2d = $Anchor/AnimatedSprite2D
@onready var flame_animated_sprite = $Anchor/FlameAnimatedSprite
@onready var variable_pitch_audio_stream_player = $VariablePitchAudioStreamPlayer as VariablePitchAudioStreamPlayer

func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)

func fire_lasers() -> void:
	variable_pitch_audio_stream_player.play_with_variance()
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()
	
func _process(delta):
	animate_the_ship()
	
func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("bank_left")
		flame_animated_sprite.play("left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("bank_right")
		flame_animated_sprite.play("right")
	else:
		animated_sprite_2d.play("center")
		flame_animated_sprite.play("center")
			
	
