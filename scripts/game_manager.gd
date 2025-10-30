class_name GameManager extends Node

@export var world3D : Node3D
@export var world2D : Node2D
@export var gui : Control

var current3DScene
var current2DScene
var currentGUIScene

func _ready() -> void:
	Global.game_manager = self
	currentGUIScene = $GUI/SplashScreenManager


# Scene managing functions for loading swapping and deleting scenes:
func Change_GUI_Scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	# Do something with current scene:
	if currentGUIScene != null:
		if delete:
			currentGUIScene.queue_free()
		elif keep_running:
			currentGUIScene.visible = false
		else:
			gui.remove_child(currentGUIScene)
	# Load new scene:
	var newScene = load(new_scene).instantiate()
	gui.add_child(newScene)
	currentGUIScene = newScene
func Unload_GUI_Scene(delete: bool = true, keep_running: bool = false) -> void:
	# Do something with current scene:
	if currentGUIScene != null:
		if delete:
			currentGUIScene.queue_free()
		elif keep_running:
			currentGUIScene.visible = false
		else:
			gui.remove_child(currentGUIScene)

func Change_2D_Scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	# Do something with current scene:
	if current2DScene != null:
		if delete:
			current2DScene.queue_free()
		elif keep_running:
			current2DScene.visible = false
		else:
			world2D.remove_child(current2DScene)
	# Load new scene:
	var newScene = load(new_scene).instantiate()
	world2D.add_child(newScene)
	current2DScene = newScene
func Unload_2D_Scene(delete: bool = true, keep_running: bool = false) -> void:
	# Do something with current scene:
	if current2DScene != null:
		if delete:
			current2DScene.queue_free()
		elif keep_running:
			current2DScene.visible = false
		else:
			world2D.remove_child(current2DScene)

func Change_3D_Scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	# Do something with current scene:
	if current3DScene != null:
		if delete:
			current3DScene.queue_free()
		elif keep_running:
			current3DScene.visible = false
		else:
			world3D.remove_child(current3DScene)
	# Load new scene:
	var newScene = load(new_scene).instantiate()
	world3D.add_child(newScene)
	current3DScene = newScene
func Unload_3D_Scene(delete: bool = true, keep_running: bool = false) -> void:
	# Do something with current scene:
	if current3DScene != null:
		if delete:
			current3DScene.queue_free()
		elif keep_running:
			current3DScene.visible = false
		else:
			world3D.remove_child(current3DScene)
