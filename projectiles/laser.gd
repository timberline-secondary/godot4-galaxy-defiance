extends Node2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component = $ScaleComponent as ScaleComponent
@onready var flash_component = $FlashComponent as FlashComponent

func _ready():
	scale_component.tween_scale()
	flash_component.flash()
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
