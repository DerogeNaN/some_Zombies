extends Control

@export var loadScene: PackedScene
@export var inTime: float = 0.5
@export var fadeInTime: float = 1.5
@export var pauseTime: float = 1.5
@export var fadeOutTime: float = 0.5
@export var splashScreenContainer: Node

var splashScreens: Array


func _ready() -> void:
	GetScreens()
	Fade()

# Fill array with splash screen nodes
func GetScreens() -> void: 
	splashScreens = splashScreenContainer.get_children()
	for screen in splashScreens:
		screen.modulate.a = 0.0

# Applies fade to alpha value of each splash screen
func Fade() -> void:
	for screen in splashScreens:
		var tween = self.create_tween()
		tween.tween_interval(inTime)
		tween.tween_property(screen, "modulate:a", 1.0, fadeInTime)
		tween.tween_interval(pauseTime)
		tween.tween_property(screen, "modulate:a", 0.0, fadeOutTime)
		tween.tween_interval(inTime)
		await tween.finished
	get_tree().change_scene_to_packed(loadScene)

# Skip splash with any input
func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed():
		get_tree().change_scene_to_packed(loadScene)
		Global.game_manager.Change_3D_Scene("res://scenes/levels/test_scene.tscn")
