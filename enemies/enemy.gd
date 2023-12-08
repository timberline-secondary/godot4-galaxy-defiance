extends Node2D
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var stats_component = $StatsComponent as StatsComponent
@onready var move_component = $MoveComponent as MoveComponent
@onready var scale_component = $ScaleComponent as ScaleComponent
@onready var flash_component = $FlashComponent as FlashComponent
@onready var shake_component = $ShakeComponent as ShakeComponent
@onready var hurtbox_component = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component = $HitboxComponent as HitboxComponent
@onready var destroyed_component = $DestroyedComponent as DestroyedComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		scale_component.tween_scale()
		flash_component.flash()
		shake_component.tween_shake()
	)
	stats_component.no_health.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
